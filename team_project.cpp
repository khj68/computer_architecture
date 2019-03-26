#include <cstdio>
#include <algorithm>
#include <cmath>

using namespace std;

typedef struct{
  int num;
  int x,y;
}node;

bool operator<(node& a, node& b){
  return a.num < b.num;
}

void save_path(int* path, node* cities){
  for(int i=0; i<7; i++){
    path[i] = cities[i].num;
  }
  return;
}

double distance(node& a, node& b){
  return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
}

int main(){
  node cities[7] = {{1,0,0}, {2,8,6}, {3,2,4}, {4,6,7}, {5,1,3}, {6,9,4}, {7,2,3}};
  int shortest_path[7];
  double ans = 100000000;

  do{
    for(int i=0; i<7; i++){
      printf("%d ", cities[i].num);
    }
    double sum_distance = 0;
    for(int i=0; i<7; i++){
      if(i==6){
        sum_distance += distance(cities[i], cities[0]);
      }else{
        sum_distance += distance(cities[i], cities[i+1]);
      }
    }
    printf("%f min is %f\n", sum_distance, ans);
    if(ans > sum_distance){
      ans = sum_distance;
      save_path(shortest_path, cities);
    }
  }while(next_permutation(cities+1, cities+7));
  printf("----------------------------------------------\n");
  printf("SHORTEST PATH : ");
  for(int i=0; i<7; i++){
    printf("%d ", shortest_path[i]);
  }
}