function [L, U, P, counter] = myLU(A)   %������ LUP - ���������� ������� A, ������� ���������� ������������� �������������� �������� = counter
L = eye(size(A));
U = zeros(size(A));
P = eye(size(A));
counter = 0;
% assert(forall(size(A) == size(L)))
for r = 1:size(A)-1
    i = r + 1;
    %���� �� ��������� 0 -- ������ ������
    if abs(A(r, r)) < 1e-14
        while abs(A(i, r)) < 1e-14
            i = i + 1;
            if i > size(A, 1) %i < ���������� ����� -- ������ ���� �������, ��� � �� ����� ��������� �������
                disp('������� �����������');
                return;
            end;
        end;
        %����� ��������� ������ � �������, ������ ������
        APL = [A P L];  %��������� ������� � ����, ����� ������ ������ ������ ���� ���
        temp = APL(i, :);
        APL(i, :) = APL(r, :);
        APL(r, :) = temp;
        i = i + 1;
        %���������� ������� � ������������� ��������
        A = APL(:, 1:size(A, 2));
        P = APL(:, [1:size(A, 2)] + size(A, 2));
        L = APL(:, [1:size(A, 2)] + 2 * size(A, 2));
    end
    %����� �� ��������� A �� 0
    for i = r + 1 : size(A)
        k = A(i, r) / A(r, r);		%�����������, �� ������� ��������� ������
        counter = counter + 1;        %������� �������������� ��������
        A(i, r : size(A)) = A(i, r : size(A)) - A(r, r : size(A)) * k;  %���������� ����� �������� ��� �
        counter = counter + 2 * length(r : size(A)); 
        %���������� ����������� � ������� L
        L(i, r) = k;
    end; 
end; %������� ������������ �������
U = A;      %������� U -- ������� ������� A
end