function affine(x1,y1)
    A = [
            0.75, 0.5;
            -0.5, 0.75
        ];

    B = [
            20;
            -20
        ];
    
    % Display x1 and y1 (decimal and binary)
    disp(['x1 = ' num2str(x1) ' (' num2str(dec2bin(typecast(int8(x1),'uint8'),8)) ')']);
    disp(['y1 = ' num2str(y1) ' (' num2str(dec2bin(typecast(int8(y1),'uint8'),8)) ')']);
    
    % Multiplications + rounding
    res1 = floor(A(1,1) * x1);
    res2 = floor(A(1,2) * y1);
    res3 = floor(A(2,1) * x1);
    res4 = floor(A(2,2) * y1);
    
    % Additions
    x2 = res1 + res2 + B(1);
    y2 = res3 + res4 + B(2);
    
    % Display x2 and y2 (decimal and binary)
    disp(['x2 = ' num2str(x2) ' (' num2str(dec2bin(typecast(int8(x2),'uint8'),8)) ')']);
    disp(['y2 = ' num2str(y2) ' (' num2str(dec2bin(typecast(int8(y2),'uint8'),8)) ')']);

