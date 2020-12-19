# used in bash or zsh
# translate ipv4 addr <-> host/network order number
ip2n() {
  ip=$1
  int="${ip//./+256*(})))"
  echo $((int))
}
ip2h() {
  ip=$1
  int="(((${ip//./)*256+}"
  echo $(($int))
}
n2ip() {
  int=$1
  echo $((int%256)).$((int/256%256)).$((int/256/256%256)).$((int/256/256/256))
}
h2ip() {
  int=$1
  echo $((int/256/256/256)).$((int/256/256%256)).$((int/256%256)).$((int%256))
}

