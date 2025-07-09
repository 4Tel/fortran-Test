MODULE mem
  USE, INTRINSIC :: ISO_C_BINDING
  IMPLICIT NONE

  INTERFACE
    FUNCTION getrusage(who, usage) BIND(C, name="getrusage")
      IMPORT :: C_INT, C_PTR
      INTEGER(C_INT), VALUE :: who
      TYPE(C_PTR), VALUE :: usage
      INTEGER(C_INT) :: getrusage
    END FUNCTION
  END INTERFACE

  TYPE, BIND(C) :: timeval
    INTEGER(C_LONG) :: tv_sec
    INTEGER(C_LONG) :: tv_usec
  END TYPE timeval

  TYPE, BIND(C) :: rusage
    TYPE(timeval) :: ru_utime        ! user CPU time used
    TYPE(timeval) :: ru_stime        ! system CPU time used
    INTEGER(C_LONG) :: ru_maxrss     ! maximum resident set size
    INTEGER(C_LONG) :: ru_ixrss      ! integral shared memory size
    INTEGER(C_LONG) :: ru_idrss      ! integral unshared data size
    INTEGER(C_LONG) :: ru_isrss      ! integral unshared stack size
    INTEGER(C_LONG) :: ru_minflt     ! page reclaims
    INTEGER(C_LONG) :: ru_majflt     ! page faults
    INTEGER(C_LONG) :: ru_nswap      ! swaps
    INTEGER(C_LONG) :: ru_inblock    ! block input operations
    INTEGER(C_LONG) :: ru_oublock    ! block output operations
    INTEGER(C_LONG) :: ru_msgsnd     ! messages sent
    INTEGER(C_LONG) :: ru_msgrcv     ! messages received
    INTEGER(C_LONG) :: ru_nsignals   ! signals received
    INTEGER(C_LONG) :: ru_nvcsw      ! voluntary context switches
    INTEGER(C_LONG) :: ru_nivcsw     ! involuntary context switches
  END TYPE rusage

  TYPE(rusage), TARGET :: usages
  INTEGER :: status = 0
CONTAINS
  SUBROUTINE init_mem_usage()
    ! getrusage 호출
    status = getrusage(0_C_INT, C_LOC(usages))

    IF (status /= 0) THEN
      WRITE (*, *) "Error initializing memory usage, status =", status
      STOP
    END IF
  END SUBROUTINE init_mem_usage
  !
  SUBROUTINE print_mem_usage(stats, uses)
    TYPE(rusage), INTENT(IN) :: uses
    INTEGER, INTENT(IN) :: stats
    IF (stats /= 0) THEN
      WRITE (*, *) "Memory usage not initialized properly"
      RETURN
    END IF

    WRITE (*, *) "Memory usage (KB): ", uses%ru_maxrss
  END SUBROUTINE print_mem_usage
  !
  SUBROUTINE update_mem_usage()
    CALL init_mem_usage()
    CALL print_mem_usage(status, usages)
  END SUBROUTINE update_mem_usage
END MODULE mem
