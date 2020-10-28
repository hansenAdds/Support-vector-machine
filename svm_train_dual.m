function svm_model_d = svm_train_dual ( data_train , label_train , regularisation_para_C )
[n,p]=size(data_train);

cvx_begin
    cvx_precision low 
    variables svm_dual(n);
    maximize ((sum(svm_dual))-1/2*svm_dual'*((data_train*data_train').*(label_train'*label_train))*svm_dual);
    subject to
        svm_dual<=regularisation_para_C/n;
        svm_dual>=0;
        label_train*svm_dual==0; %follow the slides
cvx_end


dual_w=0;               %%get the dual w 
transpose_label_train=label_train';
for i=1:8500
    dual_w=dual_w+(svm_dual(i)*transpose_label_train(i)*data_train(i,:));
end

b=1/label_train'-(dual_w*data_train');  % get the b following given slides 

b_dual=sum(b)/length(b);

field_1='f1'; value_1=dual_w;
field_2='f2'; value_2=b_dual;  %build struct to store values 
svm_model_d=struct(field_1,value_1,field_2,value_2);
