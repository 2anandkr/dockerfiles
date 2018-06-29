// don't run any build executors on master
import jenkins.model.*
Jenkins.instance.setNumExecutors(0)