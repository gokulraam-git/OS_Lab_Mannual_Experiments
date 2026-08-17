#include <stdio.h>

int main()
{
    int pages[50], frames[10];
    int n, f, i, j, k;
    int fault = 0, found;
    int pos, farthest, nextUse;

    printf("Enter Number of Pages: ");
    scanf("%d", &n);

    printf("Enter Reference String:\n");
    for(i = 0; i < n; i++)
        scanf("%d", &pages[i]);

    printf("Enter Number of Frames: ");
    scanf("%d", &f);

    for(i = 0; i < f; i++)
        frames[i] = -1;

    for(i = 0; i < n; i++)
    {
        found = 0;

        for(j = 0; j < f; j++)
        {
            if(frames[j] == pages[i])
            {
                found = 1;
                break;
            }
        }

        if(found == 0)
        {
            pos = -1;

            for(j = 0; j < f; j++)
            {
                if(frames[j] == -1)
                {
                    pos = j;
                    break;
                }
            }

            if(pos == -1)
            {
                farthest = -1;

                for(j = 0; j < f; j++)
                {
                    nextUse = n;

                    for(k = i + 1; k < n; k++)
                    {
                        if(frames[j] == pages[k])
                        {
                            nextUse = k;
                            break;
                        }
                    }

                    if(nextUse > farthest)
                    {
                        farthest = nextUse;
                        pos = j;
                    }
                }
            }

            frames[pos] = pages[i];
            fault++;
        }
    }

    printf("Total Page Faults = %d\n", fault);

    return 0;
}