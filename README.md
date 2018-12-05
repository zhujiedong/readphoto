# readphoto
read LI-6400 and LI-6800 data in batch

# read_bat_6400

```
read_bat_6400 <- function(file_dir, header_line = 17, data_start = 27)
```

file_dir are the path of your raw data file, it should be a folder only contain raw data files.

header_line are the start of your measured data header.

data_start are the start line of your measured data.

the output data frame contains a column named files, its the name of your file where the data from.

# read_bat_6800

```
read_bat_6800(file_dir, skiplines = 53)
```

file_dir are the path of your raw data file, it should be a folder only contain raw data files.
skiplines are the lines before your start of your measured data.

