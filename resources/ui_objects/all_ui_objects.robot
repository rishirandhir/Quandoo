*** Settings ***
Resource                ../variables/all_constants.robot

*** Variables ***

# Buttons and labels on UI 
${ID_LOGIN_USER_CONSOLE}				id=username
${ID_PASS_USER_CONSOLE}					id=password
${ID_LOGOUT_USER_BTN}					jquery=.btn-logout
${CLICKONLOGINBUTTON} 					//button[.//text() = ' Login']
${CLICKONLOGOUTLINK}					xpath = //*[@id="content"]/div/a         
${FLASH_ERROR}          				xpath=//div[contains(@class, 'flash error')]         
${FLASH_ERROR_WO_SPACES}				//div[contains(concat(' ', normalize-space(@class), ' '), ' flash error ')]
${HOVER_PATH1_TEXT}					xpath=//*[@id="content"]/div/div[1]/div/h5
${HOVER_PATH2_TEXT}					xpath=//*[@id="content"]/div/div[2]/div/h5
${HOVER_PATH3_TEXT}					xpath=//*[@id="content"]/div/div[3]/div/h5
${HOVER_MOUSE_IMG1}					xpath = //*[@id="content"]/div/div[1]/img
${HOVER_MOUSE_IMG2}					xpath = //*[@id="content"]/div/div[2]/img
${HOVER_MOUSE_IMG3}					xpath = //*[@id="content"]/div/div[3]/img
${ID_UNMANAGED_TAB_TABLE_ROW}     			xpath= //*[@id="table2"]
