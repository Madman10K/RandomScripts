#include <stdio.h>

int main()
{
    for (int i = 38; i <= 48; i += 10)
    {
        for (int j = 0; j < 255; j++)
        {
            printf("\x1B[%d;5;%dm  %3d \x1B[0m", i, j, j);

            if ((j + 1) % 6 == 4)
            {
                printf("\n");
            }
        }
        printf("\n");
    }

    return 0;
}
