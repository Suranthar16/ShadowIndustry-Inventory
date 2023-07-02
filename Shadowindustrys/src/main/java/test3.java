import java.util.*;
import java.lang.*;
import java.io.*;
public class test3 {
	public static void main (String[] args) throws java.lang.Exception
	{
		
		Date dt=new Date();
		String dateString = dt.toString();
		System.out.println(dt);
		System.out.println(dateString);

		System.out.println(dateString.matches("[A-Z][a-z]{2}\\s[A-Z][a-z]{2}\\s[0-9]{2}\\s[0-9]{2}:[0-9]{2}:[0-9]{2}\\s[A-Z]{3}\\s[0-9]{4}"));
	}

}