function data=dbfig_load_data(key_or_tags)

if isstruct(key_or_tags)
    key=dbfig_find(key_or_tags);
else
    key=key_or_tags;
end
if iscell(key)
    key=key{1}; % only load the first one
end;

storage_path=dbfig_storage_path();
mat_path=sprintf('%s/%s.mat',storage_path,key);
L=load(mat_path,'data');
data=L.data;

end