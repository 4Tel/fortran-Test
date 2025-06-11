PROGRAM main
  USE clock, ONLY: start_clock, end_clock
  IMPLICIT NONE
  REAL::x
  x = 0
  CALL q()
  WRITE (*, *) "x = ", x
CONTAINS
  SUBROUTINE q()
    x = 1
  END SUBROUTINE q
END PROGRAM main
