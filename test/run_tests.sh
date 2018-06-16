#! /bin/bash

echo "=== START $0"

if [[ -e "./BFI.class" ]]; then
  rm "BFI"*.class
fi

javac -d . ../src/BFI.java

if [[ ! -e "./BFI.class" ]]; then
  echo "***FAIL: compile"
else

  echo "Test (file not exist): not_exist.bf"
  out=`java BFI not_exist.bf 2>&1`
  if [[ "${out}" == "Error: File not found, \"not_exist.bf\"" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  if [[ ! -e "./empty.bf" ]]; then
    touch empty.bf
  fi
  echo ""
  echo "Test (file in): empty.bf"
  out=`java BFI empty.bf 2>&1`
  if [[ "${out}" == "" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): single_line.bf"
  out=`java BFI single_line.bf 2>&1`
  if [[ "${out}" == "0" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): multiple_lines.bf"
  out=`java BFI multiple_lines.bf 2>&1`
  if [[ "${out}" == "0" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): missing_close_square_bracket.bf"
  out=`java BFI missing_close_square_bracket.bf 2>&1`
  if [[ "${out}" == "Error: Couldn't find matching ']'" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): missing_open_square_bracket.bf"
  out=`java BFI missing_open_square_bracket.bf 2>&1`
  if [[ "${out}" == "Error: Couldn't find matching '['" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): single_read_in.bf"
  out=`echo "a" | java BFI single_read_in.bf 2>&1`
  if [[ "${out}" == "a" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): multiple_read_in.bf"
  out=`java BFI multiple_read_in.bf 2>&1 < input.txt`
  if [[ "${out}" == "x" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (file in): hello_world.bf"
  out=`java BFI hello_world.bf`
  if [[ "${out}" == "Hello World!" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  echo ""
  echo "Test (stdin): hello_world.bf"
  out=`cat hello_world.bf | java BFI`
  if [[ "${out}" == "Hello World!" ]]; then
    echo "Pass"
  else
    echo "***FAIL"
  fi

  rm "BFI"*.class
fi

echo "=== END $0"
exit 0
