#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
    pid_t pid;

    pid = fork();

    if(pid == 0)
    {
        printf("Child Process Started\n");
        sleep(2);
        printf("Child Process Completed\n");
    }
    else
    {
        wait(NULL);
        printf("Parent Process Resumes After Child Completion\n");
    }

    return 0;
}