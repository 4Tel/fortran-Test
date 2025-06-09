PROGRAM main
  IMPLICIT NONE
  COMPLEX(kind=8)::var
  var = (1.0, 2.0)
  WRITE (*, *) "var = ", var
  WRITE (*, *) "real part = ", DBLE(var), REAL(var)
  WRITE (*, *) "imaginary part = ", AIMAG(var)
  WRITE (*, *) "conjugate = ", CONJG(var)
  WRITE (*, *) "magnitude = ", ABS(var)
END PROGRAM main
