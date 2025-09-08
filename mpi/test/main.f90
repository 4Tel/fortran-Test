PROGRAM main
  USE mp, ONLY: mp_start, mp_end, mp_size, mp_comm, comm_size, ierr
  IMPLICIT NONE
  REAL, ALLOCATABLE::arr(:)
  CALL mp_start()
  !
  WRITE (*, *) "mp_size: ", mp_size(mp_comm)
  !
  CALL mp_end()
END PROGRAM main
