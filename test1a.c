#include <stdio.h>

int main()
{
	printf("woo!");
	// int A[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	// int B[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	// int i, j;
	// j = 0;
	// for(i = 0; i < 10; i++) {
	// 	B[i] = A[j] * 11 + i;
	// 	// if(i < 8)
	// 	// 	j = i;
	// 	// printf("%d\n", B[i]);
	// }
	// return 0;

	int A[2048];
	int B[2048];
	for (int i = 0; i < 2048; i = i + 4)
	{
		B[i] = A[i];
		B[(i + 1)] = A[(i + 1)];
		B[(i + 2)] = A[(i + 2)];
		B[(i + 3)] = A[(i + 3)];
	}
}
