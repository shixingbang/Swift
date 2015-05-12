import javax.swing.*;

import java.util.*;
import java.io.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;
public class PaintClient extends JFrame{
	int abcdefg=100;
	int abcdefg2=101;
	PaintPanel pp=new PaintPanel(this);
	String bbbbb;
	String daanFromServer;
	DataInputStream dis=null;
	DataOutputStream dos=null;
	ObjectOutputStream oos=null;
	ObjectInputStream ois=null;
	TextField tfContent=new TextField();
	TextArea taContent=new TextArea();
	ColorPanel cp =new ColorPanel(this);
//	MenuPanel mp =new MenuPanel(this);
	JMenuBar mb=new JMenuBar();
	JLabel tl =new JLabel("Time left : ");
	Socket s=null;
	Socket s2=null;
	boolean bConnected =false;
	boolean bConnected2 =false;
	Thread tRec=new Thread(new RecvThread());
	Thread tRec2= new Thread(new RecvThread2());
	Thread timer = new Thread(new Timer());
	
	ArrayList<Point> poi=pp.points;
	ArrayList<Point> rectem=null;
	boolean biaozhi=false;
	static PaintClient pc=null;
	public static void main(String args[])
	{
		pc=new PaintClient();
		pc.launchFrame();
	}
	
	public void launchFrame(){
		pp.setBackground(Color.green);
		setLocation(0,0);
		this.setSize(2000,1600);
		this.setBackground(Color.white);
		tfContent.setPreferredSize(new Dimension (1600,100));
		taContent.setPreferredSize(new Dimension (400,1600));
		mb.setPreferredSize(new Dimension (1600,40));
		mb.setBackground(new Color(132,42,100));
//		add(mp,BorderLayout.NORTH);
		add(mb,BorderLayout.NORTH);
		add(tfContent,BorderLayout.SOUTH);
		add(pp,BorderLayout.CENTER);
		add(taContent,BorderLayout.EAST);
		add(cp,BorderLayout.WEST);
		this.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				disconnect();
				System.exit(0);
			}
		});
		
		this.addWindowFocusListener(new WindowFocusListener()
		{
			public void windowGainedFocus(WindowEvent arg0) {
				biaozhi=true;
				System.out.println("biaozhi=true");
			}
			public void windowLostFocus(WindowEvent arg0) {
				biaozhi=false;
				new Thread(new refresh()).start();
				System.out.println("biaozhi=false");
			}
	
		});
//		new Thread(new refresh()).start();
		timer.start();
		pack();
		tfContent.addActionListener(new tfListener());
		setVisible(true);
		connect();
	}
	
	public void connect()
	{
		try {
			s=new Socket("127.0.0.1",12345);
			s2=new Socket("127.0.0.1",23456);
			
System.out.println("successful connect~~");
			bConnected=true;
			bConnected2=true;
			dos =new DataOutputStream(s.getOutputStream());
			dis =new DataInputStream (s.getInputStream());
			oos=new ObjectOutputStream(s2.getOutputStream());pp.oos=oos;
			ois=new ObjectInputStream(s2.getInputStream());
			tRec.start();
			tRec2.start();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void disconnect()
	{
		try {
			dos.close();
			dis.close();
			oos.close();
			ois.close();
			s.close();
			s2.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
private class tfListener implements ActionListener
	{

		public void actionPerformed(ActionEvent e) {
			String str=tfContent.getText().trim();
			tfContent.setText("");
			try {
				if(bbbbb.equals("1")&&str.equals(daanFromServer)){
					dos.writeUTF("主机尝试作弊！！！");
					dos.flush();
				}
				else
				{
				dos.writeUTF("编号为 :" +bbbbb+" 的用户说： "+str);
				dos.flush();}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
	}
	
private class RecvThread implements Runnable{
		
		public void fatimu(){
			taContent.append("你需要画的题目是："+daanFromServer+"\n");
			abcdefg2=105;
		String str="";
		try {
			str = dis.readUTF();
		} catch (IOException e) {
			e.printStackTrace();
		}
		taContent.setText(taContent.getText()+str+'\n');
		}
		
		
		public void run()
		{
			try{
				bbbbb=dis.readUTF();
				if(bbbbb.equals("1")&&abcdefg==100)	{
					abcdefg=200;
					daanFromServer=dis.readUTF();
				}
				while(bConnected){
					
					if(bbbbb.equals("1")&&abcdefg2==101)	{
						taContent.setText("你需要画的题目是："+daanFromServer+"\n");
						abcdefg2=105;}
					String str=dis.readUTF();
					taContent.setText(taContent.getText()+str+'\n');
				}
			}
				catch (EOFException e){
					System.out.println("没东西读了，结束吧（不过为什么是在RecvThread里报错？）");
				}
				catch (SocketException e){
					System.out.println("退出了，bye!");
				}
				catch (IOException e){
					e.printStackTrace();
				}
			
		}
	}



private class RecvThread2 implements Runnable{
	public void run(){
		int size=0;
		try{
			while(bConnected2){
				rectem=(ArrayList<Point>) ois.readObject();
				size=rectem.size();
				System.out.println("get");
		//		if(size>pp.points.size()){
					pp.points=rectem;
					System.out.println(pp.points.size());
			//	}
					System.out.println("yes");
			}
		}
		catch (ClassNotFoundException e){
			System.out.println("RecvThread2 . Point is not found");
		}
		catch (SocketException e){
			System.out.println("这个也退出了");
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}

private class Timer implements Runnable{
	public void run(){
		int again;
		while(cp.seconds > 0){
			cp.seconds--;
			try {
				cp.time2.setText("00 : "+cp.seconds);
				Thread.sleep(1000);
				
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		again = JOptionPane.showConfirmDialog(null, "时间到了，再玩儿吗?");
		while(again == JOptionPane.YES_OPTION){
			cp.seconds = 60;
			while(cp.seconds > 0){
				cp.seconds--;
				try {
					cp.time2.setText("00 : "+cp.seconds);
					Thread.sleep(1000);
					
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			again = JOptionPane.showConfirmDialog(null, "时间到了，再玩儿吗?");
		}
	}
}

private class refresh implements Runnable{
	public void run(){
//		while(biaozhi){
			pp.repaint();
			try {
				Thread.sleep(100);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
//	}
}
}