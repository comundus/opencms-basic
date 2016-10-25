// (C) comundus GmbH, D-71332 WAIBLINGEN, www.comundus.com
package com.comundus.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.jar.Attributes;
import java.util.jar.JarFile;
import java.util.jar.Manifest;

/**
 * 
 *
 */
public class SystemInfo {

    private static Properties versionProps=null;
    
    private static Object LOCK = new Object();
    
    private static Properties getVersionProps() throws IOException{               
        
        synchronized(LOCK) {
            if(versionProps==null){
                versionProps=new Properties();
                InputStream in = null;
                try {
                    in = SystemInfo.class.getResourceAsStream("/org/opencms/main/version.properties");
                    versionProps.load(in);
                } finally {
                    if (in != null) {
                        in.close();
                    }
                }
            }
        }
	return versionProps;
    }
    
    public static String getOpenCmsVersion(){		
	try {
	    return getVersionProps().getProperty("version.number");
	} catch (Exception e) {
	    
	    log("", e);
	    return "could not read opencms version : "+e.getClass().getName()+": "+e.getMessage();
	}
    }
    
    public static String getRevision(){
	try {
	    return getVersionProps().getProperty("scm.revision");
	} catch (Exception e) {
	    
	    log("", e);
	    return "could not read SCM Revision : "+e.getClass().getName()+": "+e.getMessage();
	}
    }
    
    public static String getBuildTimestamp(){
        String timestampStr = "(null)";
	try {
	    timestampStr = getVersionProps().getProperty("build.timestamp");
	    if(timestampStr==null||timestampStr.isEmpty()){
		return "-";
	    }
	    return String.valueOf(new Date(Long.valueOf(timestampStr)));
	} catch (NumberFormatException e) {
	    return timestampStr;
	} catch (Exception e) {
	    
	    log("", e);
	    return "could not read build timestamp : "+e.getClass().getName()+": "+e.getMessage();
	}
    }    
    
    public static List<JarInfo> getJars() {
        return getJars(new String[0]);
    }
    public static List<JarInfo> getJars(String[] preferredTexts) {
	
        Set<String> mergedPreferredTexts = new HashSet<>();
        mergedPreferredTexts.addAll(Arrays.asList("opencms-core", "sonia-ocms", "ostfalia"));
        mergedPreferredTexts.addAll(Arrays.asList(preferredTexts));
        
	Set<JarInfo> result= new TreeSet<JarInfo>(new JarInfoComparator(mergedPreferredTexts.toArray(new String[0])));
	
	File[] webappJarFiles = new File(getWebInfPath()+"/lib").listFiles();
        for (File f : webappJarFiles) {
	    
	    try {
                if (f.getName().endsWith(".jar")) {
		    JarFile jar = null;
		    try {
		        jar = new JarFile(f);
		        Manifest manifest = jar.getManifest();

		        if(manifest==null){
		            result.add(new JarInfo(f.getName(),null,null,null,"No manifest found"));
		        }else{

		            Attributes attrs=manifest.getMainAttributes();
		            String title=attrs.getValue("Implementation-Title");
		            String version=attrs.getValue("Implementation-Version");
		            String scmBuild=attrs.getValue("SCM-Revision");			

		            result.add(new JarInfo(f.getName(), version, scmBuild, title));
		        }
		    } finally {
		        if (jar != null) {
		            jar.close();
		        }
		    }		    
		}		
		
	    } catch (IOException e) {
		result.add(new JarInfo(f.getName(),null,null,null,"could not read jar "));
		log("", e);
	    }
	}
	return new ArrayList<JarInfo>(result);
    }
    
    
    private static void log(String msg, Exception e) {
        if (msg!= null && !msg.isEmpty()) {
            System.err.println (msg);
        }
        if (e != null) {
            e.printStackTrace();
        }        
    }

    public static String getWebInfPath(){
	 
	String filePath = "";
	//String resourceName="/"+WebappInfo.class.getCanonicalName().replace(".","/")+".class";
	URL url = SystemInfo.class.getResource("/org/opencms/main/version.properties");
	String className = url.getFile();
	 
	filePath = className.substring(0,className.indexOf("WEB-INF") + "WEB-INF".length());
	return filePath;
    }
    
    
    public static class JarInfo {
	
	public JarInfo(String fileName, String version, String scmBuild,
		String title) {
	    this(fileName,version,scmBuild,title,null);
	}
	
	public JarInfo(String fileName, String version, String scmBuild,
		String title, String additionalData) {
	    super();
	    this.fileName = fileName;
	    this.version = version;
	    this.scmBuild = scmBuild;
	    this.title = title;
	    this.additionalData = additionalData;
	}
	public String fileName;
	public String version;
	public String scmBuild;
	public String title;
	public String additionalData;
    }
    
    public static class JarInfoComparator implements Comparator<JarInfo>{

		
	private String[] preferredContainedTexts;

	public JarInfoComparator() {
	    this(new String[0]);
	}
	
	public JarInfoComparator(String ... preferredContainedTexts){
	    this.preferredContainedTexts=preferredContainedTexts;
	}
	
	
	
	public int compare(JarInfo jar1, JarInfo jar2) {
	    
	    if(jar1==null){
		return 1;
	    }else if(jar2==null){
		return -1;
	    }
	    
	    int pref1=preferredPosition(jar1.fileName);
	    int pref2=preferredPosition(jar2.fileName);

	    //Prefer jars with title
	    if(pref1 > 0  &&  jar1.title!=null)    pref1+=1000;
	    if(pref2 > 0  &&  jar2.title!=null)    pref2+=1000;
	    if(pref1 <= 0  &&  jar1.title == null) pref1-=1000;
	    if(pref2 <= 0  &&  jar2.title == null) pref2-=1000;
	    
	    if(pref1 != pref2){
		return pref2 - pref1;
	    }else{
		return jar1.fileName.compareTo(jar2.fileName);
	    }
	}

	private int preferredPosition(String fileName) {
	    
	    for(int i=0;i<this.preferredContainedTexts.length;i++){		
		if(fileName.contains(preferredContainedTexts[i])){
		    return preferredContainedTexts.length-i;
		}
	    }
	    return 0;
	}	
    }    
}
