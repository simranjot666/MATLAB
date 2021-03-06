function str = printstruct(name, val)

% PRINTSTRUCT converts a Matlab structure to text which can be
% interpreted by Matlab, resulting in the original structure.

% Copyright (C) 2006, Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.ru.nl/neuroimaging/fieldtrip
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id: printstruct.m 5177 2012-01-25 15:04:34Z roboos $

if nargin==1
  val  = name;
  name = inputname(1);
end

str = [];
if isstruct(val)
  if numel(val)>1
    str = cell(size(val));
    for i=1:numel(val)
      str{i} = printstruct(sprintf('%s(%d)', name, i), val(i));
    end
    str = cat(2, str{:});
    return
  else
    % print it as a named structure
    fn = fieldnames(val);
    for i=1:length(fn)
      fv = getfield(val, fn{i});
      switch class(fv)
        case 'char'
          % line = sprintf('%s = ''%s'';\n', fn{i}, fv);
          % line = [name '.' line];
          line = printstr([name '.' fn{i}], fv);
          str  = [str line];
        case {'single' 'double'}
          line = printmat([name '.' fn{i}], fv);
          str  = [str line];
        case {'int8' 'int16' 'int32' 'int64' 'uint8' 'uint16' 'uint32' 'uint64' 'logical'}
          line = printmat([name '.' fn{i}], fv);
          str  = [str line];
        case 'cell'
          line = printcell([name '.' fn{i}], fv);
          str  = [str line];
        case 'struct'
          line = printstruct([name '.' fn{i}], fv);
          str  = [str line];
        otherwise
          error('unsupported');
      end
    end
  end
elseif ~isstruct(val)
  % print it as a named variable
  switch class(val)
    case 'char'
      str = printstr(name, val);
    case 'double'
      str = printmat(name, val);
    case {'int8' 'int16' 'int32' 'int64' 'uint8' 'uint16' 'uint32' 'uint64'}
      str = printmat(name, val);
    case 'cell'
      str = printcell(name, val);
    otherwise
      error('unsupported');
  end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = printcell(name, val)
str = [];
siz = size(val);
if isempty(val)
  str = sprintf('%s = {};\n', name);
  return;
end
for i=1:prod(siz)
  typ{i} = class(val{i});
end
for i=2:prod(siz)
  if ~strcmp(typ{i}, typ{1})
    warning('different elements in cell array');
    return
  end
end
if all(size(val)==1)
  str = sprintf('%s = { %s };\n', name, printval(val{1}));
else
  str = sprintf('%s = {\n', name);
  for i=1:siz(1)
    dum = '';
    for j=1:siz(2)
      dum = [dum ' ' printval(val{i,j}) ','];
    end
    str = sprintf('%s%s\n', str, dum);
  end
  str = sprintf('%s};\n', str(1:end-2)); % remove the last comma and space
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = printmat(name, val)
str = [];
siz = size(val);
if any(size(val)==0)
  str = sprintf('%s = [];\n', name);
elseif all(size(val)==1)
  str = sprintf('%s = %s;\n', name, printval(val));
elseif size(val,1)==1
  dum = sprintf('%g ', str, val(:));
  str = sprintf('%s = [%s];\n', name, dum);
else
  str = sprintf('%s = [\n', name);
  for i=1:siz(1)
    dum = sprintf('%g ', val(i,:));
    str = sprintf('%s  %s\n', str, dum);
  end
  str = sprintf('%s];\n', str);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = printstr(name, val)
str = [];
siz = size(val);
if siz(1)~=1
  str = sprintf('%s = \n', name);
  for i=1:siz(1)
    str = [str sprintf('  %s\n', printval(val(i,:)))];
  end
else
  str = sprintf('%s = %s;\n', name, printval(val));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = printval(val)
str = '';
siz = size(val);
switch class(val)
  case 'char'
    str = sprintf('''%s''', val);

  case {'single' 'double'}
    if all(siz==1)
      str = sprintf('%g', val);
    elseif length(siz)==2
      for i=1:siz(1);
        str = [ str sprintf('%g ', val(i,:)) '; ' ];
      end
      str = sprintf('[ %s ]', str(1:end-3));
    else
      error('multidimensional arrays are not supported');
    end
    
  case {'int8' 'int16' 'int32' 'int64' 'uint8' 'uint16' 'uint32' 'uint64'}
    % this is the same as for double, except for the %d instead of %g
    if all(siz==1)
      str = sprintf('%d', val);
    elseif length(siz)==2
      for i=1:siz(1);
        str = [ str sprintf('%d ', val(i,:)) '; ' ];
      end
      str = sprintf('[ %s ]', str(1:end-3));
    else
      error('multidimensional arrays are not supported');
    end
    
  case 'struct'
    str = '''FIXME''';
end

