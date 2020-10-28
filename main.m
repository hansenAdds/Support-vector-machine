train=load('train.mat')
data_train=train.X;
label_train=train.y;
test=load('test.mat')
test_x=test.X;
test_y=test.y;
for i=1:8500   % if the given trian label is 0 and 1, we have to change 0 to be -1 , because the cvx default data is -1 and 1
                % 
    if label_train(i)==0;
        label_train(i)=-1;
    end
end

for i=1:1500
    if test_y(i)==0;
        test_y(i)=-1;
    end
end

% svm_model_d = svm_train_dual ( data_train , label_train , 1 );
% dual_w=svm_model_d.f1;
% b_dual=svm_model_d.f2;
% test_dual_accuracy = svm_predict_dual ( test_x , test_y , svm_model_d )
%if we wanna try the trian data , the only thing is to change parameter to
%be trianning data 
% if we wanna try the testing data , we just change parameter to testing
% data .

% 
svm_model=svm_train_primal(data_train,label_train,1);
ww=svm_model.f1;
bb=svm_model.f2;
accuracy=svm_predict_primal ( test_x , test_y , svm_model )




