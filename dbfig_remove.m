function dbfig_remove(key)

if iscell(key)
    key=key{1}; % only load the first one
end;

storage_path=dbfig_storage_path();
fig_path=sprintf('%s/%s.fig',storage_path,key);
mat_path=sprintf('%s/%s.mat',storage_path,key);
delete(fig_path);
delete(mat_path);

end