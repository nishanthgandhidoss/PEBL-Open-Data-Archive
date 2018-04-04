import java.awt.print.PrinterJob;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import javax.print.PrintService;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;

public class BarcodeCMD {
	 public static void main(String[] args) throws IOException {
		 
		/* PrinterJob printJob = PrinterJob.getPrinterJob();
		 PrintService[] services = PrinterJob.lookupPrintServices();
		 System.out.println(services);
		 PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
		 aset.add(new Copies(noOfCopies));
		 if(printJob.printDialog(aset)){
			
			 String pname=printJob.getPrintService().getName();
			 System.out.println(pname);
		 }*/
		 Integer noOfCopies = 4;
		 String barcodeNo = "G00001";
		 writePrnFile(barcodeNo, noOfCopies);
		 String compName = getComputerName();
		 System.out.println(compName);
		 String exe = "cmd /c COPY /B F:\\newfile.PRN \\\\"+compName+"\\POSTEK";
		 System.out.println(exe);
		 Process runtime = Runtime.getRuntime().exec(exe);
		 System.out.println(runtime); 
	 }
	 
	 private static String getComputerName()
	 {
	     Map<String, String> env = System.getenv();
	     if (env.containsKey("COMPUTERNAME"))
	         return env.get("COMPUTERNAME");
	     else if (env.containsKey("HOSTNAME"))
	         return env.get("HOSTNAME");
	     else
	         return "Unknown Computer";
	 }
	 
	 private static void writePrnFile(String barcodeNo, Integer noOfCopies) {
		 FileOutputStream fop = null;
			File file;
			String content = getPrnFileContent(barcodeNo, noOfCopies);
			
			try {

				file = new File("F:/newfile.prn");
				fop = new FileOutputStream(file);

				// if file doesnt exists, then create it
				if (!file.exists()) {
					file.createNewFile();
				}
				Writer out = new BufferedWriter(new OutputStreamWriter(
						new FileOutputStream(file), "UTF8"));
				// get the content in bytes
				//byte[] contentInBytes = content.getBytes();

				out.write(content);
				out.flush();
				out.close();

				System.out.println("Done");

			} catch (IOException e) {
				e.printStackTrace();
			} finally {	
				try {
					if (fop != null) {
						fop.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		private static String getPrnFileContent(String barcodeNo, Integer noOfCopies) {
			String prnFile = "<xpml><page quantity='0' pitch='25.0 mm'></xpml>I8,1,001\r\n"
					+ "ZN\r\n"
					+ "q380\r\n"
					+ "O\r\n"
					+ "*D5T\r\n"
					+ "JF\r\n"
					+ "H10\r\n"
					+ "ZT\r\n"
					+ "Q200,25\r\n"
					+ "<xpml></page></xpml><xpml><page quantity='1' pitch='25.0 mm'></xpml>N\r\n"
					+ "B339,167,2,1,3,6,102,N,\"" + barcodeNo + "\"\r\n"
					+ "A244,60,2,3,1,1,N,\"" + barcodeNo + "\"\r\n"
					+ "W" + noOfCopies + "\r\n"
					+ "<xpml></page></xpml><xpml><end/></xpml>";
			return prnFile;
		}
	 }