PROGRAM main
  IMPLICIT NONE
  INTEGER, PARAMETER::stdin = 5
  INTEGER::tmp
  INTEGER, ALLOCATABLE::idx(:, :)
  WRITE (*, '(A)', ADVANCE='NO') 'Enter an integer: '
  READ (stdin, *) tmp
  ALLOCATE (idx(3, tmp))
  idx = 0
  WRITE (*, '(I5, I5)') tmp, SIZE(idx)
END PROGRAM main
