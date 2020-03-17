function listFinal = stringChange(list0,list1,list2)
% list0: Original list of strings ie) {'one','two','three'};
% list1: List of strings to be added ie) {'one','two','five','six'};
% list2: List of strings to be removed ie) {'two','five'};
% listFinal: Original list after additions/deletions ie) {'three','six','one'};
    % List shall only contain unique values
    % Most character count to least character count
    % In the event of a tie, reverse alphabetical

list = list0; %initialize list
    
%add list1 to list
for i = 1:size(list1,2) %for every element in list1
    str = list1(:,i); %take string off list1
    list = [list,str]; %add string to list0
end
list = unique(list);

%delete list2 from list
for i = 1:size(list2,2) %for every element in list2
    str = list2(:,i);
    for j = 1:length(list)
        if strcmp(list{j},str) == 1
            ind = j; %store index
        end
    end
    list(:,ind) = [];
end

%Sort list according to number of characters
numChar = []; %initialize list of string lengths
for i = 1:length(list)
    str = list{i}; %take string from list
    num = strlength(str); %number of characters in string
    numChar = [numChar,num]; %store num
end

[sortChar,ind] = sort(numChar,'descend'); %sorted indices
listSorted = list(:,ind); %sorted list

%if two strings are the same length, sort reverse alphabetically
ind = [];
for i = 1:length(listSorted)-1
    str1 = listSorted(:,i);
    num1 = strlength(str1);
    str2 = listSorted(:,i+1);
    num2 = strlength(str2);
    if num1 == num2 %if two strings are the same length
        List = [str1, str2];
        [~,I] = sort(List); %sort alphabetically
        I = flip(I); %reverse order
        I = I+i-1; %adjust indices
        ind = [ind,I]; %store indices
    else
        ind = [ind,i]; %store index
    end
end
listFinal = listSorted(:,ind); %Final list 
end



