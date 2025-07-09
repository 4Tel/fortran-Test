PROGRAM main
  USE clock, ONLY: start_clock, end_clock
  IMPLICIT NONE
  INTEGER::idx
  INTEGER::cnt = 100000
  INTEGER::size = 1000000

  CALL start_clock("Stack")
  DO idx = 1, cnt
    CALL use_stack()
  END DO
  CALL end_clock()

  CALL start_clock("Heap 1")
  DO idx = 1, cnt
    CALL use_heap1()
  END DO
  CALL end_clock()

  CALL start_clock("Heap 2")
  DO idx = 1, cnt
    CALL use_heap2()
  END DO
  CALL end_clock()

CONTAINS
  SUBROUTINE use_stack()
    REAL::arr(size)
    arr = 0
  END SUBROUTINE use_stack
  !
  SUBROUTINE use_heap1()
    REAL, ALLOCATABLE::arr(:)
    ALLOCATE (arr(size))
    arr = 0
  END SUBROUTINE use_heap1
  !
  SUBROUTINE use_heap2()
    REAL, ALLOCATABLE::arr(:)
    ALLOCATE (arr(size))
    arr = 0
    DEALLOCATE (arr)
  END SUBROUTINE use_heap2
END PROGRAM main
