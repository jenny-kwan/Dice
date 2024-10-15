ArrayList<Die> dice = new ArrayList<>(); 
int dieSize = 100; 
int gridSize = 3; 
int margin = 70; 
int spacing = 30; 
int topMargin = 100; 

void setup() {
    size(500, 500); 
    noLoop(); 

    // 9 dice
    for (int i = 0; i < gridSize; i++) {
        for (int j = 0; j < gridSize; j++) {
            int x = margin + i * (dieSize + spacing); 
            int y = topMargin + j * (dieSize + spacing); 
            dice.add(new Die(x, y));
        }
    }
}

void draw() {
    background(204,241,255); 
    int total = 0; 
    
    // Loop
    for (Die die : dice) {
        die.roll();
        die.show();
        total += die.numDots; 
    }
    
    // Total
    fill(0);
    textSize(20);
    text("Total: " + total, 200, 60); 
}

void mousePressed() {
    redraw(); 
}

// Die class
class Die {
    int x, y;   
    int numDots; 

    // Constructor
    Die(int x, int y) {
        this.x = x;
        this.y = y;
        roll(); 
    }

    void roll() {
        numDots = (int)(Math.random() * 6) + 1;
    }

    void show() {
        fill(255); // White die
        rect(x, y, dieSize, dieSize); 
        
        fill(0); 
        int offset = dieSize / 5; 
        int center = x + dieSize / 2;
    
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
