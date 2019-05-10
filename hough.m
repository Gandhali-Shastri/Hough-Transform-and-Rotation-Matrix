    function [H, theta, rho] = hough(img, varargin)
    p = inputParser();
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    prho = p.Results.RhoResolution;
    theta = p.Results.Theta;


    Map = sqrt((size(img,1) - 1) ^ 2 + (size(img,2) - 1) ^ 2);
    numRho = 2 * (ceil(Map / prho)) + 1;
    diag = prho * ceil(Map / prho);% rho ranges from -diag to diag
    numTheta = length(theta);
    H = zeros(numRho, numTheta);
    rho = -diag : diag;
    for i = 1 : size(img,1)
        for j = 1 : size(img,2)
            if (img(i, j))
                for k = 1 : numTheta
                    temp = j * cos(theta(k) * pi / 180) + i * sin(theta(k) * pi / 180);
                    rowIndex = round((temp + diag) / prho) + 1;
                    H(rowIndex, k) = H(rowIndex, k) + 1;                   
                end
            end            
        end
    end    
end