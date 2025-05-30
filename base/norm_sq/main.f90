PROGRAM main
  USE clock, ONLY: start_clock, end_clock
  IMPLICIT NONE
  COMPLEX(KIND=8)::x
  REAL(KIND=8)::rst
  INTEGER, PARAMETER::cnt = 50000
  INTEGER::i, j, k
  !
  rst = 0
  x = CMPLX(1, 2)
  WRITE (*, *) "Real^2 * AIMAG^2"
  CALL start_clock()
  DO i = 1, cnt
    DO j = 1, cnt
      rst = rst + REAL(x)**2 + AIMAG(x)**2
    END DO
  END DO
  WRITE (*, *) "norm_sq = ", rst
  CALL end_clock()

  rst = 0
  WRITE (*, *) "DBLE(x) * CONJG(x)"
  CALL start_clock()
  DO i = 1, cnt
    DO j = 1, cnt
      rst = rst + DBLE(x)*CONJG(x)
    END DO
  END DO
  WRITE (*, *) "norm_sq = ", rst
  CALL end_clock()

  rst = 0
  WRITE (*, *) "ABS(x)**2"
  CALL start_clock()
  DO i = 1, cnt
    DO j = 1, cnt
      rst = rst + ABS(x)**2
    END DO
  END DO
  WRITE (*, *) "norm_sq = ", rst
  CALL end_clock()
END PROGRAM main
