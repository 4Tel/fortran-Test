PROGRAM main
  USE OMP_LIB
  IMPLICIT NONE
  INTEGER::s, i
  INTEGER::id
  !
  ! base code
  s = 0

  DO i = 1, 100
    s = s + i
  END DO

  WRITE (*, '(A,I4)') 'base sum: ', s

  ! OMP PARALLEL code
  s = 0
  !$OMP PARALLEL DO PRIVATE(i), REDUCTION(+:s)
  DO i = 1, 100
    s = s + i
  END DO
  !$OMP END PARALLEL DO
  WRITE (*, '(A,I7)') 'OMP sum : ', s

  ! ! OMP PARALLEL code
  ! s = 0
  ! !$OMP PARALLEL PRIVATE(i), REDUCTION(+:s)
  ! !$OMP DO
  ! DO i = 1, 100
  !   s = s + i
  ! END DO
  ! !$OMP END DO
  ! WRITE (*, "('Thread',I2,': ',I4)") omp_get_thread_num(), s
  ! !$OMP END PARALLEL
  ! WRITE (*, '(A,I4)') 'OMP sum : ', s
END PROGRAM main
