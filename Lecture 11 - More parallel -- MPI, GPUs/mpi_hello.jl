using MPI
MPI.Init()

comm = MPI.COMM_WORLD

size = MPI.Comm_size(comm)
rank = MPI.Comm_rank(comm)
print("Hello from $rank of $size processors!\n")

MPI.Finalize()
