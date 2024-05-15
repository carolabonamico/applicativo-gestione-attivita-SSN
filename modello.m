  function dq=modello(t,q)
        global a_ode
        global b_ode
        k02=a_ode;
        k21=b_ode;
        dq=zeros(2,1);
        dq(1)=-k21*q(1);
        dq(2)=-k02*q(2)+k21*q(1);
    end