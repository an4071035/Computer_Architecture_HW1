#include <stdio.h>
#include <stdlib.h>
int numWaterBottles(int numBottles, int numExchange){
    int drink, remain;
    drink = numBottles;
    while(numBottles >= numExchange){
        remain = 0;
        while(numBottles >= numExchange){
            numBottles -= numExchange;
            remain++;
        }
        numBottles += remain;
        drink += remain;
    }
    return drink;
}
int main()
{
    int numBottles, numExchange, drink;
    numBottles = 15;
    numExchange = 4;
    drink = numWaterBottles(numBottles, numExchange);
    printf("maximum number of water bottles you can drink is %d\n", drink);
}

