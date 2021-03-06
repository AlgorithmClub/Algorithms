package sort;

/**
 * @Description: 堆排序
 * @Author idota
 * @Date 2018/5/17
 */

public class HeapSort {


    /**
     * @param arr 无数数组
     */
    public static void sort(int[] arr) {
        //1.建堆
        arr = buildHeap(arr, 0);
        //2.调整然后继续建立堆;
        for (int i = 0; 0 < arr.length - i; ) {
            int temp = arr[0];
            arr[0] = arr[arr.length - 1 - i];
            arr[arr.length - 1 - i] = temp;
            i++;
            arr = buildHeap(arr, i);
        }
        for (int i : arr) {
            System.out.printf("%d,", i);
        }
    }


    private static int[] buildHeap(int[] arr, int n) {
        int length = arr.length - n;
        for (int i = (length / 2) - 1; i >= 0; i--) {
            int leftIndex = i * 2 + 1;
            int rightIndex = i * 2 + 2;
            //存在右边节点
            if (rightIndex < length) {
                //左节点大于父节点则交换
                if (arr[leftIndex] > arr[i]) {
                    int temp = arr[leftIndex];
                    arr[leftIndex] = arr[i];
                    arr[i] = temp;
                }
                if (arr[rightIndex] > arr[i]) {
                    int temp = arr[rightIndex];
                    arr[rightIndex] = arr[i];
                    arr[i] = temp;
                }
            }

        }
        return arr;
    }

    public static void main(String[] args) {
        int[] arr = {16, 444,555,123123,5555,12,1231,23,12,3,123,2,3333,231211,1111,22222};
        sort(arr);
    }

}
