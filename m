Return-Path: <linux-renesas-soc+bounces-13384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C1A3D1E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 08:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CDC3A68A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 07:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F19B1E766E;
	Thu, 20 Feb 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cF5KiIRw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A91E5721;
	Thu, 20 Feb 2025 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740035518; cv=fail; b=JgX3UIf2KMYWYDQaEvWeUKDZLuc7wLGv5GnFCGoN9cl2ujzhmmRhSHHvuoxxkJQgl2qKx06VlYbo9KgXn98YpuxEqw1v5SPE/5ymlFgQWZ6J3ER2jvsKFmnVtKgMZKzwhu7x2DbYIwLebyf3HbSBpQq/Sltg38d73cpAq2XhyDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740035518; c=relaxed/simple;
	bh=mjqWUtzoM675AzY6Y4xsoMrRYH5tHFm/sU6uUqZsUAA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b/V0fXr1NmeW1vFvMUwJ52PE4WaxtY2EadXaOpAJiQfaa0DVYGjfgf32GGL82SsIPiBiXuQspINKNoRtRD5EXDxNQor1oA7Fx64CBKUfMpLuhscnBVbPlSQ6Fbr2Zap+enGA/73RQBY7jG5PDYxac8meeoiVrAghJJbL3bPvfsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cF5KiIRw; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEef6EXb2iW055ooKqY5LaLBUpnA9+m1MnahSCLfDNxmfbCfodzMKy3+rk3TpAgLmenlkzQJ5IMilvaFkUqoNnayV/BSgr7uQkAQgUTy5Cza3xEz6n11gUvL+VuD+mgKeLaBqzcAD9yIJAF5VisqH2/8b4YG6kiycgyVC6Ky7L9XiDgdLz6g4BvL1GRE7buSRihdtj8C3F2hSa8cxf4Cd0GJS7fsA/t+oeojsa2mq/j7o7qQC1LI9ZDmjfDzNiS6DEP8JVHJQoaeJMOHnrVLd97m6RTYFIxu1VutQ8uwEQUyL1s+ImKeJ9ksg7isia3X/XMdkGXSXATHYsRsT5jdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgNhVm58Vkd7wGvhPgiVzBPG4D1CguSxLW9LZSRHuuE=;
 b=MADaPQfAt5X1OlIficWcVlRnOMK9LxRytY39KKMuxeHSMmmFxTi3QLygeoXwkgRUN4vP4Bevkyoz447Cky9HZNqRMhK/ZJQVW8dXTxkb4QWOBDu07PMfZdt7tzVzFgFuP1utrv0SIHN91S8G7i9CbFRh2eSi4n4YW1dvSclpfqpChVIY1b1Sr9pYzK7xjfnXYPaISs54av/yXy9BkpsFMYRPCG8p46eGGmHucwZcgTk7bZg5+t/0C79v333nPLNJ3NgC+cUtvmOgre6vfa2xylbtW0Y+U/Z26y+bvhrw4oL/0sQQN2ZhS75z0vifhbn3m3wYux8VqZX1ceGZLC0H1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgNhVm58Vkd7wGvhPgiVzBPG4D1CguSxLW9LZSRHuuE=;
 b=cF5KiIRwko0kyM8H4okGiTV7SpmcBzvLPjhndZf7ROlI9blWwa9GrQsWiPIZK7FQHYL/Y442KLlzuU53abLcEbJ61h8LWoldyxsmhzTW/vbZvNMw9YPyzyp0E8hrYqYfzoYUkmE5URzMOHEHAnlpFqZRCUh21U8Ls1PKSbtM14U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7803.jpnprd01.prod.outlook.com (2603:1096:604:178::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 07:11:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 07:11:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH v3 0/8] Add RZ/G3E SDHI support
Thread-Topic: [PATCH v3 0/8] Add RZ/G3E SDHI support
Thread-Index: AQHbeJzGvJIoLl8m3E2Od8hqLuKjDbNP236Q
Date: Thu, 20 Feb 2025 07:11:45 +0000
Message-ID:
 <TY3PR01MB11346306FD267025422957B3486C42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7803:EE_
x-ms-office365-filtering-correlation-id: 0359eb8d-32de-4ad0-7e27-08dd517dd5a1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bF/VTYY+tD32bMw4R9mWEA9UDAnpHcg66zXnErYKdjvmNINjTcIK2SdlB6nn?=
 =?us-ascii?Q?mTC3ULVvn/I1a/pChGn8H1vNlyTsH7dUWJjE/drIGJUHheyXPUX+uqlwAnDM?=
 =?us-ascii?Q?4nF7VsYKbIp5+HyvxSmOfXl25qcjLnTEG1dzfncOWBJukFDVgzKIDaRYJawx?=
 =?us-ascii?Q?TSPIrCiQ1hFZLJWUbuDe8CW+PcyKi+W8T0+YakOjiAfdzKnp+GJtiWR3I8Up?=
 =?us-ascii?Q?dWwNjmlpn8cLT5mvgzSYhXbvvGdjfd47F6peNQhGe5cCw9dSYMXc8Yu1qXdK?=
 =?us-ascii?Q?FhQ0I76RKVBml5KCpqz5d8UQGKhy6sdPXuEQQcSI2rskGXsJKYu0j8FJr+1F?=
 =?us-ascii?Q?LJqUdvGR4ZgAhJtd7KdQNP60KkkP/Mafevtte5zJoPt4YSkYdgVrLfZSWNKk?=
 =?us-ascii?Q?Oxu3oZ514FKXhU/HiG4BCmg7M49v6DD9Aoo7qZvNwLqLiESDtNhEOq28utn1?=
 =?us-ascii?Q?ACJlEwfMxkgqyQEMCLoCrre3+qaPfkNnsTIJHauhDSNJuG/zHjwGkpkZDt47?=
 =?us-ascii?Q?ITh2PmIaaVsSQM0wOeLsuaG2gcyLcjrQyO1VWHuLwp1R1zMQ8YtWlQzgdoJT?=
 =?us-ascii?Q?oV0iNO/Fe5pMO8on3mpLOE2kXY2Cfo9JO0akB9BaHLZSYxXsHrYpCdav/WA+?=
 =?us-ascii?Q?ek0t5uBLKaVWcEUBykH2Wqb7wYOqSm6MA1sAPj8pxvRqQ8KeqeTMoTbNlfKd?=
 =?us-ascii?Q?GmG/aze4wbhNL2NNXovdVEXtDyD2J99DvP4klk7sk6vsKdqhId7BHglorLV9?=
 =?us-ascii?Q?dpbxGr7xmHRpX+B0vmv3qkuk0H6mg2I10pbtJTA4ugqSKe7H/Wz1/4YgWqau?=
 =?us-ascii?Q?Bb9pkIc0mLd3/qkHCWxI8z0mGQMWvh52+VmYPBJ/XLA41zoCJpnQnX/1g33C?=
 =?us-ascii?Q?n/At9pgAyq5/df/GPn5broqCoaFtjL+yEcgdNkbxYZ+I4iCU3Olk6wqTpE0n?=
 =?us-ascii?Q?sh7AMHe7U1Ggb97rsYzwYDtoCH0mO4jhoUoIcqOlqtOAENnJ0lpTuwP7lZ8F?=
 =?us-ascii?Q?7EobYPkFpcTUINk4l4aUr3encU+HN/JPR4NfxeoWQ4C2Y2HgIRh7mtGwME8j?=
 =?us-ascii?Q?2agEc3a96PO2plUjNzG8n+7U4P8MEHxSebQ5lSElJlKWq0cPoQ8qUfD37Bsa?=
 =?us-ascii?Q?m4aVCyC++bTnNd8eSEOs8LJVfnlHyQgC0U5nqh159S21JtYUsORm5RndnLgz?=
 =?us-ascii?Q?4LL1IBicX//qqHcHbCzBq07QOkY2L3PxKYkjWfwROjzk6ILmXiIXgsXO/gFD?=
 =?us-ascii?Q?tGjivNvGtxfZVKeW1fsu2BoQ/DCtuyy7QGdw0XXdEU3wBOywo6p/sVDFrDJe?=
 =?us-ascii?Q?gyC25hcHbJs+OvzQgjQMBZmw4wFXmAjbn+tJ5RaXUniKvTyA2mjHp+LM3f1k?=
 =?us-ascii?Q?mrZkTo9XKlY3+U7LMNVCpVMx8Z7CDgonnS+ffu9fzYq8o59VwrdT7y/nRoaO?=
 =?us-ascii?Q?xse7+Lmitq1pzDAq/Eey5pCGkvIpz4no?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1Hivw0uiXb4trqPIJ85zwTddcC5gYTfdILsq+iw+YStMOSvyxo8W6g0vvK/I?=
 =?us-ascii?Q?FMq3L276LuYeRud7FeTNlsBVeBoDhd9yoXGfwdf/8d4e55iYK6qDMI54sCqV?=
 =?us-ascii?Q?hF35FZL66h9hLAWOxIRzDxO/xJ2lxked+CSYM4DESwKrS0+piugCCSd7Gl7i?=
 =?us-ascii?Q?yyKsu93JACERKUZAg2Z2DWh1QwQqtq6IRIMsIZLKsG0FOZ23keLU0u7V//hX?=
 =?us-ascii?Q?Yl2NLFct5VCWRTMbSmVl7mpKW9+CkQQBkYmmuwkxaU9FQLVsa0RDdjykIk01?=
 =?us-ascii?Q?/JUrkFGDFVieVVB20DR4US0ZZvlkqUyKQU7STo9mlY2iH94259jnGXIfZplv?=
 =?us-ascii?Q?zyZrEev5bw7YDWrbmfjx7Y2s9J6LsP3gJp4nUa9L05WHxyabxsvJhQtq1EYN?=
 =?us-ascii?Q?Ae+H0AOH+vvfR3Lgv6CmZmLU7w6c6id/xgxFkuTpBe69e+VB3QyEJFaP+5Wg?=
 =?us-ascii?Q?zen2An35AwnxskfQfQcYYfH3DngnNITkiBzc2jwGVOSGyLsCLzhZyfhQMGS4?=
 =?us-ascii?Q?/KhEIQ48HAyIq/lY56BXOnXEL0Lnk8pX1gHqeUc9G5dj2Gr5x9Vq6/S9aPYe?=
 =?us-ascii?Q?XZE7RVus1OkWZFDFf2Iil8YtFXav/DbTMEtaluzmmoTsgx7J2JJ2nKAMHetw?=
 =?us-ascii?Q?9FtBv4IBiM1Iy6TLx7OQPKopiSf8lqR3aBs+PnC9uOnDTC05wcvo1hJ2k7G1?=
 =?us-ascii?Q?aUQoK/hc6zaj9yCNCpe1LzRvNuBtRdpSntXm7LoTVo8iaasDzQnYSh7IQmHE?=
 =?us-ascii?Q?tbrBPd1OgnilAytvaC1vDq0W8mOSHu33G5JOiDdQg9XnAJsb3Dg0+9krRwVH?=
 =?us-ascii?Q?W2/7pghbWc7SZh5TpvfC2IK3UmJeo+hzF/rUHrdEVlEp/pmq/P7zrWfVFRdp?=
 =?us-ascii?Q?qVbKp7CLSu9mtagxBkahPDaqvGoHY7mtHI/PjeGflIIUbUgObysJCC/Q+jjZ?=
 =?us-ascii?Q?p/UeuObHAdQYIaShSLsh1vPwUlVxvs8M/pwcGMkdy9gMBmEfmYinCesqYKpm?=
 =?us-ascii?Q?+kobDs2MxNhS+rnzbgseOOyt+ZZiFjQb7i/Jvgz/15YhApdnV0ZGwUdKn5aM?=
 =?us-ascii?Q?BSTYulrnCbaW6PRwU5K43AJFhdinMZaNWB5XoEhV71NeqBusSowHTvvNQw3j?=
 =?us-ascii?Q?LWoww273OBf9rjN9PtV+yFMLcgePIR5lWjsxq6/tV9mJha907+XFnUECuKd1?=
 =?us-ascii?Q?LY7BrSWLBbPjsaUg6gSh7V8oL684fHgupjqUwn/rCgj6mHvTGEXLY8kro5Jx?=
 =?us-ascii?Q?Fq5R6G1ZSAbqLzR1vYE9Zz9mA7YExEFGcUDnFFFOmhrH4sh+ARzTQSyZoxAj?=
 =?us-ascii?Q?PdrmLbPilBHzxhKBNUlizkljmeSzCB7emP5zMly7FbWnvuE3nw/327oBdLtl?=
 =?us-ascii?Q?M+9OWEVasqHbMI9DZDpZRfwuzKJ2lytKr7PZ+tiL3+isgTe99MIl/ZBjjLxb?=
 =?us-ascii?Q?pFQJ3x0BeGjHagHSt82/kY4hgy+Nu8hMEOm20TObF1So9URaE2Y0B4GQAy0f?=
 =?us-ascii?Q?UIcDOap8qqFIfBrDroaE31dQIZvdP/SyfX+g9WH07nxGBo5w/YNu+3lJD4c1?=
 =?us-ascii?Q?k51WB+08ZXVeN8k5sbqS+6ejmslphQ2tBtNzv4Wy9BxJ0+096O+N/QHsLano?=
 =?us-ascii?Q?Eg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0359eb8d-32de-4ad0-7e27-08dd517dd5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 07:11:45.3022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0UKLfoJfQdYEaZrulIMe41p8j1PSlJ2ccwh9Ho8PNq7Yj4HVUxabanQoIo0l4vBacID6TEQ+q5nO0CVEo/MOaHjy9SjJz9+Zo3DxTgAUim0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7803

Hi Ulf, Wolfram,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 06 February 2025 13:40
> Subject: [PATCH v3 0/8] Add RZ/G3E SDHI support
>=20
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that of th=
e RZ/V2H, but the SD0 channel
> has only dedicated pins, so we must use SD_STATUS register to control vol=
tage and power enable
> (internal regulator).
>=20
> For SD1 and SD2 channel we can either use gpio regulator or internal regu=
lator (using SD_STATUS
> register) for voltage switching.
>=20
> For SD0, fixed voltage(eMMC) uses fixed regulator and non-fixed voltage
> (SD) uses internal regulator.
>=20
> v2->v3:
>  * Collected tags
>  * Renamed internal regulator labels vqmmc_sdhi{0..2}->sdhi{0..2}_vqmmc.
>  * Updated regulator phandles on SoM/Board dts.
>  * Dropped renaming the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpi=
o.
>  * Renamed node sd0emmc->sd0-emmc
>  * Renamed sd0-emmc-{ctrl,data,rst}->sd0-{ctrl,data,rst}
>  * Moved header file gpio.h from patch#6 to patch#8.
>  * Dropped overriding internal regulator name.
>  * Dropped #if guard in pinctrl node for SDHI0
>  * Renamed the label/node sdhi0_pins: sd0->sdhi0_usd_pins: sd0-usd.
> v1->v2:
>  * Collected tags.
>  * Documented internal regulator as optional property for both RZ/G3E and
>    RZ/V2H SoCs.
>  * Updated commit description for regulator used in SD0 fixed and
>    non-fixed voltage case in patch#3.
>  * As the node enabling of internal regulator is controlled through statu=
s,
>    added a check for device availability.
>  * Status of internal regulator is disabled in the SoC .dtsi. Override
>    the status in the board DTS when needed.
>  * Added support for enabling SDHI internal regulator in RZ/V2H
>  * Added missing header file gpio.h
>  * Used fixed regulator for eMMC on SD0 and dropped sd0-iovs pins for
>    eMMC.
>  * Sorted pinctrl nodes for sd2
>  * Enabled internal regulator for SD2.
>  * Added support for enabling SD on SDHI0
>  * Replaced the regulator usd_vdd_3p3v->reg_3p3v.
>  * Renamed the gpio-hog node sd1-pwr-en->sd1-pwr-en-hog.
>  * Sorted sd1 pin ctrl nodes.
>=20
> Biju Das (8):
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
>   mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
>   mmc: renesas_sdhi: Add support for RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
>   arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal
>     regulator
>   arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
>   arm64: dts: renesas: rzg3e-smarc-som: Add support for enable SD on
>     SDHI0
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 ++
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  60 +++++++
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++++
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  21 +++
>  .../boot/dts/renesas/renesas-smarc2.dtsi      |  18 ++
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 154 ++++++++++++++++++
>  drivers/mmc/host/renesas_sdhi.h               |   1 +
>  drivers/mmc/host/renesas_sdhi_core.c          | 136 +++++++++++++++-
>  drivers/mmc/host/tmio_mmc.h                   |   5 +
>  9 files changed, 459 insertions(+), 1 deletion(-)

Gentle ping.

Cheers,
Biju

