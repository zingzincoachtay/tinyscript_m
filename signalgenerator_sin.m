function [wave,t] =  SignalGenerator_sin(frq, len, Fs, phs);
%
% Modified klaus.linkenkaer@cncr.vu.nl, 060404.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose
%
% Generate a sine signal of given frequency, length, sampling frequency,
% and phase.
%
% Example:  2 s of 10 Hz sine wave sampled at 300 Hz and shifted 60 degree.
% [wave] =  SignalGenerator_sin(10, 2, 300, 60/360);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input...
%
% frq   : Frequency in Hz.
% len   : Length in seconds of wave to generate.
% Fs    : Sampling frequency in Hz.
% phs   : Relative phase advance in fraction of "2*pi radians" 
%         (which is equivalent to fractions of 360 degrees!).
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output...
%
% wave  : the sine wave.
% t     : time vector corresponding to the sampling frequency and length of 
%         the wave.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unless phase is explicitly defined as an input variable, set it to zero:

if nargin == 3      
    phs = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate the sine wave...

t = 0:1/Fs:len;
wave = sin(t.*(frq*2*pi)+phs*2*pi);

figure;
  plot(t,wave);
    hold on
    grid
    xlabel('Time [s]')
    ylabel('Amplitude')  
    title(['Sine wave of length: ' num2str(len) 's, Frequency = ', ...
        num2str(frq), ' Hz, and phase = ', num2str(phs) ' *2*pi*radians'])
    