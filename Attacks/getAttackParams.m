% Copyright (c) 2001, Shelby Pereira, University of Geneva
% 
%  Permission to use, copy, modify, and distribute this software and its
%  documentation for any non-commercial purpose and without fee is hereby
%  granted (GPL), provided that the above copyright notice appear in all
%  copies and that both that copyright notice and this permission notice
% appear in supporting documentation. This software is provided "as is" 
% without express or implied warranty. The authors shall not be held
% liable in any event for incidental or consequential damages in
% connection with, or arising out of, the furnishing, performance, or
% use of this program.
% 
% If you use the Checkmark software package for your research, please cite:
%
% Shelby Pereira, Sviatoslav Voloshynovskiy, Maribel Madue�o, St�phane Marchand-Maillet
% and Thierry Pun, Second generation benchmarking and application oriented evaluation,
% In Information Hiding Workshop, Pittsburgh, PA, USA, April 2001.
%
%  http://cui.unige.ch/~vision/Publications/watermarking_publications.html
%
%  
%
% See the also the "Copyright" file provided in this package for
% copyright information about code used in the Checkmark package.
%
function [imppm,vals,category]=getAttackParams(P,imtype,timnum,tstval,type2,slow1,compressiontype,compressionval)

category=[]; % used to store auxiliary info, such as the amount of distortion
%default to 1 implies only one image in set not used when there are no parameters in determining image.
switch char(imtype)
    imppm=sprintf('%s_linear_%1.3f_%1.3f_%1.3f_%1.3f.jpg',dir1,vals(tstval,1),vals(tstval,2),...
    end
    vals=[0 1;1 0;0 5;5 0;1 1;5 5];
    vals=[0.75 1.333;
          .5   2;  %the final image size is the same as the original
          0.75 1.3;
          0.5 1.9;];
    category=[0 0 1 1];  
case P.DITHER_CLASS
    % no params for this attack
case P.THRESH_CLASS
    % no params
case P.DPRAUTOC_CLASS
    % no params
otherwise 
      sprintf('NO MATCHING ATTACK CLASS FOR %s',char(imtype))
      imppm=[];
if strcmp(type2,'numims')