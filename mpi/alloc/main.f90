PROGRAM main
  USE mp, ONLY: rank, mp_start, mp_end, mp_bcast
  IMPLICIT NONE
  REAL, ALLOCATABLE::arr(:)
  CALL mp_start()
  !
  IF (rank == 0) THEN
    ALLOCATE (arr(3))
    arr = [1.0, 2.0, 3.0]
  END IF
  CALL mp_bcast(arr)
  IF (rank < 2) THEN
    WRITE (*, *) 'Rank:', rank, 'Array:', arr
  END IF
  !
  CALL mp_end()
END PROGRAM main
