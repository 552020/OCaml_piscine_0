/*
 * C version for reference
 * Compile: gcc ft_print_comb.c -o ft_print_comb
 * Run: ./ft_print_comb
 */

#include <unistd.h>

void ft_print_comb(void) {
  int first = 0;
  int second = 0;
  int third = 0;
  int first_printed = 0; // Track if we've printed at least one combination

  for (first = 0; first <= 9; first++) {
    for (second = 0; second <= 9; second++) {
      for (third = 0; third <= 9; third++) {
        // Check constraint: digits are different and in ascending order
        if (first < second && second < third) {
          // Print comma and space before each combination except the first
          if (first_printed) {
            write(1, ", ", 2);
          }
          first_printed = 1;

          // Print the three digits
          write(1, &(char){'0' + first}, 1);
          write(1, &(char){'0' + second}, 1);
          write(1, &(char){'0' + third}, 1);
        }
      }
    }
  }
  write(1, "\n", 1);
}

int main(void) {
  ft_print_comb();
  return (0);
}
