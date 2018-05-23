function tags=dbfig_load_tags(key)

if iscell(key)
    key=key{1}; % only load the first one
end;

storage_path=dbfig_storage_path();
mat_path=sprintf('%s/%s.mat',storage_path,key);
L=load(mat_path,'tags');
tags=L.tags;

end