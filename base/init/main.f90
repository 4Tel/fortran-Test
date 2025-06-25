PROGRAM main
  IMPLICIT NONE
  INTEGER::idx
  DO idx = 1, 3
    CALL test()
  END DO
CONTAINS
  SUBROUTINE test()
    INTEGER:: jdx
    jdx = jdx + 1
    WRITE (*, *) 'jdx = ', jdx
  END SUBROUTINE test
END PROGRAM main
