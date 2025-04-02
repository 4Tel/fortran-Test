PROGRAM main
  IMPLICIT NONE
  INTEGER::i, j, k, l
  !
  DO i = 0, 4
    j = 2**i
    CALL view_int_kind(j)
  END DO
  !
  DO i = 0, 4
    j = 2**i
    DO k = 0, 8
      l = 2**k
      CALL view_real_kind(j, l)
    END DO
  END DO
  !
CONTAINS
  SUBROUTINE view_int_kind(range)
    INTEGER, INTENT(IN) :: range
    WRITE (*, *) "The kind for range", range, "of integer is: ", SELECTED_INT_KIND(range)
  END SUBROUTINE view_int_kind
  !
  SUBROUTINE view_real_kind(precise, range)
    INTEGER, INTENT(IN) :: precise, range
    WRITE (*, *) "The kind for precise", precise, "and range", range, "of real is: ", SELECTED_REAL_KIND(precise, range)
  END SUBROUTINE view_real_kind
END PROGRAM main
