# weighted_footrule
MATLAB code for calculating a weighted distance between two partial top-k lists

<p>
This code computes a weighted distance between two lists of length k which are the estimated top-k items from some larger (potentially unknown) list. It is a modification of Spearman's footrule for comparing two complete lists [1]. 
</p>

<p>
Given two lists l and m the weighted footrule dist(l, m) has the following properties:
<ul>
<li>dist(l, m) = 0 if and only if l = m.</li>
<li>dist(l, m) = 1 if and only if l and m are disjoint.</li>
<li>differences between l and m in the ith position are weighted more heavily than differences in the jth position if i < j.</li>
</ul>
</p>

## Example
```matlab
l = [5, 4, 2.4, 0.2];
m = [6, 3, 1.4, 0.7];
p = [5, 4.2, 2.4, 0.2];
weighted_footrule(l, l) % = 0
weighted_footrule(l, m) % = 1
weighted_footrule(l, p) % = 0.2343
```

## References
[1]  Amy N. Langville and Carl D. Meyer, Who's #1? The Science of Rating and Ranking, 
     Princeton University Press, 2012. pp 207-209.
