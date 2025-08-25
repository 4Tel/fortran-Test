PROGRAM main
  IMPLICIT NONE
  INTEGER, PARAMETER::stdin = 5
  INTEGER::tmp
  INTEGER, ALLOCATABLE::idx(:, :)
  READ (stdin, *) tmp
  ALLOCATE (idx(3, tmp))
  WRITE (*, '(I5, I5)') tmp, SIZE(idx)
END PROGRAM main
