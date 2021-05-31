using ZXCalculus
using YaoPlots
using Plots

function generate_example()
    zxd = ZXDiagram(4)
    push_gate!(zxd, Val{:Z}(), 1, 3//2)
    push_gate!(zxd, Val{:H}(), 1)
    push_gate!(zxd, Val{:Z}(), 1, 1//2)
    push_gate!(zxd, Val{:H}(), 4)
    push_gate!(zxd, Val{:CZ}(), 4, 1)
    push_gate!(zxd, Val{:CNOT}(), 1, 4)
    push_gate!(zxd, Val{:H}(), 1)
    push_gate!(zxd, Val{:H}(), 4)
    push_gate!(zxd, Val{:Z}(), 1, 1//4)
    push_gate!(zxd, Val{:Z}(), 4, 3//2)
    push_gate!(zxd, Val{:X}(), 4, 1//1)
    push_gate!(zxd, Val{:H}(), 1)
    push_gate!(zxd, Val{:Z}(), 4, 1//2)
    push_gate!(zxd, Val{:X}(), 4, 1//1)

    push_gate!(zxd, Val{:Z}(), 2, 1//2)
    push_gate!(zxd, Val{:CNOT}(), 3, 2)
    push_gate!(zxd, Val{:H}(), 2)
    push_gate!(zxd, Val{:CNOT}(), 3, 2)
    push_gate!(zxd, Val{:Z}(), 2, 1//4)
    push_gate!(zxd, Val{:Z}(), 3, 1//2)
    push_gate!(zxd, Val{:H}(), 2)
    push_gate!(zxd, Val{:H}(), 3)
    push_gate!(zxd, Val{:Z}(), 3, 1//2)
    push_gate!(zxd, Val{:CNOT}(), 3, 2)

    return zxd
end

zxd = generate_example()
ex_zxd = clifford_simplification(zxd)

plot(zxd)
plot(ex_zxd)

macro Name(arg)
   string(arg)
end

name = @Name ex1

function save_plot(name, plot, label)
    cd(dirname(@__FILE__));
    dir = pwd();
    println("Saving plots to the directory in $dir","\\Graphs")
    strlabel = string(label);
    mkpath(string(dir,"\\Graphs\\","\\",name,))
    pngfilename = string(dir,"\\Graphs\\","\\",name,"\\","\\",name,strlabel,".png")
    #pdffilename = string(dir,"\\Graphs\\","\\",name,"_",q, " qubits\\","\\",step," steps\\",strlabel,".pdf")
    #epsfilename = string(dir,"\\Graphs\\","\\",name,"_",q, " qubits\\","\\",step," steps\\",strlabel,".eps")
    savefig(plot, pngfilename)
    #savefig(plot, pdffilename)
    #savefig(plot, epsfilename)
end

title = "" *string(plot_name)* ""
Plots.title!(title)
lables=title

save_plot(plot_name, zxd, label) # Saves the plots to github

dir = pwd();
println("Saving plots to the directory in $dir","\\Graphs")
mkpath(string(dir,"\\Graphs\\","\\",name,))
pngfilename = string(dir,"\\Graphs\\","\\",name,"\\","\\",name,".png")
#pdffilename = string(dir,"\\Graphs\\","\\",name,"_",q, " qubits\\","\\",step," steps\\",strlabel,".pdf")
#epsfilename = string(dir,"\\Graphs\\","\\",name,"_",q, " qubits\\","\\",step," steps\\",strlabel,".eps")
savefig(zxd, pngfilename)
