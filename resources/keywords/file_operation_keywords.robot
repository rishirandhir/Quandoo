*** Settings ***
Library 			String
Library 			Collections
#Library 			C:/python scripts the hard way/Robot/quandoo_project/libs/xls_to_robot.py
Library				../../libs/xls_to_robot.py 



*** Keywords ***
Get Input Data From XLS File
	[Documentation]		This keyword reads values from xls file.
	...	
	...		Example:
	...		| Get Value From EXLS File |  ${FILE_NAME} | 
	...		| Get Value From EXLS File |  data.xlsx |

	[Arguments]	 ${FILE_NAME}  
	${data}= 	exls_to_robot	${FILE_NAME}
	Log	${data}
	[Return]	${data}
	

	