
filename = "txnlog.dat"
IO.foreach(filename, "rb") { |line| puts line }