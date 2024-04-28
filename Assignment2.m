function testLCGUniformity()
    % Parameters for the LCG
    % You can experiment with different values
    a = 1664525;
    c = 1013904223;
    m = 2^32;

    % Initial seed
    seed = 1234;

    % Number of random numbers to generate
    N = input('Enter the number of random numbers to generate: ');

    % Generate random numbers using the LCG
    randomNumbers = zeros(1, N);
    randomNumbers(1) = seed;
    for i = 2:N
        randomNumbers(i) = mod(a * randomNumbers(i-1) + c, m);
    end

    % Normalize random numbers to be in the interval [0,1)
    normalizedRandomNumbers = randomNumbers / m;

    % Divide the random numbers into 10 equally sized intervals
    intervals = linspace(0, 1, 11);

    % Count the number of random numbers in each interval
    counts = histcounts(normalizedRandomNumbers, intervals);

    % Generate a bar graph from the number of random numbers
    bar(intervals(1:end-1), counts);

    % Set axis labels and title
    xlabel('Intervals');
    ylabel('Number of Random Numbers');
    title('Uniformity Test of Random Numbers Generated by LCG');

    % Set x-axis ticks to show the intervals
    xticks(intervals);
    xticklabels(cellstr(num2str(intervals(:), '%0.1f')));

    % Show the plot
    grid on;
    ylim([0, max(counts)]); % Set y-axis limit
    axis tight;
end
