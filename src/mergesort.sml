local
  val rec merge : int list * int list -> int list =
   fn ([], ys)       => ys
    | (xs, [])       => xs
    | (x::xs, y::ys) => if x < y then
                          x::merge(xs, y::ys)
                        else y::merge(x::xs, ys)
  val rec split : 'a list -> 'a list * 'a list =
   fn []         => ([],[])
    | [x]        => ([x],[])
    | (x::y::zs) => let val (xs, ys) = split zs
                    in
                      (x::xs, y::ys)
                    end
in
val rec mergesort : int list -> int list =
 fn []    => []
  | [a]   => [a]
  | [a,b] => if a <= b then [a,b] else [b,a]
  | xs    => let val (ys,zs) = split xs
             in
               merge (mergesort ys, mergesort zs)
             end
end
