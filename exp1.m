clc;
clear all;
close all;
m=4; 			
x1= 1;
x2= 0;
x3 =0;
x4 =0;
N = 2.^m-1; 	

for i=1:N
p=x4; 		
x4=x3;
x3=x2;
x2=x1;
x1=xor(x1,p); 	
disp (i)
x = [x1 x2 x3 x4];
m_Seq(i)=p; 
disp (x)
end
disp('the resultant m-sequence is :');
disp(m_Seq)
plot(m_Seq)
