

[label_train,data_train]=libsvmread('train.libsvm');
[test_y,test_x]=libsvmread('test.libsvm');

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

model=svmtrain(label_train,data_train,1);
[predict_label,accuracy,dec_val]=svmpredict(test_y,test_x,model)