$path = pwd
cd $path\build_sanity
echo "Starting execution of Quandoo project for Login"
pybot -d .\reports .\build_sanity.robot
