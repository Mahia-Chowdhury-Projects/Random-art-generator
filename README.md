# Random Art Generator in Standard ML
## Project Overview

This project generates random abstract art using Standard ML. It builds mathematical expression trees, evaluates them over a grid of `(x, y)` points, and converts the results into grayscale or color image files.

The final output is saved as either:

- `art.pgm` for grayscale images
- `art.ppm` for color images

## Files

- `art.sml`  
  Main program. Builds random expressions, generates random grayscale or color images, and writes the output files.

- `expr.sml`  
  Defines expressions as a datatype, including variables, sine, cosine, average, multiplication, and added extensions.

- `expr-func.sml`  
  Defines expressions as functions instead of datatypes.

- `art.pgm`  
  Generated grayscale image output.

- `art.ppm`  
  Generated color image output.

- `art.jpg`  
  Viewable image version of the generated art.

## Expression Types

The project supports:

- `x`
- `y`
- `sin(pi * expression)`
- `cos(pi * expression)`
- average of two expressions
- multiplication of two expressions
- average of three expressions
- absolute value
- negation

## How It Works

1. A random expression tree is generated.
2. The expression is evaluated over points from `[-1, 1] x [-1, 1]`.
3. Each result is converted into a pixel intensity.
4. The program writes the pixel data into an image file.

For color images, three separate expressions are generated: one each for red, green, and blue.

## How to Run

Open SML/NJ and run:

```sml
use "art.sml";
