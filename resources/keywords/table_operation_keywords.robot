*** Settings ***
Library   Selenium2Library
Library   String
Library   Collections

*** Variables ***
${flag}     False
${result}
${CELL_VALUE}

*** Keywords ***
Verify the sort on table       
	[Documentation]		This keyword verifies the sort table .
	...	
	...		Example:
	...		| Get Value From EXLS File |  ${ID_UNMANAGED_TAB_TABLE_COL}    @{WEB_ELEMENTS_LIST}    ${COL_TO_SORT} | 
	...		| Get Value From EXLS File |  xpath= //c//    [a,b,c,d]   1   |

	[Arguments]	 ${ID_UNMANAGED_TAB_TABLE_COL}    ${WEB_ELEMENTS_LIST}    ${COL_TO_SORT}  
	@{row}         Get WebElements        ${ID_UNMANAGED_TAB_TABLE_COL}
  	${LENGTH}       Get Length            ${row}
  	@{CELL_VALUE1}=  Create List
      	:FOR  ${i}  IN RANGE  0   ${LENGTH}
      	\   ${details}=    		Get Text   @{row}[${i}]
      	\   @{row_details}=		Split String 	${details}	 \n
      	\   ${row_len}    Get Length      ${rowdetails}
        	:FOR  ${j}   IN RANGE   2   ${row_len}+1
        	\    ${CELL_VALUE}=		Get Table Cell    	${ID_UNMANAGED_TAB_TABLE_ROW}		${j}	${COL_TO_SORT}
        	\    Append to List     ${CELL_VALUE1}      ${CELL_VALUE}

	${flag} =  Run Keyword And Return Status   Should be equal As Strings   ${CELL_VALUE1}    ${WEB_ELEMENTS_LIST}
	Log to console   \n Expected:${CELL_VALUE1}
	Log to console   \n Actual:${WEB_ELEMENTS_LIST}
  	[return]   ${flag}
  