// Morgan Brooke-deBock
// April 1 2023
// Program to recreate the "counting pane" afghan design from Wolly Thoughts
// Information about the afghan: http://www.woollythoughts.com/afghans/pane.html
// The code generates a grid of sqaures (the dimension of the squares in specified by the dim variable)
// each square is assigned an integer number starting at 1 in the top left corner, and counting up from left to right and top to bottom.
// The squares are colored in based on the factors of the number.

int dim;
int squareArray[][];

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(1000, 1000);
  background(0, 0, 100);
  dim = 10;

  showSquares(dim, dim);
  //showPrimes(dim);
  //showAllMultiples(dim, 7);
  showGrid(dim);
}

void draw() {
  ;
}

void showSquares(int dim, int threshold) {
  int len = width / dim;

  noStroke();

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      int num = (i * dim) + (j + 1);
      IntList factors = computeFactors(num, threshold);
      int squareHeight = len / factors.size();
      for (int k = 0; k < factors.size(); k++) {
        int hueInc = 360 / threshold;
        int hueOffset = 0;
        fill((hueInc * factors.get(k) + hueOffset) % 360, 100, 100);


        int x1 = j * len;
        int x2 = x1 + len;
        int y1 = (i * len) + (k * squareHeight);
        int y2 = y1 + squareHeight;
        rect(x1, y1, x2, y2);
      }
    }
  }
}

void showPrimes(int dim) {
  int len = width / dim;

  noStroke();

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      int num = (i * dim) + (j + 1);
      IntList factors = computeFactors(num, num);

      if (factors.size() == 2) {
        fill(0, 0, 100);
      } else {
        fill(0, 0, 0);
      }

      rect(j*len, i*len, j*len + len, i*len + len);
    }
  }
}

void showAllMultiples(int dim, int n) {
  int len = width / dim;

  noStroke();

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      int num = (i * dim) + (j + 1);
    
      if (num % n == 0) {
        fill(0, 0, 100);
      } else {
        fill(0, 0, 0);
      }

      rect(j*len, i*len, j*len + len, i*len + len);
    }
  }
}

void showGrid(int dim) {
  noFill();
  stroke(1);
  int len = width / dim;
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      rect(j*len, i*len, j*len + len, i*len + len);
    }
  }
}

IntList computeFactors(int num, int threshold) {
  // Compute all of the factors of the input number below the threshold number
  IntList result = new IntList();

  for (int i = 1; i < threshold + 1; i++) {
    if (num % i == 0) {
      // add i to the list
      result.append(i);
    }
  }

  return result;
}
