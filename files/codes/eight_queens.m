function [ solutions ] = eight_queens(n)
    %This solution for the Eight Queens Problem is a non-recursive one.
    %The comments below will describe the algorithm for the n-queen
    %generalized solution.
    
    %First, we generate all possible permutations of the array [1 2 3 ... n]
    %Then, we remove all of the permutations which contain immediately
    %adjacent numbers, such as [1 2 ...], [2 1 ...] and so on.
    permutations = perms(1:n);
    permutations = permutations((sum((abs(diff(perms(1:n)'))' == 1),2) == 0),:); 
    siz = 0;
    
    %Now, we generate the matrix that represents all the diagonals we must
    %check. We only need to check diagonals because the arrays we generated
    %can be used to construct tables which only contain one queen per row
    %and one queen per column.
    
    %The matrix named diagonal_table contains, in each of its rows, 64
    %elements, of which the ones that are 1 represent positions in a given
    %diagonal of the matrix. This allows us to unroll the table we want to
    %check in a (n^2,1) array that we can multiply by the diagonals matrix
    %to check if it is a valid one.
    m = (n-3);
    diagonals = cell(m*2+1,1);
    diagonals{m+1} = 1:n+1:n*n;
    for k=1:m
        diagonals{m+1-k} = diagonals{m+1-(k-1)} + 1;
        diagonals{m+1-k} = diagonals{m+1-k}(1:end-1);
    end
    for k=1:m
        diagonals{m+1+k} = diagonals{m+k} - 1;
        diagonals{m+1+k} = diagonals{m+1+k}(2:end);
    end
    diagonal_table = zeros(numel(diagonals),n*n);
    for kk=1:numel(diagonals)
        diagonal_table(kk,diagonals{kk}) = 1;
    end
        
    %Now, we preallocate a cell with n^3 spaces in which we can store our
    %solutions. The empty spaces will be removed in the end of the
    %algorithm. The preallocation speeds up the processing by avoiding new
    %memory requests.
    solutions = cell(n^3,1);
    for ii=1:size(permutations,1)
        cur_table = zeros(n);
        for jj=1:n
            cur_table(jj,permutations(ii,jj)) = 1;
        end
        % Here, we construct an array which represents a given table and
        % its mirror one, which has columns in reverse order. This allows
        % us to perform the same check, once in each array, to validate its
        % diagonals.
        mirror_table = cur_table(:,end:-1:1);
        cur_table = cur_table(:);
        mirror_table = mirror_table(:);
        
        % The line below multiplies our diagonals table by our table array,
        % which results in each diagonal (each one is a line of the table) to be
        % extracted from the cur_table array and its elements counted.
        % Afterwards, we count all the elements that are greater than 1. If
        % none are found, we can conclude that there is only one element
        % per diagonal in all diagonals. Therefore, we've found a table
        % that solves our problem.
        
        is_solution = sum(diagonal_table*cur_table > 1) + sum(diagonal_table*mirror_table > 1);
        if isequal(is_solution,0)
            siz = siz + 1;
            solutions{siz} = cur_table;
        end
    end
    %Below, we remove all allocated memory which wasn't used to store a
    %solution. 
    solutions = solutions(~cellfun('isempty',solutions));
end

