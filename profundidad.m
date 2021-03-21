% Profundidad(y,b,z,n,q,s,c)
% Encuentra el valor de "y" en el coeficiente de manning
% Parametros:
% y - x1 valor provisional del metodo de la secante
% b - b/D/T en las ecuaciones de area (Si no requiere,  llenar
% con 0)
% z - z del area (Si no requiere,  llenar con 0)
% q - flujo del agua
% s - pendiente de canal
% c - elige la formula a usar segun lo siguiente:
% c=0, rectangulo
% c=1, triangulo
% c=2, trapezoide
% c=3, parabolica
% c=4, circular
function prof = profundidad(y,b,z,n,q,s,c)
%Se sustituyo A y R dentro de la ecuacion de manning
    if c==0
        prof= (b^(5/3)*y^(5/3))/((b+(2*y))^(2/3))-((n*q)/sqrt(s));
    end
    if c==1
        prof= (z*y^2)*(z*y/(2*sqrt(1+z^2)))^(2/3)-((n*q)/sqrt(s));
    end
    if c==2
        prof = y*(b+z*y)*((y*(b+z*y))/(b+2*y*sqrt(1+z^2)))^(2/3)-((n*q)/sqrt(s));
    end
    if c==3
        prof=((2/3)*b*y)*((2*b^2*y)/(3*b+8*y^2))^(2/3)-((n*q)/sqrt(s));
    end
    if c==4
        %se sustituyo el angulo por (2*acos(((b/2)-y)/(b/2), b siendo el
        %diametro
        prof=(((2*acos(((b/2)-y)/(b/2)))-sin(2*acos(((b/2)-y)/(b/2))))*b^2)/8*((1-sin(2*acos(((b/2)-y)/(b/2)))/(2*acos(((b/2)-y)/(b/2))))*(b/4))^(2/3)-((n*q)/sqrt(s));
    end
end