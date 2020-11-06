% coherence matrix

% recap: target_inds is an array of all the stimulations (370 rows) and
% their corresponding time points in seconds (435 columns)

% we want to compute the mean squared coherence for a given channel and all
% other channels for each stimulation / time range
% then, compute the mean and insert into a matrix

% mean squared coherence for channel 1 and channel 100 for stimulation #127
c1_100 = mscohere(d2(1, target_inds(127,:)), d2(100, target_inds(127,:)));
    % array length: 129 (?)
c1_100 = mean(c1_100);
% mean is 0.2179

% do the same for channels for all stimulations
% initialize 3D matrix
coherenceMat = zeros(203, 203, 370);

parfor i = 1:203 % for all channels
    for j = 1:203 % crossed with all other channels
        for k = 1:370 % for all stimulations
            % coherenceArray = zeros(1, 129);
            % coherenceArray(:) = mscohere(d2(i, target_inds(k,:)), d2(j, target_inds(k,:)));
            % coherenceMat(i, j, k) = mean(coherenceArray(:));
            coherenceMat(i, j, k) = mean(mscohere(d2(i, target_inds(k,:)), d2(j, target_inds(k,:))));
        end
    end
end
