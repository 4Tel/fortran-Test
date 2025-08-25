PROGRAM main
  IMPLICIT NONE
  INTEGER::idx
  DO idx = 1, 5
    idx = idx + 1 !< This will cause a compile error
    WRITE (*, *) "Loop iteration:", idx
  END DO

END PROGRAM main
