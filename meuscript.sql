USE [bd_16_byciclon]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_endereco]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_endereco](
	[idendereco] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](30) NOT NULL,
	[uf] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idendereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_itens_pedidos]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_itens_pedidos](
	[iditem] [int] IDENTITY(1,1) NOT NULL,
	[idpedido] [int] NOT NULL,
	[idproduto] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precounitario] [money] NOT NULL,
	[desconto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iditem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_pedidos]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pedidos](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[datapedido] [date] NOT NULL,
	[qtitens] [int] NOT NULL,
	[valortotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produtos]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produtos](
	[idproduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[linha] [varchar](255) NOT NULL,
	[valorunitario] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idproduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_vendedores]    Script Date: 08/07/2025 09:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_vendedores](
	[idvendedor] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idvendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
