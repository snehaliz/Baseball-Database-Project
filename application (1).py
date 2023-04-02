
from flask import Flask, session, render_template, request,make_response,redirect,flash,url_for
from flaskext.mysql import MySQL
from csi3335sp2022 import mysql
from sqlalchemy import create_engine
import pymysql
from pandas import read_sql
from forms import Login, SignUpForm


app=Flask(__name__, template_folder = 'templates')

# below would allow user to connect to the database
#URI = 'mysql+pymysql://' + sql_config['user'] + ":" + sql_config['password'] + "@" + sql_config['location'] + "/" + sql_config['database']
engine = create_engine('mysql+pymysql://snehashah:#redbritish@localhost/allstarfull')
connection = engine.raw_connection()

# App routes for home, log in, and register pages

#@app.route("/")
#@app.route('/base')
#def base():
 #   return render_template("base_template.html")


#@app.route('/login', methods = ['GET', 'POST'])
#def login():
 #   form = Login()
  #  title = "Log in to search the Allstarfull database!"
   # if form.validate_on_submit():
    #    if form.username.data:
     #       flash("Welcome!")
      #      return redirect("base_template.html")
       # else:
        #    flash("Invalid credentials. Please try again.")
    #return render_template("login.html", title, form=form)


#@app.route("/register", methods=['GET', 'POST'])
#def register():
 #   form = SignUpForm()
  #  if form.validate_on_submit():
   #     flash(f'Welcome {form.username.data}! You may log in now!', 'success')
    #    return redirect(url_for('login'))
    #return render_template('register.html', title='Sign Up to search the database!', form=form)


@app.route('/', methods = ["GET","POST"])
def index(): 
    cursor = connection.cursor()
    cursor.execute('SELECT DISTINCT(name) FROM teams')
    teamlist = cursor.fetchall()
    list_teams = []
    for i in teamlist:
        result = i[0]
        list_teams.append(result)
    cursor.execute('SELECT DISTINCT(yearID) FROM batting')
    yearlist = cursor.fetchall()
    list_years = []
    for i in yearlist:
        result = i[0]
        list_years.append(result)
    if request.method == "POST":
        teams = request.form.get("teamid")
        print(teams)
        years = request.form.get("yearid")
        print(years)
        return redirect(url_for('result',teams=teams,years=years))
    return render_template("teams.html", teamlist=list_teams, yearlist=list_years)



@app.route('/result/<string:teams>/<int:years>', methods = ["GET","POST"])
def result(teams,years):
    query = "SELECT playerID, G_all FROM appearances JOIN teams USING(teamID) WHERE teams.name = %s and appearances.yearID = %s"
    cursor = connection.cursor()
    cursor.execute(query,(teams,years,))
    newresults = cursor.fetchall()
    return render_template("result.html", newresults=newresults)




