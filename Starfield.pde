Particle [] particles;
float randomX, randomY;

NormalParticle bob;
void setup()
{
	size(600,600);

	particles = new Particle [200];

	for (int i=0;i<particles.length; i++)
	{
		particles[i]= new NormalParticle();
	}

	particles[particles.length-2] = new OddballParticle();
	particles[particles.length-1]=new JumboParticle();
	background(0);
	// ((NormalParticle)particles[0]).myX = 10;
}

void draw()
{
	fill(0,0,0,100);
	rect(0,0,600,600);

	for (int i=0;i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}

void mousePressed()
{
	for (int i=0;i<particles.length; i++)
	{
		particles[i].mouseLocation();
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
		myAngle -= 0.05;
	}

	public void show()
	{
		noStroke();
		fill(colorR, colorG, colorB);
		ellipse((float)myX, (float)myY, 10, 10);
		
	}
	public void mouseLocation()
	{ 
		myX=mouseX;
		myY=mouseY;

		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*10;

		colorR = (int)(Math.random()*255);
		colorG = (int)(Math.random()*255);
		colorB = (int)(Math.random()*255);
	}
}

interface Particle
{
	public void show();
	public void move();
	public void mouseLocation();
}

class OddballParticle implements Particle
{
	double myX, myY, myAngle, mySpeed;

	OddballParticle()
	{
		myX = 300;
		myY = 300;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*3;
	}

	public void move()
	{
		myX += mySpeed*Math.cos(myAngle);
		myY += mySpeed*Math.sin(myAngle);
		myAngle += 0.05;
	}

	public void show()
	{
		// fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		// rect((float)myX, (float)myY, 30, 10);
		noStroke();
	 	fill(229,223,153); //bee body
	 	ellipse((float)myX, (float)myY,30,30);
	 	fill(86,84,57); //stripe
	 	ellipse((float)myX-10,(float)myY,30,30);
	 	fill(229,223,153); //bee body
	 	ellipse((float)myX-20, (float)myY,30,30);
	 	fill(57,56,38); //eyes
	 	ellipse((float)myX-30,(float)myY,5,5);
	 	ellipse((float)myX-17,(float)myY,5,5);
	 	fill(255); //wings
	 	stroke(153,229,223);
	 	strokeWeight(0.5);
	 	ellipse((float)myX,(float)myY-20,15,15);
	 	ellipse((float)myX-10,(float)myY-20,15,15);
	 	stroke(57,56,38); //smile
	 	strokeWeight(3);
	 	noFill();
	 	arc((float)myX-25,(float)myY+5,7, 7, 0,PI);
	}
	public void mouseLocation()
	{
		myX=mouseX;
		myY=mouseY;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*3;
	}
	
}

class JumboParticle extends NormalParticle 
{
	void show()
	{
		fill(colorR, colorG, colorB);
		ellipse((float)myX, (float)myY, 50, 50);
		fill(0);
		ellipse((float)myX-10, (float)myY-5, 5, 5);
		ellipse((float)myX+10, (float)myY-5, 5, 5);
		fill(255,0,0);
		arc((float)myX, (float)myY+8, 40, 20, 0, PI);
	}
}
