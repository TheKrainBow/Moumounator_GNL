dir=$(pwd)
echo $dir
echo "${basedir}"
path=$1

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        COLOR_FLAG=\\e
        ECHO_FLAG=${ECHO_FLAG}
elif [[ "$OSTYPE" == "darwin"* ]]; then
        COLOR_FLAG=\\x1B
        ECHO_FLAG=
fi

echo
echo ${ECHO_FLAG} "\t" | tr -d '\n' ; for i in {16..22} {21..16} {15..22} {21..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t" | tr -d '\n'; for i in {16..22} {21..21} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo ${ECHO_FLAG} "Moumounator" | tr -d '\n';
for i in {21..21} {22..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t" | tr -d '\n'; for i in {16..22} {21..17} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo ${ECHO_FLAG} "GNL" | tr -d '\n';
for i in {17..21} {22..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t" | tr -d '\n'; for i in {16..22} {21..16} {15..22} {21..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo
if [ $# = 0 ]
then
  echo "Need path file."
  echo "Correct use:"
  echo "./Moumounator_GNL.sh <../path_to_your_GNL>"
  echo
  exit
elif [ $# = 1 ]
then
  printf '%s\n\n' "$(tail -n +2 main_all.c)" > main_all.c
  { echo "#include \""$1"/get_next_line.h\""; cat main_all.c; } >main_all.new
  mv main_all.new main_all.c
  fileextension=.
elif [ $# = 2 ]
then
  if [ $2 = -bonus ]
  then
    printf '%s\n\n' "$(tail -n +2 main_all.c)" > main_all.c
    { echo "#include \""$1"/get_next_line_bonus.h\"";cat main_all.c; } >main_all.new
    mv main_all.new main_all.c
  fileextension=_bonus.
  fi
fi
for i in {0..9}
do
  echo "test_n${i}.txt is tested."
  for j in {1..5}
  do
    echo "BUFFER_SIZE = ${j}" | tr -d '\n'
    gcc -D BUFFER_SIZE=${j} main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
    if [ $? = 1 ]
    then
      echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
      echo "\t      |ERROR COMPILE|"
      echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
      echo
      echo "Did you do anything wrong?"
    fi
    ./a.out test_n${i}.txt
  done
done

echo "No error found" >> ERROR_FEEDBACK