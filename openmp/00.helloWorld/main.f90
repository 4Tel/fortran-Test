PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::id
  !
!$OMP PARALLEL PRIVATE ( id )
  id = omp_get_thread_num()
  WRITE (*, *) 'HELLO from process ', id
!$OMP END PARALLEL
  WRITE (*, *) "number of procs: ", omp_get_num_procs()
  WRITE (*, *) "number of max threads: ", omp_get_max_threads()
!
  id = omp_get_thread_num()
  WRITE (*, *) 'outside of parallel: ', id
END PROGRAM main
