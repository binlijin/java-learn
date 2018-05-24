Task

> * The Task represents one execution of a parallel subtask on a TaskManager.
> * A Task wraps a Flink operator (which may be a user function) and
> * runs it, providing all services necessary for example to consume input data,
>  * produce its results (intermediate result partitions) and communicate
>  * with the JobManager.
>  *
>  * <p>The Flink operators (implemented as subclasses of
>  * {@link AbstractInvokable} have only data readers, -writers, and certain event callbacks.
>  * The task connects those to the network stack and actor messages, and tracks the state
>  * of the execution and handles exceptions.
>  *
>  * <p>Tasks have no knowledge about how they relate to other tasks, or whether they
>  * are the first attempt to execute the task, or a repeated attempt. All of that
>  * is only known to the JobManager. All the task knows are its own runnable code,
>  * the task's configuration, and the IDs of the intermediate results to consume and
>  * produce (if any).
>  *
>  * <p>Each Task is run by one dedicated thread.

Flink运行时之TaskManager执行Task  
http://vinoyang.com/2017/01/24/flink-runtime-taskmanager-run-task/

Flink中task之间的数据交换机制
http://vinoyang.com/2016/04/24/flink-data-exchange-between-tasks/

https://cwiki.apache.org/confluence/display/FLINK/Data+exchange+between+tasks

Flink 网络栈
http://chenyuzhao.me/2017/02/09/flink%E7%BD%91%E7%BB%9C%E6%A0%88/


输入：InputGateDeploymentDescriptor  
输出：ResultPartitionDeploymentDescriptor  


Flink运行时之生产端结果分区  
http://vinoyang.com/2016/12/30/flink-runtime-producer-result-partition/

RecordWriter -> ResultPartitionWriter -> ResultPartition -> ResultSubpartition (流PipelinedSubpartition/批SpillableSubpartition)  

ResultPartition 里面向JobManager通知consumers有数据可消费  
JobManager向TaskManager发送TaskMessage消息，通知Task消息可读，消息传递到RemoteInputChannel  




JobManager通知TaskManager的某个Task数据可读（TaskMessage消息）  
TaskManger -> SingleInputGate#updateInputChannel -> RemoteInputChannel#requestSubpartition 向server请求数据  



Flink运行时之基于Netty的网络通信中  
http://vinoyang.com/2017/01/12/flink-runtime-netty-part-2/

通信协议：  
PartitionRequestProtocol  

Client向server发送分区数据请求命令，PartitionRequestClient，消息是PartitionRequest。  


client处理来自server端的消息协议PartitionRequestClientHandler：  
（1）BufferResponse  
（2）ErrorResponse  
Netty线程调用RemoteInputChannel#onBuffer把数据放到RemoteInputChannel的receivedBuffers中。  




server端处理来自client的消息 PartitionRequestServerHandler，PartitionRequestQueue  
（1）PartitionRequestServerHandler处理client的PartitionRequest消息请求  
    对于流来说 在PipelinedSubpartition里面创建PipelinedSubpartitionView，监听Buffer数据，有可用数据时回调 SequenceNumberingViewReader#notifyBuffersAvailable（BufferAvailabilityListener）最终调用处理PartitionRequestQueue#notifyReaderNonEmpty会在Netty里面起一个任务发送数据。



Task
AbstractInvokable
StreamTask
  SourceStreamTask
  OneInputStreamTask
  TwoInputStreamTask
OperatorChain










