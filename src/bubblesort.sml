local
  val rec bsort : int list -> int list =
   fn []         => []
    | [x]        => [x]
    | (x::y::xs) => if x > y then
                      y::x::xs
                    else if x = y then
                      x::y::xs
                    else x::bsort(y::xs)
in
fun bubblesort (xs : int list) : int list =
  if bsort xs = xs then
    xs
  else bubblesort (bsort xs)
end
