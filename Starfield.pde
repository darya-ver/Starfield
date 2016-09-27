// NormalParticle bob;
NormalParticle [] particles;
void setup()
{
	size(600,600);
	// bob = new NormalParticle();
	particles = new NormalParticle [100];
	for (int i=0;i<particles.length; i++)
	{
		particles[i]=new NormalParticle();
	}
}

void draw()
{
	background(10);
	// bob = new NormalParticle();
	// bob.move();
	// bob.show();
	for (int i=0;i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}
	

class NormalParticle
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

	void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
	}

	void show()
	{
		fill(255, 255, 255);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}

interface Particle
{
	//your code here
}

class OddballParticle //uses an interface
{
	//your code here
}

class JumboParticle //uses inheritance
{
	//your code here
}


