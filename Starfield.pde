// NormalParticle bob;
Particle [] particles;
void setup()
{
	size(600,600);

	particles = new Particle [100];

	for (int i=0;i<particles.length-1; i++)
	{
		particles[i]=new NormalParticle();
	}

	particles[particles.length-1]=new OddballParticle();
}

void draw()
{
	background(10);

	for (int i=0;i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}
	

class NormalParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;
	int colorR, colorG, colorB;

	NormalParticle()
	{
		myX = 300;
		myY = 300;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*10;

		colorR = (int)(Math.random()*255);
		colorG = (int)(Math.random()*255);
		colorB = (int)(Math.random()*255);
	}

	public void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
	}

	public void show()
	{
		fill(colorR, colorG, colorB);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}

interface Particle
{
	public void show();
	public void move();
}

class OddballParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;
	int colorR, colorG, colorB;

	OddballParticle()
	{
		myX = 300;
		myY = 300;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*3;

		colorR = (int)(Math.random()*255);
		colorG = (int)(Math.random()*255);
		colorB = (int)(Math.random()*255);
	}

	public void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
	}

	public void show()
	{
		fill(255, 255, 255);
		ellipse((float)myX, (float)myY, 50, 50);
		fill(0);
		ellipse((float)myX-10,(float)myY-7, 5, 5);
		ellipse((float)myX+10, (float)myY-7, 5, 5);
		arc((float)myX, (float)myY+5, 30, 30, 0, (float)(Math.PI));
		fill(255,0,0);
		triangle((float)myX, (float)myY+35, (float)myX+30, (float)myY+25, (float)myX-30, (float)myY+25);
	}
}

class JumboParticle //implements Particle
{
	//your code here
}


