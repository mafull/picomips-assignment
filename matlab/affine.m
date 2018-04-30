function [x2,y2] = affine(x1,y1)
    A = [
            0.75, 0.5;
            -0.5, 0.75
        ];

    B = [
            20;
            -20
        ];
    
    % Multiplications + rounding
    res1 = floor(A(1,1) * x1);
    res2 = floor(A(1,2) * y1);
    res3 = floor(A(2,1) * x1);
    res4 = floor(A(2,2) * y1);
    
    % Additions
    x2 = res1 + res2 + B(1);
    y2 = res3 + res4 + B(2);


