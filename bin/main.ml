open Base

let read_bytes filename =
  let ic = Stdio.In_channel.create filename in 
  let pattern_bytes = Bytes.create 4 in
  Option.value_exn (Stdio.In_channel.really_input ic ~buf:pattern_bytes ~pos: 0 ~len:4);
  let stringified_sub_pattern_for_jpeg = Bytes.to_string(Bytes.sub pattern_bytes ~pos: 0 ~len: 3) in

  match stringified_sub_pattern_for_jpeg with
  | "\xFF\xD8\xFF" -> "image/jpeg"
  | _ -> 
    match Bytes.to_string pattern_bytes with 
    | "\x25\x50\x44\x46" -> "application/pdf"
    | "\x89\x50\x4E\x47" -> "image/png"
    | "\x46\x49\x46\x36" -> "image/gif"
    | "\x52\x49\x46\x46" -> "image/webp"
    | _ -> "dont/care" (* Default MIME type *)

;;

let () =
  let array_of_argument = Sys.get_argv () in
  let filename = array_of_argument.(1)  in
  let mime_type = read_bytes filename in
  Stdlib.print_endline mime_type