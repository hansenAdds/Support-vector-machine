function test_accuracy_d = svm_predict_dual ( data_test , label_test , svm_model_d )

dual_w=svm_model_d.f1;
b_dual=svm_model_d.f2;

test_dual=dual_w*data_test'+b_dual;
for i=1:1500                % get a value if its greater than hyperplane ,classfiy to 1 class 
    if test_dual(i)>=0
        test_dual(i)=1;
    end
end
for i=1:1500
    if test_dual(i)<0           % get a value if its less than hyperplane ,classfiy to -1 class 
        test_dual(i)=-1;
    end
end
 test_error=test_dual-label_test;
 test_accuracy_d = 1-length(find(test_error~=0))/1500            %% if its zero ,means predicted value is same 
                                                         % if its not ,means predicted value is not same 
 