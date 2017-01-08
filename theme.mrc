On ^*:Join:#: { echo -t $Chan 14(7JOIN14) 3{14- User3 $Nick $+ 14(3 $+ $Address($nick,1) $+ 14) Has Joined3 $Chan 14-3}  | halt }
On ^*:Part:#: { 
  if ($1- == $null) { echo -t $Chan 14(10PART14) 3{14- User3 $Nick 14Has Left3 $Chan 14-3} | halt }
  if ($1- != $null) { echo -t $Chan 14(10PART14) 3{14- User3 $Nick 14Has Left3 $Chan 14-3} 3(14-3 $1- 14-3) | halt }
}
On ^*:Rawmode:#:{ echo -t $Chan 14(11MODE14) 3{14- User3 $Nick 14Sets Mode: 14(11 $1- 14) in3 $Chan 14-3} | Halt }
On ^*:Text:*:#: { echo -t $Chan 3{14-3 $Nick 14-3} $1- | Halt }
On ^*:Text:*:?: { echo -t $nick 3{14-3 $Nick 14-3} $1- | Halt }
On ^*:QUIT:{
  haltdef
  var %z = 1
  while (%z <= $comchan($nick,0)) { echo -ti2 $comchan($nick,%z) 14(4QUIT14) 3{14- User3 $nick 14(3 $+ $address $+ 14)3-14(4 $+ $1- $+ 14) -3} | inc %z }
}
on ^*:NICK:{
  haltdef
  var %z = 1
  while (%z <= $comchan($newnick,0)) { echo -ti2 $comchan($newnick,%z) 14(9NICKCHANGE14) 3{14- User3 $nick 14changed his/her nick to3 $newnick 14-3} | inc %z }
}
on *:Input:*: {
  if ($left($1,1) == /) { $1- | halt }
  if ($left($1,2) == /) { $1- | halt }
  .msg $active $1-
  echo -t $active 3{14-3 $me 14-3}14 $1-
  halt
}
raw 001:*: {
  echo -st 3{14- $2 $3 $4 $+ 3 $5 $6 $7 14-3}14
  halt
}
raw 002:*: { 
  echo -st 3{14- $2 $3 $4 $+ 3 $5 14 $+ $6 $7 $+ :3 $8 14-3}14
  halt
}
raw 003:*: {
  echo -st 3{14- $2 $3 $4 $5 $+ 3 $6 $+ , $7 $8 $9  $+ 14 $+ $10 $+ 3 $11 $12 14-3}14
  halt
} 
raw 004:*: {
  echo -st 3{14- 3S14erver:3 $2 14 $+ 3V14ersion:3 $3  3U14sermodes:3 $4  3C14hanmodes:3 $5  14-3}14
  halt
}
