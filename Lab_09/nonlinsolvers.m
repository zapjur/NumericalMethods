function C = nonlinsolvers(f, fp, a, b, solver, iter)

C = zeros(1,iter);    % kolejne oszacowania miejsca zerowego 
c = a;                % pierwsze oszacowanie

for i = 1 : iter
  fa = feval(f,a); fb=feval(f,b); fc=feval(f,c); fpc=feval(fp,c);  % oblicz
  switch(solver)
    case 'bisection',
        if( fa*fc<0 ) b=c; else a=c; end
        c = (a+b)/2;
    case 'regula-falsi',
        if( fa*fc<0 ) b=c; else a=c; end
        c = b-fb*(b-a)/(fb-fa);
    case 'newton-raphson',
        c = c-fc/fpc;
    case 'sieczne'
    C = zeros(1, iter);
    tol = 1e-4;
    
    fa = feval(f, a);
    fb = feval(f, b);
    
    if abs(fa) < tol
        C = a;
        return;
    elseif abs(fb) < tol
        C = b;
        return;
    end

    for i = 1:iter

        c = b - fb * (b - a) / (fb - fa);
        fc = feval(f, c);
       
        if abs(fc) < tol
            C(i) = c;
            C = C(1:i);
            break;
        end
        
        a = b;
        fa = fb;
        b = c;
        fb = fc;
        
        C(i) = c;
    end


  otherwise,
      error('Brak metody');
  end
  C(i)=c; 
end
