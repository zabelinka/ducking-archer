function y = f(x)
y = 4.5 * cos(7*x) * exp((- 2 *x)/3) + 1.4 * sin(1.5 * x) * exp(- x/3) + 3;




% ��������: �������� �� f(x)*p(x)
% y = @(x) (4.5 .* cos(7.*x) .* exp((- 2 .*x)./3) + 1.4 .* sin(1.5 .* x) .* exp(- x./3) + 3) ./ ((x - 2.1) .^ 0.4);
% integral(y, 2.1, 3.3)
% = 4.4615