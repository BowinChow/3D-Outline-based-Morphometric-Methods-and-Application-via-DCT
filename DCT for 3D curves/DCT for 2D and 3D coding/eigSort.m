function[evecs_out,eval_mat_out] = eigSort(input_orthogonal_matrix)

[evecs,eval_mat] = eig(input_orthogonal_matrix);
eval_list = diag(eval_mat);
[eval_list_out,i] = sort(eval_list,'descend');
eval_mat_out = diag(eval_list_out);
evecs_out = evecs(:,i);

