local
  fun insert (x : int) : int list -> int list =
   fn []      => [x]
    | (y::ys) => if x < y then
                   x::y::ys
                 else y::insert x ys
in
val rec insertionsort : int list -> int list =
 fn []      => []
  | (x::xs) => insert x (insertionsort xs)
end
