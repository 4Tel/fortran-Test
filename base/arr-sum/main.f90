PROGRAM main
  IMPLICIT NONE
  INTEGER::x, r1, r2
  INTEGER::i, j, k
  INTEGER, ALLOCATABLE::arr(:, :, :)
  !
  x = 5
  ALLOCATE (arr(x, x, x))
  DO i = 1, x
    DO j = 1, x
      DO k = 1, x
        arr(i, j, k) = i*1000000 + j*1000 + k
      END DO
    END DO
  END DO
  r1 = SUM(arr(:, x, x))
  r2 = (x*(x + 1))*500000 + x*x*1000 + x*x
  WRITE (*, *) r1, r2, r1 == r2
END PROGRAM main
