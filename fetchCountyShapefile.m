%fetch zip
url = 'https://data.ca.gov/dataset/e212e397-1277-4df3-8c22-40721b095f33/resource/b0007416-a325-4777-9295-368ea6b710e6/download/ca_counties.zip';
zip = websave('countyShapefile.zip', url);
unzip('countyShapefile.zip')
