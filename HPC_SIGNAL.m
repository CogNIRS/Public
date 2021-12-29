function [s, d, f1, f2] = HPC_SIGNAL(y1,y2, fs)
    
    %returns sembalance of y1 and y2 inputs based on the cwt using the
    %Morlet wavelet
    
y1(isnan(y1)) = 0; 
y2(isnan(y2)) = 0;
m1=mean(y1(:)); 
m2=mean(y2(:)); 
y1=y1-m1; 
y2=y2-m2; 

[c1,f1]=cwt(y1,'amor',fs); %continuous wavelet transform with morlet wavelet
[c2,f2]=cwt(y2,'amor',fs); 

ctc=c1.*conj(c2);     %Cross wavelet transform

spt = atan2(imag(ctc),real(ctc)); %phase

s=cos(spt); %semblance

d=s.*abs(ctc); %semblance w/ amplitude


end

