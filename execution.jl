# write something you want to improve first call latency

using Plots
p1=plot(sin)
p1|>display
p2=plot!(p1, cos)
p=plot(rand(10), rand(10))
p|>display