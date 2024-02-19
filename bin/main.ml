open Base
(* type mimeImageInfo = {byte_pattern : string array; mask : string array;}

let mimeJPG = { byte_pattern = [|"FF"; "D8"; "FF"|]; mask = [|"FF"; "FF"; "FF"|]}
let mimeGIF = { byte_pattern = [|"47"; "49"; "46"; "38"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
let mimePNG = { byte_pattern = [|"89"; "50"; "4E"; "47"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
let mimeWEBP = { byte_pattern = [|"52"; "49"; "46"; "46"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
*)
let read_file_byte file = Option.value_exn (In_channel.with_open_bin file In_channel.input_byte)

let () = 
  let array_of_argument = Sys.get_argv () in
  let byte = read_file_byte array_of_argument.(1)  in
  Stdlib.print_int byte
