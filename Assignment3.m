function lcg_period_analysis(a1, c1, m1, a2, c2, m2)
    % Check if all input arguments are provided
    if nargin ~= 6
        error('Incorrect number of input arguments. Please provide values for a1, c1, m1, a2, c2, and m2.');
    end
    
    % Initial seed
    seed = 1;

    % Initialize arrays to store sequences
    sequence1 = zeros(1, m1);
    sequence2 = zeros(1, m2);

    % Generate sequence for LCG1
    current_value = seed;
    for i = 1:m1
        sequence1(i) = current_value;
        current_value = mod(a1 * current_value + c1, m1);
    end

    % Generate sequence for LCG2
    current_value = seed;
    for i = 1:m2
        sequence2(i) = current_value;
        current_value = mod(a2 * current_value + c2, m2);
    end

    % Print sequences
    disp('Sequence for LCG1:');
    disp(sequence1);
    disp('Sequence for LCG2:');
    disp(sequence2);

    % Find period for LCG1
    period1 = find(sequence1 == sequence1(1), 2);
    if numel(period1) == 1
        disp(['Period for LCG1: ', num2str(period1)]);
    else
        disp(['Period for LCG1: ', num2str(period1(2) - 1)]);
    end

    % Find period for LCG2
    period2 = find(sequence2 == sequence2(1), 2);
    if numel(period2) == 1
        disp(['Period for LCG2: ', num2str(period2)]);
    else
        disp(['Period for LCG2: ', num2str(period2(2) - 1)]);
    end
end
lcg_period_analysis(3, 0, 5, 5, 0, 7);
