
//
PImage BImage1,BImage2,enemy,fighter,hp,treasure,end1,end2,MoocsEnemy1,MoocsGainbomb,start1,start2; // image in 
int Bx,hpy,Tx,Ty,Ex,Ey;
//
final int GAME_START = 1,GAME_WIN = 2,GAME_LOSE = 3,GAME_RUN = 4;
int gameState,n,HP;
// control
float x,y;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
//
//_________________________________________________--
float RY,enemyWidth,enemyHeight;

int winTimes,Ex2,Ey2,timesN;
final int first = 1,second = 2,third = 3;

void setup () {
  size(640, 480) ;
  
  //gameState = GAME_START;
  gameState = GAME_START;
  
   // load image
  BImage1 = loadImage("img/bg1.png");
  BImage2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  MoocsEnemy1 = loadImage("img/Moocs-element-enemy1.png");
  MoocsGainbomb = loadImage("img/Moocs-element-gainbomb.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  // load image
  
  //old
  //hpy = floor(random(100)); 
  hpy = 190; //190~100_ /5
  HP = floor((hpy * 10) / 19);  
  //
  
  Tx = floor(random(0,599));
  Ty = floor(random(0,439));
  // Tx y
  
  //Ex = 20;
  //Ey = floor(random(50,420));
  // old
  
  x = width;
  y = height/2;
  
  Ex2 = 0;
  
  timesN = first;
  Ey = floor(random(50,420));
}

void draw() {
  //switch
  switch (gameState){
    
    case GAME_START:
      image(start2,0,0);
      //x,y 208,378
      if (mouseX > 208 && mouseX < 450 && mouseY > 378 && mouseY < 410){
        image(start1,0,0);
        if (mousePressed == true){
          gameState = GAME_RUN;
        }
      }
    break;
  
    case GAME_WIN:  
    break;
  
    case GAME_LOSE:
      image(end2,0,0);
      //205,308 -----436,350
      if (mouseX > 205 && mouseX < 436 && mouseY > 308 && mouseY < 350){
        image(end1,0,0);
        if (mousePressed == true){
          gameState = GAME_RUN; 
          // reset allthing_______________________________________________________________________________________
          hpy = 38; //190~100_ /5
          HP = floor((hpy * 10) / 19);
          //println("HP = ",HP);
          Tx = floor(random(0,599));
          Ty = floor(random(0,439));
          //Ex = 20;
          //Ey = floor(random(50,420));
          x = width;
          y = height/2;
          Ex2 = 0;  
          Ey2 = 0;
          winTimes = 0;
          }
          //______________________________________________________________________________________________________
      }
    break;
  
    case GAME_RUN:
    
    // background
    image(BImage1,Bx,0);
    image(BImage2,Bx-640,0);
    image(BImage1,Bx-1280,0);
    Bx += 2 ;
    Bx = Bx % 1280 ;
    // background
    
    noStroke();
    fill(255,10,10);
    rect(27,26,hpy,15);
    image(hp,15,20);
    // hp
    
    image(fighter,x,y);
    // fighter
    
    //__________________________________________________________________________________________________________
    
    //Ex += 4;
    //Ex = Ex % 640;
    //if (Ey > y){
    //  Ey -= 2;
    //}
    //if (Ey < y){
    //  Ey += 2;
    //}
    
    enemyWidth = 61;
    enemyHeight = 61;

    
        Ex += 4;
        Ex = Ex % 946;
        println(Ex);
    switch (timesN) {
     //______________________________________________
    case first:
        //c first time flight
        for(int i=1;i <= 5;i++){
        pushMatrix();
        translate(i*70,0);
        image(enemy,Ex-305,Ey);
        popMatrix(); 
        }   
        if (Ex >= 942){
            timesN = second;
            Ey = floor(random(0,114));
          } 
    break;
     //______________________________________________
    case second:
        //b second time
       
            for(int j=1;j <= 5;j++){
            pushMatrix();
            translate(j*enemyWidth,j*enemyHeight);
            image(enemy,Ex-305,Ey);
            popMatrix();
            }
        if (Ex >= 942){
            timesN = third;
            Ey = floor(random(0,114));
          } 
    break;
     //______________________________________________
    case third:
        //a thired time
        for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
                if(i==3){
                  if (j==1 || j==5){
                    println(j);
                    pushMatrix();
                    translate(j*61,i*61);
                    image(enemy,Ex-305,Ey);
                    popMatrix();
                  }
                }
                if(i==1 || i==5){
                  if (j==3){
                    pushMatrix();
                    translate(j*61,i*61);
                    image(enemy,Ex-305,Ey);
                    popMatrix();
                  }
                }
                if(i==2 || i==4){
                  if (j==2 || j==4){
                    pushMatrix();
                    translate(j*61,i*61);
                    image(enemy,Ex-305,Ey);
                    popMatrix();
                  }
                }
            }
        }
        if (Ex >= 942){
            timesN = first;
            Ey = floor(random(50,420));
          } 
    break;
    //______________________________________________
    }
    //image(enemy,Ex,Ey);
    //boss
    //if (winTimes > 4){   
    //    image(MoocsEnemy1,30,y);
        
    //    n = n % 121;
    //    n += 1;
    //    println(n);
    //    if (n > 120){
    //        Ey2 = floor(y);
    //        Ex2 = 30;
    //    }
        
    //    Ex2 += 6;
    //    fill(255,0,0);
    //    noStroke();
    //    ellipse(Ex2,Ey2,20,20);
    //}
    //if (winTimes < 5){
    //  Ex2=-200;
    //  Ey2=-200;
    //}
    //boss
    
    //__________________________________________________________________________________________________________
    
    image(treasure,Tx,Ty);
    // treasure random
    
    //control___________________________________________________________________________________________________
          if (upPressed) {
          y -= speed;
        }
          if (downPressed) {
          y += speed;
        }
          if (leftPressed) {
          x -= speed;
        }
          if (rightPressed) {
          x += speed;
        }
          if (x > 589){
            x = 588;
          }
          if (y > 429){
            y = 428;
          }
          if (x < 0){
            x = 0;
          }
          if (y < 0){
            y = 0;
          }
    //__________________________________________________________________________________________________________
    
    //if(x > (Ex-51) && x < (Ex+61) && y > (Ey-51) && y < (Ey+61)){
    //    Ex = 20;
    //    Ey = floor(random(50,420));
    //    hpy -= 38; //190~100_ /5
    //    HP = floor((hpy * 10) / 19);
    //    if  (HP < 1){
    //      gameState = GAME_LOSE;
    //    }
    //}
    
    //if(x > (Ex2-61) && x < (Ex2+10) && y > (Ey2-61) && y < (Ey2+10)){
    //    Ex2 = 30;
    //    Ey2 = -200;
    //    hpy -= 38; //190~100_ /5
    //    HP = floor((hpy * 10) / 19);
    //    if  (HP < 1){
    //      gameState = GAME_LOSE;
    //    }
    //}
    
    if(x > (Tx-51) && x < (Tx+41) && y > (Ty-51) && y < (Ty+41)){
        hpy += 19; //190~100_ /5
        HP = floor((hpy * 10) / 19);
        Tx = floor(random(0,599));
        Ty = floor(random(0,439));
        winTimes += 1;
    }
    
    if (hpy > 190){
    hpy = 190;
    HP = 100;
    } 
    
    //___________________________________________________________________________________________________________
    
    
    break;
  
  
  }
  
  
  
}
//______________________________________________________________________________________________________________
void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
