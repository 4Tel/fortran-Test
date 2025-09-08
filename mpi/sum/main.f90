PROGRAM main
  USE mp, ONLY: comm_rank, mp_start, mp_end, mp_sum
  IMPLICIT NONE
  INTEGER::rank_sum
  CALL mp_start()
  !
  rank_sum = comm_rank
  CALL mp_sum(rank_sum)
  WRITE (*, *) 'Rank:', comm_rank, 'Sum of ranks:', rank_sum
  !
  CALL mp_end()
END PROGRAM main
