PROGRAM main
  USE clock, ONLY: start_clock, end_clock
  IMPLICIT NONE
  INTEGER, PARAMETER::size = 1000000000
  LOGICAL::ierr = .FALSE.
  INTEGER::idx
  INTEGER::arr(size)
  !
  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "Array size:", size
  WRITE (*, *) "Array initialization and assignment performance test"
  WRITE (*, *) "---------------------------------------------"
  !
  WRITE (*, *) "Initializing to zero"
  CALL start_clock()
  arr(:) = 0
  CALL end_clock()
  !
  WRITE (*, *) "Set value to one"
  CALL start_clock()
  arr(:) = 1
  CALL end_clock()
  !
  WRITE (*, *) "Set value to 100"
  CALL start_clock()
  arr(:) = 100
  CALL end_clock()
  !
  WRITE (*, *) "Set partial value using a subroutine"
  CALL start_clock()
  CALL setter(arr)
  CALL end_clock()
  WRITE (*, *) "Partial write test result"
  DO idx = 1, 10
    IF (arr(idx) /= 0) THEN
      WRITE (*, *) "Error: arr(", idx, ") = ", arr(idx)
      ierr = .TRUE.
    END IF
  END DO
  DO idx = 11, size
    IF (arr(idx) /= 100) THEN
      WRITE (*, *) "Error: arr(", idx, ") = ", arr(idx)
      ierr = .TRUE.
    END IF
  END DO
  IF (.NOT. ierr) THEN
    WRITE (*, *) "Partial write test passed"
  ELSE
    WRITE (*, *) "Partial write test failed"
  END IF
CONTAINS
  SUBROUTINE setter(arr_)
    INTEGER, INTENT(OUT) :: arr_(size)
    arr_(1:10) = 0
  END SUBROUTINE setter
END PROGRAM main
