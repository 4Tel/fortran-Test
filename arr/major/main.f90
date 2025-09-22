PROGRAM main
  USE constants, ONLY: DP
  USE clock, ONLY: start_clock, end_clock
  IMPLICIT NONE
  INTEGER(DP), PARAMETER::arr_size = 30000
  REAL::arr(arr_size, arr_size)
  INTEGER(DP)::s = 0
  INTEGER::idx, jdx

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "Array size:", arr_size
  WRITE (*, *) "array assignment performance test"
  WRITE (*, *) "---------------------------------------------"

  WRITE (*, *) "arr = 1"
  CALL start_clock()
  arr = 1
  CALL end_clock()

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "s = SUM(arr)"
  WRITE (*, *) "---------------------------------------------"
  s = 0
  CALL start_clock()
  s = SUM(arr)
  CALL end_clock()

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "s += SUM(arr(:, jdx))"
  WRITE (*, *) "---------------------------------------------"
  s = 0
  CALL start_clock()
  DO jdx = 1, arr_size
    s = s + SUM(arr(:, jdx))
  END DO
  CALL end_clock()

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "s += SUM(arr(jdx, :))"
  WRITE (*, *) "---------------------------------------------"
  s = 0
  CALL start_clock()
  DO jdx = 1, arr_size
    s = s + SUM(arr(jdx, :))
  END DO
  CALL end_clock()

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "s += arr(idx, jdx)"
  WRITE (*, *) "---------------------------------------------"
  s = 0
  CALL start_clock()
  DO idx = 1, arr_size
    DO jdx = 1, arr_size
      s = s + arr(idx, jdx)
    END DO
  END DO
  CALL end_clock()

  WRITE (*, *) "---------------------------------------------"
  WRITE (*, *) "s += arr(jdx, idx)"
  WRITE (*, *) "---------------------------------------------"
  s = 0
  CALL start_clock()
  DO idx = 1, arr_size
    DO jdx = 1, arr_size
      s = s + arr(jdx, idx)
    END DO
  END DO
  CALL end_clock()
END PROGRAM main
