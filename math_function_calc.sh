#!/bin/bash
add() {
  sum=$(( $1 + $2 ))
  echo "Sum is: $sum"
}

subtract() {
  minus=$(( $1 - $2 ))
  echo "Subtraction is: $minus"
}

multiply() {
  product=$(( $1 * $2 ))
  echo "Multiplication is: $product"
}

divide() {
  division=$(( $1 / $2 ))
  echo "Division is: $division"
}

"$@"
