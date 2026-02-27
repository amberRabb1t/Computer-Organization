#include <stdio.h>

int v[] = {3, 10, 8, 2, 7, 1, 5, 9, 6, 4};

// swap(int i, int j) : swaps elements of v[] at positions i and j
void swap(int i, int j) {
	int temp = v[i];
	v[i] = v[j];
	v[j] = temp;
}

int partition(int f, int l) {
	int pivot = v[l];           // element v[l] is the pivot
	int i = f;                  // i points to the beginning of the vector
	// loop over vector
	for (int j = f; j < l; ++j) {
		if (v[j] < pivot) {		// element smaller than pivot
			swap(i++, j);		// swap it with position pointed by i
		}
	}
	swap(i, l);                // swap pivot to its correct position
	return (i);                 // return pivot's position
}

void qsort(int f, int l) {
    if (f < l) {
        int p = partition(f, l);
        qsort(f, p-1);
        qsort(p+1, l);
    }
}

int main() {
    int n = 10;
    for(int i = 0; i < 10; ++i) {
        printf("%d ", v[i]);
	}
    printf("\n");
    printf("%d\n", partition(5, 2));
    for(int i = 0; i < 10; ++i) {
        printf("%d ", v[i]);
	}
    return 0;
}
