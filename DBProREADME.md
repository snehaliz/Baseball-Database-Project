
# Database Design & Application - Final Project (Spring 2022)

**Team Allstarfull - Sneha Shah & Tara Williams**
*Project Description*: https://cs.baylor.edu/~speegle/3335/project.html

**Overview**

Database Design and Application Final Project for Spring 2022. This web database application will include:
    1. Include updated baseball database - Complete
    2. Login/Register Capabilities - Incomplete, In-Progress
    3. Implementation of admin user so that logged information for users can be viewed. - Incomplete
    4. Dropdown menus to select team name/teamID and year and view playing times/contributions for each player on the selected team. - Complete
    
 
**Data Used in Application** 

*2019, 2020, 2021 Hall of Fame Inductees & Voting - Baseball Reference*: https://www.baseball-reference.com/awards/hof_2019.shtml
*Most Recent Lahman Baseball Database - Sean Lahman*: https://www.seanlahman.com/baseball-archive/statistics/

 

**Requirements to run this application**
*Packages needed to be installed*

```
pip install flask == 1.1.2
pip install flask_login == 0.6.0
pip install flask_wtf == 1.0.1
pip install WTForms == 3.0.1
pip install pandas == 1.4.2
pip install Werkzeug == 1.0.1
pip install PyMySQL == 1.0.2
pip install sqlalchemy == 1.4.36

```
    
       
**Updates / Member Contributions & Timeline**
*Note: Some tasks/components are incomplete. Most dates reflect approximate start times.

(4/11/22), **Tara** - Updated Project Timeline and Milestones
(4/12/22), **Sneha** - **schema.sql** *(adding new tables, modifying database)*
(4/12/22), **Sneha** -
    1. Several needed indexes are missing. Add them.
    2. There is no G_rf in the appearances table. *(Resolved by importing updated .csv files)*
    5. There is data missing from the fielding table. In particular, the file FieldingOFSplit.csv is not included.
    7. Punctuation for values in schools.csv changed from commas to semicolons (ex: University of California, Berkeley to University of California;Berkeley)
    
(4/14/22), **Tara** - 
    3. The G_of attribute in the appearances table is unclear (it might be the sum of the OF games, but without G_rf, it is hard to tell). *(G_of, number of times a player was in an outfield position: sum of G_rf (right field), G_cf (center field), and G_lf (left field)*
    4. The finalGameDate field is not correct.
    6. In allstarfull, ID 5375 is not correct. Replace with the correct data.    

(4/15/22), **Sneha** - **load_data.py**, **load_hall.py**
    1. Inserts data from .csv files (Lahman files) into **allstarfull** database
    2. Updates Hall of Fame data with NewHallofFame.csv (information taken from *Baseball Reference* site)
    3. inf values replaced with "99999999" in PitchingPost.csv
    
(4/21/22), **Tara** - **base_template.html**, **register.html** 
    1. Webpage for registration/account creation
    2. Incomplete home page (not connected to other components)
    
(4/21/22), **Tara** - **login.html**, **forms.py** 
    1. Webpage of login/sign in 
    2. Form for log in and registration
    
(4/23/22), **Sneha** - **application.py** 
    1. Constructed routes Python file
    2. Established connection with database
    
(4/24/22), **Sneha** - **team.html**
    1. Constructed dropdown menus for team and year selection

(4/27/22), **Tara** - **application.py**
    1.) Addition of log in and register routes
    
(4/28/22), **Tara** - **models.py**, **README.md** 
    1. Constructed readme.md - documented requirements for running application, timeline for project
    2. Attempt to implement User Authentication with models.py, forms.py, application.py *incomplete*
    
(4/30/22), **Sneha** - **results.html**
    1. Outputs table from selection of team and year from teams.html
    2. Outputs number of games played for each player on selected team for selected year


