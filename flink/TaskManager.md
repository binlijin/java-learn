TaskManager

Deploy/Stop/Cancel task

TaskManager 基本组件  
http://chenyuzhao.me/2017/02/09/taskmanager%E5%9F%BA%E6%9C%AC%E7%BB%84%E4%BB%B6/
- （1）task 的启动销毁  
- （2）内存管理  
- （3）磁盘IO IOManager  
- （4）网络传输管理  
- （5）下载jar包
      BlobCache/BlobClient


Flink运行时之TaskManager执行Task  
http://vinoyang.com/2017/01/24/flink-runtime-taskmanager-run-task/

- (1) 一个任务实例被部署所产生的实际影响就是JobManager会将一个TaskDeploymentDescriptor对象封装在SubmitTask消息中发送给TaskManager  
  Execution#deploy里面创建  
- (2) 而处理该消息的入口方法是submitTask方法，它是TaskManager接收任务部署并启动任务执行的入口方法  
  TaskManager#submitTask  TaskManager.scala

YarnResourceManager#createTaskExecutorLaunchContext ContainerLaunchContext  
入口是 YarnTaskExecutorRunner  
1. TaskManagerRunner  
1. TaskManagerServices  
   1. NetworkEnvironment   
   1. MemoryManager  
   1. IOManager  
   1. BroadcastVariableManager  
   1. FileCache  
   1. TimerService  
   1. TaskSlotTable  
   1. JobManagerTable  
   1. JobLeaderService  
1. TaskExecutor  
  
Task执行用户逻辑前会从job manager下载所需的jar
