# Quandoo
Repository to test a webpage

Overview:
  This framework will test the login, sorting and hover scenarios on a general webpage.
  The technology stack that i have used is ROBOT FRAMEWORK with PYTHON and shell scripts to launch it.
  Each folder in the framework will have a description file of what the files will do.
  Also every keyword has the documentation associated with it.

How to Run:
  In the folder  \Quandoo_Project a file "Call_Test.ps1" is present, run this file from a shell prompt
  to launch the tests. eg . \Quandoo_Project\Call_Test.ps1. 
  The tests will run on the cosole and in the end give a status as pass or fail on the console with extra
  information where needed.
  
Reports:
  Three report files will be generated in the folder where the tests are present
  eg: ..\Quandoo_Project\build_sanity\reports
  The report.html file will give you a representation of all the tests with the status and also tell what each keyword does . 
  Other report files will also be present viz. log.html and output.xml
  I have kept a few example reports in the folder.
  
Faliure Analysis:
  If in case a test fails a screenshot with the test case name and date appended will be created.
  The Console itself will also throw an error.
  
  
