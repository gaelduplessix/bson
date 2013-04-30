open Ocaml_bson;;

let print_buffer s = 
  String.iter (fun c -> let i = Char.code c in if i < 10 then Printf.printf "\\x0%X" i else Printf.printf "\\x%X" i) s;
  print_endline "";;



let bin = "12345";;

let doc0 = Bson.make ();;


let e1 = Bson.create_double 1.0;;
let doc1 = Bson.add_element "Double" e1 doc0;;

let e2 = Bson.create_string "string";;
let doc2 = Bson.add_element "String" e2 doc1;;

let e3 = Bson.create_doc_element doc2;;
let doc3 = Bson.add_element "Document" e3 doc2;;

let e4 = Bson.create_list [e1;e2;e3];;
let doc4 = Bson.add_element "Array" e4 doc3;;

(*let e5 = Bson.create_generic_binary bin;;
let doc5 = Bson.add_element "Generic Binary" e5 doc4;;

let e6 = Bson.create_function_binary bin;;
let doc6 = Bson.add_element "Function Binary" e6 doc5

let e7 = Bson.create_uuid_binary bin;;
let doc7 = Bson.add_element "UUID Binary" e7 doc6;;

let e8 = Bson.create_md5_binary bin;;
let doc8 = Bson.add_element "MD5 Binary" e8 doc7;;*)

let e9 = Bson.create_user_binary bin;;
let doc9 = Bson.add_element "User Defined Binary" e9 doc4;;

let e10 = Bson.create_objectId "123456789123";;
let doc10 = Bson.add_element "ObjectId" e10 doc9;;

(*let e10_1 = Bson.create_objectId "00123456789123";;
let doc10_1 = Bson.add_element "ObjectId" e10_1 doc9;;*)

let e11 = Bson.create_boolean true;;
let doc11 = Bson.add_element "Boolean" e11 doc10;;

let e12 = Bson.create_utc 123L;;
let doc12 = Bson.add_element "UTC" e12 doc11;;

let e13 = Bson.create_null ();;
let doc13 = Bson.add_element "Null" e13 doc12;;

let e14 = Bson.create_regex "pattern" "option";;
let doc14 = Bson.add_element "Regex" e14 doc13;;

let e15 = Bson.create_jscode "code...";;
let doc15 = Bson.add_element "JSCode" e15 doc14;;

let e16 = Bson.create_jscode_w_s "code" doc14;;
let doc16 = Bson.add_element "JSCodeWS" e16 doc15;;

let e17 = Bson.create_int32 123l;;
let doc17 = Bson.add_element "Int32" e17 doc16;;

let e18 = Bson.create_int64 123L;;
let doc18 = Bson.add_element "Int64" e18 doc17;;

(*let e19 = Bson.create_timestamp 123L;;
let doc19 = Bson.add_element "Timestamp" e19 doc18;;*)

let e20 = Bson.create_minkey ();;
let doc20 = Bson.add_element "MinKey" e20 doc18;;

let e21 = Bson.create_maxkey ();;
let doc21 = Bson.add_element "MaxKey" e21 doc20;;

(*let _ = print_endline "{\"hello\":\"world\"}";;*)
let e22 = Bson.create_string "world";;
let doc22 = Bson.add_element "hello" e22 doc0;;
let _ = print_endline (Bson.to_json doc22);;

let _ = print_endline "encoding...";;
let doc22_buf = Bson.encode doc22;;
let _ = print_buffer doc22_buf;;

let _ = print_endline "decoding...";;
let doc22_rev = Bson.decode doc22_buf;;
let _ = print_endline (Bson.to_json doc22_rev);;



print_endline "";;

(*let _ = print_endline "{\"BSON\":[\"awesome\", 5.05, 1986]}";;*)
let l = [(Bson.create_string "awesome"); (Bson.create_double 5.05); (Bson.create_int32 1986l)];;
let e23 = Bson.create_list l;;
let doc23 = Bson.add_element "BSON" e23 doc0;;
let _ = print_endline (Bson.to_json doc23);;

let _ = print_endline "encoding...";;
let doc23_buf = Bson.encode doc23;;
let _ = print_buffer doc23_buf;;

let _ = print_endline "decoding...";;
let doc23_rev = Bson.decode doc23_buf;;
let _ = print_endline (Bson.to_json doc23_rev);;

print_endline "";;

(*
let doc21_buf = Bson.encode doc21;;
let _ = print_buffer doc21_buf;;*)
