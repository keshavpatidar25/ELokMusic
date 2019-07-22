package oms.dao;

import java.io.File;
import java.io.IOException;

public class FileDao {

    public FileDao() {
    }
 
    public boolean deleteDirectory(String path)
    {	
 
    	File directory = new File(path);
 
    	//make sure directory exists
    	if(!directory.exists()){
 
           System.out.println("Directory does not exist.");
           return false;
 
        }else{
 
           try{
 
               return delete(directory);
 
           }catch(IOException e){
               e.printStackTrace();
               return false;
           }
        }
 
    }
 
    public boolean delete(File file) throws IOException{
 
        boolean success=true;
    	if(file.isDirectory()){
 
    		//directory is empty, then delete it
    		if(file.list().length==0){
 
    		   return file.delete();
                 
 
    		}
/*                else{
 
    		   //list all the directory contents
        	   String files[] = file.list();
 
        	   for (String temp : files) {
        	      //construct the file structure
        	      File fileDelete = new File(file, temp);
 
        	      //recursive delete
        	     success = success && delete(fileDelete);
        	   }
 
        	   //check the directory again, if empty then delete it
        	   if(file.list().length==0){
           	     return file.delete();
        	   }
                   */
                   return success;
    		
 
    	}else{
    		//if file, then delete it
    		return file.delete();
    	}
    }

}
