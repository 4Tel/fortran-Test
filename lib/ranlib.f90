MODULE ranlib
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: fill_random
  INTERFACE fill_random
    MODULE PROCEDURE fill_random_c8, fill_random_c16
  END INTERFACE fill_random
CONTAINS
  SUBROUTINE fill_random_c8(arr, size)
    COMPLEX, INTENT(OUT) :: arr(*)
    INTEGER, INTENT(IN) :: size
    REAL, ALLOCATABLE :: ran1(:), ran2(:)
    ALLOCATE (ran1(size), ran2(size))
    CALL RANDOM_NUMBER(ran1)
    CALL RANDOM_NUMBER(ran2)
    arr(1:size) = CMPLX(ran1(1:size), ran2(1:size))
    DEALLOCATE (ran1, ran2)
  END SUBROUTINE fill_random_c8
  SUBROUTINE fill_random_c16(arr, size)
    COMPLEX(kind=16), INTENT(OUT) :: arr(*)
    INTEGER, INTENT(IN) :: size
    REAL(kind=16), ALLOCATABLE :: ran1(:), ran2(:)
    ALLOCATE (ran1(size), ran2(size))
    CALL RANDOM_NUMBER(ran1)
    CALL RANDOM_NUMBER(ran2)
    arr(1:size) = CMPLX(ran1(1:size), ran2(1:size), kind=16)
    DEALLOCATE (ran1, ran2)
  END SUBROUTINE fill_random_c16
END MODULE ranlib
