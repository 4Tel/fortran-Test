PROGRAM main
  IMPLICIT NONE
  INTEGER::a(2, 2)
  INTEGER::i, j

  !... Method 1
  WRITE (*, 2222) 1
  a = 1
  WRITE (*, 9999) a
  WRITE (*, 1111)

  !... Method 2
  WRITE (*, 2222) 2
  a = RESHAPE([1, 2, 3, 4], SHAPE(a))
  WRITE (*, 9999) a
  DO j = 1, 2
    DO i = 1, 2
      WRITE (*, 8888) i, j, a(i, j)
    END DO
  END DO
  WRITE (*, 1111)

  !... Method 3
  WRITE (*, 2222) 3
  a(:, 1) = [5, 6]
  WRITE (*, 9999) a
  WRITE (*, 1111)

  !... Method 4
  WRITE (*, 2222) 4
  a(1, :) = (/7, 8/)
  WRITE (*, 9999) a
  WRITE (*, 1111)

1111 FORMAT('---')
2222 FORMAT('Method ', I1)
8888 FORMAT('a(', I1, ',', I1')=', I1)
9999 FORMAT("Matrix: ", 4(I1, 1X))
END PROGRAM main
