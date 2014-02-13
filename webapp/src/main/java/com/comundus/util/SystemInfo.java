package com.comundus.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Comparator;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.jar.Attributes;
import java.util.jar.JarFile;
import java.util.jar.Manifest;

public class SystemInfo {

    public static Properties versionProps=null;
    
    private static Properties getVersionProps() throws IOException{
	if(versionProps==null){
	    versionProps=new Properties();
	    versionProps.load(SystemInfo.class.getResourceAsStream("/org/opencms/main/version.properties"));
	}
	return versionProps;
    }
    
    public static String getOpenCmsVersion(){		
	try {
	    return getVersionProps().getProperty("version.number");
	} catch (Exception e) {
	    
	    e.printStackTrace();
	    return "could not read opencms version : "+e.getClass().getName()+": "+e.getMessage();
	}
	
    }
    
    public static String getRevision(){
	try {
	    return getVersionProps().getProperty("scm.revision");
	} catch (Exception e) {
	    
	    e.printStackTrace();
	    return "could not read SCM Revision : "+e.getClass().getName()+": "+e.getMessage();
	}

	
    }
    
    public static String getBuildTimestamp(){
	try {
	    String timestampStr=getVersionProps().getProperty("build.timestamp");
	    if(timestampStr==null||timestampStr.isEmpty()){
		return "-";
	    }
	    return String.valueOf(new Date(Long.valueOf(timestampStr)));
	    
	} catch (Exception e) {
	    
	    e.printStackTrace();
	    return "could not read build timestamp : "+e.getClass().getName()+": "+e.getMessage();
	}

    }

    
    
    public static List<JarInfo> getJars(){
	
	Set<JarInfo> result= new TreeSet<JarInfo>(new JarInfoComparator("de.badenwuerttemberg","_de.gdz.intranet.pagetypes","com.comundus","de.gdz"));
	
	File[] a = new File(getWebInfPath()+"/lib").listFiles();
	for(File f:a){
	    
	    try {
		if(f.getName().endsWith(".jar")){
		    JarFile jar = new JarFile(f);
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
		    
		}
		
		
	    } catch (IOException e) {
		result.add(new JarInfo(f.getName(),null,null,null,"could not read jar "));
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }
	    
	    //result.add(f.getName());
	}
	return new ArrayList(result);
    }
    
    
    public static String getWebInfPath(){
	 
	String filePath = "";
	//String resourceName="/"+WebappInfo.class.getCanonicalName().replace(".","/")+".class";
	URL url = SystemInfo.class.getResource("/org/opencms/main/version.properties");
	String className = url.getFile();
	 
	filePath = className.substring(0,className.indexOf("WEB-INF") + "WEB-INF".length());
	return filePath;
    }
    
    
    public static class JarInfo{
	
	
	
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
