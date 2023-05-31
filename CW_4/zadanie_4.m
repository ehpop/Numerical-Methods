dx_values = [1e-1 1e-2 1e-3 1e-4 1e-5];
err = 1e-10;
diriv_options = [1 2 3];
diriv_options_names = {'central', 'forward', 'backward'};
x_start = -10;

iterations = zeros(length(diriv_options), length(dx_values));

for diriv_option_idx = 1:length(diriv_options)
    subplot(1, 3, diriv_option_idx);
    for dx_idx = 1:length(dx_values)
        [~, ~, iters] = newtonRophson(x_start, @f1, err, dx_values(dx_idx), 1e10, diriv_options(diriv_option_idx));
        
        iterations(diriv_option_idx, dx_idx) = iters;
    end
    bar(iterations(diriv_option_idx, :), 0.4);
    xlabel('dx value');
    ylabel('Iterations');
    title(['dirivative method: ', diriv_options_names(diriv_option_idx)]);
    grid("on")
    
    xticks(1:numel(dx_values));
    xticklabels(cellstr(num2str(dx_values')));
    xtickangle(45);
end