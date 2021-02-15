# Motorbikes_MVC
###### A training project to help me memorize scraping techniques and the use of an Sqlite3 database. 
###### I used Wikipedia for data relating to 'notable' motorbikes produced over the last fifty years by the biggest motorbike brands of the world. Witin this little app all models can be listed from the databse either by choosing the year of manufature, the brand or model name. It goes without saying that I have a particular interest in motorcycles!

#### Technologies
###### The code is written in Ruby version 2.6.6
###### Sqlite3 version is 3.31.1

#### Setup
###### Needs Ruby environment. Download all folders: "ruby app.rb" to run the code. 
###### The app interface appears in the Terminal and greets the user with welcome message. Meantime, in the background, Wikipedia scraping and loading of the database is performed. It can take around 15 seconds for the scraping to complete. In the end there should be around 830 records stored. The user is then prompted with a list of options for viewing the data. On Exit the database is dropped, deleted and created again empty, ready for the next time the app is prompted.

#### To do list
###### Some extra features might include
1. Further CRUD features to the database.
2. Ability to export database to a csv file...why not!?
3. Perhaps some more scraping for further details on a selection of bikes. More db tables needed! 

#### Status
###### Project is: in progress.

#### Inspiration
###### Inspired by Le Wagon Bootcamp learning material and personal interest in Motorbikes.



