%% dependencies : VoiceBox (http://www.ee.ic.ac.uk/hp/staff/dmb/voicebox/voicebox.html) 
addpath('voicebox');
%% read file
[x fs]=audioread('test_h.wav');
%% calculate spectrogram
[t,f,ps]=calculateSpectrogram(x,fs);
%% load SVD dictionary (left singular vectors)
load Dict;
Dict=U(:,1:5); %% choosing top 5 left singular vectors
%% compute features
cof=Dict'*ps';
cof=softmax(cof); %% obtaining categorical multinoulli distribution estimates for each column.
%% It represents the probability of similarity of a frame with each of the dictionary atom.

%% obtaining MI

[H]=MI(cof); 
H=normalize(1-H,0,1);
H=smooth(H,10);
H=[0;H];
ind=find(H>0.08);
[r c]=size(H);
res=zeros(r,1);
res(ind)=1;

%%
figure;
subplot(3,1,1);
spgrambw(x,fs,'J',90.5/2);
ylim([0 10000])
title('Spectrogram');
subplot(3,1,2);
imagesc(cof);
title('Features');
xlabel('Frame Index') % x-axis label
ylabel('Coefficients') % y-axis label
xlim([0 668])
subplot(3,1,3);
plot(res);
title('Decisions');
xlabel('Frame Index') % x-axis label
ylabel('Result')
xlim([0 668])

