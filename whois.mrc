raw 301:*: {
  echo -a 3{14-14 3A14way: Yes: ( $+ $3- $+ ) 14-3} 
  halt
}
raw 307:*: {
  echo -a 3{14-14 3R14egistered 3N14ickname: Yes. 14-3} 
  halt
}
raw 310:*: {
  echo -a 3{14-14 3I14RC 3H14elper: Yes. 14-3} 
  halt
}
raw 311:*: {
  echo -a 3{14-14 3W14hois for $2 14-3}
  echo -a 3{14-14 3N14ick3N14ame: $2 14-3} 
  echo -a 3{14-14 3R14eal 3N14ame: $6- 14-3}
  echo -a 3{14-14 3I14dent: $3 14-3}
  echo -a 3{14-14 3A14ddress: *!*3@14 $+ $4 14-3}
  halt
}
raw 378:*: {
  echo -a 3{14-14 3H14ostmask: $6 14-3} 
  echo -a 3{14-14 3I14P: $7 14-3}
  halt
}
raw 379:*: {
  echo -a 3{14-14 3M14odes: $6- 14-3}
  halt
}
raw 671:*: {
  echo -a 3{14-14 3S14ecure 3C14onnection: Yes 14-3} 
  halt

}
raw 276:*: {
  echo -a 3{14-14 3C14lient 3C14ert 3F14ingerprint: $7 14-3}
  halt
}
raw 320:*: {
  echo -a 3{14-14 3N14etwork 3A14dministrator: Yes 14-3}
  halt
}
raw 330:*: {
  echo -a 3{14-14 3L14ogged in as: $2 14-3}
  halt
}
raw 312:*: {
  echo -a 3{14-14 3S14erver: $3 14-3}
  echo -a 3{14-14 3D14escription: $4- 14-3}
  halt
}

raw 313:*: {
  echo -a 3{14-14 3N14etwork 3R14ank: $5-9 14-3}
  halt
}
raw 319:*: {
  echo -a 3{14-14 3C14hannels: $Replace($3-,~,3~14,&,3&14,@,3@14,%,3%14,+,3+14) 14-3}
  halt
}
raw 317:*: {
  echo -a 3{14-14 3S14igned on at: $asctime($4,dddd mm/dd/yyyy HH:nn:sstt) 14-3}
  echo -a 3{14-14 3T14ime 3I14dle: $duration($3) 14-3}
  echo -a 3{14-14 3T14ime 3O14nline: $duration($calc($ctime - $4)) 14-3}
  halt
}
raw 335:*: { 
  echo -a 3{14-14 3B14ot: Yes. 14-3} 
  halt
}

raw 318:*: { 
  echo -a 3{14-14 3E14nd of 3W14hois 14-3} 
  halt
}
