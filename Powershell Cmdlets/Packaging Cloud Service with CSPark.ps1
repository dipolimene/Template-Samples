cspack [DirectoryName]\[ServiceDefinition]
       /role:[RoleName];[RoleBinariesDirectory]
       /sites:[RoleName];[VirtualPath];[PhysicalPath]
       /out:[OutputFileName]



cspack [DirectoryName]\[ServiceDefinition]
       /out:[OutputFileName]
       /role:[RoleName];[RoleBinariesDirectory]
       /sites:[RoleName];[VirtualPath];[PhysicalPath]
       /role:[RoleName];[RoleBinariesDirectory];[RoleAssemblyName]



cspack C:\Users\855am\source\repos\repos\repos\ServiceDefinition.csdef 
/role:repoweb;C:\Users\855am\source\repos\repos\repoweb\bin 
/sites:repoweb;Web;C:\Users\855am\source\repos\repos\repoweb 
/role:repowork;C:\Users\855am\source\repos\repos\repowork\bin\Release;repowork.dll 
/out:repo



C:\Program Files\Microsoft SDKs\Azure\.NET SDK\v2.9\bin> 