PROGRAM main
  IMPLICIT NONE
  COMPLEX(kind=4)::var
  var = dcmplx(1.0, 2.0D+39)
  WRITE (*, *) "var = ", var
  WRITE (*, *) "real part = ", DBLE(var), REAL(var)
  WRITE (*, *) "imaginary part = ", AIMAG(var)
  WRITE (*, *) "conjugate = ", CONJG(var)
  WRITE (*, *) "magnitude = ", ABS(var)
END PROGRAM main
