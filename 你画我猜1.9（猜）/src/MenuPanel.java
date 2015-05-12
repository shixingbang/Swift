import java.awt.*;
import java.util.*;
import java.net.*;
import java.io.*;

import javax.swing.*;

import java.awt.event.*;
public class MenuPanel extends JPanel{
	final int Panel_WIDTH=1600,Panel_HEIGHT=40;
	PaintClient pc;
	JLabel tl = new JLabel("TJlahsdf;a");
	public MenuPanel(PaintClient pc)  {
		this.pc=pc;
		add(tl);
		tl.setLocation(400,20);
		setBackground(new Color(132,32,92));
		this.setPreferredSize(new Dimension(Panel_WIDTH, Panel_HEIGHT));
		
	}
}