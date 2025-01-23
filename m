Return-Path: <linux-renesas-soc+bounces-12373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4796AA1A105
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6FC1605D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93BE20C48D;
	Thu, 23 Jan 2025 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K4NDvaKq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9897820C028
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625490; cv=fail; b=HyXle2+sApCHP9Sz9kUpIchOyqLw8J4/r3k+Z0DFFe2hImx6QqPjFjVcjZLzthYYnp4olUWC31zmM5AmCj2RvNOLBH47AeNAm+C4SQxyFhNRrVtojwwbhCSpvRsyjy9yQK7i0V3g8ljwDSo5WKdSgXhpPITHmm5cvQdxL2Nl3Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625490; c=relaxed/simple;
	bh=8tZMaEnvmCr319EaYdQ0Iv2fCeK34GyTY3/96hlDy+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QjY3CgsYNvsXG/a+9VJVej9z3QoPSpqB+NrJFCvZfgctNvDjLYdBy7AtAiQ0uVirTyFPg1syu3tKeKsw4ocZvqMPZzEoDrO2+8bE6mF0cYfd6mgku2yJr52ekzELJGvElPchxieWsZDM4YCDtp1VtGk5s10hbatS4bVPdq50u4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K4NDvaKq; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkClKPN4lGoUsLEE2KXsRaRC59Mi4r3kz/B3wn619oO+Ux22lGe0JUKTa6wCtTpWEJ9ILmp/Y2HSmFe1JE64aj39f896RNHhwxCMEdj1+PzEJrP5R7BOYAkPqGDVBHDOgorrQW+giRUFZjT+RFxdixtrmpmq+TGUc2Ig4USJHjwMfAebrFIkDnH16g7Fnr8jlS3NF1wZ9L8N08grszIfLL7BYu4wqmKKn9IR1xKAFs0z97CqVwi6FTpfo3Rd5F35R0M8VHYUjqsTBuUp0JX4Ldd1dxpoWM8iSo6QZ60jYuX5liW/hUaW4wFQixoI/Duu8QcRoiDnW9az/dLaWsba4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOi2bDFZLSgiqKfITX417jNUsartlgkqpCrEFfBiwUg=;
 b=Xt7ftuoegj55+VUx1KEmhn7jPDavxobARsWDTUSy0N5LNHcQSNzS4ciBoj8xTgg0SatmwIJx5mU5JCqE6NcesIeh1T8nefEkmDg4cdT1ZBcByqrDi31n464UNifFhd0Z1sMHtmziolgdK/YHGcoT8WG/96dULLeN8HYD3kJIfx7n3rm7u7u8lNFVpQmT2AGAmkIUNrRcZvLHzODEJGLopSbXdkRZib7/s83wt+ghgsj0Dv5y6+BkGPGQdb/LFCezgNeouYm4YDKwPqXZP5oGbwB6VRmLzfuiM5zS9cd07ospBxeeHg0ZoliV9/83gD+ws97IWHeeCQU3AbC3oNMLIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOi2bDFZLSgiqKfITX417jNUsartlgkqpCrEFfBiwUg=;
 b=K4NDvaKqHuE1v9NZSqzTJnSDywff7ldpnpFgeLHtbKeIdeC/bdOWCgAiFVvALtRJW6Tk/PCvSbSUZ0vL0XpM7pAYRZgDcblg0KSFiy4UDU0o6SnLJ730GBai2fJHUvAtirjwH12i7i+uW/KzvjiILn5RlYFEBcXnRZFChIMehFk=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB13964.jpnprd01.prod.outlook.com (2603:1096:405:21e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:44:46 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:44:46 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 09/11] irqchip/renesas-rzv2h: Add tien variable to struct
 rzv2h_hw_info
Thread-Topic: [PATCH 09/11] irqchip/renesas-rzv2h: Add tien variable to struct
 rzv2h_hw_info
Thread-Index: AQHbayBge1i4oa/TKkeTgAKSDwqSiLMkIITw
Date: Thu, 23 Jan 2025 09:44:46 +0000
Message-ID:
 <TYCPR01MB12093C7BD63A6BD3EED94CC03C2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-10-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB13964:EE_
x-ms-office365-filtering-correlation-id: 25ed05b0-2afa-4825-fcfe-08dd3b929257
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sTak9XPZF47LmwqUqw/FckTYXapJpwoiOMoa7DSOOEYUteVGEfmXMtl60DAj?=
 =?us-ascii?Q?yU3VeuiS0ILGhONJG7X1fxt5ux7bTx71mC16HaSgkr41lI/w2ghNV24gnhPx?=
 =?us-ascii?Q?iCoOg7H/36lXx/X23R1uY/eXPgH6FUDLUDkQnV5hZfCXxmr2Cto/XHIo/9Ec?=
 =?us-ascii?Q?vyM4DEdn2xrSgKK2lCyrr1ylgtDr0ceJXN6pBSOCnCNOKL5ifxv/Ua3bMx5J?=
 =?us-ascii?Q?TmdvSDWKt8Yhr4akN+3TO1SSlg1NJjjUREcC2Gu903xlNNAfYz2xyQRJpPQN?=
 =?us-ascii?Q?jO+0wQHdn4qXaHC2jNR6e9ZMz22izkJH+kY1HmhgjtYfCoH0Fsv4IJoa/nO9?=
 =?us-ascii?Q?eS8QeM87594ktHK1KtPFoL6eZymmoRwgtG7EvKHD53pDhpqCIhxec/uHTjrM?=
 =?us-ascii?Q?wKlTYTfzsV293WZ/qHOeT4AA3QnGnfRIUepBe9OTlud9Bl3IPGikvO0Apq92?=
 =?us-ascii?Q?LE+VehCqcmzwtQTjFOz7OLy8kLcc+KFya8U80zcxfpfRbK391XpLDUO6P+bl?=
 =?us-ascii?Q?tN8bGhHJJY9UL4PGwsx6nLbk58yGH+b9vhQntQxgNsZgyzwzOmsw16phvDMV?=
 =?us-ascii?Q?izl75twFTk1eTEtICUinsxy8i3dHMVdyEHQRkVRsEitvUaz0xGZWXvjGagAW?=
 =?us-ascii?Q?poROpq3nIulbgACeOmuklyisfew+LINJc+L7BXLDKq3rTF4CgTuFpvIpBiQI?=
 =?us-ascii?Q?MwkQd0NlvSJ0HkN46CoDU9CmLc6qa88ohcUnZtHR9qMMu88cidJZoN88BtoI?=
 =?us-ascii?Q?IXiWWl4oPReB//Gyjs2a/y9Z/KZ7WhYxTKL+l3Zi4dRod2iSTuCborBi9yr8?=
 =?us-ascii?Q?jIwhFE99Q30A0724XRl0C5AdLpZ2/S1O2lkaoRvLfkdqq41u8K9WvQiY+4zb?=
 =?us-ascii?Q?8f/va4vXSPGVUTawtbuYBWL557nfTn2vhXofejsTAgJ2szS/NXmsmOKRvgt8?=
 =?us-ascii?Q?Y6ah57nBCoMrfPfxyx9UStiMaH7a6+LbO4zGaMEYfgoQ1P4srC55YeGUczVB?=
 =?us-ascii?Q?wYOEI35J9bTB1bzHXYVPpGq7e4NxTvjtJEGHUl3aKcuixpt0hPg8MmsEpjNZ?=
 =?us-ascii?Q?OHRh85QvFFO63xILuI3EvsnZtYxYMcIxW19qWg0ETk8DXa3a9OI6X4Q5LT80?=
 =?us-ascii?Q?SWZrr/WWDGBfeLM/HZ9UGQrp+OSJ94s3FGM2UTuP0suTI1axXB713ZjbFGZd?=
 =?us-ascii?Q?4qFdk6Gcr98L2DyqEocs3hNAsO2hLzoURDw7H0Uc9ZgeLhMVioVI/NquUie+?=
 =?us-ascii?Q?uCtXdNu/GSPXA34MYtXxdyMLaIoZsqq+n6VoooGW5hTeRAX7apt2u6lJcgcL?=
 =?us-ascii?Q?+AmKpBLa9O7eFOFQuwejbqXCb3hPVB/t3FISX7iJ84FpPcIuMsg5xA9+rI0m?=
 =?us-ascii?Q?R6aUWTFMFBne6oqrnEuc6CJf0i/Y9mcziqO51aG3RRF8tG/zatsjDVc/pcNF?=
 =?us-ascii?Q?OVax/hVXKHHeywsHEZ3VJGLyLf5WKeNF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NfP8DRcBMznYP2c2WFQM1Nwsc+t5txhdvqfy1+e6J9JcuMeMj0ARGLG+wnhb?=
 =?us-ascii?Q?uZZjWn+cTlptMsCI3+J14hH/kQ6wyLrgdNBmmB5p9jJeGCnCADsLeFukwc7i?=
 =?us-ascii?Q?AqHQOZvYWYmvtYyeIBE0AG5CSniyty/pEHH0RnAkzdksj9o+Svu0iUhPJEvu?=
 =?us-ascii?Q?QfXAJM9GtYBhUJOqSCi7VfI31v2j+8sf+ifp6tHra0DCv9jhhVhs1R/XQ3E6?=
 =?us-ascii?Q?iCxdnmGD4xrVL6EBVlPwPEiyrCAmrA2Ohohj6MH69npOetQpdQEF5EByYnxM?=
 =?us-ascii?Q?1OxszZ1ghKkTC9JUgFvzJMPOnnleMhJvi758rqQRFd0hrWu0HLvF5ftXg0Pe?=
 =?us-ascii?Q?l8zMjyvoe1WrUV3O2uvNCKQ8w445GOkv/jSFLDSCMl3cAzNaG8IimQhTNQjc?=
 =?us-ascii?Q?V3oJ8CDPC6ttc8FfzEqt87DBWj3Hi0p84l1pJzBM/6G+Ooz2ZJajlMpCJGmI?=
 =?us-ascii?Q?UvxSY7o2akeiXzx0RK9Tz4KqV35IwXV5FlkVcwuzolxb1prBU92utrYZ+eLz?=
 =?us-ascii?Q?Hak3OqRsizkunJj76LVZqBRdPRI4DzadzwAdJzDD/LuK4BhWONfHEtfeZBpH?=
 =?us-ascii?Q?tvK2ON0wBc9+PBwXXEdeDIm+UfYY0tU03F5SDBkt4J+Xu0/og3ZzKaDuv4bV?=
 =?us-ascii?Q?09aD3fj91erKEfrdd8y8C9FkMtGoGKq9qoLf+a13LSUYbXq7nzU3WTMOW1/+?=
 =?us-ascii?Q?9qXn5PeKw/yGdmkt/Qn/6a/fVD1a/GIXjDdZBe36Wfs8s+8wfZVJVeFVvMWw?=
 =?us-ascii?Q?5+RGdLEAAeeGUIHXn1Jih8uv96Rx27T3mL9SFoW9ASl4ejOvdRt+KMcy6EzB?=
 =?us-ascii?Q?ojhuIeDrd+1Wzkc460DmM5ZwigaSbAUCPKrIMfCg5EWeo2zAtGnV6vj7UJKy?=
 =?us-ascii?Q?Hgd0Gx/u0+n5Qe/1YBAt3Jho0D9sCVRaNbUExf7CzgSNMHIUTT8IwSyiFSRh?=
 =?us-ascii?Q?lQ8JjKMHnPBqi5rh8vMf7Mq6JQGlWIMI/S0QeU1iQy6pS5DuctvcFR9IATAM?=
 =?us-ascii?Q?pv+tzZlRNDseBvVva00jcnwXyKF8UhVC3sm3oGgo9CLaoNUDAruvIFP1kSYc?=
 =?us-ascii?Q?F0Dk1WCYbp1YOQTowhnBWO6H8FLI5wAz8gejBGn8LDw1uX3UGDMnLEFliUJQ?=
 =?us-ascii?Q?iXvQhLoRAT7FSGE3bpxl84c6GSr9UmxECU5B/Fz/iXFO6BC6e0X87cmJnaXK?=
 =?us-ascii?Q?9RdcCFs1Weeg/GVLzRkSs3ggGHNIs9sDnJVVDL3VmoclJm9XhlHQYUsSaIVp?=
 =?us-ascii?Q?Hn2d5ciEdx/VHTG6ycZYjfepyi9nVssag/EYmBMjfqgkUzJAOcO/nQOJEy6M?=
 =?us-ascii?Q?TpXs33nTIa4/2x7E3mA/h5nzKJTZ9KeCid6jfb8/vjOd0lhLZYpQIhWD/Lc0?=
 =?us-ascii?Q?7qaKv4O+/RMPVPp0AnTQJvl8v73SEOwdkxUDAS4gYMtVvb356oKFhSozYdlD?=
 =?us-ascii?Q?+6YSr9K1d7TyCdfIv6ye5fSLDKVWY4FK4cxhff9iw769jDphli5KVHlBWbW7?=
 =?us-ascii?Q?jIjxyCicV+caDTKr9jiG7YdzrIMVGbLK16xrUAmOkXbQm1hL4PRM7z6ac8py?=
 =?us-ascii?Q?z6xs8llNkjcuvsf13dtkZW49BjVM9ykNudrI/wgVMcDdhT0fTyTkMMmzAtmV?=
 =?us-ascii?Q?aw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ed05b0-2afa-4825-fcfe-08dd3b929257
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:44:46.2788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGuc/xAI7kOrD3ZpdqCBsc9fPKEKDts0hr9njUZHOqYxep5sXWL6/ONsprW6IPXVHjc+qQkBP7bOIe/woXnY7uGVp+gWKeTKguMyM6oJX4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13964

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 09/11] irqchip/renesas-rzv2h: Add tien variable to struct=
 rzv2h_hw_info
>=20
> The TINT enable position on RZ/G3E is BIT 15 compared to BIT 8 on RZ/V2H.
> Add tien variable to struct rzv2h_hw_info to simplify the calculations
> when we add support for RZ/G3E and drop the macro ICU_TSSR_TIEN.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 5990dcf72ef0..a1ca34d33c93 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -64,8 +64,6 @@
>  #define ICU_TINT_LEVEL_HIGH			2
>  #define ICU_TINT_LEVEL_LOW			3
>=20
> -#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
> -
>  #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
>  #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
>  #define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel, n=
)
> @@ -78,6 +76,7 @@
>  /**
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
>   * @t_offs: TINT offset
> + * @tien: TIEN mask
>   * @tssel_mask: TSSEL mask
>   * @tssel_shift: TSSEL shift
>   * @max_tssel: TSSEL max value
> @@ -85,6 +84,7 @@
>   */
>  struct rzv2h_hw_info {
>  	u16 t_offs;
> +	u16 tien;
>  	u16 tssel_mask;
>  	u8 tssel_shift;
>  	u8 max_tssel;
> @@ -152,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data =
*d, bool enable)
>  	guard(raw_spinlock)(&priv->lock);
>  	tssr =3D readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
>  	if (enable)
> -		tssr |=3D ICU_TSSR_TIEN(tssel_n);
> +		tssr |=3D priv->info->tien << (tssel_n * priv->info->tssel_shift);
>  	else
> -		tssr &=3D ~ICU_TSSR_TIEN(tssel_n);
> +		tssr &=3D ~(priv->info->tien << (tssel_n * priv->info->tssel_shift));
>  	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));
>  }
>=20
> @@ -314,7 +314,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>=20
>  	titsr_k =3D ICU_TITSR_K(tint_nr);
>  	titsel_n =3D ICU_TITSR_TITSEL_N(tint_nr);
> -	tien =3D ICU_TSSR_TIEN(titsel_n);
> +	tien =3D priv->info->tien << (titsel_n * priv->info->tssel_shift);
>=20
>  	guard(raw_spinlock)(&priv->lock);
>=20
> @@ -517,6 +517,7 @@ static int rzv2h_icu_init_common(struct device_node *=
node, struct device_node *p
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs =3D 0,
>  	.max_tssel =3D 0x55,
> +	.tien =3D BIT(7),
>  	.tssel_mask =3D GENMASK(6, 0),
>  	.tssel_shift =3D 8,
>  	.tssr_k =3D 4,
> --
> 2.43.0
>=20


