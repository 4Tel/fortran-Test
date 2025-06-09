PROGRAM main
  IMPLICIT NONE
  REAL::arr(3, 3)
  INTEGER::idx, jdx
  DO idx = 1, 3
    DO jdx = 1, 3
      arr(idx, jdx) = idx*3 + jdx
      WRITE (*, *) "arr(", idx, ",", jdx, ") = ", arr(idx, jdx)
    END DO
  END DO
  CALL routine(arr(:, :))
CONTAINS
  SUBROUTINE routine(arr_)
    REAL, INTENT(in)::arr_(3)
    DO idx = 1, 3
      WRITE (*, *) "arr_(", idx, ") = ", arr_(idx)
    END DO
  END SUBROUTINE routine
END PROGRAM main
