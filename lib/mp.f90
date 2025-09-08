MODULE mp
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  PRIVATE
  !
  INTEGER, PUBLIC::mp_comm
  INTEGER, PUBLIC::comm_rank
  INTEGER, PUBLIC::comm_size
  INTEGER, PUBLIC::ierr
  PUBLIC:: mp_start, mp_end
  PUBLIC:: mp_size
  PUBLIC:: mp_bcast, mp_sum

  INTERFACE mp_bcast
    MODULE PROCEDURE i0_bcast, &
      r0_bcast, r1_bcast, r2_bcast
  END INTERFACE mp_bcast
  !
  INTERFACE mp_sum
    MODULE PROCEDURE i0_sum
  END INTERFACE mp_sum
CONTAINS
  SUBROUTINE mp_start(my_world_comm)
    INTEGER, INTENT(IN), OPTIONAL :: my_world_comm
    !
    mp_comm = MPI_COMM_WORLD
    IF (PRESENT(my_world_comm)) mp_comm = my_world_comm
    !
    CALL MPI_INIT(ierr)
    CALL MPI_COMM_RANK(mp_comm, comm_rank, ierr)
    CALL MPI_COMM_SIZE(mp_comm, comm_size, ierr)
  END SUBROUTINE mp_start
  !
  SUBROUTINE mp_end()
    CALL MPI_FINALIZE(ierr)
  END SUBROUTINE mp_end
  !
  SUBROUTINE mp_stop(code)
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: code
    WRITE (*, fmt='( "*** error in Message Passing (mp) module ***")')
    WRITE (*, fmt='( "*** error code: ",I5)') code
    ! abort with extreme prejudice across the entire MPI set of tasks
    CALL MPI_ABORT(MPI_COMM_WORLD, code, ierr)
    STOP
  END SUBROUTINE mp_stop

  ! ==================================================
  FUNCTION mp_size(comm)
    IMPLICIT NONE
    INTEGER :: mp_size
    INTEGER, INTENT(IN) :: comm
    INTEGER :: numtask
    !
    ierr = 0
    numtask = 1
    CALL MPI_COMM_SIZE(comm, numtask, ierr)
    IF (ierr /= 0) CALL mp_stop(8068)
    mp_size = numtask
  END FUNCTION mp_size
  ! ==================================================
  SUBROUTINE bcast_integer(msg, msglen)
    INTEGER, INTENT(IN)::msglen
    INTEGER::msg(msglen)
    CALL mpi_barrier(MPI_COMM_WORLD, ierr)
    CALL MPI_BCAST(msg, msglen, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)
  END SUBROUTINE bcast_integer
  !
  SUBROUTINE bcast_real(msg, msglen)
    INTEGER, INTENT(IN)::msglen
    REAL::msg(msglen)
    CALL mpi_barrier(MPI_COMM_WORLD, ierr)
    CALL MPI_BCAST(msg, msglen, MPI_REAL, 0, MPI_COMM_WORLD, ierr)
  END SUBROUTINE bcast_real
  ! ==================================================
  SUBROUTINE i0_bcast(msg)
    INTEGER :: msg
    CALL bcast_integer(msg, 1)
  END SUBROUTINE i0_bcast
  !
  SUBROUTINE r0_bcast(msg)
    REAL :: msg
    CALL bcast_real(msg, 1)
  END SUBROUTINE r0_bcast
  !
  SUBROUTINE r1_bcast(msg)
    REAL::msg(:)
    INTEGER:: msglen
    msglen = SIZE(msg)
    CALL bcast_real(msg, msglen)
  END SUBROUTINE r1_bcast
  !
  SUBROUTINE r2_bcast(msg)
    REAL::msg(:, :)
    INTEGER:: msglen
    msglen = SIZE(msg, 1)*SIZE(msg, 2)
    CALL bcast_real(msg, msglen)
  END SUBROUTINE r2_bcast
  ! ==================================================
  SUBROUTINE sum_integer(msg, msglen)
    INTEGER, INTENT(IN)::msglen
    INTEGER::msg(msglen)
    INTEGER::sum
    CALL MPI_ALLREDUCE(msg, sum, 1, MPI_INTEGER, MPI_SUM, MPI_COMM_WORLD, ierr)
    ! CALL MPI_REDUCE(msg, sum, 1, MPI_INTEGER, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    msg = sum
  END SUBROUTINE sum_integer
  ! ==================================================
  SUBROUTINE i0_sum(msg)
    INTEGER::msg
    INTEGER::msglen
    msglen = 1
    CALL sum_integer(msg, msglen)
  END SUBROUTINE i0_sum
END MODULE mp
