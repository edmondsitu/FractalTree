private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 0.2;  
public void setup() 
{   
	size(600,600);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(255,0,0);
	strokeWeight(25);   
	line(300,575,300,475);   
	drawBranches(300,475,100,3*Math.PI/2, 20);
}
public void drawBranches(int x,int y, double branchLength, double angle, double thickNess) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	double endX1 = (int)(branchLength*Math.cos(angle1)+x);
	double endY1 = (int)(branchLength*Math.sin(angle1)+y);
	double endX2 = (int)(branchLength*Math.cos(angle2)+x);
	double endY2 = (int)(branchLength*Math.sin(angle2)+y);
	branchLength = branchLength*fractionLength;
	thickNess = thickNess*0.7;
	strokeWeight((float)thickNess);
	line(x, y, (float)endX1, (float)endY1);
	line(x, y, (float)endX2, (float)endY2);
	if( branchLength >= smallestBranch){
		drawBranches((int)endX1,(int)endY1,branchLength,angle1,thickNess);
		drawBranches((int)endX2,(int)endY2,branchLength,angle2,thickNess);
	}
} 
