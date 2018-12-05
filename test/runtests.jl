using Test
include("../src/SimpleDebugger.jl")

struct S
    a::Int
    b::String
end

function test()

    x = 1
    s = S(1, "aoia")
    y = 2

    for i in 1:100
        global x_ = x
        global y_ = y
        global s_ = s
        global i_ = i
        i >= 10 && SimpleDebugger.@bkp
    end

end

test()
