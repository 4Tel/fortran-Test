PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::s
  INTEGER::i, j, k
  INTEGER::id
  REAL :: start_time, end_time

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL DO PRIVATE(i,s)
  DO i = 1, 100
    s = s + i
  END DO
  !$OMP END PARALLEL DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, '(A,I7)') 'OMP sum : ', s

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL DO PRIVATE(i), SHARED(s)
  DO i = 1, 100
    s = s + i
  END DO
  !$OMP END PARALLEL DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, '(A,I7)') 'OMP sum : ', s

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL DO PRIVATE(i), REDUCTION(+:s)
  DO i = 1, 100
    s = s + i
  END DO
  !$OMP END PARALLEL DO
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, '(A,I7)') 'OMP sum : ', s

  s = 0
  CALL CPU_TIME(start_time)
  !$OMP PARALLEL PRIVATE(i,j), SHARED(s)
  j = 0
  !$OMP DO
  DO i = 1, 100
    j = j + i
  END DO
  !$OMP END DO
  !$OMP CRITICAL
  s = s + j
  !$OMP END CRITICAL
  !$OMP END PARALLEL
  CALL CPU_TIME(end_time)
  WRITE (*, '(A,F7.4,A2)') 'Execution time: ', end_time - start_time, "s"
  WRITE (*, '(A,I7)') 'OMP sum : ', s
END PROGRAM main
