function keys=dbfig_find(tags)
storage_path=dbfig_storage_path();
D=dir(sprintf('%s/*.mat',storage_path));
keys={};
for j=1:length(D)
    fname0=D(j).name;
    L=load(sprintf('%s/%s',storage_path,fname0),'tags');
    tags0=L.tags;
    if (tags_match(tags0,tags))
        L=load(sprintf('%s/%s',storage_path,fname0),'key');
        keys{end+1}=L.key;
    end;
end;
end

function ret=tags_match(storage_tags,tags)
tagnames=fieldnames(tags);
for j=1:length(tagnames)
    if ~isfield(storage_tags,tagnames(j))
        ret=false;
        return;
    end;
    if storage_tags.(tagnames{j}) ~= tags.(tagnames{j})
        ret=false;
        return;
    end;
end;
ret=true;
end