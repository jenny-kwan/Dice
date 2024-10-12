ArrayList<Die> dice = new ArrayList<>(); 
int dieSize = 100; 
int gridSize = 3; 
int margin = 70; 
int spacing = 30; 
int topMargin = 100; 

void setup() {
    size(500, 500); // Set canvas size
    noLoop(); // No automatic redraw

    // Create 9 dice, positioned in a 3x3 grid with calculated spacing
    for (int i = 0; i < gridSize; i++) {
        for (int j = 0; j < gridSize; j++) {
            int x = margin + i * (dieSize + spacing); // X position with increased margin and spacing
            int y = topMargin + j * (dieSize + spacing); // Y position with increased top margin
            dice.add(new Die(x, y));
        }
    }
}

void draw() {
    background(204,241,255); // Set background color
    int total = 0; // Variable to store the total roll value of all dice
    
    // Loop through all dice, roll them, and display
    for (Die die : dice) {
        die.roll();
        die.show();
        total += die.numDots; // Add the value of each die to the total
    }
    
    // Display total roll value at the top of the screen, above the dice
    fill(0);
    textSize(20);
    text("Total: " + total, 200, 60); // Display total above the dice, with more vertical space
}

void mousePressed() {
    redraw(); // Redraw the screen with new rolls when mouse is pressed
}

// Die class
class Die {
    int x, y;   // Position of the die on the screen
    int numDots; // Number of dots on the die

    // Constructor to initialize the x and y positions and roll the die
    Die(int x, int y) {
        this.x = x;
        this.y = y;
        roll(); // Roll the dice to initialize numDots
    }

    // Roll the dice, assigning a random number from 1 to 6
    void roll() {
        numDots = (int)(Math.random() * 6) + 1;
    }

    // Show the die (draw the dice and its dots)
    void show() {
        // Draw the square (dice) at position (x, y)
        fill(255); // White die
        rect(x, y, dieSize, dieSize); // Draw the die with calculated size
        
        fill(0); // Dots should be black
        int offset = dieSize / 5; // Offset to position the dots relative to die size
        int center = x + dieSize / 2;
        
        // Draw the appropriate dots based on numDots
        if (numDots == 1 || numDots == 3 || numDots == 5) {
            ellipse(center, y + dieSize / 2, 10, 10); // Center dot
        }
        if (numDots == 2 || numDots == 3 || numDots == 4 || numDots == 5 || numDots == 6) {
            ellipse(x + offset, y + offset, 10, 10); // Top left
            ellipse(x + dieSize - offset, y + dieSize - offset, 10, 10); // Bottom right
        }
        if (numDots == 4 || numDots == 5 || numDots == 6) {
            ellipse(x + dieSize - offset, y + offset, 10, 10); // Top right
            ellipse(x + offset, y + dieSize - offset, 10, 10); // Bottom left
        }
        if (numDots == 6) {
            ellipse(x + offset, y + dieSize / 2, 10, 10); // Middle left
            ellipse(x + dieSize - offset, y + dieSize / 2, 10, 10); // Middle right
        }
    }
}
