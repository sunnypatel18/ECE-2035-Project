/**********************************
 * Author: Sunny Patel
 * Institution: Georgia Tech
 *
 * Title: MAIN
 * Class: ECE2035
 * Assignment: Project 2
 **********************************/

//includes
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <time.h>
#include <sys/un.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <termios.h>

//defines
#define BAUDRATE            9600
#define BUFFSIZE            8192
#define GRAVITY             1
#define PHIGH               10
#define PLOW                5
#define PI                  3.141592653589793238462643f
#define ACK                 "ACK"
#define ACK_TIMEOUT         5
#define COM_ADDR	        "socks/monkeys_socket"
#define UNIX_PATH_MAX       100

//function prototypes
int  invert(int value);
void startGame(void);
int  waitForAck(void);
char get_pb_zxcvqr(void);
void pb1_hit_callback(void);
void pb2_hit_callback(void);
void pb3_hit_callback(void);
void pb4_hit_callback(void);
void getworld (int**world, unsigned char *World);
void updateShot(int row, int column, int del);
void colorTile(int row, int column, int strength);
void deleteTile(int row, int column);
void paaUpdate(int power, int angle);
void hint(int row, int column, int power, int angle);
void run_test_trajectory(int *world);

// Global variables for push buttons
char volatile power=PHIGH, angle=45, fire;
int connection_fd;

//main
int main() {

    START:    
    //variables
    unsigned char World[BUFFSIZE];

    //socket connection
    struct sockaddr_un address;
    int socket_fd;
    socklen_t address_length;
    pid_t child;

    socket_fd = socket(AF_UNIX, SOCK_STREAM, 0);
    if (socket_fd < 0){
        printf("socket() failed\n");
        return 1;
    }

    memset(&address, 0, sizeof(struct sockaddr_un));
    address.sun_family = AF_UNIX;
    snprintf(address.sun_path, UNIX_PATH_MAX, COM_ADDR);
    address_length = sizeof(address);
    connect(socket_fd, (struct sockaddr *) &address, address_length);
    connection_fd=socket_fd;

    struct timeval timeout;
    timeout.tv_sec = ACK_TIMEOUT;
    timeout.tv_usec = 0;
    setsockopt(connection_fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
  
    /******** Project 2 *********/    
    //loop
    while(1) {
        //synchronize front end display  
        startGame();                            

        //receive World
        recv(connection_fd,World,BUFFSIZE,0); 
        sleep(1);
        fflush(stdout);    
        printf("received\n");
        
        //make sure World is received correctly, or just reset
        if(waitForAck()) {
            printf("Unable to receive world, attempting to reset and try again...");
            fflush(stdout);
            close(socket_fd);
            sleep(1);

            socket_fd = socket(AF_UNIX, SOCK_STREAM, 0);
            if (socket_fd < 0){
                printf("socket() failed\n");
                return 1;
            }

            connect(socket_fd, (struct sockaddr *) &address, address_length);
            connection_fd=socket_fd;

            setsockopt(connection_fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout));
            continue;
        }
        
        //get world that will be used for your work
        int *world;
        getworld(&world, World);

        //clear the terminal
        fflush(stdout);
        rewind(stdout);
        printf("\033[2J\033[1;1H");
        printf("Angry Monkeys\n");
        printf("Push the buttons.\n");
        printf("Z - fire cannon\nX - decrease angle    C - increase angle\nV - toggle power\nR - reset    Q - quit\n");
 
        /****   BEGIN - your code goes here for project 2  ****/
// initialize all the variables below        
int i, num_cannon=10;
char pb;
double vx;
double vy;
int x;
int y;
int type;
int str;
int u = 0;
int v = 1;
int flag;
int k;
int j;
int m;
int xhint;
int yhint;
int anglehint;
int anglemonkey;
int z;
int l;
int hints;
double vynew;
double vxnew;
int xnew;
int stop;
int p;
int Array[10000]={0}; //create array of 10000 zeros.
int index;
int indexnew;

for (p=0;p<world[1];p++) //converts sparse array into a linear array
	{
	index = world[p*4+2]*sqrt(world[0]) + world[p*4+3]; //creates and index that is easier to navigate
	Array[index] = world[p*4+4]; //will give the type value for the sparse array
	}

//finds left most monkey
stop = 0;
	for (j=0; j<sqrt(world[0]);j++) //looks in x direction
	{
		for (k=0; k<sqrt(world[0]);k++) //looks in y direction
		{
			for (m=0;(m<world[1] && stop == u);m++) //indexes the sparse array
			{

				if (world[m*4+2] == k && world[m*4+3] == j) //check for correct position
				{
					if (world[m*4+4] == 77) //check if type is monkey
					{
						stop = v; //condition stop
						yhint = k; //get coordinate row
						xhint = j; //get coordinate column
						index = yhint*sqrt(world[0])+xhint; //converts monkey location to follow linear sparse array
							while(Array[index] != 84) //checks where the branch is attached to the tree bark
							{ //moves in a diagonal direction moving right one and then down one
								index++; //moves right
								xhint++; //changes the hint
								index = index - sqrt(world[0]); //moves down
								yhint--; //changes the hint
							}
								if (Array[index-1] != 66) //if the left adjacent value is not a branch move down
								{
									index--; //moves left
									xhint--; //changes the hint
									index = index + sqrt(world[0]); //moves up
									yhint++;//changes the hint
										if (Array[index] != 66)//if it is still not a branch value move up 1 time more.
											{
												index = index + sqrt(world[0]);//moves up
												yhint++; //changes hint
											} 
								} 
								else //if the value to the left is a branch then change hint values
								{
									index--; //changes hint
									xhint--; //changes hint
								}
							for (anglehint=0;anglehint<90;anglehint++) //check which angle is correct
							{
								vynew = power*sin(anglehint*(PI/180)); //create new variables for the iterated angles
								vxnew = power*cos(anglehint*(PI/180));
								hints = (int) floor((vynew/vxnew)*xhint-0.5*GRAVITY*pow((xhint/vxnew),2)); //calculate a new y
								if (yhint == hints) //if the row location matches obtain right angle
								{
									anglemonkey = anglehint; //obtains right angle
								}
							}
					}
				}
			}
		}
	}
							
hint(yhint,xhint,power,anglemonkey); //prints the hint to the world. 

while(1){
paaUpdate(power, angle); //red arrow
pb=get_pb_zxcvqr(); 
vx = power*cos(angle*(PI/180)); //physics
vy = power*sin(angle*(PI/180)); //physics

            if(pb=='z'){
            	printf("FIRE!!!\n");
		flag = 0;//stopping the cannonball
		for (x=0;(x<sqrt(world[0]) && flag == u);x++) //index the world
		{
			y = (int) floor((vy/vx)*x-0.5*GRAVITY*pow((x/vx),2)); //updates y position using physics
			updateShot(y,x,1); //cannon ball displayed on the world
			sleep(0);//slows down the cannon ball animation
			for (i=0;(i<world[1] && flag == u);i++) //index through the sparse array
			{
				if (world[i*4+2] == y && world[i*4+3] == x) //if locations match
				{ 
					type = world[i*4+4];//checks type
					if (type == 77) //Monkey type
					{
					str = world[i*4+5];//checks strength
					str--;//decrement strength
					world[i*4+5] = str;//updates strength
						if (str == 0)//if the strength is 0
						{
						deleteTile(world[i*4+2],world[i*4+3]);//delete the tile
						world[i*4+2] = -1;//move the row coordinate off the grid
						world[i*4+3] = -1;//move the column coordinate off the grid
						}
					flag = v;//condition stop
					colorTile(world[i*4+2],world[i*4+3],str);//updates color of the tile
					}
					else if (type == 84) //Tree Trunks type repeat same commands as above
					{
					str = world[i*4+5];
					str--;
					world[i*4+5] = str;
						if (str == 0)
						{
						deleteTile(world[i*4+2],world[i*4+3]);
						world[i*4+2] = -1;
						world[i*4+3] = -1;	
						//delete all above tree tiles
							for (z=y;z<sqrt(world[0]);z++) //index through the world values
							{
								for (l=0;l<world[1];l++)//index through sparse array
								{
									if ( world[l*4+2] == z && world[l*4+3] == x)//find matching coordinates
									{
										if (world[l*4+4] == 84 || world[l*4+4] == 77)//check if monkey or tree trunk type
										{
										deleteTile(z,x);//delete the above tiles
										world[l*4+2] = -1;//move row coordinate off the grid
										world[l*4+3] = -1;//move column coordinate off the grid
										}
									}
								}
							}
						
						}
					flag = v;
					colorTile(world[i*4+2],world[i*4+3],str);
					}
					else if (type == 66) //Branches type repeat same commands as above
					{
					str = world[i*4+5];
					str--;
					world[i*4+5] = str;
						if (str == 0)
						{
						deleteTile(world[i*4+2],world[i*4+3]);
						world[i*4+2] = -1;
						world[i*4+3] = -1;
						}
					flag = v;
					colorTile(world[i*4+2],world[i*4+3],str);
					}
				}
			}
		}
                    pb4_hit_callback(); 
            } else if(pb=='x'){
                    pb3_hit_callback(); 
                    if(power==PHIGH)
                            printf("Angle:%d PHIGH\n", angle);
                    else
                            printf("Angle:%d PLOW\n", angle);
            } else if(pb=='c'){
                    pb2_hit_callback(); 
                    if(power==PHIGH)
                            printf("Angle:%d PHIGH\n", angle);
                    else
                            printf("Angle:%d PLOW\n", angle); 
            } else if(pb=='v'){
                    pb1_hit_callback(); 
                    if(power==PHIGH)
                            printf("Angle:%d PHIGH\n", angle);
                    else
                            printf("Angle:%d PLOW\n", angle); 
            } else if(pb=='q'){
	            printf("EXIT\n");
                    free(world);
                    close(socket_fd);
		    exit(1);
            }  else if(pb=='r'){
                    printf("RESTART\n");
                    free(world);
                    close(socket_fd);
                    goto START;		    
            }  else {
	            printf("INVALID INPUT \n");
            }
	}
        /****    END - your code stops here   ****/
        free(world);  
        close(socket_fd);
    }
    //end loop

}

void run_test_trajectory(int *world){
  //Just for test...
  int i;
  for(i=1;i<10;i++){
    updateShot(i-1,i,0);
    sleep(1);
    hint(i+2, i+3,2,1);
  } 
  
  for(i=0;i<5;i++){       
    deleteTile(world[4*i+2],world[4*i+3]);
    updateShot(i-1,i,1);
  }
}

//fcn to send update
void updateShot(int row, int column, int del){
    //temp variables
    char buffer[BUFFSIZE];
    
    //construct message
    sprintf(buffer, "%s-%d-%d-%d;", "update", row, column, del);

    //send message
    send(connection_fd, buffer, strlen(buffer),0);
    waitForAck();
}

//fcn to send color
void colorTile(int row, int column, int strength){
    //temp variables
    char buffer[BUFFSIZE];
    
    //construct message
    sprintf(buffer, "%s-%d-%d-%d;", "color", row, column, strength);

    //send message
    send(connection_fd, buffer, strlen(buffer),0);
    waitForAck();
}    
    
//fcn to send delete
void deleteTile(int row, int column){
    //temp variables
    char buffer[BUFFSIZE];
    
    //construct message
    sprintf(buffer, "%s-%d-%d;", "delete", row, column);

    //send message
    send(connection_fd, buffer, strlen(buffer),0);
    waitForAck();
} 

//fcn to send power and angle
void paaUpdate(int power, int angle){
    //temp variables
    char buffer[BUFFSIZE];
    
    //construct message
    sprintf(buffer, "%s-%d-%d;", "paa", power, angle);

    //send message
    send(connection_fd, buffer, strlen(buffer),0);
    waitForAck();
} 

//fcn to send hint
void hint(int row, int column, int power, int angle){
    //temp variables
    char buffer[BUFFSIZE];
    
    //construct message
    sprintf(buffer, "%s-%d-%d-%d-%d;", "hint", row, column, power, angle);

    //send message
    send(connection_fd, buffer, strlen(buffer),0);
    waitForAck();
}

//fcn to get acknowledgement from serial peripheral
int waitForAck(void) {
    //get acknowlegement
    char buffer[BUFFSIZE];
    double elapsed;
    time_t start;
    time_t now;
    time(&start);
    while(1) {
        memset(&buffer[0],0,strlen(buffer));  
	    recv(connection_fd,buffer,BUFFSIZE-1,0);
        if(strncmp(ACK, buffer, strlen(ACK)) == 0) {
            break;
        }
        memset(&buffer[0],0,strlen(buffer));     
        time(&now);
        elapsed = difftime(now, start);
        //printf("%.f, ", elapsed);
        fflush(stdout);
        if(elapsed >= ACK_TIMEOUT)
            return 1;
    }
    return 0;
}

//fcn to initialize the frontend display
void startGame(void) {
    //temp variables
    char buffer[BUFFSIZE];

    //construct message
    sprintf(buffer, "start");

    //send message
    send(connection_fd, buffer, strlen(buffer),0);

    //wait for acknowledgement
    waitForAck();
}

//function to perform bitwise inversion
int invert(int value) {
    if (value == 0) {
        return 1;
    } else {
        return 0;
    }
}

char get_pb_zxcvqr(void) {
    char buf = 0;
    struct termios old = {0};
    if (tcgetattr(0, &old) < 0)
            perror("tcsetattr()");
    old.c_lflag &= ~ICANON;
    old.c_lflag &= ~ECHO;
    old.c_cc[VMIN] = 1;
    old.c_cc[VTIME] = 0;
    if (tcsetattr(0, TCSANOW, &old) < 0)
            perror("tcsetattr ICANON");
    if (read(0, &buf, 1) < 0)
            perror ("read()");
    old.c_lflag |= ICANON;
    old.c_lflag |= ECHO;
    if (tcsetattr(0, TCSADRAIN, &old) < 0)
            perror ("tcsetattr ~ICANON");
    return (buf);
}


// Callback routine is interrupt activated by a debounced pb hit
void pb1_hit_callback (void) {
    if(power==PHIGH)
        power=PLOW;
    else 
        power=PHIGH;
}
void pb2_hit_callback (void) {
    if(angle<90)
        angle++;
    else if(angle>=90) 
        angle=0;
}
void pb3_hit_callback (void) {
    if(angle>0)
        angle--;
    else if(angle<=0)
        angle=90;
}
void pb4_hit_callback (void) {
    fire++;
}

//func. to get world
void getworld (int**world, unsigned char *World){
    int i;
    char temp[3];
    
    //allocate world
    *world = (int*)malloc(sizeof(int)*(((World[2]<<8)+World[3])*4+2));
    
    //get it
    (*world)[0]=(World[0]<<8)+World[1];
    (*world)[1]=(World[2]<<8)+World[3];
    for(i=0;i<((*world)[1]*4);i++){
        temp[0] = World[(2*i)+4];
        temp[1] = World[(2*i)+5];
        temp[2] = '\0';   
        sscanf(temp, "%d", &((*world)[i+2]));            
    }
}
