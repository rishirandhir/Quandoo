*** Settings ***
Library   Selenium2Library		
Library   OperatingSystem
library   DateTime
Library   String
Resource  all_keywords.robot
Resource  ../ui_objects/all_ui_objects.robot
Resource  ../variables/all_variables.robot

*** Variables ***
${FAILED_LOGIN_TEXT}    invalid
${flag}     		False
*** Keywords ***
Open Browser For Test
		[Documentation]   This keyword is used to open login page in browser.
		  ...	
		  ...
 		  ...	Author				:   rishi randhir
		  ...   Example :
		  ...   | Open Browser To Login Page |  ${HOST} 	     | ${BROWSER}   |
		  ...   | Open Browser To Login Page |  http://facebook.com  | Firefox      |
		[Arguments]                     ${HOST123}     ${BROWSER123}
		
        Open Browser                    http://${HOST123}        ${BROWSER123}
        Maximize Browser Window
        #Login Page Should Be Open


Enter Login Credentials 
	[Documentation]   This keyword is used to enter the values in the fields of Username and Password.
		  ...	Author				:   rishi randhir		
  		  ...   Example :
		  ...   | Enter Test Credentials  |  ${VALID_USER}   ${VALID_PASSWORD}  |
		[Arguments]                     ${VALID_USER}   ${VALID_PASSWORD}
		Input Text 			${ID_LOGIN_USER_CONSOLE}    ${VALID_USER}
		Input Password			${ID_PASS_USER_CONSOLE}     ${VALID_PASSWORD}

Click On Button 
	[Documentation]   This keyword is used to click on buttons on webpage.
		...	 Author				:   rishi randhir
		...      Example :
		...      |Click Login Button 	| ${CLICKONBUTTON} |
		[Arguments]                     ${CLICKONBUTTON}
		Click Button     	        ${CLICKONBUTTON}

Check Bad UserName Or Password 
	[Documentation]   This keyword is used toverify if the user name or password is incorrect.
		...	 Author				:   rishi randhir
		...      Example :
		...      |Click Login Button 	| 
		Wait Until Element Is Visible    ${FLASH_ERROR}
    		${Response}     Get Text         ${FLASH_ERROR_WO_SPACES}
    		${temp_val}     Get Lines Containing String     ${Response}  ${FAILED_LOGIN_TEXT}
    		${flag}=        Run Keyword If  '${temp_val}' == '${FAILED_LOGIN_USER}' or '${temp_val}' == '${FAILED_LOGIN_PASS}'  Set Variable  True  ELSE  Set Variable   False
    		[return]        ${flag}
	
Get Credentials From Xls Location And Verify Login 	
	[Documentation]   This keyword is used to test bulk negative values from a xls file.
		...	 Author				:   rishi randhir
		...      Example :
		...      |Get Credentials From Xls Location And Verify Login 	| ${FILENAME} |
		[Arguments]                        ${FILENAME}
	${data}     Get Input Data From XLS File   ${FILENAME}
	:For 	${use_pass} 	IN 	@{data}
	\	${Val_User} 	Set Variable 	 ${use_pass[0]}
	\	${Val_User}     Set Variable     ${Val_User[1]}
	\	${Val_Pass}     Set Variable	 ${use_pass[1]}
	\	${Val_Pass}     Set Variable	 ${Val_Pass[1]}
	\	Log to Console   ${\n}Starting validation for user ${Val_User} from xls file.
	\	Open Browser For Test    	${HOST}/login    ${BROWSER}
	\	Enter Login Credentials  	${Val_User}      ${Val_Pass}
	\	Click On Button              	${CLICKONLOGINBUTTON} 
	\  	${flag} =		Check Bad UserName Or Password     
	\	Close All Browsers  	
	
Hover Mouse On Image To Get Data   
	[Documentation]   This keyword is used to hover over images in web and return the data of hovered image.
		...	 Author				:   rishi randhir
		...      Example :
		...      |Hover Mouse On Image To Get Data    	| ${IMAGE_NAME}     ${HOVER_TEXT}|
		[Arguments]                        ${IMAGE_NAME}     ${HOVER_TEXT}  		
	Mouse Over 	${IMAGE_NAME}
	${content}	Get Text 		${HOVER_TEXT}	
	[return]        ${content}

		
End Test
		[Documentation]   This keyword is used to capture screenshot of page whenever test-case fails.
		  ...	Author				:   rishi randhir		
		  ...   For failed test-case it takes a screenshot of the current page and puts it into the log.
  		  ...   Example :
		  ...   | End Test |  ${TEST_NAME} |
		[Arguments]                     ${TEST_NAME}
		${time}=    Evaluate    str(time.time())    time
		Run Keyword If Test Failed    Capture Page Screenshot	${TEST_NAME}-${time}.png




 	