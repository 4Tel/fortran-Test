PROGRAM main
  IMPLICIT NONE
  REAL::start_cpu, end_cpu
  INTEGER::start_cnt, end_cnt, cnt_rate, cnt_max
  !
  INTEGER, PARAMETER::sep1 = 100000
  INTEGER, PARAMETER::sep2 = 100000
  INTEGER(kind=8)::i, j
  REAL(kind=SELECTED_REAL_KIND(14, 200))::n
  !
  CALL start_clock()
  n = 0
  DO i = 1, sep1
    DO j = (i - 1)*sep2 + 1, i*sep2
      n = n + j
    END DO
  END DO
  WRITE (*, *) 'calc result: ', n
  !
  CALL end_clock()
  CALL start_clock()
  n = 0
  DO i = 1, sep1
    !$OMP PARALLEL DO PRIVATE(j) REDUCTION(+:n)
    DO j = (i - 1)*sep2 + 1, i*sep2
      n = n + j
    END DO
    !$OMP END PARALLEL DO
  END DO
  WRITE (*, *)
  WRITE (*, *) 'omp result : ', n
  CALL end_clock()
CONTAINS
  SUBROUTINE start_clock()
    CALL CPU_TIME(start_cpu)
    CALL SYSTEM_CLOCK(start_cnt, cnt_rate, cnt_max)
  END SUBROUTINE start_clock
  SUBROUTINE end_clock()
    CALL CPU_TIME(end_cpu)
    CALL SYSTEM_CLOCK(end_cnt, cnt_rate, cnt_max)
    WRITE (*, *) 'CPU time   : ', end_cpu - start_cpu
    WRITE (*, *) 'Wall time  : ', REAL(end_cnt - start_cnt)/REAL(cnt_rate)
  END SUBROUTINE end_clock
END PROGRAM main
