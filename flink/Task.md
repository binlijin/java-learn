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
 
