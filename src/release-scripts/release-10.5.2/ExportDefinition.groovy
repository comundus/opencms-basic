/**
 * Export Definition for the release 10.5.2
 */
import static OpenCmsExport.*
/**
/** sample for module export without jar  */
module ([
    name: 'my.module.one'
])

/** sample for module export with jar  */
module ([
    name: 'my.module.two',
    addModuleJar: true
])

/** sample for module export with additional jars and resources
module ([
    name: 'my.module.three',
    addModuleJar: true,
    additionalModuleJars: [
        'commons-csv.jar',
        'api-all.jar',
        'commons-validator.jar',
        ]
    additionalFiles: [
        'webapp/target/webapp/WEB-INF/classes/org/opencms/main/version.properties': 'resources/classes/org/opencms/main/version.properties',
        ]
    
])
*/

/** sample for db export
export ([
    sitePath:'/',
    resources: [
        '/sites/default/.content/.config', 
        '/sites/default/.categories/sample1/', 
        '/sites/default/.categories/sample2/', 
        '/sites/default/.galleries/sample1/',
        ],
    fileName:'opencms/db-export/sample.zip',
    exportUsers: false
])
*/
