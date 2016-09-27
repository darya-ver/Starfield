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
	background(200);

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
		strokeWeight(1);
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
		// myY += 0;
		// myX += 0;
	}

	public void show()
	{
		//helmet-white
		fill(255);
		strokeWeight(1);
		ellipse((float)myX, (float)myY-8, 90, 70);
		//helmet-black
		fill(0);
		ellipse((float)myX, (float)myY, 70, 50);

		//face
		fill(255, 195, 170);
		ellipse((float)myX, (float)myY, 50, 50);
		
		//eyes-white
		fill(255);
		ellipse((float)myX-10, (float)myY-7, 10, 10);
		ellipse((float)myX+10, (float)myY-7, 10, 10);
		//eyes-black
		fill(0);
		ellipse((float)myX-10,(float)myY-7, 5, 5);
		ellipse((float)myX+10, (float)myY-7, 5, 5);
		
		//mouth
		arc((float)myX, (float)myY+5, 30, 30, 0, (float)(Math.PI));

		//body
		strokeWeight(7);
		line((float)myX, (float)myY+28, (float)myX, (float)myY+75);	
		line((float)myX-40,(float)myY+35, (float)myX+40, (float)myY+35);	
		line((float)myX, (float)myY+75, (float)myX-20, (float)myY+120);
		line((float)myX, (float)myY+75, (float)myX+20, (float)myY+120);

		//bubble
		strokeWeight(1);
		fill(255);
		ellipse((float)myX+100, (float)myY-110, 130, 80);
		
		// //hat
		// fill(119,7,124);
		// triangle((float)myX, (float)myY-35, (float)myX+30, (float)myY-19, (float)myX-30, (float)myY-19);
	}
}

class JumboParticle //implements Particle
{
	//your code here
}


