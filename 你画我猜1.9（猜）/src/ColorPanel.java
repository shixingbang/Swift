import java.awt.*;
import java.util.*;
import java.net.*;
import java.io.*;

import javax.swing.*;

import java.awt.event.*;
public class ColorPanel extends JPanel{
	final int Panel_WIDTH=100,Panel_HEIGHT=1200;
	int seconds=10;
	PaintClient pc;
	JButton BlackB =new JButton("black");
	JButton YellowB =new JButton("yellow");
	JButton RedB =new JButton("red");
	JButton GreenB =new JButton("green");
	JButton BlueB =new JButton("blue");
	JButton OrangeB =new JButton("orange");
	JButton CyanB =new JButton("cyan");
	JButton PinkB=new JButton("pink");
	JButton clear = new JButton("Clear");
	JLabel time = new JLabel("Time");
	JLabel time2 = new JLabel();
	public ColorPanel(PaintClient pc)  {
		this.pc=pc;
		BlackB.setLocation(200,300);
		BlackB.setForeground(Color.black);
		YellowB.setLocation(200,330);
		YellowB.setForeground(Color.yellow);
		RedB.setLocation(200,360);
		RedB.setForeground(Color.red);
		GreenB.setLocation(200,390);
		GreenB.setForeground(Color.green);
		BlueB.setLocation(200,420);
		BlueB.setForeground(Color.blue);
		OrangeB.setLocation(200,450);
		OrangeB.setForeground(Color.orange);
		CyanB.setLocation(200,480);
		CyanB.setForeground(Color.cyan);
		PinkB.setLocation(200,510);
		PinkB.setForeground(Color.pink);
		BlackB.addActionListener(new BlackBListener());
		YellowB.addActionListener(new YellowBListener());
		RedB.addActionListener(new RedBListener());
		GreenB.addActionListener(new GreenBListener());
		BlueB.addActionListener(new BlueBListener());
		OrangeB.addActionListener(new OrangeBListener());
		CyanB.addActionListener(new CyanBListener());
		PinkB.addActionListener(new PinkBListener());
		add(BlackB);
		add(YellowB);
		add(RedB);
		add(GreenB);
		add(BlueB);
		add(OrangeB);
		add(CyanB);
		add(PinkB);
		clear.addActionListener(new ClearListener());
		add(clear);
		time2.setText("00 : "+seconds);
		add(time);
		add(time2);
		
		
		setBackground(Color.gray);
		this.setPreferredSize(new Dimension(Panel_WIDTH, Panel_HEIGHT));
		
		
		
	}
private class ClearListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			pc.pp.buttonColor=Color.white;
		}
	}
private	class BlackBListener implements ActionListener{


		public void actionPerformed(ActionEvent e) {
			pc.pp.buttonColor=Color.black;
		}
		
	}
private class YellowBListener implements ActionListener{

	public void actionPerformed(ActionEvent e){
		pc.pp.buttonColor=Color.yellow;
	}
}
private class RedBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.red;
	}
}
private class GreenBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.green;
	}
}
private class BlueBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.blue;
	}
}
private class CyanBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.cyan;
	}
}
private class OrangeBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.orange;
	}
}
private class PinkBListener implements ActionListener{

public void actionPerformed(ActionEvent e){
	pc.pp.buttonColor=Color.pink;
	}
}
}
