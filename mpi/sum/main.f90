PROGRAM main
  USE mp, ONLY: rank, mp_start, mp_end, mp_sum
  IMPLICIT NONE
  INTEGER::rank_sum
  CALL mp_start()
  !
  rank_sum = rank
  CALL mp_sum(rank_sum)
  WRITE (*, *) 'Rank:', rank, 'Sum of ranks:', rank_sum
  !
  CALL mp_end()
END PROGRAM main
