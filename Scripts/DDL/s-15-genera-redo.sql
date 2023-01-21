
set serveroutput on 
CONNECT CLIENTE_USR/cliente123

--------------------------------------------------
-------- Redo para la tabla CLIENTE-------------------
---------------------------------------------------
declare
  v_max_id number;
  v_max_sen number;
  v_max_med number;
  v_max_cl_gm number;
  v_max_cred number;
  v_count number;

begin
   -- insert
  v_count := 0;
  
  for v_count in 1 .. 500 loop
    select max(cliente_id) + 1 into v_max_id
    from cliente;
    -- INSERT EN CLIENTE
    insert into cliente (cliente_id, nombre, ap_paterno, ap_materno, email, 
      username, password, curp, foto, direccion, fecha_nacimiento)
    values(v_max_id, dbms_random.string('L', 10), dbms_random.string('L', 12), 
      dbms_random.string('L', 12), dbms_random.string('A', 20), dbms_random.string('L', 10), 
      dbms_random.string('A', 12), dbms_random.string('A', 18), empty_blob(), 
      dbms_random.string('L', 20), sysdate);
    

    --INSERT EN SENSOR
    select max(sensor_id) + 1 into v_max_sen
    from sensor;
    insert into sensor (sensor_id, no_serie, fecha_compra, marca, cliente_id)
    values(v_max_sen, round(dbms_random.value(999999,999999999), 0), sysdate, 
      dbms_random.string('U', 15), v_max_id);

    --INSERT EN MEDIDAS
    select max(medida_id) + 1 into v_max_med
    from medida;
    insert into medida (medida_id, fecha, peso, masa_corporal, estatura, 
      cliente_id)
    values(v_max_med, sysdate, round(dbms_random.value(50,120),2), 
      round(dbms_random.value(1, 100),2), round(dbms_random.value(150,210),0), v_max_id);
    
    --INSERT EN CREDENCIAL
    select max(credencial_id) + 1 into v_max_cred
    from credencial;
    insert into credencial (credencial_id, folio, fecha_expedicion, vigencia, codigo_barras, 
      cliente_id)
    values(v_max_cred, dbms_random.string('A',8), sysdate, 
      round(dbms_random.value(24,27),0), empty_blob(), v_max_id);
    
    --INSERT EN CLIENTE_GIMNASIO
    select max(cliente_gimnasio_id) + 1 into v_max_cl_gm
    from cliente_gimnasio;
    insert into cliente_gimnasio (cliente_gimnasio_id, cliente_id, gimnasio_id)
    values(v_max_cl_gm, v_max_id,round(dbms_random.value(1,200),0));
    
    --v_count := v_count + 1;
  end loop;

  dbms_output.put_line('Registros insertados en CLIENTE');
  
end;
/


declare 
  v_count number;
begin 
  -- update 
  --v_count := 0;
  for v_count in 500 .. 800 loop
      update cliente set nombre = dbms_random.string('L', 12), 
        ap_materno = dbms_random.string('L', 15), 
        password = dbms_random.string('A', 10),
        fecha_nacimiento = sysdate, 
        direccion = dbms_random.string('L', 30)
        where cliente_id = v_count;
        --v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en CLIENTE');
end;
/

CONNECT sys/systemgym as sysdba