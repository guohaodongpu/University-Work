
#include<stdio.h>
#include<windows.h> 
//郭浩东-1514011447-A05
int ErFen(int a[], int l, int n);

int main()
{
    int array[9] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    int location;
    int n = 6; 
    location = ErFen(array, 9, n);
    
    printf("所需查找值的下标为: %d\n", location);
    
    printf("\n");
    system("pause"); 
    return 0;
}

int ErFen(int a[], int l, int n)
{
    
    int low = 0, m, high = l - 1;

    while (low <= high)
    {
        m = (low + high) / 2;
        if (n < a[m])
        {
            high = m - 1;
        }
        else if (n> a[m])
        {
            low = m + 1;
        }
        else
        {
            return m;
        }
    }
    return -1;
}
