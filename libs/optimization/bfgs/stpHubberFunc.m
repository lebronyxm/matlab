function [f, g] = stpHubberFunc(x)
% hubber function 
    
    % get the global value
    global globalA globalB threshold;
    
    % initial
    z = globalA * x - globalB;
    sum = 0;
    n = length(globalB);
    
    for i = 1 : n
        r = abs( z(i, 1) );
        
        % calculate the function value
        if (r>=0 && r<=threshold)
            sum = sum + r*r/(2*threshold);
        else
            sum = sum + (r - threshold/2);
        end
        sum = sum + r;
        
        % calculate the gradient
        temp = z(i, 1) / threshold;
        if( temp > 1)
            temp = 1;
        end
        
        if(temp < -1)
            temp = -1;
        end
        
        % save ith gradient to vector z
        z(i, 1) = temp;
    end
    
    f = sum;
    g = globalA' * z;
%     g = mb_numDiff(@stpTemp, x);
end