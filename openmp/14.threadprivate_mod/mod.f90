MODULE my_mod
  INTEGER::val1
  INTEGER::val2
END MODULE my_mod
SUBROUTINE sub1(val)
  INTEGER, INTENT(IN) :: val
  ! do something. include I/O and buffer
END SUBROUTINE sub1
