%this code copies a single file from multiple folders  and saves them in
%a single folder. It works if you want to copy a series of files.
%All folders must be in the same location. Only one file can be moved from
%each folder.
%Complete the actions indicated in the section "start of the code" before runnign the code 

%%%%%%%%%%%%%%%%%start of the code%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
% paste the source of the mmultiple folders
ms='G:\2016\plasma surface\october\19-10-2016\500 nm\500 nm-[4-1]\vib-200'; 
% paste the location to which all files must be copied
md='E:\test';
mkdir(md);
s=dir(ms);
L=length(s);
a=dir(fullfile(ms,getfield(s(3),'name')));
source_string=input('enter the first three characters of the file::'); 

for i=1:length(a) 
strings_to_search=getfield(a(i),'name');
if strncmpi(source_string,strings_to_search,3)==1
    flag=i;
    marker=strfind(strings_to_search,'.');
    extension=strings_to_search(marker:end);
end
end

count=1;
for i=3:1:L
a=dir(fullfile(ms,getfield(s(i),'name')));
b=getfield(a(flag),'name');
c=fullfile(fullfile(ms,getfield(s(i),'name')),b);
d=strcat(num2str(count),extension);
e=fullfile(md,d);
copyfile(c,e);
count=count+1;
end
clear all
