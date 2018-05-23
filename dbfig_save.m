function dbfig_save(fig,data,tags)

storage_path=dbfig_storage_path();
key=datahash(tags);
fig_fname=sprintf('%s/%s.fig',storage_path,key);
mat_fname=sprintf('%s/%s.mat',storage_path,key);

savefig(fig,fig_fname);

X=struct;
X.dbfig_version=dbfig_version();
X.tags=tags;
X.data=data;
X.key=key;

save(mat_fname,'-struct','X');

end

function hash=datahash(X)
Opt.Format = 'hex'; 
Opt.Method = 'SHA-1'; 
hash=DataHash(X, Opt);
hash=hash(1:8);
end