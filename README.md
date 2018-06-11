# dbfig

A matlab system for saving and retrieving figures and accompanying data.

Developers: Jeremy Magland and Charlie Epstein

An example usage is provided in [dbfig_test.m](./dbfig_test.m).

## Basic usage

```
dbfig_save(fig_handle,data,tags)
```

where fig_handle is the handle of the figure, data (struct) is some accompanying data, and tags (struct) are the parameters needed to retrieve the record.

To open a saved figure:
```
dbfig_open(tags)
```
Note that we only need to match a subset of the tags. If more than one record is found, only the first is opened.

Similar system for retrieving the associated data:
```
data=dbfig_load_data(tags)
```

Each record is stored according to a key, which is simply a datahash of the tags struct. You can retrieve the existing keys matching a set of tags using

```
keys=dbfig_find(tags)
```

Then you can feed those in to the above functions
```
dbfig_open(keys{1})
data1=dbfig_load_data(keys{1})
```
Or exclude the index to refer to only the first match.

You can remove individual records via:
```
dbfig_remove(keys{1}).
```

See the test example for more details.



Configuration of the storage path (by default it is /tmp/dbfig_storage):
If you use the setenv('DBFIG_HOME_DIR',dir) in MATLAB, then the program
```
difig_storage_path
```
(creates) uses the directory DBFIG_HOME_DIR/.dbfig to store the images and associated data. With an argument
```
difig_storage_path(path)
```
this program stores its data in path.


