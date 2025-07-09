PROGRAM main
  USE mem, ONLY: VmInfo
  IMPLICIT NONE
  INTEGER::idx
  INTEGER::size = 1000000
  WRITE (*, *) "===== Stack size ====="
  idx = 0
  CALL VmInfo()
  CALL use_stack()
  CALL VmInfo()
  !
  WRITE (*, *) "===== Stack value ====="
  idx = 1
  CALL use_stack(1.0)
  idx = 0
  CALL use_stack()
  !
  idx = 1
  CALL use_stack(10.0)
  idx = 0
  CALL use_stack()

CONTAINS
  SUBROUTINE use_stack(val)
    REAL, INTENT(IN), OPTIONAL::val
    REAL::arr(size)
    IF (idx == 1) THEN
      arr(1) = val
    ELSE
      WRITE (*, *) "arr(1) = ", arr(1)
    END IF
  END SUBROUTINE use_stack
END PROGRAM main
