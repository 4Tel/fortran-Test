PROGRAM main
  IMPLICIT NONE
  INTEGER::i, x, num
  !
  x = 10
!$OMP PARALLEL DO private(i), reduction(+:num)
  DO i = 1, x
    num = num + 1
  END DO
!$OMP END PARALLEL DO
  WRITE (*, *) num
END PROGRAM main
