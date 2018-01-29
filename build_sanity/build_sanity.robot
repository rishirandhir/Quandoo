*** Settings ***
Documentation    These tests will run webpage UI tests.

Resource  	../resources/keywords/all_keywords.robot
Resource 	../resources/ui_objects/all_ui_objects.robot
Resource 	../resources/variables/all_variables.robot
Resource 	../resources/variables/all_constants.robot
Resource	../resources/keywords/file_operation_keywords.robot
Resource	../resources/keywords/table_operation_keywords.robot
Library		Selenium2Library
Library         OperatingSystem
Suite Teardown  Close All Browsers  
Test Teardown	End Test   ${TEST_NAME}

*** Variables ***
${flag}     		False

*** Test Cases ***
#--------------------------------------------------------------------------------------------

Verify the correct credentials
	[Tags]    Sanity
	[Documentation]   Test Case1 : This is a test that will use the valid credentials

	Open Browser For Test    	${HOST}/login           ${BROWSER}
	Enter Login Credentials  	${VALID_USER}      ${VALID_PASSWORD}
	Click On Button              	${CLICKONLOGINBUTTON}   
  	Wait until page contains        ${SECURE_MSG_STRING}        
	Click Link			${CLICKONLOGOUTLINK}
	Wait until page contains        ${SECURE_LOGOUT_STRING}   
	Close All Browsers 
#---------------------------------------------------------------------------------------------
Verify the values of multiple negative users
	[Tags]    Sanity
	[Documentation]   Test Case 2 and 3: This is a test case that will validate all the negative scenarios, since these are usually more
	...		#input has been taken from xls file , as mentioned in test case 2 and 3.		

	Get Credentials From Xls Location And Verify Login 	${CURDIR}\\data\\${FILENAME}
	Close All Browsers
#----------------------------------------------------------------------------------------------
Verify the hover action 
	[Tags]    Sanity
	[Documentation]   Test Case 4: Verify hover actions. 

	Open Browser For Test   	${HOST}/hovers    ${BROWSER}
	${content1} =  Hover Mouse On Image To Get Data   ${HOVER_MOUSE_IMG1}      ${HOVER_PATH1_TEXT}
	${content2} =  Hover Mouse On Image To Get Data   ${HOVER_MOUSE_IMG2}      ${HOVER_PATH2_TEXT}
	${content3} =  Hover Mouse On Image To Get Data   ${HOVER_MOUSE_IMG3}      ${HOVER_PATH3_TEXT}
	${flag}=   Run Keyword If    '${content1}' == "name: user1" and '${content2}' == "name: user2" and '${content3}' == "name: user3"  Set Variable   True   ELSE   Set Variable   False
	Run Keyword If  '${flag}' == 'False'    Fail    
	Close All Browsers
#-----------------------------------------------------------------------------------------------
Verify ascending order of elements in table 2
	[Tags]    Sanity
	[Documentation]   Test Case 5: Sort in Ascending order 

	Open Browser For Test   	${HOST}/tables    ${BROWSER}
	${Header_Item}=    Get WebElement      ${ID_UNMANAGED_TAB_TABLE_ROW}/thead/tr/th[${COL_TO_SORT}]/span
	Click Element      ${Header_Item}
  	#Create a LIst of Expected ascending order
	@{WEB_ELEMENTS_LIST_ASC}   Create List   Bach  Conway  Doe  Smith
	#verify the sort.
	${flag}=  Verify the sort on table       ${ID_UNMANAGED_TAB_TABLE_ROW}    ${WEB_ELEMENTS_LIST_ASC}    ${COL_TO_SORT}
	Log to Console   ${flag}
	Close All Browsers
#-----------------------------------------------------------------------------------------------------
Verify descending order of elements in table 2
	[Tags]    Sanity
	[Documentation]  Test Case 6:  Sort in Descending Order

	Open Browser For Test   	${HOST}/tables    ${BROWSER}
	${Header_Item}=    Get WebElement      ${ID_UNMANAGED_TAB_TABLE_ROW}/thead/tr/th[${COL_TO_SORT}]/span
	Click Element      ${Header_Item}
	Click Element      ${Header_Item}
  	#Create a List of Expected descending order
	@{WEB_ELEMENTS_LIST_DES}   Create List   Create List   Bach  Conway  Doe  Smith
	#verify the sort.
	${flag}=  Verify the sort on table       ${ID_UNMANAGED_TAB_TABLE_ROW}    ${WEB_ELEMENTS_LIST_DES}    ${COL_TO_SORT}
	Close All Browsers
	
		     