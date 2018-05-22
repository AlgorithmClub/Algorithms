package sort;

/**
 * @Description: 快速排序
 * @Author idota
 * @Date 2018/5/21
 */
public class QuickSort {


    /**
     * @param arr   传入的数组
     * @param start 数组起始位置
     * @param end   数组结尾位置
     */
    public static void qsort(int[] arr, int start, int end) {
        int s = start;
        int e = end;
        int povit = arr[start];

        while (s < e) {
            while (s < e && arr[e] >= povit)
                e--;
            if (s < e) {
                int temp = arr[e];
                arr[e] = arr[s];
                arr[s] = temp;
                s++;
            }

            while (s < e && arr[s] <= povit)
                s++;

            if (s < e) {
                int temp = arr[e];
                arr[e] = arr[s];
                arr[s] = temp;
                e--;
            }
        }
        if (s > start) qsort(arr, start, s - 1);
        if (e < end) qsort(arr, s + 1, end);
    }

    public static void main(String[] args) {
        int[] arr = {14, 12, 23, 4, 5, 6};
        qsort(arr, 0, arr.length - 1);
        for (int i : arr) {
            System.out.println(i);
        }
    }

}
