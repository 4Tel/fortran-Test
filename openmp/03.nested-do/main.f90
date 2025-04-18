PROGRAM main
  IMPLICIT NONE
  INTEGER, PARAMETER::x = 10
  INTEGER::i, j, k, l
  INTEGER::w, idx, array(x, x, x)
  !
  array(:, :, :) = 0
!$OMP PARALLEL DO default(shared), private(i,j,k,l,w,array), reduction(+:array(x,x,x))
  DO i = 0, x - 1
    DO j = 0, x - 1
      DO k = 0, x - 1
        DO l = 0, x - 1
          w = idx(j, k, l, x)
          array(j, k, l) = array(j, k, l) + w
        END DO
      END DO
    END DO
  END DO
!$OMP END PARALLEL DO
  WRITE (*, *) array(x - 1, x - 1, x - 1), x*idx(x - 1, x - 1, x - 1, x)
END PROGRAM main
!
INTEGER FUNCTION idx(j, k, l, x)
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: j, k, l, x
  idx = j*(x*x) + k*x + l
END FUNCTION idx
