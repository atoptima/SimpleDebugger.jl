# SimpleDebugger.jl
A simple debugger for julia

# Credits 
Artur Pessoa: https://github.com/orgs/atoptima/people/artalvpes

# Use
Add the command "SimpleDebugger.@bkp" in your code to stop at a breakpoint.

# Commands
p \<expression\>

Effect: evaluates an expression and prints the result.

Note: only global variables can be accessed. Copy local variables (of any scope) to global to see their values.
  
c [\<number of steps\>]

Effect: continues the execution and stop again upon the <number of steps>th breakpoint found.

Note: doesn't stop if the parameter is omitted.
  
q

Effect: quit (with a throw, showing the call stack)
