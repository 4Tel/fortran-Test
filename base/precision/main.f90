PROGRAM main
  IMPLICIT NONE
  REAL(KIND=4)::x
  REAL(KIND=8)::y
  REAL(KIND=16)::Z
  !
  WRITE (*, 1520)
  WRITE (*, '(A)') "|Real numbers in Fortran with different kinds|"
  WRITE (*, 1520)
  WRITE (*, 1522) "kind", "set", "get"
  WRITE (*, 1520)

  WRITE (*, 1523) "const", "1.0E+39", 1.0E+39
  WRITE (*, 1523) "const", "1.0D+39", 1.0D+39
  x = 1.0D+39
  WRITE (*, 1523) "4(single)", "1.0D+39", x
  y = 1.0D+39
  WRITE (*, 1523) "8(double)", "1.0D+39", y
  WRITE (*, 1520)

  WRITE (*, 1523) "const", "1.0D+309", 1.0D+309
  WRITE (*, 1523) "const", "1.0D+309", 1.0E+309_16
  y = 1.0E+309_16
  WRITE (*, 1523) "8(double)", "1.0E+309_16", y
  z = 1.0E+309_16
  WRITE (*, 1523) "16(quadr)", "1.0E+309_16", z
  WRITE (*, 1520)

1520 FORMAT("---------------------------------------------")
1522 FORMAT("| ", A10, " | ", A12, " | ", A14, " |")
1523 FORMAT("| ", A10, " | ", A12, " | ", E14.7, " |")
END PROGRAM main
