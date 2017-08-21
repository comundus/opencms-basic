USE fraunhofer;

CREATE TABLE CMS_USERS (
    USER_ID NVARCHAR(36) NOT NULL,
    USER_NAME NVARCHAR(128) NOT NULL,
    USER_PASSWORD NVARCHAR(255) NOT NULL,
    USER_FIRSTNAME NVARCHAR(128) NOT NULL,
    USER_LASTNAME NVARCHAR(128) NOT NULL,
    USER_EMAIL NVARCHAR(128) NOT NULL,
    USER_LASTLOGIN BIGINT NOT NULL,
    USER_FLAGS INT NOT NULL,
    USER_OU NVARCHAR(128),
    USER_DATECREATED BIGINT NOT NULL,
    PRIMARY KEY (USER_ID), 
    UNIQUE (USER_OU, USER_NAME)
);

CREATE NONCLUSTERED INDEX CMS_USERS_01_IDX 
    ON CMS_USERS (USER_NAME);

CREATE NONCLUSTERED INDEX CMS_USERS_02_IDX 
    ON CMS_USERS (USER_OU);
        
CREATE TABLE CMS_USERDATA (
    USER_ID NVARCHAR(36) NOT NULL,
    DATA_KEY NVARCHAR(255) NOT NULL,
    DATA_VALUE IMAGE,
    DATA_TYPE NVARCHAR(128) NOT NULL,
    PRIMARY KEY (USER_ID, DATA_KEY)
);

CREATE NONCLUSTERED INDEX CMS_USERDATA_01_IDX 
    ON CMS_USERDATA (USER_ID);
    
CREATE NONCLUSTERED INDEX CMS_USERDATA_02_IDX 
    ON CMS_USERDATA (DATA_KEY);
    
CREATE TABLE CMS_HISTORY_PRINCIPALS (
    PRINCIPAL_ID NVARCHAR(36) NOT NULL,
    PRINCIPAL_NAME NVARCHAR(128) NOT NULL,
    PRINCIPAL_DESCRIPTION NVARCHAR(255) NOT NULL,
    PRINCIPAL_OU NVARCHAR(128),
    PRINCIPAL_EMAIL NVARCHAR(128) NOT NULL,
    PRINCIPAL_TYPE NVARCHAR(5) NOT NULL,
    PRINCIPAL_USERDELETED NVARCHAR(36) NOT NULL,
    PRINCIPAL_DATEDELETED BIGINT NOT NULL,
    PRIMARY KEY (PRINCIPAL_ID)
);

CREATE TABLE CMS_GROUPS (
    GROUP_ID NVARCHAR(36)  NOT NULL,
    PARENT_GROUP_ID NVARCHAR(36)  NOT NULL,
    GROUP_NAME NVARCHAR(128)  NOT NULL,
    GROUP_DESCRIPTION NVARCHAR(255) NOT NULL,
    GROUP_FLAGS INT NOT NULL,
    GROUP_OU NVARCHAR(128),
    PRIMARY KEY (GROUP_ID),
    UNIQUE (GROUP_OU, GROUP_NAME)
);

CREATE NONCLUSTERED INDEX CMS_GROUPS_01_IDX 
    ON CMS_GROUPS (GROUP_NAME);

CREATE NONCLUSTERED INDEX CMS_GROUPS_02_IDX 
    ON CMS_GROUPS (GROUP_OU);

CREATE NONCLUSTERED INDEX CMS_GROUPS_03_IDX 
    ON CMS_GROUPS (PARENT_GROUP_ID);
      
CREATE TABLE CMS_GROUPUSERS (
    GROUP_ID NVARCHAR(36)  NOT NULL,
    USER_ID NVARCHAR(36)  NOT NULL,
    GROUPUSER_FLAGS INT NOT NULL,
    PRIMARY KEY (GROUP_ID,USER_ID)
);

CREATE NONCLUSTERED INDEX CMS_GROUPUSERS_01_IDX 
    ON CMS_GROUPUSERS (GROUP_ID);
    
CREATE NONCLUSTERED INDEX CMS_GROUPUSERS_02_IDX 
    ON CMS_GROUPUSERS (USER_ID);

CREATE TABLE CMS_PROJECTS (
    PROJECT_ID NVARCHAR(36) NOT NULL,
    PROJECT_NAME NVARCHAR(200)  NOT NULL,
    PROJECT_DESCRIPTION NVARCHAR(255) NOT NULL,
    PROJECT_FLAGS INT NOT NULL,
    PROJECT_TYPE INT NOT NULL,
    USER_ID NVARCHAR(36)  NOT NULL,
    GROUP_ID NVARCHAR(36)  NOT NULL, 
    MANAGERGROUP_ID NVARCHAR(36)  NOT NULL,
    DATE_CREATED BIGINT NOT NULL,
    PROJECT_OU NVARCHAR(128) NOT NULL,
    PRIMARY KEY (PROJECT_ID), 
    UNIQUE (PROJECT_OU, PROJECT_NAME, DATE_CREATED)
);

CREATE NONCLUSTERED INDEX CMS_PROJECTS_01_IDX 
    ON CMS_PROJECTS (PROJECT_FLAGS);

CREATE NONCLUSTERED INDEX CMS_PROJECTS_02_IDX 
    ON CMS_PROJECTS (GROUP_ID);

CREATE NONCLUSTERED INDEX CMS_PROJECTS_03_IDX 
    ON CMS_PROJECTS (MANAGERGROUP_ID);
    
CREATE NONCLUSTERED INDEX CMS_PROJECTS_04_IDX 
    ON CMS_PROJECTS (PROJECT_OU, PROJECT_NAME);
    
CREATE NONCLUSTERED INDEX CMS_PROJECTS_05_IDX 
    ON CMS_PROJECTS (PROJECT_NAME);
    
CREATE NONCLUSTERED INDEX CMS_PROJECTS_06_IDX 
    ON CMS_PROJECTS (PROJECT_OU);

CREATE NONCLUSTERED INDEX CMS_PROJECTS_07_IDX 
    ON CMS_PROJECTS (USER_ID);
    
CREATE TABLE CMS_HISTORY_PROJECTS (
    PROJECT_ID NVARCHAR(36) NOT NULL,
    PROJECT_NAME NVARCHAR(255)  NOT NULL,
    PROJECT_DESCRIPTION NVARCHAR(255) NOT NULL,
    PROJECT_TYPE INT NOT NULL,
    USER_ID NVARCHAR(36)  NOT NULL,
    GROUP_ID NVARCHAR(36)  NOT NULL,
    MANAGERGROUP_ID NVARCHAR(36)  NOT NULL,
    DATE_CREATED BIGINT NOT NULL,    
    PUBLISH_TAG INT NOT NULL,
    PROJECT_PUBLISHDATE BIGINT,
    PROJECT_PUBLISHED_BY NVARCHAR(36) NOT NULL,
    PROJECT_OU NVARCHAR(128) NOT NULL,
    PRIMARY KEY (PUBLISH_TAG)
);

CREATE TABLE CMS_PROJECTRESOURCES (
    PROJECT_ID NVARCHAR(36) NOT NULL,
    RESOURCE_PATH NVARCHAR(511) NOT NULL,
    PRIMARY KEY (PROJECT_ID, RESOURCE_PATH)
);

CREATE NONCLUSTERED INDEX CMS_PROJECTRESOURCES_01_IDX 
    ON CMS_PROJECTRESOURCES (RESOURCE_PATH);

CREATE TABLE CMS_HISTORY_PROJECTRESOURCES (
    PUBLISH_TAG INT NOT NULL,
    PROJECT_ID NVARCHAR(36) NOT NULL,
    RESOURCE_PATH NVARCHAR(511) NOT NULL,
    PRIMARY KEY (PUBLISH_TAG, PROJECT_ID, RESOURCE_PATH)
);

CREATE TABLE CMS_OFFLINE_PROPERTYDEF (
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL, 
    PROPERTYDEF_NAME NVARCHAR(128)  NOT NULL,
    PROPERTYDEF_TYPE INT NOT NULL,
    PRIMARY KEY (PROPERTYDEF_ID), 
    UNIQUE (PROPERTYDEF_NAME)
);
                           
CREATE TABLE CMS_ONLINE_PROPERTYDEF (
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL, 
    PROPERTYDEF_NAME NVARCHAR(128)  NOT NULL,
    PROPERTYDEF_TYPE INT NOT NULL,
    PRIMARY KEY (PROPERTYDEF_ID), 
    UNIQUE (PROPERTYDEF_NAME)    
);
                                        
CREATE TABLE CMS_HISTORY_PROPERTYDEF (
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL, 
    PROPERTYDEF_NAME NVARCHAR(128)  NOT NULL,
    PROPERTYDEF_TYPE INT NOT NULL,
    PRIMARY KEY (PROPERTYDEF_ID), 
    UNIQUE (PROPERTYDEF_NAME)    
);

CREATE TABLE CMS_OFFLINE_PROPERTIES (
    PROPERTY_ID NVARCHAR(36)  NOT NULL,
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_TYPE INT NOT NULL,
    PROPERTY_VALUE NTEXT NOT NULL,
    PRIMARY KEY (PROPERTY_ID),
    UNIQUE (PROPERTYDEF_ID, PROPERTY_MAPPING_ID)
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_PROPERTIES_01_IDX 
    ON CMS_OFFLINE_PROPERTIES (PROPERTYDEF_ID);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_PROPERTIES_02_IDX 
    ON CMS_OFFLINE_PROPERTIES (PROPERTY_MAPPING_ID);
                                      
CREATE TABLE CMS_ONLINE_PROPERTIES (
    PROPERTY_ID NVARCHAR(36)  NOT NULL,
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_TYPE INT NOT NULL,
    PROPERTY_VALUE NTEXT NOT NULL,
    PRIMARY KEY(PROPERTY_ID),
    UNIQUE (PROPERTYDEF_ID, PROPERTY_MAPPING_ID)
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_PROPERTIES_01_IDX 
    ON CMS_ONLINE_PROPERTIES (PROPERTYDEF_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_PROPERTIES_02_IDX 
    ON CMS_ONLINE_PROPERTIES (PROPERTY_MAPPING_ID);
                                                                         
CREATE TABLE CMS_HISTORY_PROPERTIES (
    STRUCTURE_ID NVARCHAR(36)  NOT NULL,
    PROPERTYDEF_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_ID NVARCHAR(36)  NOT NULL,
    PROPERTY_MAPPING_TYPE INT NOT NULL,
    PROPERTY_VALUE NTEXT NOT NULL,
    PUBLISH_TAG INT,
    PRIMARY KEY(STRUCTURE_ID, PROPERTYDEF_ID, PROPERTY_MAPPING_TYPE, PUBLISH_TAG)
);

CREATE NONCLUSTERED INDEX CMS_HISTORY_PROPERTIES_01_IDX 
    ON CMS_HISTORY_PROPERTIES (PROPERTYDEF_ID);

CREATE NONCLUSTERED INDEX CMS_HISTORY_PROPERTIES_02_IDX 
    ON CMS_HISTORY_PROPERTIES (PROPERTY_MAPPING_ID);

CREATE NONCLUSTERED INDEX CMS_HISTORY_PROPERTIES_03_IDX 
    ON CMS_HISTORY_PROPERTIES (PROPERTYDEF_ID, PROPERTY_MAPPING_ID);
        
CREATE NONCLUSTERED INDEX CMS_HISTORY_PROPERTIES_04_IDX 
    ON CMS_HISTORY_PROPERTIES (STRUCTURE_ID,PUBLISH_TAG);
    
CREATE TABLE CMS_ONLINE_ACCESSCONTROL (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    PRINCIPAL_ID NVARCHAR(36)  NOT NULL,
    ACCESS_ALLOWED INT,
    ACCESS_DENIED INT,
    ACCESS_FLAGS INT,
    PRIMARY KEY (RESOURCE_ID, PRINCIPAL_ID)
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_ACCESSCONTROL_01_IDX 
    ON CMS_ONLINE_ACCESSCONTROL (PRINCIPAL_ID);
   
CREATE NONCLUSTERED INDEX CMS_ONLINE_ACCESSCONTROL_02_IDX 
    ON CMS_ONLINE_ACCESSCONTROL (RESOURCE_ID);
     
CREATE TABLE CMS_OFFLINE_ACCESSCONTROL (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    PRINCIPAL_ID NVARCHAR(36)  NOT NULL,
    ACCESS_ALLOWED INT,
    ACCESS_DENIED INT,
    ACCESS_FLAGS INT,
    PRIMARY KEY (RESOURCE_ID, PRINCIPAL_ID)
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_ACCESSCONTROL_01_IDX 
    ON CMS_OFFLINE_ACCESSCONTROL (PRINCIPAL_ID);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_ACCESSCONTROL_02_IDX 
    ON CMS_OFFLINE_ACCESSCONTROL (RESOURCE_ID);
        
CREATE TABLE CMS_PUBLISH_HISTORY (
    HISTORY_ID NVARCHAR(36)  NOT NULL,
    PUBLISH_TAG INT NOT NULL,
    STRUCTURE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_PATH NVARCHAR(511) NOT NULL,
    RESOURCE_STATE INT NOT NULL,
    RESOURCE_TYPE INT NOT NULL,
    SIBLING_COUNT INT NOT NULL,
    UNIQUE (HISTORY_ID, PUBLISH_TAG, STRUCTURE_ID, RESOURCE_PATH)
);

CREATE NONCLUSTERED INDEX CMS_PUBLISH_HISTORY_01_IDX 
    ON CMS_PUBLISH_HISTORY (PUBLISH_TAG);

CREATE NONCLUSTERED INDEX CMS_PUBLISH_HISTORY_02_IDX 
    ON CMS_PUBLISH_HISTORY (HISTORY_ID);
        
CREATE TABLE CMS_PUBLISH_JOBS (
    HISTORY_ID NVARCHAR(36) NOT NULL,
    PROJECT_ID NVARCHAR(36) NOT NULL,
    PROJECT_NAME NVARCHAR(255) NOT NULL,
    USER_ID NVARCHAR(36) NOT NULL,
    PUBLISH_LOCALE NVARCHAR(16) NOT NULL,
    PUBLISH_FLAGS INT NOT NULL,
    PUBLISH_LIST IMAGE,
    PUBLISH_REPORT IMAGE,
    RESOURCE_COUNT INT NOT NULL,
    ENQUEUE_TIME BIGINT NOT NULL,
    START_TIME BIGINT NOT NULL,
    FINISH_TIME BIGINT NOT NULL,
    PRIMARY KEY(HISTORY_ID)
);

CREATE TABLE CMS_RESOURCE_LOCKS (
  RESOURCE_PATH TEXT NOT NULL,
  USER_ID NVARCHAR(36) NOT NULL,
  PROJECT_ID NVARCHAR(36) NOT NULL,
  LOCK_TYPE INT NOT NULL
);

CREATE TABLE CMS_STATICEXPORT_LINKS (
    LINK_ID NVARCHAR(36)  NOT NULL,
    LINK_RFS_PATH NVARCHAR(511) NOT NULL,
    LINK_TYPE INT NOT NULL,
    LINK_PARAMETER TEXT,
    LINK_TIMESTAMP BIGINT,	
    PRIMARY KEY (LINK_ID)    
);

CREATE NONCLUSTERED INDEX CMS_STATICEXPORT_LINKS_01_IDX 
    ON CMS_STATICEXPORT_LINKS (LINK_RFS_PATH);
    
CREATE TABLE CMS_OFFLINE_STRUCTURE (
    STRUCTURE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    PARENT_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_PATH NVARCHAR(511)NOT NULL,
    STRUCTURE_STATE INT NOT NULL,
    DATE_RELEASED BIGINT NOT NULL,
    DATE_EXPIRED BIGINT NOT NULL,
    STRUCTURE_VERSION INT NOT NULL,
    PRIMARY KEY (STRUCTURE_ID)
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_01_IDX 
    ON CMS_OFFLINE_STRUCTURE (STRUCTURE_ID, RESOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_02_IDX 
    ON CMS_OFFLINE_STRUCTURE (RESOURCE_PATH, RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_03_IDX 
    ON CMS_OFFLINE_STRUCTURE (STRUCTURE_ID, RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_04_IDX 
    ON CMS_OFFLINE_STRUCTURE (STRUCTURE_STATE);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_05_IDX 
    ON CMS_OFFLINE_STRUCTURE (PARENT_ID);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_06_IDX 
    ON CMS_OFFLINE_STRUCTURE (RESOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_STRUCTURE_07_IDX 
    ON CMS_OFFLINE_STRUCTURE (RESOURCE_ID);
                            
CREATE TABLE CMS_ONLINE_STRUCTURE (
    STRUCTURE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    PARENT_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_PATH NVARCHAR(511) NOT NULL,
    STRUCTURE_STATE INT NOT NULL,
    DATE_RELEASED BIGINT NOT NULL,
    DATE_EXPIRED BIGINT NOT NULL,
    STRUCTURE_VERSION INT NOT NULL,
    PRIMARY KEY (STRUCTURE_ID)
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_01_IDX 
    ON CMS_ONLINE_STRUCTURE (STRUCTURE_ID, RESOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_02_IDX 
    ON CMS_ONLINE_STRUCTURE (RESOURCE_PATH, RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_03_IDX 
    ON CMS_ONLINE_STRUCTURE (STRUCTURE_ID, RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_04_IDX 
    ON CMS_ONLINE_STRUCTURE (STRUCTURE_STATE);
    
CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_05_IDX 
    ON CMS_ONLINE_STRUCTURE (PARENT_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_06_IDX 
    ON CMS_ONLINE_STRUCTURE (RESOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_ONLINE_STRUCTURE_07_IDX 
    ON CMS_ONLINE_STRUCTURE (RESOURCE_ID);
            
CREATE TABLE CMS_HISTORY_STRUCTURE (
    PUBLISH_TAG INT NOT NULL,
    VERSION INT NOT NULL,
    STRUCTURE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    PARENT_ID NVARCHAR(36) NOT NULL,
    RESOURCE_PATH NVARCHAR(511) NOT NULL,
    STRUCTURE_STATE INT NOT NULL,
    DATE_RELEASED BIGINT NOT NULL,
    DATE_EXPIRED BIGINT NOT NULL,
    STRUCTURE_VERSION INT NOT NULL,
    PRIMARY KEY (STRUCTURE_ID, PUBLISH_TAG, VERSION)
);

CREATE NONCLUSTERED INDEX CMS_HISTORY_STRUCTURE_01_IDX 
    ON CMS_HISTORY_STRUCTURE (STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_HISTORY_STRUCTURE_02_IDX 
    ON CMS_HISTORY_STRUCTURE (RESOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_HISTORY_STRUCTURE_03_IDX 
    ON CMS_HISTORY_STRUCTURE (PUBLISH_TAG);

CREATE NONCLUSTERED INDEX CMS_HISTORY_STRUCTURE_04_IDX 
    ON CMS_HISTORY_STRUCTURE (VERSION);
            
CREATE TABLE CMS_OFFLINE_RESOURCES (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_TYPE INT NOT NULL,
    RESOURCE_FLAGS INT NOT NULL,
    RESOURCE_STATE    INT NOT NULL,
    RESOURCE_SIZE INT NOT NULL,                                         
    DATE_CONTENT BIGINT NOT NULL,                                             
    SIBLING_COUNT INT NOT NULL,
    DATE_CREATED BIGINT NOT NULL,
    DATE_LASTMODIFIED BIGINT NOT NULL,
    USER_CREATED NVARCHAR(36)  NOT NULL,                                         
    USER_LASTMODIFIED NVARCHAR(36)  NOT NULL,
    PROJECT_LASTMODIFIED NVARCHAR(36) NULL,          
    RESOURCE_VERSION INT NOT NULL,
    PRIMARY KEY(RESOURCE_ID)
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCES_01_IDX 
    ON CMS_OFFLINE_RESOURCES (PROJECT_LASTMODIFIED);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCES_02_IDX 
    ON CMS_OFFLINE_RESOURCES (PROJECT_LASTMODIFIED, RESOURCE_SIZE);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCES_03_IDX 
    ON CMS_OFFLINE_RESOURCES (RESOURCE_SIZE);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCES_04_IDX 
    ON CMS_OFFLINE_RESOURCES (DATE_LASTMODIFIED);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCES_05_IDX 
    ON CMS_OFFLINE_RESOURCES (RESOURCE_TYPE);
                    
CREATE TABLE CMS_ONLINE_RESOURCES (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_TYPE INT NOT NULL,
    RESOURCE_FLAGS INT NOT NULL,
    RESOURCE_STATE    INT NOT NULL,
    RESOURCE_SIZE INT NOT NULL,
    DATE_CONTENT BIGINT NOT NULL,                                             
    SIBLING_COUNT INT NOT NULL,    
    DATE_CREATED BIGINT NOT NULL,
    DATE_LASTMODIFIED BIGINT NOT NULL,
    USER_CREATED NVARCHAR(36)  NOT NULL,                                         
    USER_LASTMODIFIED NVARCHAR(36)  NOT NULL,
    PROJECT_LASTMODIFIED NVARCHAR(36) NULL,
    RESOURCE_VERSION INT NOT NULL,
    PRIMARY KEY(RESOURCE_ID)
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCES_01_IDX 
    ON CMS_ONLINE_RESOURCES (PROJECT_LASTMODIFIED);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCES_02_IDX 
    ON CMS_ONLINE_RESOURCES (PROJECT_LASTMODIFIED, RESOURCE_SIZE);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCES_03_IDX 
    ON CMS_ONLINE_RESOURCES (RESOURCE_SIZE);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCES_04_IDX 
    ON CMS_ONLINE_RESOURCES (DATE_LASTMODIFIED);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCES_05_IDX 
    ON CMS_ONLINE_RESOURCES (RESOURCE_TYPE);
                                                           
CREATE TABLE CMS_HISTORY_RESOURCES (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    RESOURCE_TYPE INT NOT NULL,
    RESOURCE_FLAGS INT NOT NULL,
    RESOURCE_STATE    INT NOT NULL,
    RESOURCE_SIZE INT NOT NULL,
    DATE_CONTENT BIGINT NOT NULL,                                             
    SIBLING_COUNT INT NOT NULL,    
    DATE_CREATED BIGINT NOT NULL,
    DATE_LASTMODIFIED BIGINT NOT NULL,
    USER_CREATED NVARCHAR(36)  NOT NULL,
    USER_LASTMODIFIED NVARCHAR(36)  NOT NULL,
    PROJECT_LASTMODIFIED NVARCHAR(36) NOT NULL,
    PUBLISH_TAG INT NOT NULL,
    RESOURCE_VERSION INT NOT NULL,
    PRIMARY KEY(RESOURCE_ID, PUBLISH_TAG)
);

CREATE NONCLUSTERED INDEX CMS_HISTORY_RESOURCES_01_IDX 
    ON CMS_HISTORY_RESOURCES (RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_HISTORY_RESOURCES_02_IDX 
    ON CMS_HISTORY_RESOURCES (PUBLISH_TAG);
    
CREATE TABLE CMS_OFFLINE_CONTENTS (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    FILE_CONTENT IMAGE NOT NULL,
    PRIMARY KEY(RESOURCE_ID)
);

CREATE TABLE CMS_CONTENTS (
    RESOURCE_ID NVARCHAR(36)  NOT NULL,
    FILE_CONTENT IMAGE NOT NULL,
    PUBLISH_TAG_FROM INT,
    PUBLISH_TAG_TO INT,
    ONLINE_FLAG INT,
    PRIMARY KEY(RESOURCE_ID, PUBLISH_TAG_FROM),
    UNIQUE (RESOURCE_ID, PUBLISH_TAG_TO)
);

CREATE NONCLUSTERED INDEX CMS_CONTENTS_01_IDX 
    ON CMS_CONTENTS (RESOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_CONTENTS_02_IDX 
    ON CMS_CONTENTS (PUBLISH_TAG_FROM);

CREATE NONCLUSTERED INDEX CMS_CONTENTS_03_IDX 
    ON CMS_CONTENTS (PUBLISH_TAG_TO);

CREATE NONCLUSTERED INDEX CMS_CONTENTS_04_IDX 
    ON CMS_CONTENTS (RESOURCE_ID, ONLINE_FLAG);
                
CREATE TABLE CMS_ONLINE_RESOURCE_RELATIONS (
    RELATION_SOURCE_ID NVARCHAR(36) NOT NULL,
    RELATION_SOURCE_PATH NVARCHAR(511) NOT NULL,
    RELATION_TARGET_ID NVARCHAR(36) NOT NULL,
    RELATION_TARGET_PATH NVARCHAR(511) NOT NULL,
    RELATION_TYPE INT NOT NULL
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCE_RELATIONS_01_IDX 
    ON CMS_ONLINE_RESOURCE_RELATIONS (RELATION_SOURCE_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCE_RELATIONS_02_IDX 
    ON CMS_ONLINE_RESOURCE_RELATIONS (RELATION_SOURCE_PATH);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCE_RELATIONS_03_IDX 
    ON CMS_ONLINE_RESOURCE_RELATIONS (RELATION_TARGET_ID);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCE_RELATIONS_04_IDX 
    ON CMS_ONLINE_RESOURCE_RELATIONS (RELATION_TARGET_PATH);

CREATE NONCLUSTERED INDEX CMS_ONLINE_RESOURCE_RELATIONS_05_IDX 
    ON CMS_ONLINE_RESOURCE_RELATIONS (RELATION_TYPE);
                
CREATE TABLE CMS_OFFLINE_RESOURCE_RELATIONS (
    RELATION_SOURCE_ID NVARCHAR(36) NOT NULL,
    RELATION_SOURCE_PATH NVARCHAR(511) NOT NULL,
    RELATION_TARGET_ID NVARCHAR(36) NOT NULL,
    RELATION_TARGET_PATH NVARCHAR(511) NOT NULL,
    RELATION_TYPE INT NOT NULL
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCE_RELATIONS_01_IDX 
    ON CMS_OFFLINE_RESOURCE_RELATIONS (RELATION_SOURCE_ID);
    
CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCE_RELATIONS_02_IDX 
    ON CMS_OFFLINE_RESOURCE_RELATIONS (RELATION_SOURCE_PATH);
    
CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCE_RELATIONS_03_IDX 
    ON CMS_OFFLINE_RESOURCE_RELATIONS (RELATION_TARGET_ID);
    
CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCE_RELATIONS_04_IDX 
    ON CMS_OFFLINE_RESOURCE_RELATIONS (RELATION_TARGET_PATH);
    
CREATE NONCLUSTERED INDEX CMS_OFFLINE_RESOURCE_RELATIONS_05_IDX 
    ON CMS_OFFLINE_RESOURCE_RELATIONS (RELATION_TYPE);
    
CREATE TABLE CMS_LOG (
    USER_ID NVARCHAR(36) NOT NULL,
    LOG_DATE BIGINT NOT NULL,
    STRUCTURE_ID NVARCHAR(36) NOT NULL,
    LOG_TYPE INT NOT NULL,
    LOG_DATA NVARCHAR(511),
    PRIMARY KEY(USER_ID, LOG_DATE, LOG_TYPE, STRUCTURE_ID),
    UNIQUE (USER_ID, LOG_DATE, STRUCTURE_ID)
);

CREATE NONCLUSTERED INDEX CMS_LOG_01_IDX 
    ON CMS_LOG (USER_ID);

CREATE NONCLUSTERED INDEX CMS_LOG_02_IDX 
    ON CMS_LOG (LOG_DATE);

CREATE NONCLUSTERED INDEX CMS_LOG_03_IDX 
    ON CMS_LOG (STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_LOG_04_IDX 
    ON CMS_LOG (LOG_TYPE);

CREATE NONCLUSTERED INDEX CMS_LOG_05_IDX 
    ON CMS_LOG (USER_ID, STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_LOG_06_IDX 
    ON CMS_LOG (USER_ID, LOG_DATE);

CREATE NONCLUSTERED INDEX CMS_LOG_07_IDX 
    ON CMS_LOG (USER_ID, STRUCTURE_ID, LOG_DATE);

CREATE NONCLUSTERED INDEX CMS_LOG_08_IDX 
    ON CMS_LOG (USER_ID, LOG_TYPE, STRUCTURE_ID, LOG_DATE);
    
CREATE NONCLUSTERED INDEX CMS_LOG_09_IDX
	ON CMS_LOG (USER_ID, LOG_DATE, LOG_TYPE);
    
CREATE TABLE CMS_SUBSCRIPTION_VISIT (
    USER_ID NVARCHAR(36) NOT NULL,
    VISIT_DATE BIGINT NOT NULL,
    STRUCTURE_ID NVARCHAR(36),
    PRIMARY KEY(USER_ID, VISIT_DATE),
    UNIQUE (USER_ID, VISIT_DATE, STRUCTURE_ID)
);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_01_IDX 
    ON CMS_SUBSCRIPTION_VISIT (USER_ID);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_02_IDX 
    ON CMS_SUBSCRIPTION_VISIT (VISIT_DATE);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_03_IDX 
    ON CMS_SUBSCRIPTION_VISIT (STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_04_IDX 
    ON CMS_SUBSCRIPTION_VISIT (USER_ID, STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_05_IDX 
    ON CMS_SUBSCRIPTION_VISIT (USER_ID, VISIT_DATE);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_VISIT_06_IDX 
    ON CMS_SUBSCRIPTION_VISIT (USER_ID, STRUCTURE_ID, VISIT_DATE);



CREATE TABLE CMS_SUBSCRIPTION (
    PRINCIPAL_ID NVARCHAR(36) NOT NULL,
    STRUCTURE_ID NVARCHAR(36) NOT NULL,
    DATE_DELETED BIGINT NOT NULL,
    PRIMARY KEY(PRINCIPAL_ID, STRUCTURE_ID),
    UNIQUE (PRINCIPAL_ID, STRUCTURE_ID)
);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_01_IDX 
    ON CMS_SUBSCRIPTION (PRINCIPAL_ID);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_02_IDX 
    ON CMS_SUBSCRIPTION (STRUCTURE_ID);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_03_IDX 
    ON CMS_SUBSCRIPTION (DATE_DELETED);

CREATE NONCLUSTERED INDEX CMS_SUBSCRIPTION_04_IDX 
    ON CMS_SUBSCRIPTION (PRINCIPAL_ID, STRUCTURE_ID, DATE_DELETED);
    
CREATE TABLE CMS_COUNTERS (
	NAME NVARCHAR(255) NOT NULL,
	COUNTER INT NOT NULL,
	PRIMARY KEY(NAME)
);

CREATE TABLE CMS_OFFLINE_URLNAME_MAPPINGS (
	NAME NVARCHAR(255) NOT NULL,
	STRUCTURE_ID NVARCHAR(36) NOT NULL,
	STATE INT NOT NULL,
	DATE_CHANGED BIGINT NOT NULL,
	LOCALE NVARCHAR(10)
);

CREATE NONCLUSTERED INDEX CMS_OFFLINE_URLNAME_MAPPINGS_01_IDX
	ON CMS_OFFLINE_URLNAME_MAPPINGS (NAME);
	
CREATE NONCLUSTERED INDEX CMS_OFFLINE_URLNAME_MAPPINGS_02_IDX
	ON CMS_OFFLINE_URLNAME_MAPPINGS (STRUCTURE_ID);


CREATE TABLE CMS_ONLINE_URLNAME_MAPPINGS (
	NAME NVARCHAR(255) NOT NULL,
	STRUCTURE_ID NVARCHAR(36) NOT NULL,
	STATE INT NOT NULL,
	DATE_CHANGED BIGINT NOT NULL,
	LOCALE NVARCHAR(10)
);

CREATE NONCLUSTERED INDEX CMS_ONLINE_URLNAME_MAPPINGS_01_IDX
	ON CMS_ONLINE_URLNAME_MAPPINGS (NAME);
	
CREATE NONCLUSTERED INDEX CMS_ONLINE_URLNAME_MAPPINGS_02_IDX
	ON CMS_ONLINE_URLNAME_MAPPINGS (STRUCTURE_ID);


CREATE TABLE CMS_ALIASES (path NVARCHAR(256) NOT NULL, site_root NVARCHAR(64) NOT NULL, alias_mode INT NOT NULL, structure_id NVARCHAR(36) NOT NULL, PRIMARY KEY (path, site_root));
CREATE NONCLUSTERED INDEX CMS_ALIASES_IDX_1 ON CMS_ALIASES (structure_id);

CREATE TABLE CMS_USER_PUBLISH_LIST (USER_ID NVARCHAR(36) NOT NULL, STRUCTURE_ID NVARCHAR(36) NOT NULL, DATE_CHANGED BIGINT NOT NULL, PRIMARY KEY(USER_ID, STRUCTURE_ID));
CREATE NONCLUSTERED INDEX CMS_USERPUBLIST_IDX_01 ON CMS_USER_PUBLISH_LIST(USER_ID);
CREATE NONCLUSTERED INDEX CMS_USERPUBLIST_IDX_02 ON CMS_USER_PUBLISH_LIST(STRUCTURE_ID);

CREATE TABLE CMS_REWRITES (ID NVARCHAR(36) NOT NULL, ALIAS_MODE INT NOT NULL, PATTERN NVARCHAR(255) NOT NULL, REPLACEMENT VARCHAR(255) NOT NULL, SITE_ROOT NVARCHAR(64) NOT NULL, PRIMARY KEY (ID));
CREATE NONCLUSTERED INDEX CMS_REWRITES_IDX_01 ON CMS_REWRITES (SITE_ROOT);


