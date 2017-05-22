
/*==============================================================*/
/* Table: APARTADO                                              */
/*==============================================================*/
create table APARTADO (
   ID                   SERIAL               not null,
   NOMBRE               TEXT                 null,
   CODIGO               TEXT                 null,
   constraint PK_APARTADO primary key (ID)
);

/*==============================================================*/
/* Index: APARTADO_PK                                           */
/*==============================================================*/
create unique index APARTADO_PK on APARTADO (
ID
);

/*==============================================================*/
/* Table: APARTADO_PREGUNTA                                     */
/*==============================================================*/
create table APARTADO_PREGUNTA (
   ID                   SERIAL               not null,
   APARTADO             INT4                 null,
   PREGUNTA             INT4                 null,
   RESPUESTA            INT4                 null,
   ORDEN                INT4                 null,
   ESTADO               BOOL                 null,
   VALOR_PREGUNTA       DECIMAL(5,2)         null,
   constraint PK_APARTADO_PREGUNTA primary key (ID)
);

/*==============================================================*/
/* Index: APARTADO_PREGUNTA_PK                                  */
/*==============================================================*/
create unique index APARTADO_PREGUNTA_PK on APARTADO_PREGUNTA (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on APARTADO_PREGUNTA (
APARTADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on APARTADO_PREGUNTA (
PREGUNTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_19_FK on APARTADO_PREGUNTA (
RESPUESTA
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID                   SERIAL               not null,
   PAIS                 INT4                 null,
   PROVINCIA            INT4                 null,
   NOMBRE               TEXT                 null,
   ESTADO               BOOL                 null,
   constraint PK_CIUDAD primary key (ID)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
ID
);

/*==============================================================*/
/* Index: FK_PAI_CIU_FK                                         */
/*==============================================================*/
create  index FK_PAI_CIU_FK on CIUDAD (
PAIS
);

/*==============================================================*/
/* Index: FK_PRO_CIUD_FK                                        */
/*==============================================================*/
create  index FK_PRO_CIUD_FK on CIUDAD (
PROVINCIA
);

/*==============================================================*/
/* Table: DATOS_EXAMEN                                          */
/*==============================================================*/
create table DATOS_EXAMEN (
   APARTADO_PREGUNTA    INT4                 not null,
   EXAMEN               INT4                 not null,
   RESPUESTA            INT4                 null,
   FECHA                DATE                 null,
   constraint PK_DATOS_EXAMEN primary key (APARTADO_PREGUNTA, EXAMEN)
);

/*==============================================================*/
/* Index: DATOS_EXAMEN_PK                                       */
/*==============================================================*/
create unique index DATOS_EXAMEN_PK on DATOS_EXAMEN (
APARTADO_PREGUNTA,
EXAMEN
);

/*==============================================================*/
/* Index: FK_EXA_DATEXAM_FK                                     */
/*==============================================================*/
create  index FK_EXA_DATEXAM_FK on DATOS_EXAMEN (
EXAMEN
);

/*==============================================================*/
/* Index: RELATIONSHIP_24_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_24_FK on DATOS_EXAMEN (
APARTADO_PREGUNTA
);

/*==============================================================*/
/* Table: DETALLE_EXAMEN                                        */
/*==============================================================*/
create table DETALLE_EXAMEN (
   ID                   SERIAL               not null,
   FORMULARIO_APARTADO  INT4                 null,
   EXAMEN               INT4                 null,
   VALOR                DECIMAL(5,2)         null,
   constraint PK_DETALLE_EXAMEN primary key (ID)
);

/*==============================================================*/
/* Index: DETALLE_EXAMEN_PK                                     */
/*==============================================================*/
create unique index DETALLE_EXAMEN_PK on DETALLE_EXAMEN (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_26_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_26_FK on DETALLE_EXAMEN (
FORMULARIO_APARTADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_27_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_27_FK on DETALLE_EXAMEN (
EXAMEN
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID                   SERIAL               not null,
   CIUDAD               INT4                 null,
   TIPO_EMPRESA         INT4                 null,
   NOMBRE               TEXT                 null,
   MAIL                 TEXT                 null,
   TELEFONO             TEXT                 null,
   DIRECCION            TEXT                 null,
   constraint PK_EMPRESA primary key (ID)
);

comment on column EMPRESA.ID is
'primary key de tabla';

/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on EMPRESA (
ID
);

/*==============================================================*/
/* Index: FK_CIU_EMP_FK                                         */
/*==============================================================*/
create  index FK_CIU_EMP_FK on EMPRESA (
CIUDAD
);

/*==============================================================*/
/* Index: FK_TIP_EMPRESA_FK                                     */
/*==============================================================*/
create  index FK_TIP_EMPRESA_FK on EMPRESA (
TIPO_EMPRESA
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN (
   ID                   SERIAL               not null,
   EMPRESA              INT4                 null,
   FORMULARIO           INT4                 null,
   FECHA                DATE                 null,
   ESTADO               BOOL                 null,
   CODIGO               TEXT                 null,
   TOTAL                DECIMAL(5,2)         null,
   constraint PK_EXAMEN primary key (ID)
);

comment on table EXAMEN is
'objeto donde se ingresa respuestas';

comment on column EXAMEN.EMPRESA is
'primary key de tabla';

/*==============================================================*/
/* Index: EXAMEN_PK                                             */
/*==============================================================*/
create unique index EXAMEN_PK on EXAMEN (
ID
);

/*==============================================================*/
/* Index: FK_EMPRESA_EXAMEN_FK                                  */
/*==============================================================*/
create  index FK_EMPRESA_EXAMEN_FK on EXAMEN (
EMPRESA
);

/*==============================================================*/
/* Index: FK_FORM_EXAMEN_FK                                     */
/*==============================================================*/
create  index FK_FORM_EXAMEN_FK on EXAMEN (
FORMULARIO
);

/*==============================================================*/
/* Table: FORMULARIO                                            */
/*==============================================================*/
create table FORMULARIO (
   ID                   SERIAL               not null,
   NOMBRE               TEXT                 null,
   DESCRIPCION          TEXT                 null,
   FECHA                DATE                 null,
   CODIGO               TEXT                 null,
   ESTADO               BOOL                 null,
   constraint PK_FORMULARIO primary key (ID)
);

/*==============================================================*/
/* Index: FORMULARIO_PK                                         */
/*==============================================================*/
create unique index FORMULARIO_PK on FORMULARIO (
ID
);

/*==============================================================*/
/* Table: FORMULARIO_APARTADO                                   */
/*==============================================================*/
create table FORMULARIO_APARTADO (
   ID                   SERIAL               not null,
   FORMULARIO           INT4                 null,
   APARTADO             INT4                 null,
   ORDEN                INT4                 null,
   ESTADO               BOOL                 null,
   VALOR_APARTADO       DECIMAL(5,2)         null,
   constraint PK_FORMULARIO_APARTADO primary key (ID)
);

/*==============================================================*/
/* Index: APARA_PK                                              */
/*==============================================================*/
create unique index APARA_PK on FORMULARIO_APARTADO (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on FORMULARIO_APARTADO (
FORMULARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on FORMULARIO_APARTADO (
APARTADO
);

/*==============================================================*/
/* Table: GRUPO_RESPUESTA                                       */
/*==============================================================*/
create table GRUPO_RESPUESTA (
   ID                   SERIAL               not null,
   NOMBRE               TEXT                 null,
   CODIGO               TEXT                 null,
   constraint PK_GRUPO_RESPUESTA primary key (ID)
);

comment on column GRUPO_RESPUESTA.ID is
'clave primaria de grupo';

/*==============================================================*/
/* Index: GRUPO_PK                                              */
/*==============================================================*/
create unique index GRUPO_PK on GRUPO_RESPUESTA (
ID
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID                   SERIAL               not null,
   NOMBRE               TEXT                 null,
   NACIONALIDAD         TEXT                 null,
   ESTADO               BOOL                 null,
   constraint PK_PAIS primary key (ID)
);

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
ID
);

/*==============================================================*/
/* Table: PREGUNTA                                              */
/*==============================================================*/
create table PREGUNTA (
   ID                   SERIAL               not null,
   GRUPO_RESPUESTA      INT4                 null,
   NOMBRE               TEXT                 not null,
   CODIGO               TEXT                 null,
   constraint PK_PREGUNTA primary key (ID)
);

comment on column PREGUNTA.GRUPO_RESPUESTA is
'clave primaria de grupo';

/*==============================================================*/
/* Index: PREGUNTA_PK                                           */
/*==============================================================*/
create unique index PREGUNTA_PK on PREGUNTA (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_28_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_28_FK on PREGUNTA (
GRUPO_RESPUESTA
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID                   SERIAL               not null,
   PAIS                 INT4                 null,
   NOMBRE               TEXT                 null,
   ESTADO               BOOL                 null,
   constraint PK_PROVINCIA primary key (ID)
);

/*==============================================================*/
/* Index: PROVINCIA_PK                                          */
/*==============================================================*/
create unique index PROVINCIA_PK on PROVINCIA (
ID
);

/*==============================================================*/
/* Index: FK_PAIS_PROV_FK                                       */
/*==============================================================*/
create  index FK_PAIS_PROV_FK on PROVINCIA (
PAIS
);

/*==============================================================*/
/* Table: RECOMENDACION                                         */
/*==============================================================*/
create table RECOMENDACION (
   ID                   SERIAL               not null,
   FORMULARIO           INT4                 null,
   NOMBRE               TEXT                 null,
   DESCRIPCION          TEXT                 null,
   VALOR_INICIO         DECIMAL(4,2)         null,
   VALOR_FIN            DECIMAL(4,2)         null,
   constraint PK_RECOMENDACION primary key (ID)
);

/*==============================================================*/
/* Index: RECOMENDACION_PK                                      */
/*==============================================================*/
create unique index RECOMENDACION_PK on RECOMENDACION (
ID
);

/*==============================================================*/
/* Index: FK_FORM_RECOMENDACION_FK                              */
/*==============================================================*/
create  index FK_FORM_RECOMENDACION_FK on RECOMENDACION (
FORMULARIO
);

/*==============================================================*/
/* Table: RECOMENDACION_EXAMEN                                  */
/*==============================================================*/
create table RECOMENDACION_EXAMEN (
   ID                   SERIAL               not null,
   RECOMENDACION        INT4                 null,
   EXAMEN               INT4                 null,
   constraint PK_RECOMENDACION_EXAMEN primary key (ID)
);

/*==============================================================*/
/* Index: RECOMENDACION_EXAMEN_PK                               */
/*==============================================================*/
create unique index RECOMENDACION_EXAMEN_PK on RECOMENDACION_EXAMEN (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on RECOMENDACION_EXAMEN (
RECOMENDACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_22_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_22_FK on RECOMENDACION_EXAMEN (
EXAMEN
);

/*==============================================================*/
/* Table: RESPUESTA                                             */
/*==============================================================*/
create table RESPUESTA (
   ID                   SERIAL               not null,
   GRUPO                INT4                 null,
   NOMBRE               TEXT                 not null,
   CODIGO               TEXT                 null,
   constraint PK_RESPUESTA primary key (ID)
);

comment on column RESPUESTA.GRUPO is
'clave primaria de grupo';

/*==============================================================*/
/* Index: RESPUESTA_PK                                          */
/*==============================================================*/
create unique index RESPUESTA_PK on RESPUESTA (
ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RESPUESTA (
GRUPO
);

/*==============================================================*/
/* Table: TIPO_EMPRESA                                          */
/*==============================================================*/
create table TIPO_EMPRESA (
   ID                   SERIAL               not null,
   NOMBRE               TEXT                 null,
   DESCRIPCION          TEXT                 null,
   CODIGO               TEXT                 null,
   ESTADO               BOOL                 null,
   constraint PK_TIPO_EMPRESA primary key (ID)
);

/*==============================================================*/
/* Index: TIPO_EMPRESA_PK                                       */
/*==============================================================*/
create unique index TIPO_EMPRESA_PK on TIPO_EMPRESA (
ID
);

alter table APARTADO_PREGUNTA
   add constraint FK_APARTADO_RELATIONS_FORMULAR foreign key (APARTADO)
      references FORMULARIO_APARTADO (ID)
      on delete restrict on update restrict;

alter table APARTADO_PREGUNTA
   add constraint FK_APARTADO_RELATIONS_PREGUNTA foreign key (PREGUNTA)
      references PREGUNTA (ID)
      on delete restrict on update restrict;

alter table APARTADO_PREGUNTA
   add constraint FK_APARTADO_RELATIONS_RESPUEST foreign key (RESPUESTA)
      references RESPUESTA (ID)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_FK_PAI_CI_PAIS foreign key (PAIS)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table CIUDAD
   add constraint FK_CIUDAD_FK_PRO_CI_PROVINCI foreign key (PROVINCIA)
      references PROVINCIA (ID)
      on delete restrict on update restrict;

alter table DATOS_EXAMEN
   add constraint FK_DATOS_EX_RELATIONS_EXAMEN foreign key (EXAMEN)
      references EXAMEN (ID)
      on delete restrict on update restrict;

alter table DATOS_EXAMEN
   add constraint FK_DATOS_EX_RELATIONS_APARTADO foreign key (APARTADO_PREGUNTA)
      references APARTADO_PREGUNTA (ID)
      on delete restrict on update restrict;

alter table DATOS_EXAMEN
   add constraint FK_DATOS_EX_RELATIONS_RESPUEST foreign key (RESPUESTA)
      references RESPUESTA (ID)
      on delete restrict on update restrict;

alter table DETALLE_EXAMEN
   add constraint FK_DETALLE__RELATIONS_FORMULAR foreign key (FORMULARIO_APARTADO)
      references FORMULARIO_APARTADO (ID)
      on delete restrict on update restrict;

alter table DETALLE_EXAMEN
   add constraint FK_DETALLE__RELATIONS_EXAMEN foreign key (EXAMEN)
      references EXAMEN (ID)
      on delete restrict on update restrict;

alter table EMPRESA
   add constraint FK_EMPRESA_FK_CIU_EM_CIUDAD foreign key (CIUDAD)
      references CIUDAD (ID)
      on delete restrict on update restrict;

alter table EMPRESA
   add constraint FK_EMPRESA_FK_TIP_EM_TIPO_EMP foreign key (TIPO_EMPRESA)
      references TIPO_EMPRESA (ID)
      on delete restrict on update restrict;

alter table EXAMEN
   add constraint FK_EXAMEN_FK_EMPRES_EMPRESA foreign key (EMPRESA)
      references EMPRESA (ID)
      on delete restrict on update restrict;

alter table EXAMEN
   add constraint FK_EXAMEN_FK_FRM_EX_FORMULAR foreign key (FORMULARIO)
      references FORMULARIO (ID)
      on delete restrict on update restrict;

alter table FORMULARIO_APARTADO
   add constraint FK_FORMULAR_RELATIONS_FORMULAR foreign key (FORMULARIO)
      references FORMULARIO (ID)
      on delete restrict on update restrict;

alter table FORMULARIO_APARTADO
   add constraint FK_FORMULAR_RELATIONS_APARTADO foreign key (APARTADO)
      references APARTADO (ID)
      on delete restrict on update restrict;

alter table PREGUNTA
   add constraint FK_PREGUNTA_RELATIONS_GRUPO_RE foreign key (GRUPO_RESPUESTA)
      references GRUPO_RESPUESTA (ID)
      on delete restrict on update restrict;

alter table PROVINCIA
   add constraint FK_PROVINCI_FK_PAIS_P_PAIS foreign key (PAIS)
      references PAIS (ID)
      on delete restrict on update restrict;

alter table RECOMENDACION
   add constraint FK_RECOMEND_FK_FRM_RE_FORMULAR foreign key (FORMULARIO)
      references FORMULARIO (ID)
      on delete restrict on update restrict;

alter table RECOMENDACION_EXAMEN
   add constraint FK_RECOMEND_RELATIONS_RECOMEND foreign key (RECOMENDACION)
      references RECOMENDACION (ID)
      on delete restrict on update restrict;

alter table RECOMENDACION_EXAMEN
   add constraint FK_RECOMEND_RELATIONS_EXAMEN foreign key (EXAMEN)
      references EXAMEN (ID)
      on delete restrict on update restrict;

alter table RESPUESTA
   add constraint FK_RESPUEST_RELATIONS_GRUPO_RE foreign key (GRUPO)
      references GRUPO_RESPUESTA (ID)
      on delete restrict on update restrict;
