TaskManager

Deploy/Stop/Cancel task

Flink运行时之TaskManager执行Task  
http://vinoyang.com/2017/01/24/flink-runtime-taskmanager-run-task/

- (1) 一个任务实例被部署所产生的实际影响就是JobManager会将一个TaskDeploymentDescriptor对象封装在SubmitTask消息中发送给TaskManager  
  Execution#deploy里面创建  
- (2) 而处理该消息的入口方法是submitTask方法，它是TaskManager接收任务部署并启动任务执行的入口方法  
  TaskManager#submitTask  TaskManager.scala
