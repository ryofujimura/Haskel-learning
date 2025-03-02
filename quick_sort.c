/*
VSCode, Replit, Canvas, In-Notes, Hoogle, 
 */
#include "quick_sort.h"
#include <stdlib.h>

static void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}

static int partition(int *a, int low, int high) {
    int pivot = a[high];  // Use the last element as pivot
    int i = low - 1;      // Index of smaller element

    for (int j = low; j < high; j++) {
        if (a[j] < pivot) {
            i++;
            swap(&a[i], &a[j]);
        }
    }
    swap(&a[i + 1], &a[high]);
    return i + 1;  // Return pivot's final position
}

static void quick_sort_helper(int *a, int low, int high) {
    if (low < high) {
        int pi = partition(a, low, high);
        quick_sort_helper(a, low, pi - 1);   // Sort left subarray
        quick_sort_helper(a, pi + 1, high);  // Sort right subarray
    }
}

void quick_sort(int *a, int n) {
    if (n <= 1) return;  // Base case: 0 or 1 elements are already sorted
    quick_sort_helper(a, 0, n - 1);
}