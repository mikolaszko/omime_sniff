type mimeImageInfo = {byte_pattern : string array; mask : string array;}

let mimeJPG = { byte_pattern = [|"FF"; "D8"; "FF"|]; mask = [|"FF"; "FF"; "FF"|]}
let mimeGIF = { byte_pattern = [|"47"; "49"; "46"; "38"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
let mimePNG = { byte_pattern = [|"89"; "50"; "4E"; "47"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
let mimeWEBP = { byte_pattern = [|"52"; "49"; "46"; "46"|]; mask = [|"FF"; "FF"; "FF"; "FF"|]}
 

let () =
    Printf.printf "%s\n" Sys.argv.(1)
