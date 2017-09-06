% Funcþia de repartiþie pt. v.a. gaussianã, standard
function Fx = Pr_norm(x)
Fx=0.5.*(1+erf(x./sqrt(2)));