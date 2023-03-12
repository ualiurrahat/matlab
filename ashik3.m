%Program#3
%Plot the frequency modulated signal
Fs=1000; %sampling frequency
dt=1/Fs;
t=0:dt:1-dt;
a=45; %Amplitude of the carrier
fm=10;%frequency of the mesage signal
fc=100; %Frequency of the carrie signal
delta_f=1000;
kf=delta_f/fm; %frequency sensitivity of the modulator/modulation index
m=cos(2*pi*fm*t);
% m_b=tril(ones(length(m)));
% m_c = m.*m_b;
% sum_m=sum(m_c,2);
s=a*cos(2*pi*fc*t+(kf*2*pi*cumsum(m)).*dt);%sum--for integration function
plot(t,s)
grid on
hold on
plot(t,m)
ylim([-5,5])
xlabel('time (s)');
ylabel('Amplitude');
title('Message and Modulated signal')
%%plot the frequency response
f=-Fs/2:1:Fs/2-1;
M=fftshift(fft(m));
S=fftshift(fft(s));
%
figure(2)
%subplot(211)
plot(f,abs(M)/Fs)
title('Frequency Domain represetation of the signal')
grid on
hold on
plot(f,abs(S)/Fs)
xlabel('Frequency (Hz)')

ylabel('Magnitude')
%
dem=diff(s);
dem=[0,dem];
r_lo=dem.*(41*cos(2*pi*fc*t));
[b,a]=butter(10,2*fc/Fs);
r_flt=filter(b,a,r_lo);
R_flt=fftshift(fft(r_flt));
figure(3)
plot(f,abs(R_flt)/Fs);
title('Frequency represtation of the demodulated signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
grid on
figure(4)
plot(t,r_flt)
xlabel('time (s)');
ylabel('Amplitude');
grid on
title('Demodulated signal')