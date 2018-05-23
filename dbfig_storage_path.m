function path=dbfig_storage_path()
path='/tmp/dbfig_storage';
if ~exist(path,'dir')
    mkdir(path)
end;
end