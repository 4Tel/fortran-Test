PROGRAM main
  IMPLICIT NONE
  INTEGER::i, x, num(10)
  !
  num(:) = 0
  x = 10
!$OMP PARALLEL DO default(shared), private(i)
  DO i = 1, x
    num(i) = num(i) + 1
  END DO
!$OMP END PARALLEL DO
  DO i = 1, x
    WRITE (*, '("num(",I2")=",I3)') i, num(i)
  END DO
END PROGRAM main
