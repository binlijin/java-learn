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


