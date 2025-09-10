PROGRAM main
  IMPLICIT NONE
  CALL test()
  CALL test()
CONTAINS
  SUBROUTINE test()
    INTEGER :: i = 0
    i = i + 1
    WRITE (*, *) "i = ", i
  END SUBROUTINE test
END PROGRAM main
