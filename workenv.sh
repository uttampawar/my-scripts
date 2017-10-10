function set_node_version
{
  while true
  do
    echo "Select node version ..."
    echo "0. v4.5.0"
    echo "1. v6.9.1"
    echo "2. v8.5.0"
    echo "3. node_master"
    echo -n "Enter your selection:[2] "
    read -e x
    echo $x
    if [ -z "$x" ]; then
      x=2
    fi
    echo $x

    case $x in
    0) # n-2 : LTS v4.x
       NODE_HOME=$HOME/tools/node-v4.5.0-linux-x64
       export PATH=$NODE_HOME/bin:$PATH
       break;;
    1) # n-1 : v6.x
       NODE_HOME=$HOME/tools/node-v6.9.1-linux-x64
       export PATH=$NODE_HOME/bin:$PATH
       break;;
    2) # n : v8.x Current stable branch to be latest LTS in Oct. 2017
       NODE_HOME=$HOME/tools/node-v8.5.0-linux-x64
       export PATH=$NODE_HOME/bin:$PATH
       break;;
    3) #Current master branch build
       NODE_HOME=$HOME/project/node_master/out/Release
       export PATH=$NODE_HOME:$PATH
       break;;
    *) echo "Selected option is not valid. Select again."
    esac
  done

  export NODE_HOME
  echo
  echo "********************************************************************"
  echo "NODE_HOME is set to: $NODE_HOME"
  echo "Node version is set to: `node -v`"
  echo "********************************************************************"
  echo
}

function set_node_apps_env
{
  echo "Setting up node env"
  set_node_version
}

while true
do
  echo "Select an environment ..."
  echo "0. Default"
  echo "1. zenddev"
  echo "2. hhvmdev"
  echo "3. nodedev"
  echo "4. nodeapps"
  echo "5. meteor"
  echo -n "Enter your selection:[4]"
  read -e x
  if [ -z "$x" ]; then
    x=4
  fi

  case $x in
  0 ) echo "General settings."
     break;;
  1 ) echo "zend development settings. Placeholder."
     break;;
  2 ) echo "HHVM development settings. Placeholder."
     break;;
  3 ) echo "NODE development settings."
     set_node_apps_env
     break;;
  4 ) echo "NODE APPS development settings."
     set_node_apps_env
     break;;
  5 ) echo "Meteor development settings. Placeholder."
     break;;
  * ) echo "Selected option is not valid. Select again."
  esac
done

