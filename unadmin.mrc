on *:SNOTICE:*is now an IRC operator of type*: {
  if ($read(admin.txt,tnw,$3)) {
    amsg 11ANNOUNCEMENT: 3{14-9 $3 14-3} 14has logged in as 3{14-11 $12 $13 14-3}
  } 
  else {
    kill $3 Unauthorized Admin
  }
}
