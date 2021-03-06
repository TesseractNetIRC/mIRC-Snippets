##By Protheus at irc.tesseractnet.com

#psqm on

alias psqm {
  if ($dialog(psqm)) { dialog -x psqm }
  dialog -m psqm psqm
}

dialog psqm {
  title "ProSec IRC Query Manager"
  size -1 -1 170 50
  option dbu
}

on *:dialog:psqm:init:*: {
  dcx Mark $dname psqm_cb
  $blk
  $xdc 1 text 4 4 332 20 transparent
  $xdc 2 text 4 22 332 20 transparent
  $xdc 4 button 4 70 82 26
  xdid -t $dname 4 Accept
  $xdc 5 button 130 70 82 26
  xdid -t $dname 5 Deny
  $xdc 6 button 254 70 82 26
  xdid -t $dname 6 Whois
}

alias psqm_cb {
  if ($2 == sclick) && ($3 == 4) {
    .query %qnick 3{14- 3Q14uery request accepted3. 14-3}
    dialog -x psqm
    unset %qnick
  }
  elseif ($2 == sclick) && ($3 == 5) {
    .query %qnick 3{14- 3Q14uery request denied3. 3I14 am currently too busy to accept your PM3. 3P14lease try again later3. 14-3}
    dialog -x psqm 
    .closemsg  %qnick
    .ignore -wu120 %qnick
    unset %qnick
  }
  elseif ($2 == sclick) && ($3 == 6) {
    whois %qnick
  }
}

on *:open:?:*: {
  set %qnick $nick
  .query %qnick 3{14- 3Y14our query has been sent3. 3P14lease be patient while i decide whether or not to respond3... 14-3}
  echo -a  Incoming Message From:3 $nick $+ ( $+ $address $+ )
  psqm
  xdid -t psqm 1 3{14- 3S14ender3:3 $nick 14-3}
  xdid -t psqm 2 3{14- 3T14ime3:3 $time(h:nn TT) 14-3}
}

#psqm end

menu channel {
  .Query Manager
  ..On: .enable #psqm | echo -a Query Manager on
  ..Off: .disable #psqm | echo -a Query Manager off
}
