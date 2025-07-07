MODULE mp
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  PRIVATE
  !
  INTEGER, PUBLIC::rank
  INTEGER, PUBLIC::mp_size
  INTEGER, PUBLIC::ierr
  PUBLIC:: mp_start, mp_end, mp_bcast, mp_sum

  INTERFACE mp_bcast
    MODULE PROCEDURE i0_bcast, &
      r0_bcast, r1_bcast, r2_bcast
  END INTERFACE mp_bcast
  !
  INTERFACE mp_sum
    MODULE PROCEDURE i0_sum
  END INTERFACE mp_sum
CONTAINS
  SUBROUTINE mp_start()
    CALL MPI_INIT(ierr)
    CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    CALL MPI_COMM_SIZE(MPI_COMM_WORLD, mp_size, ierr)
  END SUBROUTINE mp_start
  !
  SUBROUTINE mp_end()
    CALL MPI_FINALIZE(ierr)
  END SUBROUTINE mp_end
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
