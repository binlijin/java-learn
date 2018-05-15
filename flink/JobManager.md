JobManager

JobManager.scala

The job manager is responsible for receiving Flink jobs, scheduling the tasks, gathering the job status and managing the task managers. It is realized as an actor and receives amongst others the following messages:
- （1）[[RegisterTaskManager]] is sent by a TaskManager which wants to register at the job manager. A successful registration at the instance manager is acknowledged by [[AcknowledgeRegistration]]
- （2）- [[SubmitJob]] is sent by a client which wants to submit a job to the system. The submit message contains the job description in the form of the JobGraph. The JobGraph is appended to the ExecutionGraph and the corresponding ExecutionJobVertices are scheduled for execution on the TaskManagers.
- （3）- [[CancelJob]] requests to cancel the job with the specified jobID. A successful cancellation is indicated by [[CancellationSuccess]] and a failure by [[CancellationFailure]]
- （4） - [[UpdateTaskExecutionState]] is sent by a TaskManager to update the state of an ExecutionVertex contained in the [[ExecutionGraph]]. A successful update is acknowledged by true and otherwise false.
- （5） - [[RequestNextInputSplit]] requests the next input split for a running task on a [[TaskManager]]. The assigned input split or null is sent to the sender in the form of the message [[NextInputSplit]].
- （6）- [[JobStatusChanged]] indicates that the status of job (RUNNING, CANCELING, FINISHED, etc.) has changed. This message is sent by the ExecutionGraph.
  
  
YarnApplicationMasterRunner
* This class is the executable entry point for the YARN application master.
* It starts actor system and the actors for {@link JobManager}
* and {@link YarnFlinkResourceManager}.
* The JobManager handles Flink job execution, while the YarnFlinkResourceManager handles container
* allocation and failure detection.  
  
  
Flink JobManager 基本组件  
http://chenyuzhao.me/2017/02/08/jobmanager%E5%9F%BA%E6%9C%AC%E7%BB%84%E4%BB%B6/
 
   
- （1）作业调度  
       FlinkScheduler
- （2）jar 包管理  
       BlobServer/BlobStore/BlobLibraryCacheManager
- （3）checkpoint 的协调和发起  
       StandaloneCompletedCheckpointStore/ZooKeeperCompletedCheckpointStore
- （4）InstanceManager  
       追踪当前存活的 TaskManager 的管理组件
  
## 目录
  
**初始化各个组件**
  - BlobServer
  - InstanceManager
  - FlinkScheduler
  - BlobLibraryCacheManager
  
**submitJob**
   * Submits a job to the job manager. The job is registered at the libraryCacheManager which
   * creates the job's class loader. The job graph is appended to the corresponding execution
   * graph and the execution vertices are queued for scheduling.  
  - 参数JobGraph  
    代表一个flink job
  - 
  
