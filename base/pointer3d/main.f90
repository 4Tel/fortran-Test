PROGRAM main
  IMPLICIT NONE
  REAL, TARGET::arr(3, 3, 3)
  REAL, POINTER::ptr(:, :)
  INTEGER::idx, jdx, kdx
  DO idx = 1, 3
    DO jdx = 1, 3
      DO kdx = 1, 3
        arr(idx, jdx, kdx) = (idx - 1)*9 + (jdx - 1)*3 + kdx
        WRITE (*, *) "arr(", idx, ",", jdx, ",", kdx, ") = ", arr(idx, jdx, kdx)
      END DO
    END DO
  END DO
  ptr => arr(:, :, 2)
  WRITE (*, *) "expected:", arr(:, 2, 2)
  WRITE (*, *) "Pointer :", ptr(:, 2)
CONTAINS
  SUBROUTINE routine(arr_)
    REAL, INTENT(in)::arr_(3)
    DO idx = 1, 3
      WRITE (*, *) "arr_(", idx, ") = ", arr_(idx)
    END DO
  END SUBROUTINE routine
END PROGRAM main
