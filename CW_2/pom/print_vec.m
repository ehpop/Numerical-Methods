function [] = print_vec(v, name)

fprintf('%s = [', name);
fprintf('%g, ', v(1:end-1));
fprintf('%g]\n', v(end));

end