symbolRate = 45e3;
freqSep = 200e3;
sampPerSym = ceil(M*freqSep/symbolRate);
fsamp = sampPerSym*symbolRate;% Update the FSK modulator properties.
release(fskMod)
fskMod.SymbolRate = symbolRate;
sa = dsp.SpectrumAnalyzer('SampleRate',fsamp);
data = randi([0 3],2000,1);
fskMod.FrequencySeparation = freqSep; %Update the spectrum analyzer sample rate property, sa.SampleRate. Apply FSK modulation and plot the resulting spectrum.
release(sa)
sa.SampleRate = sampPerSym*symbolRate;
modSig = step(fskMod,data);
step(sa,modSig)
release(ch)
ch.SampleRate = fsamp;
rxSig = awgn(step(ch,modSig),25);
step(sa,rxSig)
cd = comm.ConstellationDiagram;
step(cd,rxSig)
%QPSK MODULATION IN FREQUENCY-SELECTIVE FADING:
symbolRate = 500e3;
release(ch)
ch.SampleRate = symbolRate;
rxSig = awgn(step(ch,modSig),25);
step(cd,rxSig)