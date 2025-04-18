PROGRAM main
  IMPLICIT NONE
  REAL::start_cpu, end_cpu
  INTEGER::start_cnt, end_cnt, cnt_rate, cnt_max
  !
  INTEGER(kind=8)::i, j
  REAL(kind=SELECTED_REAL_KIND(14, 200))::n
  !
  WRITE(*,*) "normal"
  CALL start_clock()
  n = 0
  DO i = 1, 50000
    DO j = 1, 5000
      n = n + 1
    END DO
  END DO
  CALL end_clock()
!
  WRITE(*,*) "overhead"
  CALL start_clock()
  n = 0
  DO i = 1, 50000
    !$OMP PARALLEL DO PRIVATE(j) REDUCTION(+:n)
    DO j = 1, 5000
      n = n + 1
    END DO
    !$OMP END PARALLEL DO
  END DO
  CALL end_clock()
!
  WRITE(*,*) "outer"
  CALL start_clock()
  n = 0
  !$OMP PARALLEL DO PRIVATE(i,j) REDUCTION(+:n)
  DO i = 1, 50000
    DO j = 1, 5000
      n = n + 1
    END DO
  END DO
  !$OMP END PARALLEL DO
  CALL end_clock()
!
  WRITE(*,*) "Collapse"
  CALL start_clock()
  n = 0
  !$OMP PARALLEL DO PRIVATE(i,j) REDUCTION(+:n), COLLAPSE(2)
  DO i = 1, 50000
    DO j = 1, 5000
      n = n + 1
    END DO
  END DO
  !$OMP END PARALLEL DO
  CALL end_clock()
!
  WRITE(*,*) "Schedule"
  CALL start_clock()
  n = 0
  !$OMP PARALLEL DO PRIVATE(i,j) REDUCTION(+:n), SCHEDULE(guided)
  DO i = 1, 50000
    DO j = 1, 5000
      n = n + 1
    END DO
  END DO
  !$OMP END PARALLEL DO
  CALL end_clock()
!
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
    WRITE (*, *)
  END SUBROUTINE end_clock
END PROGRAM main
