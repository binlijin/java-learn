JobManager

The job manager is responsible for receiving Flink jobs, scheduling the tasks, gathering the job status and managing the task managers. 


Flink JobManager 基本组件  
http://chenyuzhao.me/2017/02/08/jobmanager%E5%9F%BA%E6%9C%AC%E7%BB%84%E4%BB%B6/

- （1）作业调度  
- （2）jar 包管理  
       BlobServer/BlobStore/BlobLibraryCacheManager
- （3）checkpoint 的协调和发起  
       StandaloneCompletedCheckpointStore/ZooKeeperCompletedCheckpointStore
- （4）InstanceManager  
       追踪当前存活的 TaskManager 的管理组件

