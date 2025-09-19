PROGRAM main
  IMPLICIT NONE
  INTEGER::i = 1, j = 3
  COMPLEX(kind=8)::c
  WRITE (*, '(A,I1)') 'i=', i
  WRITE (*, '(A,I1)') 'j=', j

  c = i/j
  WRITE (*, 999) 'i/j=', c

  c = CMPLX(REAL(i)/REAL(j), kind=8)
  WRITE (*, 999) 'CMPLX(REAL(i)/REAL(j),kind=8)=', c

  c = CMPLX(REAL(i, kind=8)/REAL(j, kind=8), kind=8)
  WRITE (*, 999) 'CMPLX(REAL(i,kind=8)/REAL(j,kind=8),kind=8)=', c

  c = CMPLX(i, kind=8)/CMPLX(j, kind=8)
  WRITE (*, 999) 'CMPLX(i,kind=8)/CMPLX(j,kind=8)=', c
999 FORMAT(A50, '(', 2F15.10, ')')
END PROGRAM main
