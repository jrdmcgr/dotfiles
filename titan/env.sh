# Variables for Amazon EC2
export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export PATH=$PATH:$EC2_HOME/bin
export PATH=$PATH:/usr/local/share/python
export PYTHONPATH=/usr/local/lib/python2.7/site-packages