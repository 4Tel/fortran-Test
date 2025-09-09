MODULE ranlib
  IMPLICIT NONE
  PRIVATE
  PUBLIC :: fill_random
CONTAINS
  SUBROUTINE fill_random(arr, size)
    COMPLEX, INTENT(OUT) :: arr(*)
    INTEGER, INTENT(IN) :: size
    REAL, ALLOCATABLE :: ran1(:), ran2(:)
    ALLOCATE (ran1(size), ran2(size))
    CALL RANDOM_NUMBER(ran1)
    CALL RANDOM_NUMBER(ran2)
    arr(1:size) = CMPLX(ran1(1:size), ran2(1:size))
    DEALLOCATE (ran1, ran2)
  END SUBROUTINE fill_random
END MODULE ranlib
