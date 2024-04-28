function generateRandomGraph()
    % Get input from the user for the number of random numbers
    N = input('Enter the number of random numbers to generate: ');

    % Generate N random numbers
    randomNumbers = rand(1, N);

    % Divide the random numbers into 10 equally sized intervals
    intervals = linspace(0, 1, 11);

    % Count the number of random numbers in each interval
    counts = histcounts(randomNumbers, intervals);

    % Generate a bar graph from the number of random numbers
    bar(intervals(1:end-1), counts);

    % Set axis labels and title
    xlabel('Intervals');
    ylabel('Number of Random Numbers');
    title('Distribution of Random Numbers');

    % Set x-axis ticks to show the intervals
    xticks(intervals);
    xticklabels(cellstr(num2str(intervals(:), '%0.1f')));

    % Show the plot
    grid on;
    ylim([0, ceil(max(counts)/10)*10]); % Set y-axis limit
    axis tight;
end
