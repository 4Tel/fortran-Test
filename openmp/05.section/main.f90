PROGRAM main
  USE OMP_LIB
  !
  INTEGER::num_threads, id

!$OMP PARALLEL
  num_threads = omp_get_num_threads()
!$OMP SECTIONS
!$OMP SECTION
  id = omp_get_thread_num()
  WRITE (*, '(A5,I2," /",I2)') 'hello', id, num_threads
!$OMP SECTION
  id = omp_get_thread_num()
  WRITE (*, '(A5,I2," /",I2)') 'hi', id, num_threads
!$OMP END SECTIONS
!$OMP END PARALLEL
  !
END PROGRAM main
