import java.io.*;

import java.awt.Point;
import java.util.*;
import java.net.*;

public class PaintServer {
	static ServerSocket ss = null;
	static ServerSocket ss2 = null;
	static Socket s = null;
	static Socket s2 = null;
	static boolean bstarted = false;
	static boolean bconnected = false;
	static PaintClient pp =null;
	List<Client> clients = new ArrayList<Client>();
	List<Client2> clients2 = new ArrayList<Client2>();
	ArrayList<Point> tempoi =null;
	int count =0;
	Random ranC=new Random();
	Random ranT=new Random();
	String[] timu ={"apple","tomato","fish","tree"};
	String daan;
	public static void main(String args[]) {
		new PaintServer().start();

	}

	public void start() {
		bstarted = true;
		try {
			ss = new ServerSocket(12345);
			ss2 = new ServerSocket(23456);
		} catch (BindException e) {
			System.out.println("该端口已经被使用。。。");
			System.exit(0);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			while (bstarted) {

				Socket s = ss.accept();
				Socket s2 = ss2.accept();
				Client c = new Client(s);
				clients.add(c);
				Client2 c2=new Client2(s2);
				clients2.add(c2);
				count++;
				System.out.println("a client(2) connected~");
				System.out.println("a client connected~");
				String bbbbb=String.valueOf(count);
				clients.get(clients.size()-1).send(bbbbb);
				if(count==1){
					daan=timu[ranT.nextInt(timu.length-1)];
					clients.get(0).send(daan);
				}
				new Thread(c).start();
				new Thread(c2).start();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ss.close();
				ss2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	class Client implements Runnable {
		private boolean bConnected = false;
		private Socket s = null;
		private DataInputStream dis = null;
		private DataOutputStream dos = null;

		public Client(Socket s) {
			this.s = s;

			try {
				dis = new DataInputStream(s.getInputStream());
				dos = new DataOutputStream(s.getOutputStream());
				bConnected = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public void send(String str) {
			try {
				dos.writeUTF(str);
				dos.flush();
			} catch (SocketException e) {
				clients.remove(this);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public void run() {
			try {
				while (bConnected) {
					String str = dis.readUTF();
					String housanwei="fjakds";
					if(str.length()>13){
					housanwei =str.substring(13, str.length());}
					if(housanwei.equals(daan)){
						str="有玩家猜对了！";
					}
					for (int i = 0; i < clients.size(); i++) {
						Client c = clients.get(i);
						c.send(str);
					}
				}
			} catch (SocketException e) {
				System.out.println("a client exist~");
			} catch (EOFException e) {
				System.out.println("The client was closed~");
			} catch (IOException e) {
				e.printStackTrace();
			}

			finally {
				try {
					if (dis != null)
						dis.close();
					if (dos != null)
						dos.close();
					if (s != null) {
						s.close();
						s = null;
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	class Client2 implements Runnable {
		private boolean bConnected2 = false;
		private Socket s2 = null;
		private ObjectInputStream ois = null;
		private ObjectOutputStream oos = null;

		public Client2(Socket s2) {
			this.s2 = s2;

			try {
				ois = new ObjectInputStream(s2.getInputStream());
				oos = new ObjectOutputStream(s2.getOutputStream());
				bConnected2 = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public void send2(ArrayList<Point> p) {
			try {
				oos.writeObject(p);
				oos.flush();
			} catch (SocketException e) {
				clients2.remove(this);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		public void run() {
			try {
				while (bConnected2) {
					tempoi =  (ArrayList<Point>) ois.readObject();
					for (int i = 0; i < clients2.size(); i++) {
						Client2 c = clients2.get(i);
						c.send2(tempoi);
					}
				}
				
				 
			} 
			catch (ClassNotFoundException e) {
				System.out.println("Class Not Found Exception !");
			} catch (SocketException e) {
				System.out.println("a client2 exist~");
			} catch (EOFException e) {
				System.out.println("The client2 was closed~");
			} catch (IOException e) {
				e.printStackTrace();
			}

			finally {
				try {
					if (ois != null)
						ois.close();
					if (oos != null)
						oos.close();
					if (s2 != null) {
						s2.close();
						s2 = null;
					}
				} catch (IOException e) {
					System.out.println("PaintServer 中的Client2线程被意外关闭。。估计是oos爆了～");
				}
			}
		}

	}
}
