<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "org.opencms.main.*" %>
<%@ page import = "org.opencms.mail.*" %>
<%@ page import = "java.util.Properties" %>
<%@ page import = "javax.mail.Message" %>
<%@ page import = "javax.mail.Session" %>
<%@ page import = "javax.mail.Transport" %>
<%@ page import = "javax.mail.internet.*" %>
<%@ page import = "javax.mail.MessagingException" %>
<%@ page import = "java.security.*" %>
<%@ page import = "java.lang.management.*" %>

<%
	boolean ENABLED = false;

// Username und Passwort pr�fen	
	String siteAuth = "";
	String siteUser = "";
	String sitePassword = "";
	String sitePass = "6RWeQrywyNZh5uyGKZ+fQsZXN9E=";
	siteAuth = (String)session.getAttribute( "siteA" ); 
	siteUser = request.getParameter( "siteU" );
	sitePassword = request.getParameter( "siteP" );
	MessageDigest digest = MessageDigest.getInstance("SHA-1");
	digest.reset();
	byte[] saltedBytes = (siteUser + sitePassword).getBytes("UTF-8");
	byte[] hashedBytes = digest.digest(saltedBytes);
	String encoded = new sun.misc.BASE64Encoder().encode(hashedBytes);
	
//Wenn Passwort g�ltig
	
	if ( ENABLED && (("Admin".equals( siteUser ) && sitePass.equals( encoded ) ) || "true".equals( siteAuth )) ) {
		session.setAttribute("siteA", "true");
//Variablen deklarieren
		
		String testCon = "";
		String sDbDrv = "";
		String sDbUrl = "";
		String sUsr = "";
		String sPwd = "";
		String dbVersion = "<br />";
		String dbConVer = "";
		String dbErr = "";
		String dbConRes = "<br />";
		String testRights = "false";
		String dbRights = "<br />";
		String dbRightsErr = "";
		String testFile = "false";
		String flTest = "<br />";
		String flTestErr = "";
		String testMail = "";
		String mailTo = "";
		String mailSubject = "";
		String mailText = "";
		String mailUser = "";
		String mailPassword = "";
		String mailErr = "";
		String mailTestRes = "<br />";
		String authChecked = "";
		String sqlStm = "";
		String execSql = "false";
		String sqlExecErr = "";
		String mailHost = "";
		String cmsVersion = "";
		String cmsDefaultEnc = "";
		String cmsServerName = "";
		String appServerInfo = "";
		String javaVersion = "";

		try {
		
/* Infos über OpenCms auslesen
*  Version
*  DefaultEncoding
*  Mail Einstellungen
*/
			
			CmsSystemInfo cmsInfo = OpenCms.getSystemInfo();
			cmsInfo = OpenCms.getSystemInfo();
			cmsVersion = cmsInfo.getVersion();
			cmsDefaultEnc = cmsInfo.getDefaultEncoding();
			CmsMailSettings cmsMailSet = cmsInfo.getMailSettings();
			CmsMailHost cmsMailH = cmsMailSet.getDefaultMailHost();
			mailHost = cmsMailH.getHostname();

			if (cmsMailH.getUsername()==null) {
				
				mailUser = "";
			
			} else {
				
				mailUser = cmsMailH.getUsername();
			}

			if (cmsMailH.getPassword()==null) {
				
				mailPassword = "";
			} else {
	
				mailPassword = cmsMailH.getPassword();
			}
			
/* Datenbankverbindung herstellen
*  zum auslesen der Version
*/
			
			CmsContextInfo cmsContInfo = new CmsContextInfo();
			Connection cn = null;

			try {
  
				cn = DriverManager.getConnection( "jdbc:apache:commons:dbcp:opencms:default" );
				dbVersion = cn.getMetaData().getDatabaseProductName() + "/" + cn.getMetaData().getDatabaseProductVersion();
				
			} catch( SQLException se ) {
				
				dbErr = "Verbindung zur Datenbank konnte nicht hergestellt werden!<br />" + se;

			} finally {
  
				if( cn != null ) {
    
					try {
      
						cn.close();
					} catch( Exception ex ) {
		
						// intentionally left blank
						
					}
				}
			}
		} catch( Exception ex ) {
		
			// intentionally left blank
			
		} finally {
		
/* Servername, Serverversion
*  und Javaversion auslesen
*/
		
			cmsServerName = request.getServerName();
			appServerInfo = application.getServerInfo();
			javaVersion = System.getProperty("java.version");
			Connection cn1 = null;
			testCon = request.getParameter( "test_connection" );

// Datenbankverbindung zu bel. DB herstellen
		
			if( "true".equals( testCon ) ) {
			
				sDbDrv = request.getParameter( "DbDrv" );
				sDbUrl = request.getParameter( "DbUrl" );
				sUsr   = request.getParameter( "Usr" );
				sPwd   = request.getParameter( "Pwd" );
				
				try {
					
					Class.forName( sDbDrv );
					cn1 = DriverManager.getConnection( sDbUrl, sUsr, sPwd );
				    dbConVer = cn1.getMetaData().getDatabaseProductName() + "/" + cn1.getMetaData().getDatabaseProductVersion();
				    dbConRes = "Die Verbindung zu " + dbConVer + " wurde erfolgreich hergestellt.";
					
				} catch( SQLException se ) {
					
					dbErr = "Verbindung zur Datenbank konnte nicht hergestellt werden!<br />" + se;
					
				} finally {
			
					if( cn1 != null ) {
	      
						try {
				
							cn1.close();
	      
						} catch( Exception ex ) {
						
							// intentionally left blank
	      
						}
					}
				}
			} 

			Statement st = null;
			Connection cn2 = null;
			testRights = request.getParameter( "create_db" );

// Rechte für DB testen
		
			if ( "true".equals( testRights ) ) {
	  
				try {
			
					cn2 = DriverManager.getConnection( "jdbc:apache:commons:dbcp:opencms:default" );
					st = cn2.createStatement();
				
					try {
	      
						st.executeUpdate( "DROP TABLE adminseite_test_tb" );
			
					} catch( SQLException se ) {
	      
						//löscht die Tabelle vor dem Erstellen, falls sie schon vorhanden ist.
	    
					} 
	    
					st.executeUpdate( "CREATE TABLE adminseite_test_tb (c CHAR(20))" );
					st.executeUpdate( "INSERT INTO adminseite_test_tb (c) VALUES ('a,b,c')" );
					st.executeUpdate( "DROP TABLE adminseite_test_tb" );
					dbRights = "Der Test war erfolgreich. Es wurde eine Tabelle angelegt, in die Tabelle geschrieben und die Tabelle wieder gelöscht.";
				
				} catch( SQLException se ) {
				
					dbRightsErr = "Der User besitzt nicht die benötigten Rechte!<br />" + se;
				
				} finally {
	    
					if( cn2 != null ) {
	      
						try {
	        
							cn2.close();
	      
						} catch( Exception ex ) {
	        
							// intentionally left blank
			
						}
					}
				}
			}

			Statement st1 = null;
			execSql = request.getParameter( "exec_Sql" );
	
// Insert oder Update Befehl ausführen
	
			if ( "true".equals( execSql ) ) {
	  
				sqlStm = request.getParameter( "sql_Stm" );
	  
				try {
	    
					cn2 = DriverManager.getConnection( "jdbc:apache:commons:dbcp:opencms:default" );
					st1 = cn2.createStatement();
					st1.executeUpdate( sqlStm );
	  
				} catch( SQLException se ) {
	    
					sqlExecErr = "Befehl konnte nicht ausgeführt werden." + se;
	  
				} finally {
	    
					if( cn2 != null ) {
	      
						try {
	        
							cn2.close();
	      
						} catch( Exception ex ) {
				
							// intentionally left blank
	      
						}
					}
				}
			}

			testFile = request.getParameter( "create_file" );

// Schreibrechte im Webapps Verzeichnis testen
		
			if ( "true".equals( testFile ) ) {
	  
				try {
	    
					File test_file = new File( application.getRealPath( "adminseite_test_file.txt" ) );
					test_file.createNewFile();
					BufferedWriter file = new BufferedWriter( new OutputStreamWriter( new FileOutputStream( test_file ) ) );
					file.write( "Test" );
					file.close();
					test_file.delete();
					flTest = "Benötigte Schreibrechte im Webappsverzeichnis vorhanden. Eine Datei wurde erstellt, hinein geschrieben und wieder gelöscht.";
				
				} catch( IOException ioe ) {
	    
					flTestErr = "Sie besitzen nicht die benötigten Rechte, um in das Webappsverzeichnis zu schreiben!<br />" + ioe;
	  
				}
			}

			testMail = request.getParameter( "test_mail" );

// Maileinstellungen testen	

			if( "true".equals( testMail ) ) {
			
				mailHost = request.getParameter( "mHost" );
				mailTo = request.getParameter( "mTo" );
				mailSubject = request.getParameter( "mSubject" );
				mailText = request.getParameter( "mText" );
				mailUser = request.getParameter( "mUser" );
				mailPassword = request.getParameter( "mPassword" );
				Properties props = new Properties();
				props.put( "mail.smtp.host", mailHost );
			  
				if( !("".equals(mailUser) || "".equals(mailPassword))  ) {
	    
					props.put( "mail.smtp.auth","true" );
				    authChecked = "checked";
				    Session sess = Session.getInstance( props );
					sess.setDebug(true);
				    
					try {
						
						MimeMessage msg = new MimeMessage( sess );
						msg.setFrom( new InternetAddress( mailUser, "OpenCms-Adminseite" ) );
						msg.setRecipients( Message.RecipientType.TO, mailTo );
						msg.setSubject( mailSubject );
						msg.setText( mailText );
						Transport transport = sess.getTransport( "smtp" );
						transport.connect( mailHost, mailUser, mailPassword );
						transport.sendMessage( msg, msg.getAllRecipients() );
						transport.close();
						mailTestRes = "Die E-Mail wurde mit Authentifizierung erfolgreich versandt.";
				    
					} catch ( MessagingException me ) {
	      
						mailErr = "E-Mail konnte nicht versandt werden!<br />" + me;
	    
					}
				} else {
    
					props.put( "mail.smtp.auth", "false" );
					authChecked = "";
					Session sess = Session.getInstance( props );
					sess.setDebug(true);
	    
					try {
				
						MimeMessage msg = new MimeMessage( sess );
						msg.setFrom( new InternetAddress( "OpenCms-Adminseite" ) );
						msg.setRecipients( Message.RecipientType.TO, mailTo );
						msg.setSubject( mailSubject );
						msg.setText( mailText );
						Transport.send( msg );
						mailTestRes = "Die E-Mail wurde ohne Authentifizierung erfolgreich versandt.";
					} catch ( MessagingException me ) {
			
						mailErr = "E-Mail konnte nicht versandt werden!<br />" + me;
	    
					}
				}
			}

			%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="de" xml:lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>comundus GmbH - OpenCms-Adminseite</title>
<style type="text/css">
<!--
.Stil1 {
	font-family: "Arial, Verdana, Helvetica, sans-serif";
	font-size: 50px;
	background-image: url(Head_bg.jpg);
	height: 140px;
	width: auto;
	background-position: center center;
	text-align: center;
	vertical-align: middle;
	margin: auto;
	clear: none;
	float: none;
	white-space: pre;
}

.Stil2,h2 {
	font-size: x-large;
	font-family: "Arial";
}

.Stil3,p,td {
	font-family: "Arial";
	font-size: small;
}

.Stil4,h3 {
	font-size: large;
	font-family: "Arial";
}

.Stil5 {
	font-size: large;
	font-family: "Arial";
	color: red;
	font-weight: bold;
}

.hr_stil {
	color: #FF7F00;
	background-color: #FF7F00;
}
-->
</style>
</head>
<body>
<h1 align="center" class="Stil1">OpenCms-Adminseite</h1>

<h2>OpenCms-Serverdaten</h2>
<form method="post" action="">
<input type="hidden" name="siteA" value="true" />
	<table border="0">
		<tr>
			<td>
				<div class="Stil3"><strong>Javaversion:</strong></div>
			</td>
			<td>
				<div class="Stil3"><%= javaVersion %></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="Stil3">
					<strong>Datenbankversion (OpenCms DB-Verbindungspool):</strong>
				</div>
			</td>
			<td>
				<div class="Stil3"><br /><%= dbVersion %></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="Stil3"><strong>Serverversion:</strong></div>
			</td>
			<td>
				<div class="Stil3"><%= appServerInfo %></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="Stil3"><strong>OpenCms-Version:</strong></div>
			</td>
			<td>
				<div class="Stil3"><%= cmsVersion %></div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="Stil3"><strong>OpenCms-Encoding:</strong></div>
			</td>
			<td>
				<div class="Stil3"><%= cmsDefaultEnc %></div>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top;">
				<div class="Stil3"><strong>Tomcat Startup params:</strong></div>
			</td>
			<td>
				<div class="Stil3">
					<%
					RuntimeMXBean RuntimemxBean = ManagementFactory.getRuntimeMXBean();
					List<String> aList=RuntimemxBean.getInputArguments();
					for(int i=0;i<aList.size();i++) {
					%>
						<%=aList.get(i)%><br>
					<%	
					}
					%>
				</div>
			</td>
		</tr>
		<tr>
			<td width="175">
				<div class="Stil3"><strong>Servername:</strong></div>
			</td>
			<td>
				<div class="Stil3">
					<%= cmsServerName %><br />
				</div>
			</td>
		</tr>
	</table>
</form>
<hr />
<h2>Benutzerrechte auf Datenbank testen</h2>
<table width="940">
	<tr>
		<td width="455">
		<div class="Stil4">Zum testen der Benutzerrechte der Datenbank
		(OpenCms DB-Verbindungspool), bitte auf<br />
		"Rechte testen" klicken:</div>
		</td>
		<td width="217">
			<form method="post" action="">
				<input type="hidden" name="siteA" value="true" />
				<input type="hidden" name="create_db" value="true" />
				<input type="submit" value="Rechte testen" />
			</form>
		</td>
		<td width="165">&nbsp;</td>
	</tr>
	<tr>
		<td height="39" colspan="3" align="center">
		<div class="Stil5"><%= dbRightsErr%></div>
		<div class="Stil3"><%= dbRights%></div>
		</td>
	</tr>
</table>
<h2>Schreibrechte testen</h2>
<table width="940">
	<tr>
		<td height="47"></td>
		<td height="47">
		<div class="Stil4">Zum testen der Schreibrechte im
		Webappsverzeichnis, <br />
		bitte auf "Schreibrechte testen" klicken:</div>
		</td>
		<td width="217">
			<form method="post" action="">
				<input type="hidden" name="siteA" value="true" />
				<input type="hidden" name="create_file" value="true" />
				<input type="submit" value="Schreibrechte testen" />
			</form>
		</td>
		<td width="165"></td>
	</tr>
	<tr>
		<td height="39" colspan="4" align="center">
		<div class="Stil5"><%= flTestErr%></div>
		<div class="Stil3"><%= flTest%></div>
		</td>
	</tr>
</table>
<hr />
<a name="mailVersand"></a>
<h2>Testen des E-Mail Versands</h2>
<form method="post" action="#mailVersand"><input type="hidden"
	name="siteA" value="true" /> <input type="hidden" name="test_mail"
	value="true" />
<table width="769" border="0">
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">SMTP-Host:</div>
		</th>
		<td width="374"><input type="text" name="mHost"
			value="<%= mailHost%>" size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Empf&auml;nger:</div>
		</th>
		<td><input type="text" name="mTo" value="<%= mailTo%>" size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Betreff:</div>
		</th>
		<td><input type="text" name="mSubject" value="<%= mailSubject%>"
			size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Body:</div>
		</th>
		<td><input type="text" name="mText" value="<%= mailText%>"
			size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Benutzer:</div>
		</th>
		<td><input type="text" name="mUser" value="<%= mailUser%>"
			size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Passwort:</div>
		</th>
		<td><input type="password" name="mPassword"
			value="<%= mailPassword%>" size="60" /></td>
	</tr>
	<tr>
		<td width="297"></td>
		<td height="40"><input type="submit" value="E-Mail senden" /></td>
	</tr>
	<tr>
		<td height="40" colspan="2" align="center">
		<div class="Stil5"><%= mailErr%></div>
		<div class="Stil3"><%= mailTestRes%></div>
		</td>
	</tr>
</table>
</form>
<hr />
<h2>Testen der Verbindungsdaten zur einer beliebigen Datenbank</h2>
<form method="post" action="#mailVersand"><input type="hidden"
	name="siteA" value="true" /> <input type="hidden"
	name="test_connection" value="true" />
<table width="769" border="0">
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Treiber:</div>
		</th>
		<td width="374"><input type="text" name="DbDrv"
			value="com.mysql.jdbc.Driver" size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">URL:</div>
		</th>
		<td>
		<div class="Stil3"><input type="text" name="DbUrl"
			value="jdbc:mysql://localhost:3306/" size="60" /></div>
		</td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Benutzer:</div>
		</th>
		<td><input type="text" name="Usr" value="root" size="60" /></td>
	</tr>
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">Kennwort:</div>
		</th>
		<td><input type="password" name="Pwd" value="root" size="60" /></td>
	</tr>
	<tr>
		<td width="297"></td>
		<td height="40"><input type="submit" value="Verbindung testen" /></td>
	</tr>
	<tr>
		<td height="40" colspan="2" align="center">
		<div class="Stil5"><%= dbErr%></div>
		<div class="Stil3"><%= dbConRes%></div>
		</td>
	</tr>
</table>
</form>
<hr />
<h2>Update oder Insert SQL-Befehl ausf&uuml;hren auf die OpenCms-Datenbank</h2>
<form method="post" action="#mailVersand"><input type="hidden"
	name="siteA" value="true" /> <input type="hidden"
	name="exec_Sql" value="true" />
<table width="769" border="0">
	<tr>
		<th width="297" height="40" align="right">
		<div class="Stil4">SQL-Befehl:</div>
		</th>
		<td width="374"><input type="text" name="sql_Stm"
			value="insert / update" size="60" /></td>
	</tr>
	<tr>
		<td width="297"></td>
		<td height="40"><input type="submit" value="SQL-Befehl ausführen" /></td>
	</tr>
	<tr>
		<td height="40" colspan="2" align="center">
		<div class="Stil3"><%= sqlExecErr%></div>
		</td>
	</tr>
</table>
</form>
<hr />
<h2>Systemvariablen</h2>
<table width="600" border="1">
	<%
			SortedMap sm = new TreeMap(System.getProperties());	    
    // iterate over keys
			for (Iterator iter = sm.entrySet().iterator(); iter.hasNext();) {
				Map.Entry entry = (Map.Entry)iter.next();
    %>
	<tr>
		<td><strong><%= entry.getKey() %></strong></td>
		<td><%= entry.getValue() %></td>
	</tr>
	<%
			}
	%>
</table>
<%
		}
	} else {
%>
<form method="post" action="">
	<table width="626" border="0">
		<tr>
			<td width="406" height="278"></td>
			<td width="210"></td>
		</tr>
    <% 
    if (!ENABLED) { %>
    	<tr>

    		<td colspan = "2">
    			<div style = "margin:5px 60px 5px 290px; border: 2px solid red; padding:3px 30px; color:black; background-color:#eee;">
       			Admin-Tool nicht verfügbar.
       			</div>
       		</td>
    	</tr>
    <% 
    } %>	
		<tr>
			<td height="32" align="right" valign="middle">Benutzername:&nbsp;</td>
			<td><input type="text" name="siteU" /></td>
		</tr>
		<tr>
			<td height="29" align="right" valign="middle">Passwort:&nbsp;</td>
			<td><input type="password" name="siteP" /></td>
		</tr>
		<tr>
			<td height="32"></td>
			<td><input type="submit" value="Anmelden" />&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="reset" value="Abbrechen" /></td>
		</tr>
	</table>
</form>
<%
	}
%>
</body>
</html>
