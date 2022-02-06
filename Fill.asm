// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@color    // declare color variable
M=0      // by default is white

(LOOP)

  @SCREEN
  D=A
  @pixels // pointers for screen addresses wil be here stored
  M=D         

  @KBD    // keyboard address
  D=M
  @BLACK
  D;JGT     // if(keyboard > 0) goto BLACK
  
  @color
  M=0       // else:  color is white
  @COLOR_SCREEN
  0;JMP    
  
  (BLACK)
    @color
    M=-1   

  (COLOR_SCREEN)
    @color
    D=M // what color
    @pixels
    A=M         // A store the address
    M=D         // M[A]=coloring
    
    @pixels
    M=M+1
    D=M
        
    @24576 
    D=D-A // IF Pointer plus 1 is less than 24576 continue color the screen
    @COLOR_SCREEN
    D;JLT

@LOOP
0;JMP // infinite loop