alias -l bash {
  if (!$($+(%,#,bash),2)) { inc -u10 $+(%,#,bash)
    if ($sock($+(bash,#))) sockclose $+(bash,#) 
    sockopen $+(bash,#) www.bash.org 80 
    sockmark $+(bash,#) $+(/?,$iif($1,$1,random)) msg #
  }
}
on *:input:#:if ($regex($1-,/^.bash?\s?(\d+)?$/iS)) bash $iif($regml(1),$v1)
on $*:text:/^.bash?\s?(\d+)?$/iS:#:bash $iif($regml(1),$v1)
on *:sockopen:bash*: { 
  sockwrite -n bash* GET $gettok($sock($sockname).mark,1,32) HTTP/1.1 
  sockwrite -n bash* Host: $+($sock($sockname).addr,$str($crlf,2)) 
}
on *:sockread:bash*: {
  var %bash | sockread %bash
  if ($regex(%bash,/<center.+>Quote\s\43(\d+\s.+exist\56)<\/font>/)) {
    $gettok($sock($sockname).mark,2-,32) 3{14-Bash Quote $+($chr(35),$regml(1),14-3})
    sockclose $sockname
  }
  if ($regex(%bash,/<b>\43(\d+)<\/b>/)) {
    $gettok($sock($sockname).mark,2-,32) 14Looking Up 3{14-Bash Quote$&
      $+($chr(35),$regml(1),14-3}14 Please wait...) 
  }
  if ($regex(%bash,/^(<p class=.+>|)(\S.+)(<br \/>|<\/p>)/)) { 
    inc -u10 $+(%,$sockname) 
    .timerbash $+ $($+(%,$sockname),2) 1 $calc(2* $($+(%,$sockname),2))$& 
      $gettok($sock($sockname).mark,2-,32) 3{14-3 BASH  $+ 14-3}14$&
      $replace($regml(2),&lt;,<,&gt;,>,&nsbsp,$chr(32),&,&)
  }
  if ($regml(3) = </p>) { sockclose $sockname }
}
