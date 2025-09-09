PROGRAM main
  USE clock, ONLY: start_clock, end_clock
  USE ranlib, ONLY: fill_random
  IMPLICIT NONE
  INTEGER, PARAMETER::n = 1000, m = 1000, l = 2000
  INTEGER, PARAMETER::tol = 10
  COMPLEX::a(m, l), b(l, n), c(m, n)
  INTEGER::i, j, k
  CALL RANDOM_SEED()

  CALL fill_random(a, m*l)
  CALL fill_random(b, l*n)

  CALL start_clock()
  c = 0.0
  c = MATMUL(a, b)
  IF (m*n < tol) &
    WRITE (*, *) "Matmul 1: ", c
  CALL end_clock()

  CALL start_clock()
  c = 0.0
  DO i = 1, m
    DO j = 1, n
      DO k = 1, l
        c(i, j) = c(i, j) + a(i, k)*b(k, j)
      END DO
    END DO
  END DO
  IF (m*n < tol) &
    WRITE (*, *) "Matmul 2: ", c
  CALL end_clock()

  CALL start_clock()
  c = 0.0
  CALL cgemm('N', 'N', m, n, l, (1.0, 0.0), a, m, b, l, (0.0, 0.0), c, m)
  IF (m*n < tol) &
    WRITE (*, *) "Matmul 3: ", c
  CALL end_clock()
END PROGRAM main
