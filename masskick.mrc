on *:TEXT:*:#: {
  if (($nick !isop $chan) && ($me isop $chan)) {
    if ($mhighlightcheck($chan,$1-) > 5) {
      ban -k $chan $nick 3 [AutoKick] Mass Highlight.
    }
  }
}

alias mhighlightcheck {
  ;$1 chan
  ;$2 text
  ;returns number of highlighted nicks
  ;
  var %count = 0, %x = 1, %text = $replace($strip($2-),$chr(44),$chr(32)) 
  while ($numtok(%text,32) > 0) {
    if ($gettok(%text,%x,32) ison $1) {
      inc %count
    }
    else {
    }
    var %text $remtok(%text,$v1,0,32)
  }
  return %count
