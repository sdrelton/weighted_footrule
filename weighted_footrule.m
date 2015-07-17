function phi = weighted_footrule(list1, list2)
% WEIGHTED_FOOTRULE Computes a distance between two lists of equal length.
%
% LIST1 and LIST2 must be row vectors with no repetitions within each list.
% The returned PHI is between 0 and 1, where the lists are identical if 
% PHI = 0 and are completely disjoint if PHI = 1.
%
% Author:
% Samuel D. Relton, June 2015.
%
% Reference:
% Amy N. Langville and Carl D. Meyer, Who's #1? The Science of Rating and 
% Ranking, Princeton University Press, 2012. Page 209.

k = length(list1);
phi = 0;
denom = sum(1./(1:k));
x = (k - 4*floor(k/2) + 2*(k+1)*sum(1./(1:floor(k/2))))/denom;
uniqueitems = unique([list1, list2]);

for item = uniqueitems
    if ismember(item, list1) && ismember(item, list2)
        pos1 = find(list1 == item, 1);
        pos2 = find(list2 == item, 1);
        phi = phi + abs(pos1 - pos2)/min(pos1, pos2);
    elseif ismember(item, list1)
        pos1 = find(list1 == item, 1);
        phi = phi + abs(pos1 - x)/min(pos1, x);
    else
        pos2 = find(list2 == item, 1);
        phi = phi + abs(pos2 - x)/min(pos2, x);
    end
end
phi = phi / (-2*k + 2*x*denom);
end