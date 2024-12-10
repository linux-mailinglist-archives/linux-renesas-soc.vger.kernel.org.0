Return-Path: <linux-renesas-soc+bounces-11138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9D89EA8CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 07:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043A4169CDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 06:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DDF22CBE4;
	Tue, 10 Dec 2024 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X3A75VpC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D522CBDA;
	Tue, 10 Dec 2024 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733812254; cv=fail; b=ui7Lk064Xx2Z0rolTLbZStmuLh0tXYwe9b9ox1ZTbjpoHqIoUrLZFqrMD/++UA3bDCr8J76kmRWY+ELXxFjXaK+ma3O20EbQBW9y580irfr2IedQhkBLAwnH4ZNnr/VMq0mDnLjz3Tr3BxuKopiDCOmWiLEMDrX+rUxVrVX7PwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733812254; c=relaxed/simple;
	bh=oU7XWgG9TS2PVzEhSXIGZnKAm0ZD7ym0YeZXizCHgqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uVVlZCdi1P6/cuk5oWX04hhyMuuVCkUNKuVwbclsUWzybyQW5tWuNnIIE96A1USvuuWvfX5DRF0oOL2VUkPzR2yOP74CYm3sggzez0QLmpGBz700cDkUfn2zWSkY8Je0QRdaB3+VhL252+ji1lkkmeXyrgk5QB3nS6a25RqfTIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X3A75VpC; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKj+XKwU3ty2A+XST/44qkvEX+NpSHjI/+bY3Z7RW0IW/yn5+vlEJ8rwmFL7paI42s/p49ppdfhcX04XAekWQ9omUstKOAsrh3VtOOAEBA6ruOHx30AnZ9uJYe9uMHTxe+h5QyaokjPevKTzuwqK0dq0MEIWEM25wt0HZDL+3rxqhcZZCpkLAPQIXcCkK+4Y7UwWAPdmW5rOqJey/6Z+a6HWTj+gstwcbgtXYcUR2Q+dIkSST6ekXORY7GoNBZa+Z9LaULIa0rrRVpH+TXMkcQQy3fONPklXaerxUjGzE0UfD/KrTfji3Cjd1a/3OJIEIMwd1PqWGmKeQ9PmFNGCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbPi9KMoOv97yNkYUf1EaIRHMYvAKExTh2cg42BfyTw=;
 b=Axjna0FQYu0rji+WndgDckrxQY4iqmM3PD665Y+82Fz0Gc52mECRB2/Na+SHGUH9BjrjWEQbp7Nmxzjg6nTzcme1Dq8k6TlFVNS790QeRDIKrg8v2OPKSREv7xrVXgLeNfGlV+MKfwkeqy/pB94QVSw8wlrXv5aGBrjSJiD8ezH6eZZq1uz/BaM28uJw/QnUV1ku2pMRftHkagb9wAzAmT7gkcGY7Q0lyBu6eHq/sOolTRkXZLuoFNwxT3vSJO/KiMp5IVCYl1WYeHR0+bW9sqfgNY7p67mVeuMtiJSV1SgRvLGhFszxKySHxRCr8BvVCSyhfwh00WTTeZNfkZLESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbPi9KMoOv97yNkYUf1EaIRHMYvAKExTh2cg42BfyTw=;
 b=X3A75VpCqrJ7Ir5K4COfJKB6WMLnC/pDsYd2gi8cXVLc3dHeQ7SfiZspKGdYeMCSkbf9vcEhYu9qEuyrigIa4oP+fgbiwaX/mQDKx+FJ8NCpbGFQbVWYjZ1AJbsK09zm/2XgXF5QSF30x0xXP3C483yguO9ma/B1UB/j6MvhzdI=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by OS3PR01MB8905.jpnprd01.prod.outlook.com
 (2603:1096:604:17d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Tue, 10 Dec
 2024 06:30:41 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 06:30:41 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net] net: renesas: rswitch: fix initial MPIC register
 setting
Thread-Topic: [PATCH net] net: renesas: rswitch: fix initial MPIC register
 setting
Thread-Index: AQHbShBamNhgnf/qzk2YLfenMc9CVbLfBTCA
Date: Tue, 10 Dec 2024 06:30:41 +0000
Message-ID:
 <TYWPR01MB11030BB4AC02261FF655A13CFD83D2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References: <20241209075951.163924-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241209075951.163924-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|OS3PR01MB8905:EE_
x-ms-office365-filtering-correlation-id: de294c08-a22c-43c4-3963-08dd18e42b59
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fop7tFjIL0rBlcCVx0EJKpCt1ahHhCIS2I3qp/pcyHmJLt3a9/7u9j1AVvmc?=
 =?us-ascii?Q?vvVuHNLVyI2x7miCVkNS5AoFzkAjteZXEiYQ5hKSI7J76zlHJtNF6iTnaBSd?=
 =?us-ascii?Q?7qpyWH6eOwzU/wvbC+W91Oyljkryg8dPGgHA8F/eVWKj12ub8z3YdnUh4Tqd?=
 =?us-ascii?Q?iUWpjpoD8y1JmQ4IQ1mkNzAQG5OUPOWIPb69G0cetxk1Sw8hQQHJI72PtbFJ?=
 =?us-ascii?Q?L4lk9Y1VxKKoi/VW9efVNLi54tyJVFsCotPHuQ2Q7V9Vb/8WmEquo7Eko9u5?=
 =?us-ascii?Q?Rls5GzIBalYdDqUMRozwhytMLceB5urDsw/e9gV63DKj56jvkws/vFhXeNJp?=
 =?us-ascii?Q?bPmQuJ0tzZ3Hr1yE+swm6G24dI/ZQXolizFoXV+VC8fXCrTa1tMv0sjXwnea?=
 =?us-ascii?Q?DJlu5/PNp+/dmtN+Qr645sjYGEf7nmNsMV5GH8gWrK7u6ReVelGfb15BrMBU?=
 =?us-ascii?Q?HhUM/kENkgbkReeoI1HX/hYdM+1Iz4hmQpPDpFFHjEl6oPn2a4cIO22ts9xR?=
 =?us-ascii?Q?Pv2BxCsOiZS+muyYvHw5f5yJoLwY096EGnalXd8XyvzYgjxtg1ApH3Pi5b+C?=
 =?us-ascii?Q?wGeRqHHhxJ6hsauKAOeM2tbV9hcY1C+KS+Of2cuu5ft8SBGtZD/RPn43x0e0?=
 =?us-ascii?Q?v2Qutg5wLJM9Bz9qKAIWBygo9mbG72eayMcRc44iIfbX0nkEUm6h4CXhzWcI?=
 =?us-ascii?Q?pkMSAK+xg8eHSiEBqhNsesaDxInp8ivVul5kZA+oTgA8ZBUKnAU/3DvX2qZE?=
 =?us-ascii?Q?0y5Wq9gg9LVR2yPZky9yIdkqEjo15h7yg4ErnZugOT42pI7B8NpZo0kg6dcV?=
 =?us-ascii?Q?n5tD28tJFdxnWM3PjSXrdiMl66h+GRvp2JCtsQrXTg8ahmcB8OHOC4wQnt8r?=
 =?us-ascii?Q?EyDNxM1p1oEdWoyPASoaS/kIWGdCLaD+Hwfo0qEumYoZMg2LfLCn/6OxrdMk?=
 =?us-ascii?Q?sy+NZMoHXstgXr+Or/TCEpvH8y105HNuTp08k+H478B9LaFPW3GO+Aw1Xf+r?=
 =?us-ascii?Q?9ucU1Pl/NUdHr+3DsCZe5l3ePOQMUxLPr30oQqWi09OPt/OP031/5U6EDdgJ?=
 =?us-ascii?Q?mbS9Paf9Rr4FSNE9zrbuGKZd6nBKcV9avTHj3Jz7hXtQqDhgQL8TKy4KZcAG?=
 =?us-ascii?Q?nD4pdlofmBSGGCvl+eNKBiOBUaalAvkNF7+j3Klmno7EikiSIXfocutCc05n?=
 =?us-ascii?Q?eCVgH1hwgFdwppdqswDjO7fJhEqagr+5CbScBKhkE0hEg373c9z96Rrv4p4v?=
 =?us-ascii?Q?K3KlzO1lPcW1FTKbbLQS94ay5HXBtr/oue6tHaDDMYNQdQ9J8oH+kchSAMQp?=
 =?us-ascii?Q?Mjpx+d8bn3rAdSF3ZP/d4eHXrh4tHCXRyLOYQyP5V8Y5ERyLMUlpzmpZLt24?=
 =?us-ascii?Q?PxErWBCz4mKNG4OX45QSztffPobEW6z4rebZxzSCEWzITJxsxg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/YKAfbUYIB4zzgddz5xdbCKU9CHijorb9lR3fcSkkVW3mIid3+uIGpb5V7Ll?=
 =?us-ascii?Q?l3i5RCplL4dubmdEqqAqycz046buJvWdK9Ke9J4YSOHLTOfq7q3zBg5A/kI0?=
 =?us-ascii?Q?KTmn4b3CG4YHuwy3QcKiDSbnBPms0/G2ZROKce+PC1hnfTgqyjU6em2MVegq?=
 =?us-ascii?Q?qLCnCxw91k0kpmL3pdKb2dBj6t/w1FcHngVqbLuW7DIfBT0zJOutaDhIGvc6?=
 =?us-ascii?Q?I+y1yEmTI3pDrfJJgt3MRTSil5dgaP5eXWf/F7eB0U/O+fRyPG8XB3+MyHNR?=
 =?us-ascii?Q?ne2Ahcxj4fWEzMQvBHkaoEqtdEkkcQ9/0E1GxHr3CqLbkDOeNdH+VvEm2/hv?=
 =?us-ascii?Q?ZUa/80+PztD9tfS9H4EctiGY1kgDXgFGFhn1Q/IZ9RUfEhcNyDnQ2DoOQr3z?=
 =?us-ascii?Q?SNrWslIjS7BbKu9QhmqHunkN98h4yUYYLCfbnr/M9urUOYEahg8PYqKRU1oI?=
 =?us-ascii?Q?Dno/X7LRZq0f3Vy6mtC07r+aoqwOGEoj9yyvvl2QD+1WQeZzmJ3LlIi7yBFe?=
 =?us-ascii?Q?QZ3M+tj/+fAO5FnVrkIu+JJ08oQEfUeMiybTWr5xYtV+7vm9wHXZjjHcS7Cn?=
 =?us-ascii?Q?9DrMYkxXAKOy3H9GEs/MmCS4kGdZF5Cy1kTyLUdiQXRmeYPPLPUqt7GNvDkx?=
 =?us-ascii?Q?OPCi0LJ7iwllNMDbXKFRfaw3cpVVR1Tf96JxjiEBJ/JUCpOefaBYS99STJaw?=
 =?us-ascii?Q?R+a6Ocw7DrdcstaqTH+SX9u79IePlxW8ZBswAwW+FzkH3PtR2LKXKZygUT0i?=
 =?us-ascii?Q?JUo4N51Rez/KicL/c6YYij4+RExWUd6yKfj5REyFoyQSTkRlLwAA7Q+UmC8z?=
 =?us-ascii?Q?4XkTopK0VCP+y3MxjVwqfnSS8i1RK+zmMUHwmkOjeYRaR8fsMHaopO+Gbrlb?=
 =?us-ascii?Q?WKl5Wrd1fNgqqvQy2QamwQuo86CUIMbxC2+NuZ0gtY+8e9MC8QO3o5wQG6BI?=
 =?us-ascii?Q?K7sngjv9y7XMTUs1cPq9oEzR9kK+EdohcIFz0OzwWRexb0oAgFKoEaBfN4xh?=
 =?us-ascii?Q?sHl2ImpJ2yjXOh+G6Xz+D2RdSxYvshyMgrOEgBZCqOZmkuzlA7zFXpnvPyY0?=
 =?us-ascii?Q?GMy7d24fB7QGmUtXPVqAn6c48kVcwzJVIgFgePguap91vRZ6QFO1Oyq2u+Uh?=
 =?us-ascii?Q?l2YBR/Oz+RT508eWjgt/YPRSGFzy22NZNSRjer1VH4lWbc0mCiNcVu3vwWAc?=
 =?us-ascii?Q?KGtLUEZthcAnncV2rTUIoQa1GPq8lL1gSYysAfcEzMXFvXodliDB+JJOj4hq?=
 =?us-ascii?Q?CNOpo4oRxm4j1fyvR6qKmNy1A6d+yaLFTSfeprpSE833vLruqX6ZlxpQlSeH?=
 =?us-ascii?Q?KBUoaEvYlwU73SculfPEeJrv4NfSc3OP1vI9CXLIVx3jPR/NV9Kphi7xK4vV?=
 =?us-ascii?Q?Ypg+Pa78K0NNoml2K3DNoSp8EfH79gOSXSeX9eXSpBTrOVUt6B/KLErUxLBm?=
 =?us-ascii?Q?uwtzp/bA91C+X3LR1eAIHNuC29rOGy1mFf5PI+io5J1Kvxc5Q0DKase1laKf?=
 =?us-ascii?Q?hbPEiQ9QkSrFFlBOG36yaDLbO9obXYKiwHqJ7lL4Z6QPimR0abNc1UW4S4G0?=
 =?us-ascii?Q?/EFpEz9O5aAKe2aYT/ceDcC0iUp2jU13itG2iftjxGGiCwnS9mxi5Kkd5r9L?=
 =?us-ascii?Q?ild1M4zLSha6uGCyexoqHiUEo/ZpZ7DVdZ+Fr35BGTcNislha5NTL3jAOthw?=
 =?us-ascii?Q?xKJwUg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de294c08-a22c-43c4-3963-08dd18e42b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 06:30:41.4902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XmswS9/L/kfUIB4yY2r5NuV71Hyk8mMhEyNDsMZ+rzKHPFGW1qerwZaN1b5ZKn44SBpU8UChF6S9W0FBJlYYOnaAPT6sT4leRhj6LlOg5yUfDtjL/DDrxq6fKXzIivJC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8905

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Monday, December 9, 2024 5:00 PM
>=20
> MPIC.PIS must be set per phy interface type.
> MPIC.LSC must be set per speed.
>=20
> Do that strictly per datasheet, instead of hardcoding MPIC.PIS to GMII.
>=20
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet S=
witch"")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Thank you for the patch! I could not apply this patch on net.git / main bra=
nch
and the branch + your patches [1] though, this patch looks good. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1]
https://patchwork.kernel.org/project/netdevbpf/list/?series=3D915669

Best regards,
Yoshihiro Shimoda


> ---
>  drivers/net/ethernet/renesas/rswitch.c | 27 ++++++++++++++++++++------
>  drivers/net/ethernet/renesas/rswitch.h | 14 ++++++-------
>  2 files changed, 28 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/etherne=
t/renesas/rswitch.c
> index 7f17b9656cc3..6ca5f72193eb 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1124,25 +1124,40 @@ static int rswitch_etha_wait_link_verification(st=
ruct rswitch_etha *etha)
>=20
>  static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *ma=
c)
>  {
> -	u32 val;
> +	u32 pis, lsc;
>=20
>  	rswitch_etha_write_mac_address(etha, mac);
>=20
> +	switch (etha->phy_interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		pis =3D MPIC_PIS_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_5GBASER:
> +		pis =3D MPIC_PIS_XGMII;
> +		break;
> +	default:
> +		pis =3D FIELD_GET(MPIC_PIS, ioread32(etha->addr + MPIC));
> +		break;
> +	}
> +
>  	switch (etha->speed) {
>  	case 100:
> -		val =3D MPIC_LSC_100M;
> +		lsc =3D MPIC_LSC_100M;
>  		break;
>  	case 1000:
> -		val =3D MPIC_LSC_1G;
> +		lsc =3D MPIC_LSC_1G;
>  		break;
>  	case 2500:
> -		val =3D MPIC_LSC_2_5G;
> +		lsc =3D MPIC_LSC_2_5G;
>  		break;
>  	default:
> -		return;
> +		lsc =3D FIELD_GET(MPIC_LSC, ioread32(etha->addr + MPIC));
> +		break;
>  	}
>=20
> -	iowrite32(MPIC_PIS_GMII | val, etha->addr + MPIC);
> +	rswitch_modify(etha->addr, MPIC, MPIC_PIS | MPIC_LSC,
> +		       FIELD_PREP(MPIC_PIS, pis) | FIELD_PREP(MPIC_LSC, lsc));
>  }
>=20
>  static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/etherne=
t/renesas/rswitch.h
> index 741b089c8523..abcf2aac49cd 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -725,13 +725,13 @@ enum rswitch_etha_mode {
>=20
>  #define EAVCC_VEM_SC_TAG	(0x3 << 16)
>=20
> -#define MPIC_PIS_MII		0x00
> -#define MPIC_PIS_GMII		0x02
> -#define MPIC_PIS_XGMII		0x04
> -#define MPIC_LSC_SHIFT		3
> -#define MPIC_LSC_100M		(1 << MPIC_LSC_SHIFT)
> -#define MPIC_LSC_1G		(2 << MPIC_LSC_SHIFT)
> -#define MPIC_LSC_2_5G		(3 << MPIC_LSC_SHIFT)
> +#define MPIC_PIS		GENMASK(2, 0)
> +#define MPIC_PIS_GMII		2
> +#define MPIC_PIS_XGMII		4
> +#define MPIC_LSC		GENMASK(5, 3)
> +#define MPIC_LSC_100M		1
> +#define MPIC_LSC_1G		2
> +#define MPIC_LSC_2_5G		3
>=20
>  #define MPSM_PSME		BIT(0)
>  #define MPSM_MFF		BIT(2)
> --
> 2.39.5


