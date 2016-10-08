function runner(input_size)

if (exist('ostrich_rand', 'var') == 0)
	ostrich_rand = rand;
end

% Create a pseudom-random n-gon as input
V = zeros(input_size, 2);
for i = 1:input_size
	r = 2 * pi * i / input_size;
	V(i, :) = [cos(r) sin(r)] * (1 + ostrich_rand() * 2);
end

% Run kernel and measure time for core computation 
before = tic;
output = mesh2d(V, [], [], struct('output', false));
elapsed = toc(before);

% Display output
disp('{');
disp('"input":');
disp(input_size);
disp(', "time": ');
disp(elapsed);
disp('}');
end
