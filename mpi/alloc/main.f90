PROGRAM main
  USE mp, ONLY: comm_rank, mp_start, mp_end, mp_bcast
  IMPLICIT NONE
  REAL, ALLOCATABLE::arr(:)
  CALL mp_start()
  !
  IF (comm_rank == 0) THEN
    ALLOCATE (arr(3))
    arr = [1.0, 2.0, 3.0]
  END IF
  CALL mp_bcast(arr)
  IF (comm_rank < 2) THEN
    WRITE (*, *) 'Rank:', comm_rank, 'Array:', arr
  END IF
  !
  CALL mp_end()
END PROGRAM main
