function peaks = findpeaks(H, varargin)
   
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.1 * max(H(:)));
    addParameter(p, 'nSize', floor(size(H) / 100.0) * 2 + 1); 
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nSize = p.Results.nSize;

    peaks = zeros(numpeaks, 2);
    num = 0;
    while(num < numpeaks)
        maxH = max(H(:));
        if (maxH >= threshold)
            num = num + 1;
            [r,c] = find(H == maxH);
            peaks(num,:) = [r(1),c(1)];
            rStart = max(1, r - (nSize(1) - 1) / 2);
            rEnd = min(size(H,1), r + (nSize(1) - 1) / 2);
            cStart = max(1, c - (nSize(2) - 1) / 2);
            cEnd = min(size(H,2), c + (nSize(2) - 1) / 2);
            for i = rStart : rEnd
                for j = cStart : cEnd
                        H(i,j) = 0;
                end
            end
        else
            break;          
        end
    end
    peaks = peaks(1:num, :);            
end