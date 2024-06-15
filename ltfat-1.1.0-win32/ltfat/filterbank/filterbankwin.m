function [g,info] = filterbankwin(g,a,varargin);
%FILTERBANKWIN  Compute set of filter bank windows from text or cell array
%   Usage: [g,info] = filterbankwin(g,a,L);
%
%   [g,info]=FILTERBANKWIN(g,a,L) computes a window that fits well with
%   time shift a and transform length L. The window itself is as a cell
%   array containing additional parameters.
%
%   The window can be specified directly as a cell array of vectors of
%   numerical values. In this case, FILTERBANKWIN only checks assumptions
%   about transform sizes etc.
%
%   [g,info]=FILTERBANKWIN(g,a) does the same, but the windows must be FIR
%   windows, as the transform length is unspecified.
%
%   FILTERBANKWIN(...,'normal') computes a window for regular
%   filterbanks, while FILTERBANKWIN(...,'real') does the same for the
%   positive-frequency only filterbanks.
%
%   The window can also be specified as cell array. The possibilities are:
%
%     {'dual',...}
%         Canonical dual window of whatever follows. See the examples below.
%
%     {'realdual',...}
%         Canonical dual window for a positive-frequency filterbank
%         of whatever follows. See the examples below.
%
%     {'tight',...}
%         Canonical tight window of whatever follows. See the examples below.
%
%     {'realtight',...} 
%         Canonical tight window for a real-valued for a positive
%         frequency filterbank of whatever follows.
%
%   The structure info provides some information about the computed
%   window:
%
%     info.M
%        Number of windows (equal to the number of channels)
%
%     info.longestfilter
%        Length of the longest filter
%
%     info.gauss
%        True if the windows are Gaussian.
%
%     info.tfr
%        Time/frequency support ratios of the window. Set whenever it makes sense.
%
%     info.isfir
%        Input is an FIR window
%
%     info.isdual
%        Output is the dual window of the auxiliary window.
%
%     info.istight
%        Output is known to be a tight window.
%
%     info.auxinfo
%        Info about auxiliary window.
%   
%     info.gl
%        Length of window.
%
%   See also: filterbank, filterbankdual, filterbankrealdual
%
%   Url: http://ltfat.sourceforge.net/doc/filterbank/filterbankwin.php

% Copyright (C) 2005-2012 Peter L. Soendergaard.
% This file is part of LTFAT version 1.1.0
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
  
% Assert correct input.
if nargin<2
  error('%s: Too few input parameters.',upper(mfilename));
end;

if ~iscell(g)
  error('%s: Window g must be a cell array.',upper(mfilename));
end;

if isempty(g)
  error('%s: Window g must not be empty.',upper(mfilename));
end;

definput.keyvals.L=[];
definput.flags.realtype={'normal','real'};
[flags,kv,L]=ltfatarghelper({'L'},definput,varargin);

if ischar(g{1})
  winname=lower(g{1});
  switch(winname)
   case {'dual'}
    [g,info.auxinfo] = filterbankwin(g{2},a,L);
      g = filterbankdual(g,a,L);
      info.isdual=1;
   
   case {'realdual'}
    [g,info.auxinfo] = filterbankwin(g{2},a,L);
    g = filterbankrealdual(g,a,L);
    info.isdual=1;
   
   case {'tight'}
    [g,info.auxinfo] = filterbankwin(g{2},a,L);    
    g = filterbanktight(g,a,L);
    info.istight=1;
   
   case {'realtight'}
    [g,info.auxinfo] = filterbankwin(g{2},a,L);    
    g = filterbankrealtight(g,a,L);        
    info.istight=1;
    
otherwise
    error('%s: Unsupported window type %s.',winname,upper(mfilename));
  end;
end;

info.M=numel(g);

info.longestfilter=max(cellfun(@numel,g));

if L<info.longestfilter
  error('%s: One of the windows is longer than the transform length.',upper(mfilename));
end;
  

