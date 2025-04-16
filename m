Return-Path: <linux-renesas-soc+bounces-16047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2012BA8B45A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F6E03A3561
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1144D230BD2;
	Wed, 16 Apr 2025 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cxQDku7U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFD8494;
	Wed, 16 Apr 2025 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793446; cv=fail; b=DBdq6UBL9erABZCkDLL3G496fY0Psyq5L4bOIk2dQRtFKc6VKyhDmXczjccc4JE+LVWr7dma/1dtTrVZy778FHmMcBxbnuAojy5MoNespAhWhOPbEtHvHUjqTSg6DQVaRUcJRjim4oEBvRFd9fkzznPi+hKRn59IMOSt940PwCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793446; c=relaxed/simple;
	bh=ZbO/mo5XjihV5Z9aoRJzkrKNNETZ9GE6c0rVBZyr+3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cMqST/fFVmHSxlIxHHdlcBtvPofcW993mOjssAO433YVdO1EOeIyzH675anUAecGkXzleG2vn3ZdWLSnSD2YRamsKJ3ueds7DBtipBHFnmvgTzaVXWko9FT2xfv5JgvUVntCbdzVifOEQumfRzR4j9PvUjdJja0+0+99YII9WAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cxQDku7U; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvVRxYtF9ggtD9+fms2ugTL5OnMEtC1KxVQpvJ1DoiUML77tF5ELxGauoyZTDvnvZr1x7NovQoIoax0HhCWtSP/rLKtg9sdMHYzusAkebBKfkjVjSDvqav1N1AiWY0HnBopbsz6M7iLCQ0lPA2ox+syZ42LGHzOwLKMtDHBGZ8L5XvhUQkiPOYNyDXg6QWl6VoIHz3kwMbJ0qgyAd2dq2mmhgmhjz8U4hwsat+5XH0faYFS2zUm+oG/YcHNDQUjJZDHfjd2Jugd2Dig2EijfzKhikuA02IkhUTnm6kz0YZN1O1WFFIro9/Hm2jTwCkfmD/4Re2OLeJFORNl09OK6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAeOqHz3soo7vnL8mzzbVxZ2vIUBc58jZlO/BgGVKYo=;
 b=buDsEhYEW6DSeSv8J8y1wQqZ2Xqp3K76zrYzaJNvRbS7dhMXfx8/2kBRDjwBJwRuFr6l4eVEkFkdumlX4yhZV/82hv4Gl77u1kDeaAP1vAaNQ5dECoCxON8ckFu0yttOgeV9xLUEhP1hUTfXgm7Nl2PIBazNtWTDTy6u2+QAJamQeKU0NSDW0IvkB1gvfTJXzX++R7XgFVpJSRpSYSgw0/dnTNDh94YTLqD2zffmU+pXO3jQg2XnZwSMt/CvyYON+jks34VpzFfCUIRpKCf0T+BaX8CwZM5KXf5y+b4r/k/SrSOOJXpXFPuiF/5jda9hiMfNeB995EurMeOBaOjzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAeOqHz3soo7vnL8mzzbVxZ2vIUBc58jZlO/BgGVKYo=;
 b=cxQDku7UmVFjhtEtDnn5720aVpyG8DMooLff42dQrXkWgc8MnGeH3izmmsx3NxBMDz45FB50fIg7ISOccf5MpnlRG3qGyLrOcrgkIGSfOA9nvTHJFdt/Bbgubjo5CcbILL+gNbq/hmbosZBn+JjowGPw91wC9yZCMVma6kEPMt4=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYYPR01MB10545.jpnprd01.prod.outlook.com (2603:1096:400:30e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 08:50:36 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 08:50:36 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v5 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbrj/RcNoLTikYuUCMy9/D1hiTD7Ol/Kpw
Date: Wed, 16 Apr 2025 08:50:36 +0000
Message-ID:
 <TYCPR01MB120934D9C83511FA61366B685C2BD2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415195131.281060-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415195131.281060-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYYPR01MB10545:EE_
x-ms-office365-filtering-correlation-id: e820243d-0626-4cbf-eef7-08dd7cc3c1a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U4ZUc+Xl6dxITR7wH4DwoEbW49hIEec8n1lAKy82ySv7xLsl/6sovxcleJls?=
 =?us-ascii?Q?ltkRRjKdJ8zv1z5kmZFBRZYiCik6CUWzWsmFyzs/NMK32oRKNE2PlEPSvkDl?=
 =?us-ascii?Q?JaeTinrhmbPlxXRmTEqIbMLFH1PmJoQxaE9QSbI6jesntv1atUihQfzldh6N?=
 =?us-ascii?Q?R/QpFh9pN55R/ghaNvT8NHXgRrIqFDoa/DyGBkQODFbV7LBIT584jn2gNWtc?=
 =?us-ascii?Q?bnmCqLjHQNl+5plgr7w2MHX6GiXRU79CpmMFhrcb77Ge9LUmC+Ee1HyPbja6?=
 =?us-ascii?Q?acj2MuSGpvFqei29fCt+6KUZDmA7Y4xF9SJT4Gwb4CVtAxgAf6P9fpjPsrCx?=
 =?us-ascii?Q?yfp2zNZVUGnjf80vVJrkbKSZ1GDxc0glBuavNKKcS67DS8+DmlHf2nZUoPXI?=
 =?us-ascii?Q?lKRqLh9fgtJ0C5+C3fk/HZ5Sci/lWnT3InU2MtAqgqM9QpZ7CLcjs7xqk7+K?=
 =?us-ascii?Q?0K1DZQgHIXpweSiZMA0vYa5QGuRyI6wOn8QXRSI3NcGP3MsEhlNoZKCvH2LJ?=
 =?us-ascii?Q?Bww9Jziw3sqGCG0EKWFAzBlZTd9OYqS6RMzBLWed5JEZPFbQzt4XDmwKtrhJ?=
 =?us-ascii?Q?SlCIosQsOgcnZOvadTxiZ4NzxsfCNarrqFTm8RMJV/hg7ywEftZ+WMYqTaJ3?=
 =?us-ascii?Q?cQ8bzteDe721vGh885DgelQ662H7Lv1KyAeWBnjRe/LKB7MLcaT9XjB9r90P?=
 =?us-ascii?Q?pjWSJJqmcg8l+J9Z+55acJxxqVbgF+hwsTuV/fmjHbCJqMryTnMetASdb1wk?=
 =?us-ascii?Q?2Qb5SJmdNYWGf+/WL0/v8cXb7uUU9SFZ8ONszm3bxvq++81IaMmVnFHb0iFh?=
 =?us-ascii?Q?3EAsMuW6hZG7uTv8rAZicYZYyMAc4sqD/68SFem2jv2Iig4nvvLsm8J2ngEG?=
 =?us-ascii?Q?cI+ZTfyLXLwrdM4O7+JeHiwcs3GOeKECrkyxUgyslM1LhpoBCK1dSKJYXwOU?=
 =?us-ascii?Q?96qO9Agm2ZVzDFXBY7S86YmZ+cRGVHC7U2ocCv+YkhnwaxIBBCiufXhRv5SK?=
 =?us-ascii?Q?ao62RWyQclLGNFq6HhQ6SmbSx7cNpyY8Z1rqaq/aFLKnjCX8rPncFu9V/HM5?=
 =?us-ascii?Q?z7BsmgijrA2mlc7Z5qjKtsvLisgv0qVf2jGKT/xKeo1aQej9rKrmiPVZDcNm?=
 =?us-ascii?Q?iwzSLW1yrR0DHmjTjb9cVDn4ymTio/1GLUJDfbrSR00pFj7Qa+1U9VRoNYew?=
 =?us-ascii?Q?xTE7krOWJD44SgygSM5raFR7CgdJ3JQxXHeaswou5pMcbppcUg3aHWvoLh8O?=
 =?us-ascii?Q?f9EsyxLccFe71L8f7iRC48vytDpca+i6XxpXOFjcPzvrRgj5ieukoyAP+pIb?=
 =?us-ascii?Q?Rt7GVcncpNyx2STdVcheJy2muiPDBKz2YJ3UA+A7s7etQSyU+dF6SVJ8JWny?=
 =?us-ascii?Q?1zad+B70MgRrT+U7QuJ8DJArJtkqJhIlXEwyC2aAzyEX0dIRHNpW0WrzV+Sb?=
 =?us-ascii?Q?DZ+zJcjlAy1qpVbYncijOUa3nSbF8h5YzHa7tieSxYGLri5x4QgGyA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?91A/fWHuiQPGksDKogfs7iHF+p9WX+TtoyjzM1uLxKdcspQcvPxcF7Bckvre?=
 =?us-ascii?Q?qH3RjSo0s0CgTxS6Iy+g/ttzxgr8W4gqyyLUlcWqHUYrDeKKnNOvWePy38mb?=
 =?us-ascii?Q?c61PNvAZP5Zf0TWKYHpbBGtvlK7rWeNIiKvZq49iYqbu2C+NkPjYbd38LV0U?=
 =?us-ascii?Q?A1PojZ1h7TM8GTraVU2wycEinsrfpPV9KqjHK7NJS88AOSuIjHQ/h6gwSO66?=
 =?us-ascii?Q?KnTapW5egNFWZ74MSTQWgpunT7ypKFPjJqpzyA/B/lZPnu2ucavkklZQu0Qs?=
 =?us-ascii?Q?/1p6PJxn18MYOnBj3n7CyKmBXFrcEU1K5cH2ZqQTwB9CGceVByxdjLbniQNC?=
 =?us-ascii?Q?kqWif8knOcR/s6oiWbiGZAyAIKXVV0joDmbd1jK3yPV3iYazpZq5/z406XJV?=
 =?us-ascii?Q?+S2RN6TbEvpAdZPOSTZOGYQMS/OrCM2W6gp8SMSB/wBea7Gu6m73IiVldgOH?=
 =?us-ascii?Q?VPNn7wu6oEXtnOWIKAxQxT+yr7D9msGhA+WEAXU63ge0gQjwMZlDSYvDAE7A?=
 =?us-ascii?Q?G4Gadqjo4vgQo6yzj1jF8YB16a5m1qVlXs/IQ1yWQm7jQF1ttjBP2BFnkEUu?=
 =?us-ascii?Q?CcHWuyHtHNOT+4me3ciczfTOuZOlgzQNamz49cTyt1Min35wXOFl76E02MiA?=
 =?us-ascii?Q?xjGzQx+6u3KvkZ1HWSXKJyYC7XscbUu/pxaY+06kTmdNwbC29h2KXQLMYwa7?=
 =?us-ascii?Q?7K+eURPjPJSAXPsBVume+NEnR8oMn3/DEyMZ2egcvwBMVyZXVenSSLJBt+CD?=
 =?us-ascii?Q?wn5WD8I6jvJ/PS/DEpfF4NnhJQ+AIk3e+66/XJ4TaXcxCGjUkHeAWDnanYVY?=
 =?us-ascii?Q?qt+aLw91m5tobv/SRxvMyTZOxFeBXc4MNG+ct2mt9+BbbrK6rWwZsFYy83ci?=
 =?us-ascii?Q?2Vwb9FQGnznRfyisPItQnKrUDP0Wjn7+kiX3tHeK91PtmIOw0akJCbXmGkLe?=
 =?us-ascii?Q?ayQ2fdicZ97vOn1Hb3sSvXBbfAyBRV0u7MXMpuI4/TmLnrB66XSLfXTrWnJ9?=
 =?us-ascii?Q?iR/P/m47ubku3UXODO2TdX0mAsuf5b2e+yH23E+RhNZHfpCHvaIy/2WN2stA?=
 =?us-ascii?Q?kjG2X5+lJWAGWjDECiD/1FmTsuO00V86jF94JDYqJ3yvSpYXK9XZF1sRQZwg?=
 =?us-ascii?Q?R5egsQmKUwR2xm4NfW6YKSleT4qfLWFpXxvWwvyeXF7AYlF6aAR1ozFrbC3t?=
 =?us-ascii?Q?GI0cctKmHx05fv86wwt+hAtv+Pimj+IkKxKo/3WQAEPcdLTtkqIDcNabPGaq?=
 =?us-ascii?Q?sqs3qstqCTqFlfUqJlZMt8nXG7WkMXBcvrmM6NujT2/kYrfwAuXBtWT21GZn?=
 =?us-ascii?Q?nYFvV7iUHf83xlbLqoPpG4ps3ix7uMssoO42BURKBdcIaqBMbXAwwnaTZwLX?=
 =?us-ascii?Q?rigB5ilEzDxowkPDroOTSH2NNH+0lFmn7UJHCBaTLAiTSNQgSfpW3qTAciPl?=
 =?us-ascii?Q?+3Bya/4dUtaJhu47gbXfnIFT4M5Cy9EmpMZVcEg4eL1HdRMAGm/TwguGI5KD?=
 =?us-ascii?Q?4morU5Urovyphz6zGNpM0A5r8R2iHOWyNd9m1iX2ydrk/QL4PhaYnQ8JAjDO?=
 =?us-ascii?Q?UiYDtkjTQNuOY1E/lQpUJ6Td8z3lfcPEqpzsh4USgpgN69KQZ9aVXQOGa2w/?=
 =?us-ascii?Q?Zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e820243d-0626-4cbf-eef7-08dd7cc3c1a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:50:36.4961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jp/ovDJZhd/ZhevSF7EtlD+P4Vo20d23Y8madzfrSUbyvurPaNx1T/nENAwkKRI6z2x5KkHv5+GaseVCDSzFVJEuiv+CTxIc3StfCF7wq7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10545

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 15 April 2025 20:52
> Subject: [PATCH v5 2/3] reset: Add USB2PHY port reset driver for Renesas =
RZ/V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) SoC.
> Enable control of USB2.0 PHY reset and power-down operations, including
> assert and deassert functionalities for the PHY.
>=20
> Leverage device tree (OF) data to support future SoCs with similar USB2PH=
Y
> hardware but varying register configurations. Define initialization value=
s
> and control register settings to ensure flexibility for upcoming platform=
s.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/reset/Kconfig               |   7 +
>  drivers/reset/Makefile              |   1 +
>  drivers/reset/reset-rzv2h-usb2phy.c | 236 ++++++++++++++++++++++++++++
>  3 files changed, 244 insertions(+)
>  create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 11ce86c8156b..d85be5899da6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -225,6 +225,13 @@ config RESET_RZG2L_USBPHY_CTRL
>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>  	  controls reset and power down of the USB/PHY.
>=20
> +config RESET_RZV2H_USB2PHY
> +	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> +	  (and similar SoCs).
> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 6322a191e2a8..91e6348e3351 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
>  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> +obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> new file mode 100644
> index 000000000000..ae643575b067
> --- /dev/null
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB2PHY Port reset control driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +struct rzv2h_usb2phy_regval {
> +	u16 reg;
> +	u16 val;
> +};
> +
> +struct rzv2h_usb2phy_reset_of_data {
> +	const struct rzv2h_usb2phy_regval *init_vals;
> +	unsigned int init_val_count;
> +
> +	u16 reset_reg;
> +	u16 reset_assert_val;
> +	u16 reset_deassert_val;
> +	u16 reset_status_bits;
> +	u16 reset_release_val;
> +
> +	u16 reset2_reg;
> +	u16 reset2_acquire_val;
> +	u16 reset2_release_val;
> +};
> +
> +struct rzv2h_usb2phy_reset_priv {
> +	const struct rzv2h_usb2phy_reset_of_data *data;
> +	void __iomem *base;
> +	struct device *dev;
> +	struct reset_controller_dev rcdev;
> +	spinlock_t lock; /* protects register accesses */
> +};
> +
> +static inline struct rzv2h_usb2phy_reset_priv
> +*rzv2h_usbphy_rcdev_to_priv(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
> +}
> +
> +/* This function must be called only after pm_runtime_resume_and_get() h=
as been called */
> +static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *=
priv)
> +{
> +	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> +		writel(data->reset_assert_val, priv->base + data->reset_reg);
> +	}
> +
> +	usleep_range(11, 20);
> +}
> +
> +static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcde=
v,
> +				       unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->reset_deassert_val, priv->base + data->reset_reg);
> +		writel(data->reset2_release_val, priv->base + data->reset2_reg);
> +		writel(data->reset_release_val, priv->base + data->reset_reg);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	reg =3D readl(priv->base + priv->data->reset_reg);
> +
> +	pm_runtime_put(dev);
> +
> +	return (reg & priv->data->reset_status_bits) =3D=3D priv->data->reset_s=
tatus_bits;
> +}
> +
> +static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
> +	.assert =3D rzv2h_usbphy_reset_assert,
> +	.deassert =3D rzv2h_usbphy_reset_deassert,
> +	.status =3D rzv2h_usbphy_reset_status,
> +};
> +
> +static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcd=
ev,
> +					const struct of_phandle_args *reset_spec)
> +{
> +	/* No special handling needed, we have only one reset line per device *=
/
> +	return 0;
> +}
> +
> +static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
> +{
> +	const struct rzv2h_usb2phy_reset_of_data *data;
> +	struct rzv2h_usb2phy_reset_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rstc;
> +	int error;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D of_device_get_match_data(dev);
> +	priv->data =3D data;
> +	priv->dev =3D dev;
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get deasserted reset\n");
> +
> +	spin_lock_init(&priv->lock);
> +
> +	error =3D devm_pm_runtime_enable(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
> +
> +	error =3D pm_runtime_resume_and_get(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n")=
;
> +
> +	for (unsigned int i =3D 0; i < data->init_val_count; i++)
> +		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +
> +	/* keep usb2phy in asserted state */
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	priv->rcdev.ops =3D &rzv2h_usbphy_reset_ops;
> +	priv->rcdev.of_reset_n_cells =3D 0;
> +	priv->rcdev.nr_resets =3D 1;
> +	priv->rcdev.of_xlate =3D rzv2h_usb2phy_reset_of_xlate;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.dev =3D dev;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +/*
> + * initialization values required to prepare the PHY to receive
> + * assert and deassert requests.
> + */
> +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
> +	{ .reg =3D 0xc10, .val =3D 0x67c },
> +	{ .reg =3D 0xc14, .val =3D 0x1f },
> +	{ .reg =3D 0x600, .val =3D 0x909 },
> +};
> +
> +static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data =3D =
{
> +	.init_vals =3D rzv2h_init_vals,
> +	.init_val_count =3D ARRAY_SIZE(rzv2h_init_vals),
> +	.reset_reg =3D 0,
> +	.reset_assert_val =3D 0x206,
> +	.reset_status_bits =3D BIT(2),
> +	.reset_deassert_val =3D 0x200,
> +	.reset_release_val =3D 0x0,
> +	.reset2_reg =3D 0xb04,
> +	.reset2_acquire_val =3D 0x303,
> +	.reset2_release_val =3D 0x3,
> +};
> +
> +static const struct of_device_id rzv2h_usb2phy_reset_of_match[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-usb2phy-reset", .data =3D &rzv2h_r=
eset_of_data },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_reset_of_match);
> +
> +static struct platform_driver rzv2h_usb2phy_reset_driver =3D {
> +	.driver =3D {
> +		.name		=3D "rzv2h_usb2phy_reset",
> +		.of_match_table	=3D rzv2h_usb2phy_reset_of_match,
> +	},
> +	.probe =3D rzv2h_usb2phy_reset_probe,
> +};
> +module_platform_driver(rzv2h_usb2phy_reset_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>")=
;
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");
> --
> 2.49.0


