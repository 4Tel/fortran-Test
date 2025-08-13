PROGRAM main
  IMPLICIT NONE
  REAL(4), PARAMETER::r4 = 0
  REAL(8), PARAMETER::r8 = 0
  REAL(16), PARAMETER::r16 = 0
  PRINT *, "Storage sizes of Parameters:"
  PRINT *, "r4", STORAGE_SIZE(r4)/8, "bytes"
  PRINT *, "r8", STORAGE_SIZE(r8)/8, "bytes"
  PRINT *, "r16", STORAGE_SIZE(r16)/8, "bytes"
END PROGRAM main
