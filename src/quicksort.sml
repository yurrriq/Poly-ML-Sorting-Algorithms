local
  fun split (pivot : int) : int list -> int list * int list =
   fn []        => ([],[])
    | (x :: xs) => let val (below, above) = split pivot xs
                   in
                     if x < pivot then
                       (x :: below, above)
                     else
                       (below, x :: above)
                   end
in
val rec quicksort : int list -> int list =
 fn []              => []
  | (pivot :: rest) =>
    let
      val (below, above) = split pivot rest
    in
      quicksort below @ [pivot] @ quicksort above
    end
end
