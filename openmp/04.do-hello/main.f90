PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::i, j, outer
  !
  CALL omp_set_max_active_levels(3)
  !$OMP PARALLEL num_threads(2)
  !$OMP DO PRIVATE(outer)
  DO i = 1, 2
    outer = omp_get_thread_num()
    WRITE (*, '("Hi",I2,"/",I2)') outer, omp_get_num_threads()
    !$OMP PARALLEL num_threads(4)
    !$OMP DO
    DO j = 1, 2
      WRITE (*, '("hi",I2," - ",I2,"/",I2)') outer, omp_get_thread_num(), omp_get_num_threads()
    END DO
    !$OMP END DO
    !$OMP END PARALLEL
  END DO
  !$OMP END DO
  !$OMP END PARALLEL
END PROGRAM main
