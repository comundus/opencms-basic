Create database
--------------- 
in MySQL with:
CREATE DATABASE opencms DEFAULT CHARACTER SET utf8;

Changes in $MAVEN_HOME/settings.xml
-----------------------------------

Repositories:

		<repositories>
			<repository>
				<id>maven-vfs-plugin-github</id>
				<url>https://comundus.github.io/maven2-repository</url>
			</repository>
		</repositories>
		<pluginRepositories>
			<pluginRepository>
				<id>maven-vfs-plugin-github</id>
				<url>https://comundus.github.io/maven2-repository</url>
				<snapshots>
					<enabled>false</enabled>
				</snapshots>
			</pluginRepository>
		</pluginRepositories>
    

Declare plugin group:
    
    <pluginGroups>
        <pluginGroup>com.comundus.maven</pluginGroup>
    </pluginGroups>
    