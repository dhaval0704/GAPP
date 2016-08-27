create sequence hibernate_sequence minvalue 100;

    create table additional_field_entries (
        additional_field_entry_id int4 not null,
        additional_field_name varchar(255),
        additional_field_type varchar(255),
        additional_field_value varchar(255),
        addField_additional_field_id int4,
        app_application_id int4,
        primary key (additional_field_entry_id)
    );

    create table additional_fields (
        additional_field_id int4 not null,
        field_name varchar(255),
        field_type varchar(255),
        isDeleted boolean not null,
        field_isrequired boolean,
        dept_department_id int4,
        user_user_id int4,
        primary key (additional_field_id)
    );

    create table application_status_records (
        application_status_id int4 not null,
        application_status varchar(255),
        changed_status_timestamp timestamp,
        comment varchar(255),
        is_current_status boolean,
        app_application_id int4,
        user_user_id int4,
        primary key (application_status_id)
    );

    create table applications (
        application_id int4 not null,
        cin varchar(255),
        citizenship varchar(255),
        current_application_status varchar(255),
        date_of_birth timestamp,
        email varchar(255),
        first_name varchar(255),
        gender varchar(255),
        gpa float8,
        is_international_student varchar(255),
        last_name varchar(255),
        phone_number varchar(255),
        submitted_datetime timestamp,
        term varchar(255),
        toefl_score int4,
        transcript varchar(255),
        prg_program_id int4,
        user_user_id int4,
        primary key (application_id)
    );

    create table college_degrees (
        college_id int4 not null,
        attended_time_period varchar(255),
        college_name varchar(255),
        degree_earned varchar(255),
        college_field varchar(255),
        app_application_id int4,
        primary key (college_id)
    );

    create table departments (
        department_id int4 not null,
        department_name varchar(255),
        primary key (department_id)
    );

    create table display_statuses (
        status_id int4 not null,
        status_name varchar(255),
        primary key (status_id)
    );

    create table programs (
        program_id int4 not null,
        isDeleted boolean not null,
        program_name varchar(255),
        dept_department_id int4,
        primary key (program_id)
    );

    create table users (
        user_id int4 not null,
        email varchar(255),
        password varchar(255),
        user_type varchar(255),
        user_first_name varchar(255),
        user_last_name varchar(255),
        primary key (user_id)
    );

    alter table additional_field_entries 
        add constraint FK_3ahqmnfet3a8jj6uw6ubj4xvr 
        foreign key (addField_additional_field_id) 
        references additional_fields;

    alter table additional_field_entries 
        add constraint FK_d57vjojx6x9kuhm436kgwiiqj 
        foreign key (app_application_id) 
        references applications;

    alter table additional_fields 
        add constraint FK_qyv40nsual4f0j9ler18pe5pl 
        foreign key (dept_department_id) 
        references departments;

    alter table additional_fields 
        add constraint FK_hc4j6gc8r2td1681dpc50thai 
        foreign key (user_user_id) 
        references users;

    alter table application_status_records 
        add constraint FK_ska81me8tothdk1b2u9v1i2dl 
        foreign key (app_application_id) 
        references applications;

    alter table application_status_records 
        add constraint FK_j840dt52mana5leyb6dxhyxl5 
        foreign key (user_user_id) 
        references users;

    alter table applications 
        add constraint FK_kc22r2eecydb5bx40h4kquae 
        foreign key (prg_program_id) 
        references programs;

    alter table applications 
        add constraint FK_bluanikenmrafi5adj9w2oivc 
        foreign key (user_user_id) 
        references users;

    alter table college_degrees 
        add constraint FK_cnmd6nc2ioh610439km2rpd76 
        foreign key (app_application_id) 
        references applications;

    alter table programs 
        add constraint FK_b4wtwcq4peor9dokrq54eigee 
        foreign key (dept_department_id) 
        references departments;

    

    

    


Insert Into users(user_id,email,password,user_type,user_first_name,user_last_name) values (1,'admin@localhost.localdomain','abcd','admin','chengyu','sun');
Insert Into users(user_id,email,password,user_type,user_first_name,user_last_name) values (2,'staff1@localhost.localdomain','abcd','staff','brett','lee');
Insert Into users(user_id,email,password,user_type,user_first_name,user_last_name) values (3,'staff2@localhost.localdomain','abcd','staff','brian','lara');
Insert Into users(user_id,email,password,user_type,user_first_name,user_last_name) values (4,'student1@localhost.localdomain','abcd','student','Rohan','Shah');
Insert Into users(user_id,email,password,user_type,user_first_name,user_last_name) values (5,'student2@localhost.localdomain','abcd','student','Ruchit','Shah');

Insert into departments(department_id,department_name) values (1,'Accounting Department');
Insert into departments(department_id,department_name) values (2,'Computer Science Department');

Insert into programs(program_id,program_name,dept_department_id,isdeleted) values (1,'MS in Accounting',1,false);
Insert into programs(program_id,program_name,dept_department_id,isdeleted) values (2,'MS in Computer Science',2,false);



Insert Into applications(application_id,term,prg_program_id,gpa,toefl_score,transcript,current_application_status,cin,citizenship,date_of_birth,gender,is_international_student,phone_number,user_user_id,submitted_datetime)
values(1,'Fall 2016',1,3.5,80,null,'New','305058017','AFRICAN','04/07/1991','Male','Yes','6263287672',4,'2016-07-02 01:00:00');

Insert into additional_fields (additional_field_id,field_name,field_type,field_isrequired,dept_department_id,user_user_id,isdeleted)
values(1,'GMAT','NUMBER','1',1,2,false);


Insert Into application_status_records (application_status_id,application_status,changed_status_timestamp,comment,is_current_status,app_application_id,user_user_id)
values(1,'New','01/28/2016 09:00:00','It is new application.','1',1,1);

Insert into additional_field_entries( additional_field_entry_id,additional_field_value,addfield_additional_field_id,app_application_id,additional_field_name,additional_field_type)
values(1,'90',1,1,'GMAT','NUMBER');


Insert into display_statuses (status_id,status_name)values(1,'New');
Insert into display_statuses (status_id,status_name)values(2,'Pending Review');
Insert into display_statuses (status_id,status_name)values(3,'Denied');
Insert into display_statuses (status_id,status_name)values(4,'Recommend Admit');
Insert into display_statuses (status_id,status_name)values(5,'Recommend Admit w/ Condition')


