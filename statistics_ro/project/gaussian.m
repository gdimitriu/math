function r = gaussian(x,prm)
% prm(1) - media miu; prm(2) - abaterea standard sigma
constanta = 1 / (prm(2)*sqrt(2*pi));
x = (x - prm(1)) / prm(2);
r = exp(-x.*x.*0.5).*constanta;
