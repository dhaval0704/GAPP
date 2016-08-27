      alter table additional_field_entries 
        drop constraint FK_3ahqmnfet3a8jj6uw6ubj4xvr; 
        
    alter table additional_field_entries 
        drop constraint FK_d57vjojx6x9kuhm436kgwiiqj; 
       
    alter table additional_fields 
        drop constraint FK_qyv40nsual4f0j9ler18pe5pl;
    
    alter table additional_fields 
        drop constraint FK_hc4j6gc8r2td1681dpc50thai;
     
    alter table application_status_records 
        drop constraint FK_ska81me8tothdk1b2u9v1i2dl;
       
    alter table application_status_records 
        drop constraint FK_j840dt52mana5leyb6dxhyxl5;
     
    alter table applications 
        drop constraint FK_kc22r2eecydb5bx40h4kquae;     
    alter table applications 
        drop constraint FK_bluanikenmrafi5adj9w2oivc;
       
    alter table college_degrees 
        drop constraint FK_cnmd6nc2ioh610439km2rpd76; 
     
    alter table programs 
        drop constraint FK_b4wtwcq4peor9dokrq54eigee;
      
        drop table users;
        drop table additional_field_entries;
        drop table additional_fields;
        drop table application_status_records;
        drop table applications;
        drop table departments;
        drop table college_degrees;
        drop table display_statuses;
        drop table programs;
        drop sequence hibernate_sequence;
        
        
        
