PROGRAM main
  IMPLICIT NONE
  INTEGER::idx
  REAL::time, speed, temp, pos
  LOGICAL::lcontrol_temp
  !
  INTEGER::write_unit = 10, read_unit = 20
  CHARACTER(LEN=20)::write_fname = 'input.dat'
  CHARACTER(LEN=20)::read_fname = 'output.dat'
  CHARACTER(LEN=20)::custom_py = './custom.py'
  INTEGER::ios
  LOGICAL::exists
  !
  DO idx = 1, 3
    time = REAL(idx)
    speed = 2.0*time
    temp = 20.0 + 5.0*time
    pos = speed*time

    ! ... Step 1. Write data to a file
    OPEN (unit=write_unit, file=TRIM(write_fname), status='replace')
    WRITE (write_unit, *) time, speed, temp, pos
    WRITE (*, *) 'Write input for time = ', time, ' speed = ', speed, &
      ' temp = ', temp, ' pos = ', pos
    CLOSE (write_unit)

    ! ... Step 2. Call external program
    INQUIRE (file=TRIM(write_fname), exist=exists)
    IF (.NOT. exists) THEN
      WRITE (*, *) 'File ', TRIM(write_fname), ' does not exist.'
      STOP 1
    END IF
    CALL SYSTEM(TRIM(custom_py)//' '//TRIM(write_fname))

    ! ... Step 3. Read results from a file
    OPEN (unit=read_unit, file=TRIM(read_fname), status='old', iostat=ios)
    READ (read_unit, *) speed, temp, lcontrol_temp
    WRITE (*, *) 'Read output for time = ', time, ' speed = ', speed, &
      ' temp = ', temp, ' pos = ', pos, ' lcontrol_temp = ', lcontrol_temp
    CLOSE (read_unit)
  END DO

END PROGRAM main
