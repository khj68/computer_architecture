#include <stdio.h>
#include <math.h>

typedef struct {
    int num;
    int x, y;
} node;

node cities[7] = {{1, 0, 0}, {2, 8, 6}, {3, 2, 4},
                  {4, 6, 7}, {5, 1, 3}, {6, 9, 4}, {7, 2, 3}};
double arr[7][7];

double distance(node* a, node* b)
{
    return sqrt(pow((a->x - b->x), 2) + pow((a->y - b->y), 2));
}

int main()
{
    for(int i = 0; i < 7; i++) {
        for(int j = 0; j < i; j++) {
            arr[i][j] = distance(&cities[i], &cities[j]);
            arr[j][i] = arr[i][j];
        }
    }
    for(int i = 0; i < 7; i++){
        for (int j = 0; j < 7; j++) {
            printf("%lf ", arr[i][j]);
        }
        printf("\n");
    }
    printf("\n");

    int shortest_path[7];
    printf("sizeof int[7]: %ld\n", sizeof(shortest_path));
}