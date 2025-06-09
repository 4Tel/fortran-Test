PROGRAM main
  IMPLICIT NONE
  REAL, TARGET::arr(3, 3)
  REAL, POINTER::ptr(:)
  INTEGER::idx, jdx
  DO idx = 1, 3
    DO jdx = 1, 3
      arr(idx, jdx) = idx*3 + jdx
      WRITE (*, *) "arr(", idx, ",", jdx, ") = ", arr(idx, jdx)
    END DO
  END DO
  ptr => arr(:, 1)  ! Pointing to the first column of the array
  CALL routine(ptr)
CONTAINS
  SUBROUTINE routine(arr_)
    REAL, INTENT(in)::arr_(3)
    DO idx = 1, 3
      WRITE (*, *) "arr_(", idx, ") = ", arr_(idx)
    END DO
  END SUBROUTINE routine
END PROGRAM main
