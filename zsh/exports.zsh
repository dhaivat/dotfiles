## all exports shall be declared here

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export WS="$HOME/workspace"
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home'
export JAVA7_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home'
export JAVA6_HOME='/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
export AWS_EC2_REGION=us-west-2
export AWS_IAM_HOME=/usr/local/iamcli
export EC2_HOME="/usr/local/ec2-api-tools"
export EC2_LOC="/usr/local/ec2-api-tools"
export GOROOT="/usr/local/go"
export GOPATH="$WS/go"
export GOHOME="$GOPATH/src/github.com/ceocoder"
export PATH=$AWS_IAM_HOME/bin:$EC2_LOC/bin:$PATH:$GOROOT/bin:$GOPATH/bin
export AIRSHIP_SSH_COMMAND=/usr/local/bin/as-ssh
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
alias gh="cd $GOHOME"
