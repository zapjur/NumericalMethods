clear all
close all
clc

x1 = num2bitstr( single( (1+1/4)*2^(-124) ));
x2 = num2bitstr( single( -5.877472*10^(-38) ));

if x1 == x2
    1
else
    -1
end


c = 299792458;

cs = num2bitstr(single(c));
cd = num2bitstr(double(c));

exponent = 0;
fraction = 1;

for i = 1:length(cs)
    if i == 1 && cs(1) == '1'
        sign = -1;
    else
        sign = 1;
    end

    if i > 1 && i <= 9 && cs(i) == '1'

        exponent = exponent + 2^(9 - i);

    elseif i > 9 && i <= 32 && cs(i) == '1'

        fraction = fraction + 2^(i * (-1) + 9);

    end
end

exponent

display(2^(exponent - 127) * fraction * sign)

exponent = 0;
fraction = 1;

for i = 1:length(cd)
    if i == 1 && cd(1) == '1'
        sign = -1;
    else
        sign = 1;
    end

    if i > 1 && i <= 12 && cd(i) == '1'

        exponent = exponent + 2^(12 - i);

    elseif i > 12 && i <= 64 && cd(i) == '1'

        fraction = fraction + 2^(i * (-1) + 12);

    end
end


display(2^(exponent - 1023) * fraction * sign)



