function dbfig_test

% Let's generate 3 different figures
for num_points=[10,30,100]
    x=linspace(-10,10,num_points);
    y=exp(-x.^2);
    figure; plot(x,y,'r-');

    % Save the figure along with data and tags (this info goes into a temporary folder)
    data=struct('x',x,'y',y);
    tags=struct('name','test','num_points',num_points);
    dbfig_save(gcf,data,tags); % save it
    
    % Close the figure after saving it
    close(gcf);
end;

% Retrieve from the database (temporary folder) using tags
key=dbfig_find(struct('name','test','num_points',30));
disp(key); % Display the keys of all the found records (could be more than 1 match)
% Open the figure
dbfig_open(key);
% Load the data
data0=dbfig_load_data(key)
disp(data0);

% We can also retrieve multiple matching records:
keys=dbfig_find(struct('name','test'));
disp(keys);
for j=1:length(keys)
    tags0=dbfig_load_tags(keys{j}); % Load the tags corresponding to this record key
    fprintf('tags for key=%s:\n',keys{j});
    disp(tags0);
    dbfig_remove(keys{j}); % Let's remove the records to keep the system clean, since this is just a test
end;
