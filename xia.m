clc;
clear all;
%% T1:
load time
len=length(time);
for i=2:len
    dnb = datevec(time(i));   % datetime��ȡ����ʱ��
    dna = datevec(time(i-1));   % ��ȡ�û�����ʱ��,��ʽ�����
    t=fix(etime(dnb,dna)); % ʱ���,��λ����
    if t~= 60*60
        str=datestr(time(i-1)+datenum('10000-00-00 01:00:00'),'yyyy-mm-dd HH:MM:SS');
       fprintf('ȱʧʱ���±�: %d, ʱ��Ϊ: %s\n',i,str);
    end
end

