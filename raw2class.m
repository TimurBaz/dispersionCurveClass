clc;
clear;
close all;

Lsize=5;
fSize=30;

myVars = {'data_BER','OSNRs','Disps','Pin','NPin','NDisps','NOSNRs','FiberDisp','N','dCh'};
[file,path] = uigetfile('MultiSelect','on');
load(fullfile(path,file),myVars{:});
% load('05-26-2020_16-25-56N_of_Chs = 11_FallTime02.mat',myVars{:});

OSNRreq=zeros(1,NOSNRs);
names=strings([1,NPin]);

% NPin=11;
% NStart=4;
Ns=[1:2];
BER = 10^-10;

q=1;
for k=Ns
    names(q)=sprintf("P$_{\\textrm{in}} = %d $ dBm",Pin(k));
    q=q+1;
end
for q=Ns
    temp=reshape(data_BER(q,:,:),[NDisps,NOSNRs]);
    for k=1:51
        temp1=temp(k,:);
        if isempty(temp1(temp1<-10))
            OSNRreq(k)=50;
        else
            [ber, OSNRnum] = min(abs(temp1+10));
            OSNRreq(k)=OSNRs(OSNRnum);
        end
    end
    curves(q) = dispersion_curve(OSNRreq, Disps+1800, BER, names(q));
end

defaultParamsForPlot=plotParams();
defaultParamsForPlot.yname="OSNRreq, dB";
defaultParamsForPlot.xname="Residual dispersion, ps/nm";

f1 = dispersion_curve.onePlot(curves,defaultParamsForPlot);
xlim([-1500,3000]);
%%
q = curves(1).moment1()
   