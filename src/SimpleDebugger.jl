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
            println("Debugging");
            while true
                command = readline();
                if command[1] == 'c'
                    if length(command) == 1
                        SimpleDebugger.set_count(typemax(Int));
                    else
                        SimpleDebugger.set_count(Meta.parse(command[3:end])-1);
                    end
                    break;
                end
                if command[1] == 'p'
                    v = command[3:end];
                    println(eval(Meta.parse(v)));
                end
                if command[1] == 'q'
                    error("User exit");
                end
            end
        end
    ))
end

end # module
