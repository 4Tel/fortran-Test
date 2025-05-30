MODULE clock
  IMPLICIT NONE
  !
  REAL::start_cpu, end_cpu
  INTEGER::start_cnt, end_cnt, cnt_rate, cnt_max
  PRIVATE
  PUBLIC::start_clock, end_clock
CONTAINS
  SUBROUTINE start_clock()
    CALL CPU_TIME(start_cpu)
    CALL SYSTEM_CLOCK(start_cnt, cnt_rate, cnt_max)
  END SUBROUTINE start_clock
  !
  SUBROUTINE end_clock()
    CALL CPU_TIME(end_cpu)
    CALL SYSTEM_CLOCK(end_cnt, cnt_rate, cnt_max)
    WRITE (*, *) 'CPU time   : ', end_cpu - start_cpu
    WRITE (*, *) 'Wall time  : ', REAL(end_cnt - start_cnt)/REAL(cnt_rate)
    WRITE (*, *)
  END SUBROUTINE end_clock
END MODULE clock
