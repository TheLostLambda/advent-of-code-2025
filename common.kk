import std/os/file
import std/os/path

fun input(day: int) : <exn,fsys> string
  val file = "day" ++ day.show ++ ".txt"
  read-text-file("inputs".path / file).trim

// KOKA: Metaprogramming? How could I change this to just `solve(day: int, part: int)`? I could
// import the `dayN.kk` module, then call the `parse` and `part-one` or `part-two` from that module
// KOKA: I couldn't get the polymorphic effect to work here...
fun solve(day: int, parser: (string) -> exn a, solver: (a) -> b) : <exn,fsys> b
  input(day).parser.solver
