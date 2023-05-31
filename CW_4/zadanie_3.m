dx_values = [1e-1 1e-2 1e-3 1e-4 1e-5];
err_values = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12 1e-13 1e-14];

x_start = -10;
max_iters = 1e10;
iterations = zeros(length(dx_values), length(err_values));

figure;
for dx_idx = 1:length(dx_values)
    subplot(1, 5, dx_idx);
    for err_idx = 1:length(err_values)
        [~, ~, iters] = newtonRophson(x_start, @f1, err_values(err_idx), dx_values(dx_idx), max_iters);
        iterations(dx_idx, err_idx) = iters;
    end
    
    bar(iterations(dx_idx, :), 0.4);
    xlabel('Error');
    ylabel('Iterations');
    title(['Iterations vs Error (dx = ', num2str(dx_values(dx_idx)), ')']);
    grid("on")
    
    xticks(1:numel(err_values));
    xticklabels(cellstr(num2str(err_values')));
    xtickangle(45);
end
