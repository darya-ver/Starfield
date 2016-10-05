Particle [] particles;
float randomX, randomY;

Tree tree1 = new Tree();

void setup()
{
	size(600,600);

	particles = new Particle [200];

	for (int i=0;i<particles.length; i++)
	{
		particles[i]= new NormalParticle();
	}

	particles[particles.length-2] = new OddballParticle();
	particles[particles.length-3] = new OddballParticle();
	particles[particles.length-1] = new JumboParticle();
	background(0);
	
}

void draw()
{
	fill(0,0,0,100);
	rect(0,0,600,600);

	tree1.show();

	for (int i=0;i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}

void mousePressed()
{
	tree1.mousePressedTree();

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
		fill(223, 245, 78);
		ellipse((float)myX, (float)myY, 7, 7);
		
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
	double myX, myY, myAngle, mySpeed, inc;

	OddballParticle()
	{
		myX = 300;
		myY = 300;
		myAngle = Math.PI*2*Math.random();
		mySpeed = Math.random()*10 -5;
		inc = (PI*2)/25.0;
	}

	public void move()
	{
		myX += mySpeed;
		myY += mySpeed*Math.sin(myAngle);
		// myAngle += 0.05;
		myAngle += inc;
	}

	public void show()
	{
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
		mySpeed = Math.random()*10 - 5;
	}
	
}

class JumboParticle extends NormalParticle 
{
	void show()
	{
		strokeWeight(1);
		fill(colorR, colorG, colorB);
		ellipse((float)myX, (float)myY, 50, 50);
		fill(0);
		ellipse((float)myX-10, (float)myY-5, 5, 5);
		ellipse((float)myX+10, (float)myY-5, 5, 5);
		fill(255,0,0);
		arc((float)myX, (float)myY+8, 40, 20, 0, PI);
	}
}

class Tree
{
	int myX, myY;
	Tree()
	{
		myX = 300;
		myY = 300;
	}

	void show()
	{
		strokeWeight(10);
		fill(24,133,53);
		line(myX, myY, myX, myY+140);
		noStroke();
		fill(29,176,4);
		ellipse(myX, myY, 35, 35);

	}
	void mousePressedTree()
	{
		myX=mouseX;
		myY=mouseY;
	}
}
