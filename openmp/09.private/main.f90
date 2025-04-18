PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::s
  INTEGER::i, j, k
  INTEGER::id
  REAL :: start_time, end_time

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL DO SHARED(i,j,k,s)
  DO i = 1, 100000
    DO j = 1, 100000
      DO k = 1, 10000
        s = s + i
      END DO
    END DO
  END DO
  !$OMP END PARALLEL DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, *) "s: ", s

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL DO PRIVATE(i,j,k,s)
  DO i = 1, 100000
    DO j = 1, 100000
      DO k = 1, 10000
        s = s + i
      END DO
    END DO
  END DO
  !$OMP END PARALLEL DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, *) "s: ", s

  s = 0
  CALL CPU_TIME(start_time)
  DO i = 1, 100000
    DO j = 1, 100000
      DO k = 1, 10000
        s = s + i
      END DO
    END DO
  END DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, *) "s: ", s

END PROGRAM main
