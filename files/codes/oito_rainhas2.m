function [permutations] = oito_rainhas2()
    permutations = perms(1:8);
    %um
    permutations = permutations((sum((abs(diff(permutations(:,:)'))' == 1),2) == 0),:);
    %dois 
    permutations = permutations((sum((abs(diff(permutations(:,1:2:8)'))' == 2),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,2:2:8)'))' == 2),2) == 0),:);
    %tres 
    permutations = permutations((sum((abs(diff(permutations(:,1:3:8)'))' == 3),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,2:3:8)'))' == 3),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,3:3:8)'))' == 3),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,4:3:8)'))' == 3),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,5:3:8)'))' == 3),2) == 0),:);
    %quatro
    permutations = permutations((sum((abs(diff(permutations(:,1:4:8)'))' == 4),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,2:4:8)'))' == 4),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,3:4:8)'))' == 4),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,4:4:8)'))' == 4),2) == 0),:);
    %cinco
    permutations = permutations((sum((abs(diff(permutations(:,1:5:8)'))' == 5),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,2:5:8)'))' == 5),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,3:5:8)'))' == 5),2) == 0),:);
    %seis
    permutations = permutations((sum((abs(diff(permutations(:,1:6:8)'))' == 6),2) == 0),:);
    permutations = permutations((sum((abs(diff(permutations(:,2:6:8)'))' == 6),2) == 0),:);
    %sete 
    permutations = permutations((sum((abs(diff(permutations(:,1:7:8)'))' == 7),2) == 0),:);
end