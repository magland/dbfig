function dpath=dbfig_storage_path(dbpath)
if nargin == 1
    dpath=dbpath;
    return
end
DPATH=getenv('DBFIG_HOME_DIR');
if ~(size(DPATH) == size([]))
    dpath=[DPATH '/.dbfig'];
    if ~exist(dpath,'dir')
        mkdir(dpath);
    end;
else
    dpath='$home/.dbfig';
    if ~exist(dpath,'dir')
        mkdir(dpath);
    end;
end
end