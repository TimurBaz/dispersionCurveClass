clc;clear;close all;

BER = 10^-10;
disps = -2000:2000;
OSNRs1 = disps.^2/10^6;
OSNRs2 = 2*disps.^2/10^6;

c1 = dispersion_curve(OSNRs1, disps, BER,"$x^2$");
c2 = dispersion_curve(OSNRs2, disps, BER,"$2\times x^2$");

defaultParamsForPlot=plotParams();
defaultParamsForPlot.yname="OSNRreq, dB";
defaultParamsForPlot.xname="Residual dispersion, ps/nm";

f1 = dispersion_curve.onePlot([c1,c2],defaultParamsForPlot);

q = c1.first_moment();