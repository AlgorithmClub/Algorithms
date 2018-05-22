void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void quick_sort(int arr[], int start, int end) {
    if (start >= end) return;
    int pivot = arr[end];
    int left = start, right = end - 1;
    while (left < right) {
        while (arr[left] < pivot && left < right)
            left++;
        while (arr[right] >= pivot && left < right)
            right--;
        swap(&arr[left], &arr[right]);
    }
   
    quick_sort(arr, start, left - 1);
    quick_sort(arr, left + 1, end);
}
