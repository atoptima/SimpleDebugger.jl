module SimpleDebugger
global SimpleDebugger_count = 0

function set_count(v::Int)
    global SimpleDebugger_count = v
end

macro bkp()
    return esc(:(
        temp = SimpleDebugger.SimpleDebugger_count;
        if temp > 0
            t2 = SimpleDebugger.SimpleDebugger_count - 1;
            SimpleDebugger.set_count(t2);
        else
            println("Debugging...")
            while true
                command = readline();
                if length(command) == 0
                    continue
                end
                if command[1] == 'h'
                    println("SimpleDebugger help:")
                    println("Commands are:")
                    println("h -> help")
                    println("p + <exp> -> print (or eval) epression <exp>")
                    println("c + <number> -> skip <number> times the breakpoint is hit")
                    println("q -> quit debugging with the stacktrace")
                elseif command[1] == 'c'
                    if length(command) == 1
                        SimpleDebugger.set_count(typemax(Int));
                    else
                        SimpleDebugger.set_count(Meta.parse(command[3:end])-1);
                    end
                    break;
                elseif command[1] == 'p'
                    v = command[3:end];
                    try
                        println(eval(Meta.parse(v)));
                    catch err
                        println(err);
                    end
                elseif command[1] == 'q'
                    error("User exit");
                else
                    println("Unrecognized SimpleDebugger command ", command[1])
                end
            end
        end
    ))
end

end # module
