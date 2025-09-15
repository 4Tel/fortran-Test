PROGRAM main
  IMPLICIT NONE
  CALL int_to_string(1)
  CALL int_to_string(12)
  CALL int_to_string(123)
CONTAINS
  SUBROUTINE int_to_string(i)
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: i
    CHARACTER(len=10) :: str
    WRITE (str, '(I0)') i   ! I0 = integer with minimal width
    PRINT *, 'String: "', TRIM(str), '"'
  END SUBROUTINE int_to_string
END PROGRAM main
