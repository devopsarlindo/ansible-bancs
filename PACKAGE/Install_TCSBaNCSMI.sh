#!/bin/sh

#################################################
######## TCS BaNCS MI Installation Script #######
#################################################
appVersion=MI

#### Checking installation prerequisite

if [ -z $JAVA_HOME ]
then
	echo "JAVA_HOME is not set.Please set JAVA_HOME  to the JDK 1.6 or above and rerun the script"
	exit -1
else
	echo "JAVA_HOME set to $JAVA_HOME"
fi

which java > /dev/null

if [ $? -ne 0 ]
then
	echo "java is not available in the system path"
	exit -1
fi

if [ -z $ANT_HOME ]
then
	echo "ANT_HOME is not set.Please set ANT_HOME  to the Ant installation 1.9 or above and rerun the script"
	exit -1
else
	echo "ANT_HOME set to $ANT_HOME"
fi

which ant > /dev/null

if [ $? -ne 0 ]
then
	echo "Ant is not available in the system path"
	exit -1
fi

which perl > /dev/null

if [ $? -ne 0 ]
then
	echo "Perl is not available in the system path"
	exit -1
fi

##### Executing the TCS BaNCS MI application executable ######
#This will extract the TCS BaNCS MI application and gather all the needed inputs #

tmestmp=`date +%Y%m%d_%H%M%S`

java -jar $appVersion.jar -console

if [ $? -ne 0 ]
then
	echo "Error in extraction of TCS BaNCS MI application "
	exit -1
fi

if [ ! -f MI_InstallLocation ]
then
	echo "Error:The extract location file MI_InstallLocation is not available";
	exit -1
fi
echo "Going to Sleep for 30 Sec before Initiating the deployment "
sleep 30
echo "Skipping extraction"
########################################
install_home=`cat MI_InstallLocation|cut -d : -f1`;
install_type=`cat MI_InstallLocation|cut -d : -f2`;
isRemoteAllowed=`cat MI_InstallLocation|cut -d : -f3`;
deployPropFile=`cat MI_InstallLocation|cut -d : -f4`;



echo $install_home/Scripts


cd $install_home/Scripts

if [ $? -ne 0 ]
then
	echo "Error:Unable to change directory to installation script folder"
	exit -1
fi

mkdir -p $install_home/Scripts/logs
export ERRFILE=$install_home/Scripts/logs/errorLog_${tmestmp}.log
export INFOFILE=$install_home/Scripts/logs/infoLog_${tmestmp}.log

for scriptFile in `find $install_home/Scripts -name "*.sh"`
do
	chmod +x $scriptFile
done

perl MI_BMT_startInstallation.pl $install_home $install_type $isRemoteAllowed $deployPropFile


