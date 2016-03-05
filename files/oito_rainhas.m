function [ solutions ] = oito_rainhas(n)
    permutations = perms(1:n);
    permutations = permutations((sum((abs(diff(perms(1:n)'))' == 1),2) == 0),:); 
    siz = 0;
    
    %gerando as diagonais
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
    
    %por definicao, apenas geramos uma rainha por linha e coluna, entao
    %devemos checar as diagonais
    solutions = cell(1);
    for ii=1:size(permutations,1)
        cur_table = zeros(n);
        for jj=1:n
            cur_table(jj,permutations(ii,jj)) = 1;
        end
        is_solution = 1;
        for jj=1:length(diagonals)
            if numel(find(cur_table(diagonals{jj}))) > 1
                is_solution = 0;
            end
        end
        if isequal(is_solution,1)
            cur_table = cur_table(:,n:-1:1);
            for jj=1:length(diagonals)
                if numel(find(cur_table(diagonals{jj}))) > 1
                    is_solution = 0;
                end
            end         
            if isequal(is_solution,1)
                siz = siz + 1;
                solutions{siz} = cur_table;
            end
        end
    end
end

