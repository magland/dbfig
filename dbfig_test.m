function dbfig_test

for num_points=[10,30,100]
    x=linspace(-10,10,num_points);
    y=exp(-x.^2);
    figure; plot(x,y,'r-');

    % Save the figure along with data and tags
    data=struct('x',x,'y',y);
    tags=struct('name','test','num_points',num_points);
    dbfig_save(gcf,data,tags);
    
    close(gcf);
end;

% Retrieve from the database using tags
key=dbfig_find(struct('name','test','num_points',30));
disp(key);
% Open the figure
dbfig_open(key);
% Load the data
data0=dbfig_load_data(key)
disp(data0);

% Can retrieve multiple:
keys=dbfig_find(struct('name','test'));
disp(keys);
for j=1:length(keys)
    tags0=dbfig_load_tags(keys{j});
    fprintf('tags for key=%s:\n',keys{j});
    disp(tags0);
    dbfig_remove(keys{j});
end;