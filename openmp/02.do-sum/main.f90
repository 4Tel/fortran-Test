PROGRAM main
  IMPLICIT NONE
  INTEGER::i, x, array
  !
  x = 10
!$OMP PARALLEL DO private(i), reduction(+:array)
  DO i = 1, x
    array = array + 1
  END DO
!$OMP END PARALLEL DO
  WRITE (*, *) array
END PROGRAM main
