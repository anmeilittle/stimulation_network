
% EEG data script

% set up workflow

% % load data
d = h5read('/gpfs/milgram/project/turk-browne/projects/stimulation_behavior/intermediate_data/DC_stim_1_512hz.h5', '/data');
d = squeeze(d);
d2 = d(1:203, :);

% % finding times
times = stim_find(d2, 512); % stim_find func outputs the time points at
% which the stimulations were applied
time = (1:length(d2))/512; % this array converts the frequency points into
% actual times

% % col 104 has 370 % this was done manually
% length(times{1, 104});
use_times = times(1, 104);
use_times = use_times{1,1};
timedata = (1:length(d2))/512;

% % plotting data
% figure;
% plot(timedata, d2(100, :)); % EEG for channel 100
% hold on
% plot(times{100}, 0, 'r.'); % plot the times of stimulation with red dots
% % everythinglooks good

% [~, k_time] = min(abs(timedata - use_times(127)));
% this gives the closest time point (s) that corresponds to the stimulation at
% row 127 for channel 104

k_time = zeros(1, 370);

for i = 1:370
    [~, k_time(i)] = min(abs(timedata - use_times(i)));
end

%
% % let's set the range to be 0.051 s after stimulation for .85s
% % ex. for 127th stimulation point
% target_inds = k_time(127) + 26 + (1:435); % this is our range (length 435)
% figure;
% plot(timedata(target_inds), d2(1, target_inds));
% % looks good

% now we need to do this for all stimulation points
target_inds = zeros(370, 435);

for i = 1:370 %for each stimulation
    target_inds(i, :) = k_time(i) + 26 + (1:435);
end
