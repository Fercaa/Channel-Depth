% secanteP(f,xi)
% encuentra la raiz
% Parametros:
% x1: xi, valor de busqueda
% x1: xi-1, valor anterior de la busqueda
% Se incluyen los parametros de la funcion de profundidad.
% Retorna:
% valor estimado de la raiz

function [secanteP]= secanteP(x0,x1,b,z,n,q,s,c)
    fprintf('xi-1 \t\t xi \t\t xi+1 \t\t ea \n')
    it=0;
    ea=0;
    % para de iterar cuando el error sea mayor a 0.1%
    while ea>=0.1 || it==0
        % Formula del metodo de la secante
        fapprox= (profundidad(x1,b,z,n,q,s,c)-profundidad(x0,b,z,n,q,s,c))/(x1-x0);
        secanteP= x1-(profundidad(x1,b,z,n,q,s,c)/fapprox);
        ea= abs((x1-x0)/x1)*100;
        % imprime los resultados a partir de la segunda iteracion
        if it==0
            fprintf('%f \t %f \t %f\n' ,x0, x1,secanteP);
        else 
            fprintf('%f \t %f \t %f \t %f\n' ,x0, x1,secanteP,ea);
        end
        %Se actualizan los valores de x0 y x1 para la siguiente iteracion
        x0=x1;
        x1=secanteP;
        it= it+1;
    end
end