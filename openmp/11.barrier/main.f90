PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::i
  INTEGER::id

  !... w/o barrier
  !$OMP PARALLEL PRIVATE(i,id)
  id = omp_get_thread_num()
  DO i = 1, 2
    CALL WAIT(0.2*id)
    WRITE (*, '(A,I2," / ",A, I2) ') "id: ", id, "i: ", i
  END DO
  !$OMP END PARALLEL

  !... with barrier
  !$OMP PARALLEL PRIVATE(i,id)
  id = omp_get_thread_num()
  DO i = 1, 2
    CALL WAIT(0.2*id)
    !$OMP BARRIER
    WRITE (*, '(A,I2," / ",A, I2) ') "id: ", id, "i: ", i
  END DO
  !$OMP END PARALLEL

CONTAINS
  ! fortran sleep function for float value
  SUBROUTINE WAIT(time)
    REAL, INTENT(IN)::time
    CHARACTER(LEN=100) :: command
    WRITE (command, '(A,F5.2)') "sleep ", time
    CALL SYSTEM(command)
  END SUBROUTINE WAIT
END PROGRAM main
