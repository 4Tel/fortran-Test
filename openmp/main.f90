PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
!$OMP PARALLEL
  PRINT *, "Hello from process: ", omp_get_wtime()
!$OMP END PARALLEL
END
