function test_accuracy = svm_predict_primal ( data_test , label_test , svm_model )

ww=svm_model.f1;
bb=svm_model.f2;


   test_result=data_test*ww+bb;
   for i=1:1500
       if test_result(i)>=0
           test_result(i)=1;
       end
    end
    
  
    for i=1:1500
       if test_result(i)<0
           test_result(i)=-1;
       end
    end
    test_error=test_result-label_test'; %after classified , we use substruction to get error , 
    test_accuracy=1-(length(find(test_error~=0))/1500)  %% if its zero ,means predicted value is same 
                                                         % if its not ,means predicted value is not same 
