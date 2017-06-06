DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar`(
	IN usrn varchar (50)
)
BEGIN
	SELECT usuario.idUser, usuario.usernm, usuario.profpic, ciudad.nomCiudad 
    FROM usuario INNER JOIN ciudad ON ciudad.idCiudad = usuario.idCiudad
    WHERE usernm LIKE CONCAT(usrn, '%');
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletpost`(
	IN idpos smallint(5)
)
BEGIN
	
    delete from publicacion where idPost = idpos;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletuser`(
	IN idus smallint(5)
)
BEGIN
	
    delete from usuario where idUser = idus;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `editPerfil`(
	IN idus smallint,
    IN abtt varchar(140),
    IN pfpc mediumblob,    
    IN ptpc mediumblob 
)
BEGIN
update usuario
	set 
    about = abtt,
    profpic = pfpc, 
    profcov = ptpc
    
    where idUser = idus;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `editpost`(
	IN idus smallint,
    IN body varchar(250),
    IN pic mediumblob
)
BEGIN
update publicacion
	set 
    post_body = body,
    foto = pic
    
    where idPost = idus;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edituser`(
	IN idus smallint,
	IN usnm varchar(32),
    IN pssw varchar(32),
    IN corr varchar(30),
    IN gnnr int,     
    IN ttle varchar(30),
    IN priv bit(1),
    IN fnac date,    
    IN rans varchar(30),
    IN city smallint(5),
    IN qstn smallint(5)    
)
BEGIN
update usuario
	set usernm = usnm,
    psswrd = MD5(pssw),
    email = corr,
    gender = gnnr,
    title = ttle,
    privat = priv,
    fechn = fnac,
    rcveryanswer = rans,
    idCiudad = city,
    idQuestion = qstn
    
    where idUser = idus;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loguser`(
	IN corr varchar(50),
    IN pssw varchar(32)
)
BEGIN

select idUser, usernm, psswrd, email, gender, profpic, profcov,
		title, about, usrtype, privat, fechn, rcveryanswer,
        idCiudad, idQuestion
        
        from usuario where email = corr AND psswrd = MD5(pssw);
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `newfollow`(
	IN user_you smallint,
	IN user_followed smallint
)
BEGIN
	insert into user_follow
	VALUES(
	null,
	idUser1 = user_you,
	idUser2 = user_followed,
	aceptado = 1
);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `newpost`(
	IN fpos date,  
    IN ttle varchar(30),    
    IN body varchar(250),
    IN tipo varchar(50),
    IN pict mediumblob,   
    IN vide varchar(255),
    IN idu smallint(5)
    )
BEGIN
    insert into publicacion 
    VALUES(
    null,
    fpos,
    ttle, 
    body,
    tipo,
    pict,
    vide,
    idu
    );
    
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `newuser`(
	IN usnm varchar(32),
    IN pssw varchar(32),    
    IN corr varchar(30),    
    IN gnnr int,
    IN pfpc mediumblob,    
    IN ptpc mediumblob,
    IN ttle varchar(30),
    IN abtt varchar(140),
    IN utyp bit,    
    IN prvt bit,
    IN fnac date,    
    IN rans varchar(30),    
    IN city smallint(5),
    IN qstn smallint(5)
    )
BEGIN
    insert into usuario 
    VALUES(
    null,
	usnm,
    MD5(pssw),
    corr,
    gnnr,
    pfpc,
    ptpc,
    ttle,
    abtt,
    utyp,
    prvt,
    fnac,
    rans,
    city,
    qstn
    );
    
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readAllPost`(
	
)
BEGIN

select publicacion.idPost , publicacion.postdate , publicacion.post_title, 
		publicacion.post_body , publicacion.tipo , usuario.usernm
        from publicacion inner join usuario on publicacion.idUser = usuario.idUser;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readData`(
	IN correo varchar(50)
)
BEGIN

select idUser, usernm, psswrd, email, gender, profpic, profcov,
		title, about, usrtype, privat, fechn, rcveryanswer,
        idCiudad, idQuestion
        from usuario where email = correo ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readDataB`(
	IN usrb varchar(50)
)
BEGIN

select idUser, usernm, psswrd, email, gender, profpic, profcov,
		title, about, usrtype, privat, fechn, rcveryanswer,
        idCiudad, idQuestion
        from usuario where usernm = usrb ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readImg`(
	IN idu smallint
)
BEGIN

select profpic
        from usuario where idUser= idu ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readImgC`(
	IN idu smallint
)
BEGIN

select profcov
        from usuario where idUser= idu ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readImgPost`(
	IN idu smallint
)
BEGIN

select foto
        from publicacion where idPost= idu ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readOnePost`(
	IN postid smallint
)
BEGIN

select publicacion.idPost , publicacion.postdate , publicacion.post_title, 
	publicacion.post_body , publicacion.tipo , usuario.usernm
        from publicacion inner join usuario on publicacion.idUser = usuario.idUser
        where publicacion.idPost = postid ;
        
        END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readPostFollow`(
	IN idu smallint
)
BEGIN

select publicacion.idPost , publicacion.postdate , publicacion.post_title, 
		publicacion.post_body , publicacion.tipo , usuario.usernm
        from publicacion inner join usuario inner join user_follow
        on publicacion.idUser = usuario.idUser, user_follow.idUser2 = idu;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `readPostsU`(
	IN user smallint
)
BEGIN

select publicacion.idPost , publicacion.postdate , publicacion.post_title, 
	publicacion.post_body , publicacion.tipo , usuario.usernm
        from publicacion inner join usuario on publicacion.idUser = usuario.idUser
        where publicacion.idUser = user ;
        
        END$$
DELIMITER ;
