function dbfig_show(key_or_tags)

if isstruct(key_or_tags)
    key=dbfig_find(key_or_tags);
else
    key=key_or_tags;
end
if iscell(key)
    key=key{1}; % only show the first one
end;

storage_path=dbfig_storage_path();
fig_path=sprintf('%s/%s.fig',storage_path,key);
openfig(fig_path);

end