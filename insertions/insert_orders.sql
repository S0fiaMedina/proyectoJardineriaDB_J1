CALL insert_data_order(1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
CALL insert_data_order(2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5);
CALL insert_data_order(3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
CALL insert_data_order(4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);
CALL insert_data_order(8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
CALL insert_data_order(9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
CALL insert_data_order(10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
CALL insert_data_order(11,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
CALL insert_data_order(12,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
CALL insert_data_order(13,'2009-01-12','2009-01-14','2009-01-15','Entregado',NULL,7);
CALL insert_data_order(14,'2009-01-02','2009-01-02',null,'Rechazado','mal pago',7);
CALL insert_data_order(15,'2009-01-09','2009-01-12','2009-01-11','Entregado',NULL,7);
CALL insert_data_order(16,'2009-01-06','2009-01-07','2009-01-15','Entregado',NULL,7);
CALL insert_data_order(17,'2009-01-08','2009-01-09','2009-01-11','Entregado','mal estado',7);
CALL insert_data_order(18,'2009-01-05','2009-01-06','2009-01-07','Entregado',NULL,9);
CALL insert_data_order(19,'2009-01-18','2009-02-12',NULL,'Pendiente','entregar en murcia',9);
CALL insert_data_order(20,'2009-01-20','2009-02-15',NULL,'Pendiente',NULL,9);
CALL insert_data_order(21,'2009-01-09','2009-01-09','2009-01-09','Rechazado','mal pago',9);
CALL insert_data_order(22,'2009-01-11','2009-01-11','2009-01-13','Entregado',NULL,9);
CALL insert_data_order(23,'2008-12-30','2009-01-10',NULL,'Rechazado','El pedido fue anulado por el cliente',5);
CALL insert_data_order(24,'2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14);
CALL insert_data_order(25,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
CALL insert_data_order(26,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
CALL insert_data_order(27,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
CALL insert_data_order(28,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
CALL insert_data_order(29,'2008-08-01','2008-09-01','2008-09-01','Rechazado','El cliente no está conforme con el pedido',14);
CALL insert_data_order(30,'2008-08-03','2008-09-03','2008-08-31','Entregado',NULL,13);
CALL insert_data_order(31,'2008-09-04','2008-09-30','2008-10-04','Rechazado','El cliente ha rechazado por llegar 5 dias tarde',13);
CALL insert_data_order(32,'2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardia, el cliente puso reclamacion',4);
CALL insert_data_order(33,'2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4);
CALL insert_data_order(34,'2007-06-20','2008-06-28','2008-06-28','Entregado','Pagado a plazos',4);
CALL insert_data_order(35,'2008-03-10','2009-03-20',NULL,'Rechazado','Limite de credito superado',4);
CALL insert_data_order(36,'2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14);
CALL insert_data_order(37,'2008-11-03','2009-11-13',NULL,'Pendiente','El pedido nunca llego a su destino',4);
CALL insert_data_order(38,'2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19);
CALL insert_data_order(39,'2009-03-06','2009-03-07','2009-03-09','Pendiente',NULL,19);
CALL insert_data_order(40,'2009-03-09','2009-03-10','2009-03-13','Rechazado',NULL,19);
CALL insert_data_order(41,'2009-03-12','2009-03-13','2009-03-13','Entregado',NULL,19);
CALL insert_data_order(42,'2009-03-22','2009-03-23','2009-03-27','Entregado',NULL,19);
CALL insert_data_order(43,'2009-03-25','2009-03-26','2009-03-28','Pendiente',NULL,23);
CALL insert_data_order(44,'2009-03-26','2009-03-27','2009-03-30','Pendiente',NULL,23);
CALL insert_data_order(45,'2009-04-01','2009-03-04','2009-03-07','Entregado',NULL,23);
CALL insert_data_order(46,'2009-04-03','2009-03-04','2009-03-05','Rechazado',NULL,23);
CALL insert_data_order(47,'2009-04-15','2009-03-17','2009-03-17','Entregado',NULL,23);
CALL insert_data_order(48,'2008-03-17','2008-03-30','2008-03-29','Entregado','Según el Cliente, el pedido llegó defectuoso',26);
CALL insert_data_order(49,'2008-07-12','2008-07-22','2008-07-30','Entregado','El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora',26);
CALL insert_data_order(50,'2008-03-17','2008-08-09',NULL,'Pendiente','Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)',26);
CALL insert_data_order(51,'2008-10-01','2008-10-14','2008-10-14','Entregado','Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.',26);
CALL insert_data_order(52,'2008-12-07','2008-12-21',NULL,'Pendiente','El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado.',26);
CALL insert_data_order(53,'2008-10-15','2008-11-15','2008-11-09','Entregado','El pedido llega 6 dias antes',13);
CALL insert_data_order(54,'2009-01-11','2009-02-11',NULL,'Pendiente',NULL,14);
CALL insert_data_order(55,'2008-12-10','2009-01-10','2009-01-11','Entregado','Retrasado 1 dia por problemas de transporte',14);
CALL insert_data_order(56,'2008-12-19','2009-01-20',NULL,'Rechazado','El cliente a anulado el pedido el dia 2009-01-10',13);
CALL insert_data_order(57,'2009-01-05','2009-02-05',NULL,'Pendiente',NULL,13);
CALL insert_data_order(58,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',3);
CALL insert_data_order(59,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
CALL insert_data_order(60,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
CALL insert_data_order(61,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
CALL insert_data_order(62,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
CALL insert_data_order(63,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
CALL insert_data_order(64,'2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',1);
CALL insert_data_order(65,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
CALL insert_data_order(66,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas producto',3);
CALL insert_data_order(67,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
CALL insert_data_order(68,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
CALL insert_data_order(74,'2009-01-14','2009-01-22',NULL,'Rechazado','El pedido no llego el dia que queria el cliente por fallo del transporte',15);
CALL insert_data_order(75,'2009-01-11','2009-01-13','2009-01-13','Entregado','El pedido llego perfectamente',15);
CALL insert_data_order(76,'2008-11-15','2008-11-23','2008-11-23','Entregado',NULL,15);
CALL insert_data_order(77,'2009-01-03','2009-01-08',NULL,'Pendiente','El pedido no pudo ser entregado por problemas meteorologicos',15);
CALL insert_data_order(78,'2008-12-15','2008-12-17','2008-12-17','Entregado','Fue entregado, pero faltaba mercancia que sera entregada otro dia',15);
CALL insert_data_order(79,'2009-01-12','2009-01-13','2009-01-13','Entregado',NULL,28);
CALL insert_data_order(80,'2009-01-25','2009-01-26',NULL,'Pendiente','No terminó el pago',28);
CALL insert_data_order(81,'2009-01-18','2009-01-24',NULL,'Rechazado','Los producto estaban en mal estado',28);
CALL insert_data_order(82,'2009-01-20','2009-01-29','2009-01-29','Entregado','El pedido llego un poco mas tarde de la hora fijada',28);
CALL insert_data_order(83,'2009-01-24','2009-01-28',NULL,'Entregado',NULL,28);
CALL insert_data_order(89,'2007-10-05','2007-12-13','2007-12-10','Entregado','La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho',35);
CALL insert_data_order(90,'2009-02-07','2008-02-17',NULL,'Pendiente','Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día ',27);
CALL insert_data_order(91,'2009-03-18','2009-03-29','2009-03-27','Entregado','Todo se entregó a su debido tiempo, incluso con un día de antelación',27);
CALL insert_data_order(92,'2009-04-19','2009-04-30','2009-05-03','Entregado','El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas',27);
CALL insert_data_order(93,'2009-05-03','2009-05-30','2009-05-17','Entregado','El pedido se entregó antes de lo esperado.',27);
CALL insert_data_order(94,'2009-10-18','2009-11-01',NULL,'Pendiente','El pedido está en camino.',27);
CALL insert_data_order(95,'2008-01-04','2008-01-19','2008-01-19','Entregado',NULL,35);
CALL insert_data_order(96,'2008-03-20','2008-04-12','2008-04-13','Entregado','La entrega se retraso un dia',35);
CALL insert_data_order(97,'2008-10-08','2008-11-25','2008-11-25','Entregado',NULL,35);
CALL insert_data_order(98,'2009-01-08','2009-02-13',NULL,'Pendiente',NULL,35);
CALL insert_data_order(99,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
CALL insert_data_order(100,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
CALL insert_data_order(101,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
CALL insert_data_order(102,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
CALL insert_data_order(103,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
CALL insert_data_order(104,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
CALL insert_data_order(105,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
CALL insert_data_order(106,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
CALL insert_data_order(107,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
CALL insert_data_order(108,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
CALL insert_data_order(109,'2006-05-25','2006-07-28','2006-07-28','Entregado',NULL,38);
CALL insert_data_order(110,'2007-03-19','2007-04-24','2007-04-24','Entregado',NULL,38);
CALL insert_data_order(111,'2008-03-05','2008-03-30','2008-03-30','Entregado',NULL,36);
CALL insert_data_order(112,'2009-03-05','2009-04-06','2009-05-07','Pendiente',NULL,36);
CALL insert_data_order(113,'2008-10-28','2008-11-09','2009-01-09','Rechazado','El producto ha sido rechazado por la tardanza de el envio',36);
CALL insert_data_order(114,'2009-01-15','2009-01-29','2009-01-31','Entregado','El envio llego dos dias más tarde debido al mal tiempo',36);
CALL insert_data_order(115,'2008-11-29','2009-01-26','2009-02-27','Pendiente',NULL,36);
CALL insert_data_order(116,'2008-06-28','2008-08-01','2008-08-01','Entregado',NULL,38);
CALL insert_data_order(117,'2008-08-25','2008-10-01',NULL,'Rechazado','El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente',38);
CALL insert_data_order(118,'2009-02-15','2009-02-27',NULL,'Pendiente',NULL,16);
CALL insert_data_order(119,'2009-01-10','2009-01-15','2009-01-15','Entregado','El pedido llego perfectamente',16);
CALL insert_data_order(120,'2009-03-07','2009-03-27',NULL,'Rechazado','El pedido fue rechazado por el cliente',16);
CALL insert_data_order(121,'2008-12-28','2009-01-08','2009-01-08','Entregado','Pago pendiente',16);
CALL insert_data_order(122,'2009-04-09','2009-04-15','2009-04-15','Entregado',NULL,16);
CALL insert_data_order(123,'2009-01-15','2009-01-20','2009-01-24','Pendiente',NULL,30);
CALL insert_data_order(124,'2009-03-02','2009-03-06','2009-03-06','Entregado',NULL,30);
CALL insert_data_order(125,'2009-02-14','2009-02-20',NULL,'Rechazado','el producto ha sido rechazado por la pesima calidad',30);
CALL insert_data_order(126,'2009-05-13','2009-05-15','2009-05-20','Pendiente',NULL,30);
CALL insert_data_order(127,'2009-04-06','2009-04-10','2009-04-10','Entregado',NULL,30);
CALL insert_data_order(128,'2008-11-10','2008-12-10','2008-12-29','Rechazado','El pedido ha sido rechazado por el cliente por el retraso en la entrega',38);
