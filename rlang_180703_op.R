operator <- function(num1, num2, opcode){
  return (cat(num1, opcode, num2, "=",switch(
    toString(opcode),
    '+' = num1 + num2,
    '-' = num1 - num2,
    '*' = num1 * num2,
    '/' = num1 / num2,
    '%%' = num1 %% num2,
    '%/%' = num1 %/% num2,
    '^' = num1 ^ num2
  )))  
}
operator(3,5,'^')