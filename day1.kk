import std/data/sort

fun parse(input : string) : exn (list<int>, list<int>)
  val parts =
    with line <- input.lines.map
    with word <- line.split("   ").map
    word.parse-int.unjust
  parts.map(fn([f, s]) (f,s)).unzip

fun part-one(lists : (list<int>, list<int>)) : int
  // KOKA: Type inference breaks if I just do `lists.map(sort)`? Why?
  val (left, right) = lists.map(fn(l) l.sort)
  zipwith(left, right, fn(l, r) abs(l - r)).sum

fun part-two((left, right) : (list<int>, list<int>)) : int
  val scores =
    with l <- left.map
    l * right.filter(fn(r) l == r).length
  scores.sum
