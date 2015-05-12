
import java.awt.*;
import java.util.*;
import java.net.*;
import java.io.*;

import javax.swing.*;

import java.awt.event.*;

public class PaintPanel extends JPanel {

	final int Panel_WIDTH=40,Panel_HEIGHT=30;
	ArrayList<Point> points = new ArrayList<Point>();
	int size=points.size();
	PaintClient pc;
//	JLabel tl =new JLabel("fjlasdjf");
	Color buttonColor=Color.blue;
	ObjectOutputStream oos=null;
	public PaintPanel(PaintClient pc)  {
		this.pc=pc;
		
		
		
		setBackground(Color.green);
		this.setPreferredSize(new Dimension(Panel_WIDTH, Panel_HEIGHT));
		addMouseListener(new PencilListener1());
		addMouseMotionListener(new PencilListener2());
	}

	public void paint(Graphics g){
//		add(tl);
		Point p1 = null;
//		g.setColor(buttonColor);
		Iterator<Point> i = points.iterator();
		while (i.hasNext()) {
			Point p = i.next();
			if (p1 == null)
				p1 = p;
			
			if (p1.x == -1 && p1.y == -1 || p.x == -1 && p.y == -1){
				p1=p;
				continue;}
			else
				{
					g.setColor(buttonColor);
					g.drawLine(p1.x, p1.y, p.x, p.y);
				}
			p1=p;
			g.setColor(Color.blue);
		}
		try{
			if(points.size()>size){
				System.out.println(points.size()+"   "+size);
				size=points.size();
				
				oos.writeObject(points);
			}
		}
		catch (Exception e){
			System.out.println("PaintPanel那里没发出去。");
			e.printStackTrace();
		}
	}
class PencilListener2 implements MouseMotionListener {
		public void mouseDragged(MouseEvent e) {
			points.add(new Point(e.getX(),e.getY()));
			repaint();
		}
		public void mouseMoved(MouseEvent arg0) {

		}
	}
class PencilListener1 implements MouseListener {
		public void mouseClicked(MouseEvent arg0) {
		}
		public void mouseEntered(MouseEvent arg0) {
		}
		public void mouseExited(MouseEvent arg0) {

		}
		public void mousePressed(MouseEvent e) {
			points.add(new Point(-1,-1));
			repaint();
		}
		public void mouseReleased(MouseEvent arg0) {

		}
	}


}
