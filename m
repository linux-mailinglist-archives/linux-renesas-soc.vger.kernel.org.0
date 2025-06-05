Return-Path: <linux-renesas-soc+bounces-17864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473EACEC26
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 10:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E38E1899C11
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 08:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCED2063FD;
	Thu,  5 Jun 2025 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="scBDBvzq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BAE202997;
	Thu,  5 Jun 2025 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112943; cv=fail; b=b8BeYlYNnYXY+zg8NqXr6mL/Yr82xcQKqQK75zZILfPxn9e4ZHSXVUHLlIlx+VEmXqJLJ52uQD1IBhSNOwf8XFoJB7MwPOIDr5YDT0RqYWp7cBrqp/W2PFzRePHUm/1hnkQ0/N/n7zMrS/W9ehzhMrE4mjtKkUyo/rkYUy3bsa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112943; c=relaxed/simple;
	bh=4uW70OysZ29z412ZCMCFWcC3Z2AIn3abD3IiHOKtQiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZKQ7W7oxjsrM3Q5D44PqOG6p48qAgwywXHmymfXShPWlHEeC/Utpv/Gf/EJs3qyWJSaneUc3WBo6BEpP8cORNhPqclyCRzfA2pDhbyhLGiQnbECHFV5YjIur4RbFRzll3lrvUABJnfJyKecv7LH8FpKBcQzC/JdAsQpCBZMSWeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=scBDBvzq; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ma0S0MnyVAM/x+HIf/cyFxAEk3US/teD0Tz3aLusSL/gOBRYBasFTSXdWT2n2P9m0Sqq4dA7AuGM6cy+mCmq43Pmz7Qxm/3umGzU8kGdRZLQ7c8H3Tpblhn7DEPjqLmn+QYONajrFxUDygZhVuFtRcdfHwU8OeUI5fQmHMPIi3yZnoW/Z2aNfYwu4+TJRbMSM3jQ4dNymil9YaVhv5tWLDCYS5+cRZc+QZE2JTVC5FDHuqWXNTgZtVaLOPtD+DzySEuSnCbbLvJutKioDNgjhbXNbNHZyVPBd45Go8mv4kB5yIMc3RRwnXMbbqJ9q/ELSH41/rVqErT3uCjLOrkDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn1smjHEO0xGQcrdb9taBEC2KvmYmpeuDvwusIrHUvo=;
 b=y6Q82FV0BOpLCXnBo+TUnoYzlFJl+EHsPwisW7UTW7P54S6RenTQNKDDeYNg+JrklWmmOemwWMPIwmuMJM9jywxecNGwz3lCmHsNua13d5NufIVyYoTJc7TDV4ySZ2+YChE026p6FlHeXIW2BHQbE5D/xBwDWAO4Mi3w/ynSO1h4Pu/Zd0h3jtP7Ea3HZyKdDgkl0UsL8H0LsFCigBJG7DaTrhuN56BPtV7Si0SFzNfXZn+bABKs2PniPPa9u7+iqHr8ehA3evjyD9yMh5Rcxr/GMwZTpOh945Kb2SB7A2AQqXK6ABEGmWHm44NHQ6ULEhjFUKP7i0rVrHKTOt0iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn1smjHEO0xGQcrdb9taBEC2KvmYmpeuDvwusIrHUvo=;
 b=scBDBvzqX3+Rvje3JqX/OBP6qt1UuJbyxYBhinyO6CYkH7/Qo4NM8ZAcNFgv3AxhcPIgpp+TYBDHFBABTMsx3Tr5KcTbRvChJRlx5MKCyI0n6J33NAm3wFHBzy8Ib+mH63JrMWfeetXsCHWwYVR45InycgG//ylHys61aTy5tRs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10173.jpnprd01.prod.outlook.com (2603:1096:400:1da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:42:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 08:42:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add GBETH nodes
Thread-Topic: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add GBETH nodes
Thread-Index: AQHb1R1DYepK90SlwUCzecMansBgJ7P0QS5w
Date: Thu, 5 Jun 2025 08:42:17 +0000
Message-ID:
 <TY3PR01MB11346ABDE55F146C18F6309B8866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
 <20250604065200.163778-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250604065200.163778-4-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10173:EE_
x-ms-office365-filtering-correlation-id: 9d489cf7-164a-4a17-39da-08dda40ce0ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?W3OrbbFWpvQAPZXm9dJobtGyFBvRkCdwiJ64fCAAw/o6UHfI7Slb6C7OCJwm?=
 =?us-ascii?Q?Mawm1Twt64kjWzloy8QOJyUw6kt1RWTA2REaSobNqE7eoek5E4RPbikdEu4K?=
 =?us-ascii?Q?GtK+wTswiIIeR4QldPeDDr+pIA1UhSuLUIgDC6pNn9tz9ALAeHLtCPOK0aio?=
 =?us-ascii?Q?VTy0BiR5CFU0sE+8OlplsOuiK4Uxjrgz5J7WFTfOzZ/skeKM3PvrzUl7uLen?=
 =?us-ascii?Q?5dZ9fa8fkG04BuDgi6zEvuILYhy1Oe36M1Dz6T0RuDQIpsa+19yVTTMY54Ds?=
 =?us-ascii?Q?21Jp+pb7ns/inkGf1j6A6vKp5DWbP1YxK8jIQV579PwkU0IAveEwoGv1nqSR?=
 =?us-ascii?Q?K0Y8LZzGAVihus/4/qak6VlMRLbILuyVJ+60V/uRzAni0iN4NDEAS0D+AF/T?=
 =?us-ascii?Q?9j4k6QrDfZVNfui8HbIBOVwl7fYoCrpITV4gawQDHfG3SdU1M+bemdUKC5K/?=
 =?us-ascii?Q?edoJSASGJL7XdlGTOVxY7SqIj+j8nCbUzaJD9kW2tSYHWUlGc1bNhvAyzKa9?=
 =?us-ascii?Q?gWPQupDOf6pR06qcVVG/zFAsCPzh6nAql7NQaKHHnaFb8gTcVr/GBVUnGQ/p?=
 =?us-ascii?Q?iPPwCWTDoWiW28LgN/WfsyIY6dODjqB2eA0KC2YqDpyAkRMA9la7YQMW/19H?=
 =?us-ascii?Q?XumsUZpbrdmCIdTPL2trqmilquXCnRgzaIXNpJ3agkF1Fzph9kmZALAk59Iy?=
 =?us-ascii?Q?X/IS1h2yR17ayvOe2PET3HDeAkjnjSJwG+zxELUV0WMrDJuXNX3kDwlVLfOI?=
 =?us-ascii?Q?sShAMyZAtS3Q0FJm3k6KFBv/Y8mYPK2t0PLBeaH0RGYK6lURFWba4mXfXeNr?=
 =?us-ascii?Q?K1D1sPorBvNbNVxsMyjVihk2YS+9KgG7y8WDgpgjE+VgQ7iryx0hbF4Id46G?=
 =?us-ascii?Q?S7jGfqICjOcqJzKZbuzbopuOd1whT5ItO6dg4SECG0oHN5S+u3JITBxLBjD8?=
 =?us-ascii?Q?FR8s7Q6eX1P1TpWL3Rmy6iZBqaLPQuBddeOd0uz793In4LmMkBy5agPbadoD?=
 =?us-ascii?Q?LSzd/VWbZjcBkL5w8unF3k6nvpbu2nnih9aK3wyKVDcXJMkQCzZ2rZZAAW+2?=
 =?us-ascii?Q?VCeu22OHw3xCjh690SioPNy8Q/tTNyff5Vn3ynsRBy2+HHZwJDo8MPla3ROK?=
 =?us-ascii?Q?YSqNFDHjKLLVb3tI5+sF47i/Swjtv4fGSdq8RXtMokaXGV4cnH+/vHIbM+CS?=
 =?us-ascii?Q?yAUNg4fSMbnwZ8Rs92Mf0lsyEDSh9zqZlhq1sazXGat1RovG3lPkUtAZy6GQ?=
 =?us-ascii?Q?jyLFz1z7Hv87MMiYgaS0lMWjGMLF4p9bmh36Mkbbj0jMhMeOVfu71yPlSgC1?=
 =?us-ascii?Q?gxfKt7JkA6WwxZ88ZQCScfeEJJ8Ua+k8/60ZJ+LqcOwMW/AcvvYec5Lk9EkK?=
 =?us-ascii?Q?yy2OqFvV3P4UdUUQcI2JW+s+TP3g76OMXeotl1WaXUHGjyTApqMms9+aytVr?=
 =?us-ascii?Q?oN3goFORMbQb2CL8ZFMLgqGI7hwCbExa32vsl1oQoavHFf5gzony/5CYhj9B?=
 =?us-ascii?Q?QCotshYAH+0Xe4k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nf5i7rSOqN9A8EEVMlaDTaKK8QeGDk5e5jYyj5A9+kr7JSdWYXNVoOZdUJvo?=
 =?us-ascii?Q?rG+CsWK9bZAZh/sdlzv37GDdfnjWFvYBOqpuvDRv+7mTTwkLOxqZvxrkXufe?=
 =?us-ascii?Q?0AU/zGa/aIWvdJINrNI5CYIQgekIF9vZntAvjFZwe1ws9GVagzOo63di6O4K?=
 =?us-ascii?Q?bguM2keYp4+uYbKRXXsnKycsLN6V+0tbLvnR7KS7Js+zhnV1Q+0ZBDP4BCUm?=
 =?us-ascii?Q?7nb0i5hmSH4PFPUUrPcvH+Ct+dksZAvGAec8WRFFX0hSWkF+4pRWrEKciwYL?=
 =?us-ascii?Q?fDBWoIPjsxrLaVb0ZsOf+xbB+H3nJ9gsPhZo+u+qhLOezvZsZrZQaS5EPYC9?=
 =?us-ascii?Q?nHqDDgUL+f81xXjkFGmaqB5Fb2sEyagF86tpag5S80KGmN+JnvZPSblNif9S?=
 =?us-ascii?Q?4SOdWMGU+sBZIt/M52rfG0fosokI3wC04EvYCST7rgJY5rtDyNqbstYUy8sl?=
 =?us-ascii?Q?WiuRpzffZ8SpQ3LaZjpqTK0zA2+aAIMVZu9eIMLrdgNV5RyHz5whlJo2FGGT?=
 =?us-ascii?Q?rcRuIXj90hRtZ6sxVNsMuFCrYN6iKYySFVBb2m6UoAAN2yTtmS6y8mVjUopP?=
 =?us-ascii?Q?jTe5+33NcxZhFL2/DkvukySGONBPIEvqts8suVrSH5vNSjvZgoF3W8v9/yuS?=
 =?us-ascii?Q?SgWfmZF9w66SwF0GLES8FQwCdEx6JkCqbh2Mn9+gzzpjVYbaIAigQISDibB5?=
 =?us-ascii?Q?jivptrrJ3YBrgSLcSuex6pIdjqeW2IURaz20OFSgHBbm9HDH7h2O1lUsP6Om?=
 =?us-ascii?Q?mZpfPH14KWVMdBMDPEm0N5WsYoDgDPHaVAqF9/kTHpueImaOpWXOuWZ9VbAX?=
 =?us-ascii?Q?yDjTPvhkNeNHnxUEMdZQrNfFGtLMkr0/Nj499ULCEQM4NYonyhwLc74J1sOG?=
 =?us-ascii?Q?y3eIe4980Ro9vIki4UubSxP0//0pO7Eb5yozGchz/IgdDRaDVecK0yXpz0Ln?=
 =?us-ascii?Q?TexTWHnzf+J2/GOK41iXee8pQtWpeCtSFiEy0DGA0Jne7QZ3fpS2fw1i/loE?=
 =?us-ascii?Q?9b3AUMQgYIsywaaPKxhywM66uCBGf0rdobagWXXrydA1N2W2U8Ka0IU7VtA3?=
 =?us-ascii?Q?uWQhx6Cqf9CN4EBDZWlrT1Oxpi76bBO7mnJ0/ErT2eGW5gWWCZmbFtDVt0IB?=
 =?us-ascii?Q?TG66zu/9Eh7h34aTHNLGDWz8iRwGNqi89kIm8K+0Z2vfqPGeGxj4bq8xz2FH?=
 =?us-ascii?Q?sfORQIbzcscCyeCCPO0J2nHhLbtJE1KJH/PmfXBwZb+WVJ40P5mjAsYfxrvC?=
 =?us-ascii?Q?wTWajX5H2Pmh2wi5cA1otUOp/tv0HhvWD62ACbNHKKKAwJidtx5vJs1lU+ZL?=
 =?us-ascii?Q?TcVcltgS2JbGExxI4Eub35TT6R3yKom0m//AQEOfjKs6yReG55GdTNOCdT7S?=
 =?us-ascii?Q?ScPVr9z4Lu1MyhDdkbKlZj93QMR0W6uSCUtzrWDN34AmMA8dZWlBdoouTNvr?=
 =?us-ascii?Q?jr+3QXfARH1jKdN9nNqNGf/mwypvgXGpCBVjq57sSTJAPjhLnZMiDVZnU8II?=
 =?us-ascii?Q?3CB3nNv+gd6iJFWGK2XCGvDkOwGgUMmLtv4KCq5TCIXzk7HjTtgv/bbn8SUo?=
 =?us-ascii?Q?NdZcdb6SrXmFbZcoYYhMUH0Oi2aIQLaNZigKjhO4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d489cf7-164a-4a17-39da-08dda40ce0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 08:42:17.2309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rlep6JYKRpCRyCf2Er5ZwbzQBbQOE2+HWzkW1DEQhak6UaJGCtprLwIux6tMraEXdV43CIfsS4420fFl5kj41yEyKO4wNpIhUn3wXqoIDO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10173

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 04 June 2025 07:52
> Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add GBETH nodes
>=20
> Add GBETH nodes to RZ/G3E (R9A09G047) SoC DTSI.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 207 +++++++++++++++++++++
>  1 file changed, 207 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> index a0d4fab4fe05..e6e35b41a9d3 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -759,6 +759,213 @@ csi2cru: endpoint@0 {
>  				};
>  			};
>  		};
> +
> +		eth0: ethernet@15c30000 {
> +			compatible =3D "renesas,r9a09g047-gbeth", "renesas,rzv2h-gbeth", "snp=
s,dwmac-5.20";
> +			reg =3D <0 0x15c30000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
> +				 <&cpg CPG_CORE R9A09G047_GBETH_0_CLK_PTP_REF_I>,
> +				 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
> +				 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
> +			clock-names =3D "stmmaceth", "pclk", "ptp_ref",
> +				      "tx", "rx", "tx-180", "rx-180";
> +			interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq", "eth_wake_irq", "eth_lpi",
> +					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
> +					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
> +					  "tx-queue-2", "tx-queue-3";
> +			resets =3D <&cpg 0xb0>;
> +			power-domains =3D <&cpg>;
> +			snps,multicast-filter-bins =3D <256>;
> +			snps,perfect-filter-entries =3D <128>;
> +			rx-fifo-depth =3D <8192>;
> +			tx-fifo-depth =3D <8192>;
> +			snps,fixed-burst;
> +			snps,no-pbl-x8;
> +			snps,force_thresh_dma_mode;
> +			snps,axi-config =3D <&stmmac_axi_setup>;
> +			snps,mtl-rx-config =3D <&mtl_rx_setup0>;
> +			snps,mtl-tx-config =3D <&mtl_tx_setup0>;
> +			snps,txpbl =3D <32>;
> +			snps,rxpbl =3D <32>;
> +			status =3D "disabled";
> +
> +			mdio {
> +				compatible =3D "snps,dwmac-mdio";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			mtl_rx_setup0: rx-queues-config {
> +				snps,rx-queues-to-use =3D <4>;
> +				snps,rx-sched-sp;
> +
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x1>;
> +					snps,map-to-dma-channel =3D <0>;
> +				};
> +
> +				queue1 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x2>;
> +					snps,map-to-dma-channel =3D <1>;
> +				};
> +
> +				queue2 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x4>;
> +					snps,map-to-dma-channel =3D <2>;
> +				};
> +
> +				queue3 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x8>;
> +					snps,map-to-dma-channel =3D <3>;
> +				};
> +			};
> +
> +			mtl_tx_setup0: tx-queues-config {
> +				snps,tx-queues-to-use =3D <4>;
> +
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x1>;
> +				};
> +
> +				queue1 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x2>;
> +				};
> +
> +				queue2 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x4>;
> +				};
> +
> +				queue3 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x8>;
> +				};
> +			};
> +		};
> +
> +		eth1: ethernet@15c40000 {
> +			compatible =3D "renesas,r9a09g047-gbeth", "renesas,rzv2h-gbeth", "snp=
s,dwmac-5.20";
> +			reg =3D <0 0x15c40000 0 0x10000>;
> +			clocks =3D <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
> +				 <&cpg CPG_CORE R9A09G047_GBETH_1_CLK_PTP_REF_I>,
> +				 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
> +				 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
> +			clock-names =3D "stmmaceth", "pclk", "ptp_ref",
> +				      "tx", "rx", "tx-180", "rx-180";
> +			interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "macirq", "eth_wake_irq", "eth_lpi",
> +					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
> +					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
> +					  "tx-queue-2", "tx-queue-3";
> +			resets =3D <&cpg 0xb1>;
> +			power-domains =3D <&cpg>;
> +			snps,multicast-filter-bins =3D <256>;
> +			snps,perfect-filter-entries =3D <128>;
> +			rx-fifo-depth =3D <8192>;
> +			tx-fifo-depth =3D <8192>;
> +			snps,fixed-burst;
> +			snps,no-pbl-x8;
> +			snps,force_thresh_dma_mode;
> +			snps,axi-config =3D <&stmmac_axi_setup>;
> +			snps,mtl-rx-config =3D <&mtl_rx_setup1>;
> +			snps,mtl-tx-config =3D <&mtl_tx_setup1>;
> +			snps,txpbl =3D <32>;
> +			snps,rxpbl =3D <32>;
> +			status =3D "disabled";
> +
> +			mdio {
> +				compatible =3D "snps,dwmac-mdio";
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			mtl_rx_setup1: rx-queues-config {
> +				snps,rx-queues-to-use =3D <4>;
> +				snps,rx-sched-sp;
> +
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x1>;
> +					snps,map-to-dma-channel =3D <0>;
> +				};
> +
> +				queue1 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x2>;
> +					snps,map-to-dma-channel =3D <1>;
> +				};
> +
> +				queue2 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x4>;
> +					snps,map-to-dma-channel =3D <2>;
> +				};
> +
> +				queue3 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x8>;
> +					snps,map-to-dma-channel =3D <3>;
> +				};
> +			};
> +
> +			mtl_tx_setup1: tx-queues-config {
> +				snps,tx-queues-to-use =3D <4>;
> +
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x1>;
> +				};
> +
> +				queue1 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x2>;
> +				};
> +
> +				queue2 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x4>;
> +				};
> +
> +				queue3 {
> +					snps,dcb-algorithm;
> +					snps,priority =3D <0x8>;
> +				};
> +			};
> +		};
> +	};
> +
> +	stmmac_axi_setup: stmmac-axi-config {
> +		snps,lpi_en;
> +		snps,wr_osr_lmt =3D <0xf>;
> +		snps,rd_osr_lmt =3D <0xf>;
> +		snps,blen =3D <16 8 4 0 0 0 0>;
>  	};
>=20
>  	timer {
> --
> 2.25.1


