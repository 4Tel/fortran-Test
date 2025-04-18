PROGRAM main
  USE OMP_LIB
  !
  INTEGER::num_threads, id

!$OMP PARALLEL
  num_threads = omp_get_num_threads()
!$OMP SINGLE
  id = omp_get_thread_num()
  WRITE (*, '(A,I2,"/",I2)') 'hi', id, num_threads
!$OMP END SINGLE
!$OMP MASTER
  id = omp_get_thread_num()
  WRITE (*, '(A,I2,"/",I2)') 'hello', id, num_threads
!$OMP END MASTER
!$OMP END PARALLEL
  !
END PROGRAM main
