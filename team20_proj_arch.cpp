/*
 * SWE3005 Computer Architectures
 * Prof. Hee Yong Youn
 * 2019 Spring Course Project
 * TSP on MIPS
 * Phase 1: High level language program
 * Team. 20
 */

#include <cstdio>
#include <algorithm>
#include <cmath>
#include <ctime>

using namespace std;

typedef struct {
  int num;
  int x, y;
} node;

node cities[7] = {{1, 0, 0}, {2, 8, 6}, {3, 2, 4},
                  {4, 6, 7}, {5, 1, 3}, {6, 9, 4}, {7, 2, 3}};
bool visit[7];
double ans = 100000000;
double arr[7][7];

bool operator<(node& a, node& b) {
  return a.num < b.num;
}

void save_path(int* path, node* cities) {
  for(int i = 0; i < 7; i++){
    path[i] = cities[i].num;
  }
  return;
}

double distance(node& a, node& b) {
  return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
}

void dfs(int n, int depth, double sum) {
  if(depth == 6){
    // add  path to 1
    sum += arr[n][0];
    ans = min(ans, sum);
    // min check
    return;
  }
  for(int i = 1; i < 7; i++) {
    if(visit[i] == true) continue;
    visit[i] = true;
    if(!(sum > ans)) dfs(i, depth + 1, sum + arr[n][i]);
    visit[i] = false;
  }
}

int main() {
  clock_t begin, end;
  begin = clock();
  int shortest_path[7];

  for(int i = 0; i < 7; i++) {
    for(int j = 0; j < i; j++) {
      arr[i][j] = distance(cities[i], cities[j]);
      arr[j][i] = arr[i][j];
    }
  }

  dfs(0, 0, 0);

  printf("----------------------------------------------\n");
  printf("SHORTEST PATH : ");
  printf("%f\n", ans);
  end = clock();
  printf("\nTIME : %f", (end - begin) / CLOCKS_PER_SEC);
}
