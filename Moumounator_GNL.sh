dir=$(pwd)
echo $dir
echo "${basedir}"
path=$1

if [[ "$OSTYPE" == "darwin"* ]]; then
        COLOR_FLAG=\\x1B
        ECHO_FLAG=
else
        COLOR_FLAG=\\e
        ECHO_FLAG=-ne
fi
clear
echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;220m"
echo "${COLOR_FLAG}[38;5;220m"
cat cat/cat.txt
for i in {10..21}
do
  rm -f tested_files/test_n${i}.txt
done
echo
echo
echo ${ECHO_FLAG} "\t\t\t" | tr -d '\n' ; for i in {16..22} {21..16} {15..22} {21..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t\t\t" | tr -d '\n'; for i in {16..22} {21..21} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo ${ECHO_FLAG} "Moumounator" | tr -d '\n';
for i in {21..21} {22..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t\t\t" | tr -d '\n'; for i in {16..22} {21..20} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo ${ECHO_FLAG} "FT_PRINTF" | tr -d '\n';
for i in {20..21} {22..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo ${ECHO_FLAG} "\t\t\t" | tr -d '\n'; for i in {16..22} {21..16} {15..22} {21..16} ; do echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;${i}m₪${COLOR_FLAG}[0m" | tr -d '\n'; done ; echo
echo
echo ${ECHO_FLAG} "${COLOR_FLAG}[1m"
sleep 1
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
  printf '%s\n\n' "$(tail -n +2 main_stdin.c)" > main_stdin.c
  { echo "#include \""$1"/get_next_line.h\""; cat main_all.c; } >main_all.new
  { echo "#include \""$1"/get_next_line.h\""; cat main_stdin.c; } >main_stdin.new
  mv main_all.new main_all.c
  mv main_stdin.new main_stdin.c
  fileextension=.
elif [ $# = 2 ]
then
  if [ $2 = -bonus ]
  then
    printf '%s\n\n' "$(tail -n +2 main_all.c)" > main_all.c
    printf '%s\n\n' "$(tail -n +2 main_stdin.c)" > main_stdin.c
    { echo "#include \""$1"/get_next_line_bonus.h\""; cat main_all.c; } >main_all.new
    { echo "#include \""$1"/get_next_line_bonus.h\""; cat main_stdin.c; } >main_stdin.new
    mv main_all.new main_all.c
    mv main_stdin.new main_stdin.c
    fileextension=_bonus.
  fi
fi

touch tested_files/test_n20.txt
touch tested_files/test_n21.txt
chmod 777 tested_files/test_n20.txt
chmod 777 tested_files/test_n21.txt
for i in {0..12000}
do
  printf "42 " >> tested_files/test_n20.txt
  printf "\n" >> tested_files/test_n21.txt
done

for i in {10..15}
do
  touch tested_files/test_n${i}.txt
  chmod 777 tested_files/test_n${i}.txt
  j=0
  while ((j<i-10))
  do
    printf "\n" >> tested_files/test_n${i}.txt
    ((j+=1))
  done
done
for i in {16..19}
do
  touch tested_files/test_n${i}.txt
  chmod 777 tested_files/test_n${i}.txt
  j=0
  while ((j<i-16))
  do
    printf "Cat\n" >> tested_files/test_n${i}.txt
    ((j+=1))
  done
done
for i in {10..19}
do
  echo "test_n${i}.txt is tested."
  for j in {1..5}
  do
    echo "BUFFER_SIZE = ${j}" | tr -d '\n'
    gcc -w -D BUFFER_SIZE=${j} main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
    if [ $? = 1 ]
    then
      echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
      echo "\t      |ERROR COMPILE|"
      echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
      echo
      echo "Did you do anything wrong?"
    fi
    ./a.out tested_files/test_n${i}.txt
  done
done

echo "cat/cat.txt is tested."
for j in {1..5}
do
  echo "BUFFER_SIZE = ${j}" | tr -d '\n'
  gcc -w -D BUFFER_SIZE=${j} main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
  if [ $? = 1 ]
  then
    echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
    echo "\t      |ERROR COMPILE|"
    echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
    echo
    echo "Did you do anything wrong?"
  fi
  ./a.out cat/cat.txt
done

echo "[LONG LINE] test_n20.txt is tested."
for j in {1..5}
do
  echo "BUFFER_SIZE = ${j}" | tr -d '\n'
  gcc -w -D BUFFER_SIZE=${j} main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
  if [ $? = 1 ]
  then
    echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
    echo "\t      |ERROR COMPILE|"
    echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
    echo
    echo "Did you do anything wrong?"
  fi
  ./a.out tested_files/test_n20.txt
done

echo "[MANY LINE] test_n21.txt is tested."
for j in {1..5}
do
  echo "BUFFER_SIZE = ${j}" | tr -d '\n'
  gcc -w -D BUFFER_SIZE=${j} main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
  if [ $? = 1 ]
  then
    echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
    echo "\t      |ERROR COMPILE|"
    echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
    echo
    echo "Did you do anything wrong?"
  fi
  ./a.out tested_files/test_n21.txt
done

echo "/devs/null is tested. (Buffer 8)"
gcc -w -D BUFFER_SIZE=8 main_all.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
if [ $? = 1 ]
then
  echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
  echo "\t      |ERROR COMPILE|"
  echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
  echo
  echo "Did you do anything wrong?"
fi
./a.out /devs/null

echo "Testing stdin with buffer_size 42"
gcc -w -D BUFFER_SIZE=42 main_stdin.c gnl/*.c $1/get_next_line${fileextension}c $1/get_next_line_utils${fileextension}c
if [ $? = 1 ]
then
  echo "\n\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------"
  echo "\t      |ERROR COMPILE|"
  echo "\t      ${COLOR_FLAG}[1m${COLOR_FLAG}[31m---------------${COLOR_FLAG}[0m"
  echo
  echo "Did you do anything wrong?"
fi
./a.out
rm a.out
echo "No error found" >> ERROR_FEEDBACK
echo ${ECHO_FLAG} "${COLOR_FLAG}[38;5;220m"
echo
cat cat/error.txt
echo
echo ${ECHO_FLAG} "${COLOR_FLAG}[0;1m"
echo ${ECHO_FLAG} "         Thanks for using Moumounator (Meow)"
rm -rf *.a a.out output_printf.txt output_user.txt