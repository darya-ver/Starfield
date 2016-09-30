Particle [] particles;
float randomX, randomY;

NormalParticle bob;
void setup()
{
	size(600,600);

	particles = new Particle [200];

	for (int i=0;i<particles.length; i++)
	{
		particles[i]= new NormalParticle(300,300);
	}

	// particles[particles.length-1]=new OddballParticle(300,300);
	// particles[0]=new JumboParticle(300,300);
	bob = new NormalParticle(400,400);
}

void draw()
{
	background(200);

	for (int i=0;i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}

void mousePressed()
{
	randomX= (float)(Math.random()*600);
	randomY = (float)(Math.random()*600);

	for (int i=0;i<particles.length-1; i++)
	{
		particles[i]=new NormalParticle(randomX, randomY);
	}

	// if (bob.myX == 400  && bob.myY == 400)
	// {
	// 	bob = new NormalParticle((float)(Math.random()*600),(float)(Math.random()*600));
	// }

	// particles[particles.length-1]=new OddballParticle();
	// particles[0]=new JumboParticle(300,300);

	// if (particles[4].myX == 300 && particles[4].myY == 300)
	// {
	// 	randomX= (float)(Math.random()*600);
	// 	randomY = (float)(Math.random()*600);

	// 	for (int i=0;i<particles.length-1; i++)
	// 	{
	// 		particles[i]=new NormalParticle(randomX, randomY);
	// 	}

	// 	particles[particles.length-1]=new OddballParticle();
	// 	particles[0]=new JumboParticle(300,300);
	// }

	// for (int i=0;i<particles.length-1; i++)
	// {
	// 	particles[i].mouseLocation();
	// }
	
}
class NormalParticle implements Particle
{
	double myX, myY, myAngle, mySpeed, referenceNum;
	int colorR, colorG, colorB;

	NormalParticle(float x, float y)
	{
		myX = x;
		myY = y;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*10;

		colorR = (int)(Math.random()*255);
		colorG = (int)(Math.random()*255);
		colorB = (int)(Math.random()*255);

		int referenceNum = 300;
	}

	public void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
		myAngle -= 0.08;
	}

	public void show()
	{
		noStroke();
		fill(colorR, colorG, colorB, 100);
		ellipse((float)myX, (float)myY, 10, 10);
		
		// for (int i=0; i<10; i++)
		// {
		// 	fill(colorR, colorG, colorB, 255-(5*i));
		// 	ellipse((float)myX - (4*i), (float)myY - (4*i), 10, 10);
		// }
		
	}
	// public void mouseLocation()
	// {
	// 	myX=mouseX;
	// 	myY=mouseY;
	// }
	// public void changeDirections()
	// {
	// 	if (myX==referenceNum && myY==referenceNum){
	// 		myX = 400;
	// 		myY = 400;
	// 		referenceNum = 400;
	// 	}
	// }
}

interface Particle
{
	public void show();
	public void move();
	// public void mouseLocation();
	// public void changeDirections();
}

class OddballParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;

	// int colorR, colorG, colorB;

	OddballParticle(float x, float y)
	{
		myX = x;
		myY = y;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*3;

		// colorR = (int)(Math.random()*255);
		// colorG = (int)(Math.random()*255);
		// colorB = (int)(Math.random()*255);
	}

	public void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
	}

	public void show()
	{
		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		ellipse((float)myX, (float)myY, 15, 15);
	}
	// public void mouseLocation()
	// {
	// 	myX=mouseX;
	// 	myY=mouseY;
	// }
	
}

// class JumboParticle extends NormalParticle //implements Particle
// {
// 	double myX, myY;

// 	JumboParticle(int x, int y)
// 	{
// 		myY=y;
// 		myX=x;
// 	}
// 	void show()
// 	{
// 		fill(colorR, colorG, colorB);
// 		ellipse((float)myX, (float)myY, 50, 50);
// 	}
// }

// void astronautPerson()
// {
// 	//helmet-white
// 		fill(255);
// 		strokeWeight(1);
// 		ellipse((float)myX, (float)myY-8, 90, 70);
// 		//helmet-black
// 		fill(0);
// 		ellipse((float)myX, (float)myY, 70, 50);

// 		//face
// 		fill(255, 195, 170);
// 		ellipse((float)myX, (float)myY, 50, 50);
		
// 		//eyes-white
// 		fill(255);
// 		ellipse((float)myX-10, (float)myY-7, 10, 10);
// 		ellipse((float)myX+10, (float)myY-7, 10, 10);
// 		//eyes-black
// 		fill(0);
// 		ellipse((float)myX-10,(float)myY-7, 5, 5);
// 		ellipse((float)myX+10, (float)myY-7, 5, 5);
		
// 		//mouth
// 		arc((float)myX, (float)myY+5, 30, 30, 0, (float)(Math.PI));

// 		//body
// 		strokeWeight(7);
// 		line((float)myX, (float)myY+28, (float)myX, (float)myY+75);	
// 		line((float)myX-40,(float)myY+35, (float)myX+40, (float)myY+35);	
// 		line((float)myX, (float)myY+75, (float)myX-20, (float)myY+120);
// 		line((float)myX, (float)myY+75, (float)myX+20, (float)myY+120);

// 		//bubble-circle
// 		strokeWeight(1);
// 		fill(255);
// 		//bubble-tip
// 		triangle((float)myX+ 25, (float)myY-55, (float)myX+50, (float)myY-90, (float)myX+85, (float)myY-80);
// 		ellipse((float)myX+100, (float)myY-110, 130, 80);
// }

