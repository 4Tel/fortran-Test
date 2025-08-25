PROGRAM main
  USE omp_lib
  USE my_mod, ONLY: val1, val2
  IMPLICIT NONE
  !$OMP THREADPRIVATE(val1)
  INTEGER::idx
  INTEGER::val(3)
  !$OMP PARALLEL DO PRIVATE(val2)
  DO idx = 1, 4
    CALL my_sub1(val2, idx)
    WRITE (*, *) 'Thread ', omp_get_thread_num(), ' processed index ', idx, ' with value ', val2
  END DO
  !$OMP END PARALLEL DO
END PROGRAM main

SUBROUTINE my_sub1(val, idx)
  INTEGER, INTENT(IN)::idx
  INTEGER, INTENT(OUT)::val
  val = idx
  CALL sub1(val)
END SUBROUTINE my_sub1

SUBROUTINE my_sub2(arg1, arg2)
  INTEGER, INTENT(IN) :: arg1(3)
  INTEGER, INTENT(OUT) :: arg2(3)
  arg2 = arg1*2
END SUBROUTINE my_sub2
