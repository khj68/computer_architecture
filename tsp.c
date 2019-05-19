/*
 * SWE3005 Computer Architectures
 * Prof. Hee Yong Youn
 * 2019 Spring Course Project
 * TSP on MIPS
 * Phase 1: High level language program
 * Team. 20: Hyungjun Kim, Ju-eun Park
 */

#include <stdio.h>
#include <math.h>

typedef struct {
  int num;
  int x, y;
} node;

node cities[7] = {{1, 0, 0}, {2, 8, 6}, {3, 2, 4},
                  {4, 6, 7}, {5, 1, 3}, {6, 9, 4}, {7, 2, 3}};
int visit[7];
double ans = 100000000;
double arr[7][7];
int current_path[7];
int shortest_path[7];

void save_path()
{
  for(int i = 0; i < 7; i++){
    shortest_path[i] = current_path[i];
  }
}

double distance(node* a, node* b)
{
  return sqrt(pow((a->x - b->x), 2) + pow((a->y - b->y), 2));
}

void print_path(int* arr)
{
  for(int i = 0; i < 7; i++){
    printf("%d ", arr[i]);
  }
  printf("\n");
}

void dfs(int n, int depth, double sum)
{
  if(depth == 6){
    // add path to 1
    sum += arr[n][0];
    if(sum < ans){
      ans = sum;
      save_path();
    }
    return;
  }
  for(int i = 1; i < 7; i++) {
    if(visit[i] == 1) continue;
    
    if(sum + arr[n][i] < ans) {
      visit[i] = 1;
      current_path[depth+1] = cities[i].num;
      dfs(i, depth + 1, sum + arr[n][i]);
      // visit[i] = 0;
    }
  }
}

int main()
{
  for(int i = 0; i < 7; i++) {
    for(int j = 0; j < i; j++) {
      arr[i][j] = distance(&cities[i], &cities[j]);
      arr[j][i] = arr[i][j];
    }
  }

  
  shortest_path[0] = 1;
  current_path[0] = 1;
  dfs(0, 0, 0);
  
  printf("SHORTEST PATH : ");
  print_path(shortest_path);
  printf("DISTANCE : %f\n", ans);
}
