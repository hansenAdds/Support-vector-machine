%svm_model = svm_train_primal ( data_train , label_train , regularisation_para_C)
function svm_model = svm_train_primal(data_train,label_train,regularisation_para_C)

[n,p]=size(data_train);
cvx_begin
    cvx_precision low
    variables w(p) b xi(n);  %slack
    minimize (1/2*(w'*w)+regularisation_para_C*sum(xi)/n)
    subject to 
        label_train'.*(data_train*w+b) >= 1-xi; %follow the slides
        xi>=0;
       
cvx_end
field_1='f1'; value_1=w;%build struct to store values 
field_2='f2'; value_2=b;
svm_model=struct(field_1,value_1,field_2,value_2);



