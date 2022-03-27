CREATE TABLE IF NOT EXISTS `users` (
    `id_cliente` int NOT NULL AUTO_INCREMENT,
    `cpf_cliente` char(11) NOT NULL,
    `nome_cliente` varchar(11) NOT NULL,
    `email_cliente` varchar(11) NOT NULL,
    `data_cliente` date NOT NULL,
    `rua_cliente` varchar(100) NOT NULL,
    `nr_cliente` int NOT NULL,
    `cep_cliente` char(8) NOT NULL,
    `cidade_cliente` varchar(100) NOT NULL,
    `uf_cliente` char(2) NOT NULL,
    PRIMARY KEY (`id_cliente`)
)