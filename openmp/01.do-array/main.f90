PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::i, x, array(10)
  INTEGER::id, num_threads
  !
  array(:) = 0
  x = 6
!$OMP PARALLEL
  num_threads = omp_get_num_threads()
  !$OMP DO
  DO i = 1, num_threads
    id = omp_get_thread_num()
    WRITE (*, *) i, id
    array(i) = id
  END DO
  !$OMP END DO
  !$OMP DO
  DO i = num_threads + 1, x
    id = omp_get_thread_num()
    array(i) = id
  END DO
  !$OMP END DO
!$OMP END PARALLEL
  DO i = 1, x
    WRITE (*, '("array(",I2")=",I3)') i, array(i)
  END DO
END PROGRAM main
