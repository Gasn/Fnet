/*
 * StreamClient.java
 *
 * Created on 16 August 2005, 13:34
 */

/**
 *
 * @author  peters
 */
import java.io.*;
import java.net.*;
public class Client {
    
    /** Creates a new instance of StreamClient */
    public Client() {
    }
    
    /**
     * @param args the command line arguments
     */
    //private static String name = "Client";
    private static byte[] Name = new byte[] {'C', 'l','i','e','n','t',23, 23};
    public static void main(String[] args) throws IOException {
        
        Socket clientSocket = null;
        PrintWriter out = null;
        BufferedReader in = null;
        DataOutputStream out1= null;
        
        try {
            // Connect to the process listening on
            // port 34567 on this host (localhost)
            clientSocket = new Socket("localhost", 13739);
            
            
            //out = new PrintWriter(clientSocket.getOutputStream(), true);
            // "true" means flush at end of line
            in = new BufferedReader(
		    new InputStreamReader(clientSocket.getInputStream()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Create a buffered reader to read from standard input
        BufferedReader stdin = new BufferedReader(
		new InputStreamReader(System.in));
        
        String userInput;
        out1=new DataOutputStream(clientSocket.getOutputStream());
          byte[] ad= new byte[4];
        
        while((userInput = stdin.readLine()) != null) {
            // Send the line to server
        	
        	int port= clientSocket.getLocalPort();
        	//String add= ""+ad+" "+port;
        	InetAddress a = clientSocket.getLocalAddress();
        	ad =clientSocket.getLocalAddress().getAddress();
        	//int a2= Integer.parseInt(ad);
        	//byte[]
        	out1.writeByte(0);
        	out1.write(Name);
        	out1.write(ad);
        	out1.writeInt(port);
        	//System.out.println(port);
           
            
            // Wait for a reply
            String reply = in.readLine();
            // Print out the reply to standard output
            System.out.println("Reply: " + reply);
        }
        
        // Close everything
        out.close();
        in.close();
        stdin.close();
        clientSocket.close();
    }
    
}
