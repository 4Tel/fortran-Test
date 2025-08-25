MODULE my_mod
  INTEGER::val1
  INTEGER::val2
END MODULE my_mod
SUBROUTINE sub1(val)
  INTEGER, INTENT(IN) :: val
  ! do something. include I/O and buffer
END SUBROUTINE sub1

PROGRAM main
  USE omp_lib
  USE my_mod, ONLY: val1, val2
  IMPLICIT NONE
  !$OMP THREADPRIVATE(val1)
  INTEGER::idx
  WRITE(*, *) "val1"
  !$OMP PARALLEL DO
  DO idx = 1, 4
    CALL my_sub1(idx)
    WRITE (*, *) 'Thread ', omp_get_thread_num(), ' processed index ', idx, ' with value ', val1
  END DO
  !$OMP END PARALLEL DO

  WRITE(*, *) "val2"
  !$OMP PARALLEL DO PRIVATE(val2)
  DO idx = 1, 4
    CALL my_sub2(val2, idx)
    WRITE (*, *) 'Thread ', omp_get_thread_num(), ' processed index ', idx, ' with value ', val2
  END DO
  !$OMP END PARALLEL DO
END PROGRAM main

SUBROUTINE my_sub1(idx)
  USE my_mod, ONLY: val1
  INTEGER, INTENT(IN)::idx
  val1 = idx
  CALL sub1(val1)
END SUBROUTINE my_sub1

SUBROUTINE my_sub2(val, idx)
  INTEGER, INTENT(OUT)::val
  INTEGER, INTENT(IN)::idx
  val = idx
  CALL sub1(val)
END SUBROUTINE
