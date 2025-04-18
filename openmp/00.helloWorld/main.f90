PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::id
  !
!$OMP PARALLEL
  id = omp_get_thread_num()
  WRITE (*, *) 'Hello ', id
!$OMP END PARALLEL

!$OMP PARALLEL num_threads(4)
  id = omp_get_thread_num()
  WRITE (*, *) 'HELLO ', id
!$OMP END PARALLEL
  WRITE (*, *) "number of procs: ", omp_get_num_procs()
  WRITE (*, *) "number of max threads: ", omp_get_max_threads()
!
  id = omp_get_thread_num()
  WRITE (*, *) 'outside of parallel: ', id
  WRITE (*, *) "openmp version: ", openmp_version
END PROGRAM main
