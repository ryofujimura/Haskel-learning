// VSCode, Replit, Canvas, In-Notes, Hoogle
#include "merge_sort.h"
#include <stdlib.h>

static void merge(int *a, int *temp, int left, int mid, int right) {
    int i = left;      // Index for left subarray
    int j = mid + 1;   // Index for right subarray
    int k = left;      // Index for temp array

    // Merge the two subarrays into temp
    while (i <= mid && j <= right) {
        if (a[i] <= a[j]) {
            temp[k++] = a[i++];
        } else {
            temp[k++] = a[j++];
        }
    }

    // Copy remaining elements from left subarray
    while (i <= mid) {
        temp[k++] = a[i++];
    }

    // Copy remaining elements from right subarray
    while (j <= right) {
        temp[k++] = a[j++];
    }

    // Copy back to original array
    for (int m = left; m <= right; m++) {
        a[m] = temp[m];
    }
}

static void merge_sort_helper(int *a, int *temp, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;  // Avoid integer overflow
        merge_sort_helper(a, temp, left, mid);
        merge_sort_helper(a, temp, mid + 1, right);
        merge(a, temp, left, mid, right);
    }
}

void merge_sort(int *a, int n) {
    if (n <= 1) return;  // Base case: 0 or 1 elements are sorted

    int *temp = malloc(n * sizeof(int));
    if (temp == NULL) {
        exit(1);  // Exit on allocation failure (basic error handling)
    }

    merge_sort_helper(a, temp, 0, n - 1);
    free(temp);  // Free dynamically allocated memory
}