Return-Path: <linux-renesas-soc+bounces-14943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09336A7443E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6919189324C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 07:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBB1182D0;
	Fri, 28 Mar 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WbJMVkPh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62561BC4E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146128; cv=fail; b=m6lyqVSKX6aALdmfRGwUR6mawWywChff1rfAIbGCKY8z5jeFJ9ywkLUsUjGxPnEeEgtesJzizVF+yDWx8O4WqKBRx+S7VpW7J5OgLaUKX/3cnOaEysLmv8kodt1D+up/4kHxw86/dNONAhokjzaLHKRcMRL4VGXJaiPa9QOWBxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146128; c=relaxed/simple;
	bh=jBXDBfAi6a4RVyxttu9YTQep+NhcRDyyOB+Xxp6Jz74=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pvoGCpR+eKAQAdk5k8+h9Nu5WFcoPghan9gJF3m7JDx4pqdZjLT8eyZbC1+MnR6QsWHThClZyHu0TlDSWrEfeTHcpSi+ssg83hjuDoskHYijXPu6NgQf9xeS287C29xrKpaSlpnMeKx3RQw8jv88f8gTtOAnbTADyVxg6ZUNsF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WbJMVkPh; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTTFho5jwMyAQvssY0VwieiXiRFWfvvONHbczSkF/pQu1NETGlcTt+1Zf7oOhSvysxPgHJKPWk171QPh01xTjyIRbiJWJMgzupxp9uSdZ9sKqdQFVrbtOD4OVnszJVO9hYo8wKm5pIhWQB6sK9egBQ5BkVkijuQptrcQA0mRVOER6Yi0lUe2TIRIrLDuD2zrg7T/CEaVYt9/2TC3z1+K6ikxjvcHvnIZq4rmOL2niIMlFSnUXknBNWIlG72fz5vN7cfWbyypygd6f7Fc+TylwaD07L3uFHB7385RJT//cPLHRWQiVtpnCCNfwUMWiwcXuPLSp5dmfH2x1iDiyVK6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brulwiD79jaMX4kkp91NOEDVTQV95lgX4iDWfnj631g=;
 b=rR9XaCQOYju7mIJcMBjgOkgbZRjZyg29I2Dd98tc5TE3+UTQbkC0DAgR9ruAd1jetqvGOajRcj+/U55EYkWhzpmyvmOHrb85U0EQ9cLNyfElNaitf7P45CdJGidvdB0LOfV7e8IbMwyQ4DA8JTJLIp8TTifT6p/y2ZV1kVCiBAJI90u9M/cLcE+wBGFabvItQZCwFbxocBuHsTPLdA7ex2y2tctWbql6b1ak0XUOY5wvmEjyK9A2LYrH5KLa8NRg7k0Bml7fOL0fjxfyFqnaqIO52mTrgSJy7cLDNk5VTspYktgxQGmP8U7YkugWCaKdc0RYycT2ALDzdQLJA4g46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brulwiD79jaMX4kkp91NOEDVTQV95lgX4iDWfnj631g=;
 b=WbJMVkPhaYILahFy/FYM8kjWJz5OnS1qtARmrn8jo6Uq8YUa5BCPlaXSVdC1LSPB+/TXNaJl1h0eVBkwRrA15la9ViyLnoLtbFWhMZ379Wcl8RZF3gN43Z++cOPZCmpF1OooUXUsKQ3zqbALqQhKrTjZm5R0cKvBCWeqiO6AF6c=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB8192.jpnprd01.prod.outlook.com (2603:1096:400:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 07:15:21 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:15:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
Thread-Topic: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs
 by default when ARCH_RENESAS is set
Thread-Index: AQHbn08iM6VwmqpspkW3kmRobnuFALOIIghg
Date: Fri, 28 Mar 2025 07:15:21 +0000
Message-ID:
 <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB8192:EE_
x-ms-office365-filtering-correlation-id: 7d897b84-71a3-4704-f177-08dd6dc84d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iGJGimNUmg+awIEXzDdzRLOP6P7nx/iR5KmOpTIlxI+RxdFyHjF2+5uQr+T9?=
 =?us-ascii?Q?aQt+gZxiiZSKst4FQ2yVK+mes0mZ6cviaMUwId481GveZ4oroeKCrEi8y2he?=
 =?us-ascii?Q?M70EIlAROC1StI/aQ4ibjJ049HoxngVW1MZBCwRed/vUxgzV5ugr0CExGNnL?=
 =?us-ascii?Q?IIfuE41vRfzrQna1bQrnmqjA6wItTVANcuNzHaXte0Aw2HxuhUhEqNEiuRkn?=
 =?us-ascii?Q?qk251IRmsUPK8oSxdzJYDSETeJR3rVgTeMV1Mo0jte4Ypatz2DK+AEY98q9X?=
 =?us-ascii?Q?t7+LNViKBuaWCvQAa+uziO11X0klWeRZWkvyq1KuCiVGys409eT13KY76cNX?=
 =?us-ascii?Q?g7m6E6OAjvxOL8p7QLCMDUX+KPQpJG8XzV7hlTTJ3tkZ64qnifHnaElWn4IA?=
 =?us-ascii?Q?xQQzzrfulMVvAU/r236GzOfJRuvokLTm21Rh6mtQjvq7ar/G3SzRWXIdycLK?=
 =?us-ascii?Q?YlM7Yv/9FrtIT3TpnuWzLy8CIqK+6squcfoBVxFWEpEz5wEi9CyiPCLd5+AD?=
 =?us-ascii?Q?l/tvxYonWf6MvXRqh8G8q7Vam3dMrYBYRcTspNtgX0EPtjRjI6Gki7OQmog3?=
 =?us-ascii?Q?0t9YCQvdAL8aubZRSMiWPsxQQyWiFWo1UPFkjjRQ5sQLnRqR1apairZa/sMm?=
 =?us-ascii?Q?X8jrqIjjSe7pFbv97sINhOi8xvkBXh+xJSpGW7cbNL1ie5UyfFKitm4LR/zx?=
 =?us-ascii?Q?OXvD8HNKVUhZ1uWijO6nxQenYN+w4UDvXPH/U8y5uNO+yRxhyT/s2znL9SGo?=
 =?us-ascii?Q?nkRia3lDSg/KExgBcBjjNI8YFdgASEsIwGefLW5Me5jXaDDzAhw4O/p6CQk+?=
 =?us-ascii?Q?dpiksvpVfeg1M9qtQ842ggprt1UNTjXztzaDwNDTtVThn6XnC/i/tOklH06h?=
 =?us-ascii?Q?MAPghdUrdeBGZaGnLWXDcUDVs5SfMp1/9VZUFc08ZZ2txcDWQLJOz64qP+Zh?=
 =?us-ascii?Q?5a8j8PDxCsmXIB+TvKDQLEqkhsZ+kXr5FY3O4IVCPIWMXeinARupkoZol85Q?=
 =?us-ascii?Q?H/Sqz9n3SAsKBbtplb4REH8kN2WEuKOaqX3aTZs9wkG8d5PcnGNC+3IbiXUI?=
 =?us-ascii?Q?nyyQgVXg8qjeUvldTL1tz7udh2tEuxigc5h09+vSWUOdcYRVirEQ/Vp7jMIJ?=
 =?us-ascii?Q?rhX7Wx9982FRXaF0idU5mh09sbJyF0Q02gmdkPeJjL6l2f2Y2u2G5frlwduv?=
 =?us-ascii?Q?kAHJDJElglIDIHSd++mktM2lkYzhauSKwp5lJeSSQegODZo7GBLiLDv6+ify?=
 =?us-ascii?Q?koxPRaXlz4/qOBaOjS/MDWnwPA08XwxzAFudWJ5JtMHF2OhQAH7S9kdkjDaO?=
 =?us-ascii?Q?+naCdHY5LaZ20BBzjmXpia/Ti93DAX+O63S1gUUqtvJh68JLUS8s+EuJHZs6?=
 =?us-ascii?Q?fNq9hGgQwFe7tbh5y7HfxvY9olHw348cfcRIBhhIHf6458/aGXNu01OfIDqQ?=
 =?us-ascii?Q?p9YNrtfuKOe1t/WsaQ9KnwJieoM3/yuf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IdkAoeFaxdRP6Uj0zdVO8lg6eMZh6pR+wRbCz8w/9qyV9bcroL/bDquF9UpU?=
 =?us-ascii?Q?TNlipKgK12iTf1sU7kGWyFgJqGELIVauVr7yLX79CRb5eaR0kXXmPZbeQP9Q?=
 =?us-ascii?Q?QkPshCO+8XeJWH0ciyN0DrIxgjqe2qNE9IZCfMdsxZbl2EyWYQmBUTF0H2rH?=
 =?us-ascii?Q?Hjgv31WDVgECTJ6WaUFuIA0LFXAimsk2MVk7vFsYMfN3KFlgjqu0yHLN/VcH?=
 =?us-ascii?Q?6OdRgJ//Mai+ks0vXZNHviUlRE6Jvc9Vq/R/o6dSOIbcZ4VBV67IxjuO80f0?=
 =?us-ascii?Q?pKiiG9DOChFfL9kxMcaVUuU07uYUTM8dyxM8p/Qb7sSMAJnxWLLWT0IhyzAm?=
 =?us-ascii?Q?j/7I57sRoEHw3VdsEJUL/J5DJWSxAU+sDMWYAEJvxnUL5qGpSiWL3McIN+hu?=
 =?us-ascii?Q?2fi3XLN0fPUgzz5B7ktTwTlgpv/RtP6yQI9QaJ2PPJsVJTUDM9kTdqhiZVNJ?=
 =?us-ascii?Q?9AjI1ClQa5tJjZb8dE9c1zqTyiiZjfN6G56lOOhxoPbF/sd7vgI3v6J9yJsc?=
 =?us-ascii?Q?+FlrX/jAB2StAFr1wI74ZXP+N0UK6j5UaCmQTUl2HF0Kqv8Gdz0HySviCzHA?=
 =?us-ascii?Q?RiWVDc+VdFdTMu7//rsCqjpiE4k59uUDwUuZ2JUeSyS8e5jBbRDPDhpJQfLs?=
 =?us-ascii?Q?IPFD1Ngdrllrm2t2AW27QJYUU4MKKBNejOqb7/koWQbHTM+6qvvefhRZm6Ix?=
 =?us-ascii?Q?K11eB4FExcxx2hZXeqbq/5BfOZuNlUq95O9k5PDDvv43NwjrQhZNnsQooQ2E?=
 =?us-ascii?Q?gTj40MyEooloJYU4Xw4WOrkSQfsJtj+Oay70bxHXZH+zFo70cnR2qLd4nysO?=
 =?us-ascii?Q?n3SBBjirVua0ZJd2kFZ/DFcRSpjjneBl4ODMEwDHw44IeJC7K15x44xiqe51?=
 =?us-ascii?Q?HZl/M9+SRCmPz5vuzvZYmj7GBZfhueSRew6gdcBMZzTX1kHj9JD3RrHpqs+j?=
 =?us-ascii?Q?amH82UOrxGNu1G4LZtg0zdIm2pAqJwjwS2KNrIlW8UUjS8ovYr4Vln9sFJYq?=
 =?us-ascii?Q?L93VPrxaXVVMNXYJz6vEwc68uFdNScMf7KmmEocSnHHjksyYmuOposeVoJZM?=
 =?us-ascii?Q?Ws1BrpjZhF/2H+8E6ml22PqpRmyq6TkFdahZzsen8wn+kkkawgMdj/Pg23gC?=
 =?us-ascii?Q?WcjwhN/jx7LXxGRVXZAWCjSqouSnKPWJ1oRXPw6B4epz4ROMVA9tj+7ftHZB?=
 =?us-ascii?Q?PnBrjTRryNCLAvHyvBO+3m+cBQUwKSAZckihpWFvPJZEzKan45vW9AhPbe67?=
 =?us-ascii?Q?pMikbOT96hrkR0pS/wk17zRnicpn6L0p3e6nIGx6eLNmMxGQ6RdRRG8RP8s4?=
 =?us-ascii?Q?vzbZHXC+wFFBygL/KxblwGvevVF3rmUyegx7PqbSGWt41H+O7N2lNJAkwJCU?=
 =?us-ascii?Q?C3OXZZh/2aOhlBw0Yq2xNVK6yNgJOaJGfyKRhHE5j0+w1oCViN7GBZ7Y94b8?=
 =?us-ascii?Q?9f1pu+by/va1nT3dnyCKwf0209IHwI6FirAGNsVEvC1QUVvoBjrEO4kixWFB?=
 =?us-ascii?Q?WBVj7eaCx+6Ae4TqUxEgsvTbNM7V4SQoh2rtw/H/FWgAPlXQRc3okJIXzZDe?=
 =?us-ascii?Q?xKt3a53DOIWPxWcG6RxRyvcqzyuIKCa9XMrBS5vZhZPQQRHVD8iJz/vczrUD?=
 =?us-ascii?Q?vQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d897b84-71a3-4704-f177-08dd6dc84d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 07:15:21.6543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsgbVIfv9DUmyrRBy4EkDJEir9KeBlioUY4XFVz3C1B+PU1Gav7yRn/CCSb1Y2T9GNIo7KQhxMuj1FdIqCOaHiUFL4guuttPb5vuXA7H3Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8192

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 27 March 2025 19:33
> Subject: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs b=
y default when ARCH_RENESAS
> is set
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> Adding default y if ARCH_RENESAS to the relevant configurations removes t=
he need to manually enable
> individual SoCs in defconfig files.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/soc/renesas/Kconfig | 42 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig in=
dex
> 49648cf28bd2..40197421ff62 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
>=20
>  config ARCH_EMEV2
>  	bool "ARM32 Platform support for Emma Mobile EV2"
> +	default y if ARCH_RENESAS
>  	select HAVE_ARM_SCU if SMP
>  	select SYS_SUPPORTS_EM_STI
>=20
>  config ARCH_R8A7794
>  	bool "ARM32 Platform support for R-Car E2"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_814220
>  	select SYSC_R8A7794
>=20
>  config ARCH_R8A7779
>  	bool "ARM32 Platform support for R-Car H1"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN1
>  	select ARM_ERRATA_754322
>  	select ARM_GLOBAL_TIMER
> @@ -85,6 +88,7 @@ config ARCH_R8A7779
>=20
>  config ARCH_R8A7790
>  	bool "ARM32 Platform support for R-Car H2"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select ARM_ERRATA_814220
> @@ -93,11 +97,13 @@ config ARCH_R8A7790
>=20
>  config ARCH_R8A7778
>  	bool "ARM32 Platform support for R-Car M1A"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN1
>  	select ARM_ERRATA_754322
>=20
>  config ARCH_R8A7793
>  	bool "ARM32 Platform support for R-Car M2-N"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select I2C
> @@ -105,6 +111,7 @@ config ARCH_R8A7793
>=20
>  config ARCH_R8A7791
>  	bool "ARM32 Platform support for R-Car M2-W"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select I2C
> @@ -112,18 +119,21 @@ config ARCH_R8A7791
>=20
>  config ARCH_R8A7792
>  	bool "ARM32 Platform support for R-Car V2H"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select SYSC_R8A7792
>=20
>  config ARCH_R8A7740
>  	bool "ARM32 Platform support for R-Mobile A1"
> +	default y if ARCH_RENESAS
>  	select ARCH_RMOBILE
>  	select ARM_ERRATA_754322
>  	select RENESAS_INTC_IRQPIN
>=20
>  config ARCH_R8A73A4
>  	bool "ARM32 Platform support for R-Mobile APE6"
> +	default y if ARCH_RENESAS
>  	select ARCH_RMOBILE
>  	select ARM_ERRATA_798181 if SMP
>  	select ARM_ERRATA_814220
> @@ -132,6 +142,7 @@ config ARCH_R8A73A4
>=20
>  config ARCH_R7S72100
>  	bool "ARM32 Platform support for RZ/A1H"
> +	default y if ARCH_RENESAS
>  	select ARM_ERRATA_754322
>  	select PM
>  	select PM_GENERIC_DOMAINS
> @@ -141,6 +152,7 @@ config ARCH_R7S72100
>=20
>  config ARCH_R7S9210
>  	bool "ARM32 Platform support for RZ/A2"
> +	default y if ARCH_RENESAS
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select RENESAS_OSTM
> @@ -148,18 +160,21 @@ config ARCH_R7S9210
>=20
>  config ARCH_R8A77470
>  	bool "ARM32 Platform support for RZ/G1C"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_814220
>  	select SYSC_R8A77470
>=20
>  config ARCH_R8A7745
>  	bool "ARM32 Platform support for RZ/G1E"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_814220
>  	select SYSC_R8A7745
>=20
>  config ARCH_R8A7742
>  	bool "ARM32 Platform support for RZ/G1H"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select ARM_ERRATA_814220
> @@ -167,23 +182,27 @@ config ARCH_R8A7742
>=20
>  config ARCH_R8A7743
>  	bool "ARM32 Platform support for RZ/G1M"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select SYSC_R8A7743
>=20
>  config ARCH_R8A7744
>  	bool "ARM32 Platform support for RZ/G1N"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
>  	select SYSC_R8A7743
>=20
>  config ARCH_R9A06G032
>  	bool "ARM32 Platform support for RZ/N1D"
> +	default y if ARCH_RENESAS
>  	select ARCH_RZN1
>  	select ARM_ERRATA_814220
>=20
>  config ARCH_SH73A0
>  	bool "ARM32 Platform support for SH-Mobile AG5"
> +	default y if ARCH_RENESAS
>  	select ARCH_RMOBILE
>  	select ARM_ERRATA_754322
>  	select ARM_GLOBAL_TIMER
> @@ -197,6 +216,7 @@ if ARM64
>=20
>  config ARCH_R8A77995
>  	bool "ARM64 Platform support for R-Car D3"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77995
>  	help
> @@ -205,6 +225,7 @@ config ARCH_R8A77995
>=20
>  config ARCH_R8A77990
>  	bool "ARM64 Platform support for R-Car E3"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77990
>  	help
> @@ -213,6 +234,7 @@ config ARCH_R8A77990
>=20
>  config ARCH_R8A77951
>  	bool "ARM64 Platform support for R-Car H3 ES2.0+"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A7795
>  	help
> @@ -222,6 +244,7 @@ config ARCH_R8A77951
>=20
>  config ARCH_R8A77965
>  	bool "ARM64 Platform support for R-Car M3-N"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77965
>  	help
> @@ -230,6 +253,7 @@ config ARCH_R8A77965
>=20
>  config ARCH_R8A77960
>  	bool "ARM64 Platform support for R-Car M3-W"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77960
>  	help
> @@ -237,6 +261,7 @@ config ARCH_R8A77960
>=20
>  config ARCH_R8A77961
>  	bool "ARM64 Platform support for R-Car M3-W+"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77961
>  	help
> @@ -245,6 +270,7 @@ config ARCH_R8A77961
>=20
>  config ARCH_R8A779F0
>  	bool "ARM64 Platform support for R-Car S4-8"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779F0
>  	help
> @@ -252,6 +278,7 @@ config ARCH_R8A779F0
>=20
>  config ARCH_R8A77980
>  	bool "ARM64 Platform support for R-Car V3H"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77980
>  	help
> @@ -259,6 +286,7 @@ config ARCH_R8A77980
>=20
>  config ARCH_R8A77970
>  	bool "ARM64 Platform support for R-Car V3M"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A77970
>  	help
> @@ -266,6 +294,7 @@ config ARCH_R8A77970
>=20
>  config ARCH_R8A779A0
>  	bool "ARM64 Platform support for R-Car V3U"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779A0
>  	help
> @@ -273,6 +302,7 @@ config ARCH_R8A779A0
>=20
>  config ARCH_R8A779G0
>  	bool "ARM64 Platform support for R-Car V4H"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779G0
>  	help
> @@ -280,6 +310,7 @@ config ARCH_R8A779G0
>=20
>  config ARCH_R8A779H0
>  	bool "ARM64 Platform support for R-Car V4M"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779H0
>  	help
> @@ -287,6 +318,7 @@ config ARCH_R8A779H0
>=20
>  config ARCH_R8A774C0
>  	bool "ARM64 Platform support for RZ/G2E"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A774C0
>  	help
> @@ -294,6 +326,7 @@ config ARCH_R8A774C0
>=20
>  config ARCH_R8A774E1
>  	bool "ARM64 Platform support for RZ/G2H"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A774E1
>  	help
> @@ -301,6 +334,7 @@ config ARCH_R8A774E1
>=20
>  config ARCH_R8A774A1
>  	bool "ARM64 Platform support for RZ/G2M"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A774A1
>  	help
> @@ -308,6 +342,7 @@ config ARCH_R8A774A1
>=20
>  config ARCH_R8A774B1
>  	bool "ARM64 Platform support for RZ/G2N"
> +	default y if ARCH_RENESAS
>  	select ARCH_RCAR_GEN3
>  	select SYSC_R8A774B1
>  	help
> @@ -315,24 +350,28 @@ config ARCH_R8A774B1
>=20
>  config ARCH_R9A07G043
>  	bool "ARM64 Platform support for RZ/G2UL"
> +	default y if ARCH_RENESAS
>  	select ARCH_RZG2L
>  	help
>  	  This enables support for the Renesas RZ/G2UL SoC variants.
>=20
>  config ARCH_R9A07G044
>  	bool "ARM64 Platform support for RZ/G2L"
> +	default y if ARCH_RENESAS
>  	select ARCH_RZG2L
>  	help
>  	  This enables support for the Renesas RZ/G2L SoC variants.
>=20
>  config ARCH_R9A07G054
>  	bool "ARM64 Platform support for RZ/V2L"
> +	default y if ARCH_RENESAS
>  	select ARCH_RZG2L
>  	help
>  	  This enables support for the Renesas RZ/V2L SoC variants.
>=20
>  config ARCH_R9A08G045
>  	bool "ARM64 Platform support for RZ/G3S"
> +	default y if ARCH_RENESAS
>  	select ARCH_RZG2L
>  	select SYSC_R9A08G045
>  	help
> @@ -340,6 +379,7 @@ config ARCH_R9A08G045
>=20
>  config ARCH_R9A09G011
>  	bool "ARM64 Platform support for RZ/V2M"
> +	default y if ARCH_RENESAS
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select PWC_RZV2M
> @@ -348,12 +388,14 @@ config ARCH_R9A09G011
>=20
>  config ARCH_R9A09G047
>  	bool "ARM64 Platform support for RZ/G3E"
> +	default y if ARCH_RENESAS
>  	select SYS_R9A09G047
>  	help
>  	  This enables support for the Renesas RZ/G3E SoC variants.
>=20
>  config ARCH_R9A09G057
>  	bool "ARM64 Platform support for RZ/V2H(P)"
> +	default y if ARCH_RENESAS
>  	select RENESAS_RZV2H_ICU
>  	select SYS_R9A09G057
>  	help


Can we add this changes to newer devices for eg:RZ/T2H, RZ/V2N?

So that previous devices, they don't need to patch this file:

1) If they want to do a standalone build for Image size optimization,
 just remove the unwanted SoCs from defconfig.

2) Debug some issues, some people just use defconfig from
   different kernel version to try it out.

Cheers,
Biju

