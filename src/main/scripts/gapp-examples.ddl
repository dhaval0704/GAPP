
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

    create sequence hibernate_sequence;
