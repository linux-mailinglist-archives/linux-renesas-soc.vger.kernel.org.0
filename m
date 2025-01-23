Return-Path: <linux-renesas-soc+bounces-12376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B7A1A123
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6641188F1FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD4020CCDE;
	Thu, 23 Jan 2025 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ka8ibNmR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2F1C54BB;
	Thu, 23 Jan 2025 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625692; cv=fail; b=eJi6oEwPmIJD0OLr/ftmh7Qzo1ziXoo8tiaPOAOgQmuuTIZ93rkHh5ohBl6lMqjeYzlnrSB2O4eMm8WbVE47lx4v1UXfqBrQR+9kpay2BQESqjvlaYfG84dM1RbRDd4faUijaM9sgkWT40aPWh4Cl09Sa66TtBo02HEKC1dxyUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625692; c=relaxed/simple;
	bh=pGYeNdb54ds251MEdXB63YYL9pQASst7r+JEypG+PQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P4D64dIwqmOswdR0nwrHRmktAM7PsKn/51fIKihRmTBsLnS6KZprbImgX9aZkF3lbMWuBERtdaqxbqZ+ue+diTYqeSN5jG7NX6DlbY4iULb7Z9S3W3s/6xG7hIdTRCjFFE8SJFGzZFsbYsgLRdU09DRFIrqNLVUyjz2xFR0a9hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ka8ibNmR; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/q7pZmICX1/9F0xHltpAdZD23UOejtY95CdIQDl6XoEvfe31dS414BIXhRQE3nrTSKSpFwJV6PVzymzEPZzJ0uESsxx91eLCH5/clzMkGMbph6aGnGarxGuINbccKNV0LXLo5OpFwu7ll0zNP0xOvvLXbWc1nF3PH268rZK8x+xTXGr+hqgX1y/cKPebPe2yjVNmEmiRa47r7+/ApP3SqkrnVuUvwvVIUiMqFEgO61vREo2ubq6rxDsZ5uSK99sQmhWoE4rfNDK6jzBXb/7n4QSkCxha5zq3XFswpCQAu1BlMAEbzbQSKpWWB+1OnKefyPX47Pj+3aCS3LY60U8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfjQzWVdKDFUsnKKuAefu6UAgapX9pa6MQGm0NBDBcw=;
 b=ZxH5nA7weQbDqWEcSSa54zNlOWXZXPhmnBQWAMWeclvXL923VoR4NWl+FHwOt/eDgSt0Ya9NFMcXgitddmBceAX9RJb2m3fPEIU+y+U58rJJttr1c0RJHxZ4J3cB6ZYseF9bfvxyjKNbAmOgMi1L3v4qHwe+DYdIluvylpf6JV5loccMMNI7/4U6CR9tz9RgBxN1JcPuZFGiwyYQ9KtxR/j7V3jmXn6DSxMk7Xtcir3gnvvaZRIm0sNymoM6458G+TsmEYoELg0l1nu91cIpybOWdZAMSGrzUqHAGNqAzqhyy6/mSoOiKiHjZuG3L2XwGGJ1u+aoi8QISpvBrqhjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfjQzWVdKDFUsnKKuAefu6UAgapX9pa6MQGm0NBDBcw=;
 b=ka8ibNmRY2J2JxC6XwQm4DBh/mEFbB8uVWbY/S6HujBGfP4Ktp1fBXMO5mqQoRxC3h0qBsn0EVGKPwPxpkuMyC0bNrEQURCCP3J7XYiaqVSeOEKXiqueOydDfj+mKterJOyZAnWUJ7Lv2+a/Q53Cxd8eb0Lw4XyThTd95zCXJHo=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB6367.jpnprd01.prod.outlook.com (2603:1096:400:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:48:08 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:48:08 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 02/11] clk: renesas: r9a09g047: Add ICU clock/reset
Thread-Topic: [PATCH 02/11] clk: renesas: r9a09g047: Add ICU clock/reset
Thread-Index: AQHbayBfWgT5YOvO1kWh0H8NPJQUKrMkIXOQ
Date: Thu, 23 Jan 2025 09:48:08 +0000
Message-ID:
 <TYCPR01MB12093CEC7E9F12F6133B9DF5FC2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB6367:EE_
x-ms-office365-filtering-correlation-id: be760471-d804-4fdc-aac3-08dd3b930aa2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?g8S8ZG2OwwUNJH/N1arwZOuricVusOVS41NwuJaD0EOtarbhaz1ftH2kCest?=
 =?us-ascii?Q?kAOBPu5PGFtu7jeToOXCilC1aEd+MjkpXyHV41EC0jSuLbSaMDstAzdmMfeW?=
 =?us-ascii?Q?vY2AvX1TsSazlCf5EgvcIz/2D79VfxNFghDyGy4ZsRE0CkRSiRRt4SkiZWqw?=
 =?us-ascii?Q?WdVX8ChiPfRaMjfKuu9VdA4w9f8Xp+36g9BXiIuk+R+j5CBt5RfGOyFCK26U?=
 =?us-ascii?Q?G0ysl4bAmhWNjQEjQArKD1qipPBJVDgUwwfcQsnvIpa02XSeSE+VdMoPpQbg?=
 =?us-ascii?Q?MBnRXDKRSFv8gZTFU2N01ZhkQtfCa8xMcC3dBWHY/hGXpww2dKI23D1ZaYJF?=
 =?us-ascii?Q?MwYkaAuLRgIjidMgiZTNC6HX7vD1sm1o4LFjTWAwfj8fcQeG8+kI1i2Zn+JC?=
 =?us-ascii?Q?PhbQ8ZvWTxCnzKhJ1PjqADngm1qdnrxMPvgK7/UqXLvmSZIt0ZeYzRH+aruT?=
 =?us-ascii?Q?gVc9dR2dQqPXT/MZNkJjDxfm2PkIoTg9N6UJUF+pt32mIrnrp31NNkdrMGCQ?=
 =?us-ascii?Q?xG/3oWqaXqex1/8ytTZVcnpw2tT6nlbOsp7FEhzDEFZilDPWw0R8AqLh85nZ?=
 =?us-ascii?Q?vs/WNbMVDdKwD3sgHYI87R+0iDt4JsAuLst8XaPP54wO209rGh13GOt9Xarl?=
 =?us-ascii?Q?kjYltsMlPu/9D4Py34fXqGB75PBfih82Yp+nF5IEuq3Tb39PKhcfZB7qcR47?=
 =?us-ascii?Q?cW63hsh33PNzwJk14cuiTyrtBzITJw34cyBKpFRFc9t5uCjIQax6ZBbgi9Jd?=
 =?us-ascii?Q?CWFNKfhd5FqmKz/18koBnp2g+S+rsbKZ3zAEbSrQGxqVwqqg+5iu9AcK53By?=
 =?us-ascii?Q?Zxy88CXSMmpkL4OToyGdf6ZRnrVmMuw2jSzhq9jYwf3spHnaGevhR3MviuX2?=
 =?us-ascii?Q?AoAEq+uFdKrSpOVAq1bbfg8dK3K57iXebGPEd5KsAGLrh+ojZspO4ypkpDxw?=
 =?us-ascii?Q?N0opbtHE194qBwsQRE18Vj8RfwwGNxaLThRmkaskFWyl+dyVG8mFJe0pHRfs?=
 =?us-ascii?Q?/KI3Hm0bYoZH937FWj0XssLyw8zt6OJGnDeWFmsQ+D6c3Z5oiwMwiMRb5tIT?=
 =?us-ascii?Q?sPiSXiGc/uCc+zgNtAXU+7GutB494X19lnVHmbW4NYYTQZ5cEkvk2MJ04Ndn?=
 =?us-ascii?Q?mDVIYwwJg+pVZxzSnltI8MbX0Zz2+HaH/dO9jcNhP+dk7aWflRdlF+9DxT46?=
 =?us-ascii?Q?Wlymxo2daibnoXhiFhQHq5Hfng8mxr4/eCD2LXcUP18/YT9PUeXH/Kk35AhB?=
 =?us-ascii?Q?NCxwRcxNTT9Eiv2VvVRp99TYTxrNGxAJ7n1hDvnWaATRe+bdq4jHSczLqVMP?=
 =?us-ascii?Q?mpbndRrxcZNrjUrLo5Wq4dcCX9RXTEqlMT2kA8g54kA01TJDCZE47MNh/m3z?=
 =?us-ascii?Q?X7D8iokP017+UGtqEdyJD8GOu5/PaudyeejcrAnui1rKRm/+m1qi2y7Stve0?=
 =?us-ascii?Q?Ij0n9qDJChkzTR3eArQOrhZzq6vE2Ofc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BY3SKxgsDVzAoKrOA9I0vqlAVz+gOeoL/cMk8rdLcvcKdBlFnD/6iVGG4EuT?=
 =?us-ascii?Q?w7ZND8ngcogJ0TLxz3Pffj0AZts8Mgk0orY1g/wxUVakqp0TvnsTqX0NA4Hq?=
 =?us-ascii?Q?zBxpAVsCk6OdCdZijlKypoMto2Q47cyfpr+fnfNVr/4TWLtzq/HKos6sIu1+?=
 =?us-ascii?Q?XMHao9Sr2+WKOODJN4GqDwoO76sj2YLJK/hig2zhtnkNxyx14SL1ZHujdp7E?=
 =?us-ascii?Q?eF0uBd/yIuZQGJ06c8JlksINmSuhcb1DvHhpUZemyW+X6T6oC1HdWdcQzZXm?=
 =?us-ascii?Q?mDqH04CFtbjcetSZwNtQ6ZaO6ZfnSQ6VvffXwPGiDVNq0b6tkL/fnRn0mr77?=
 =?us-ascii?Q?H7bGZa+rC6sq2uUX9+5ZOPsixiU9Ci3QaXJeGTMwRb1GrbA+Ns2GI6PqTsaW?=
 =?us-ascii?Q?aUHhq08h0TzNj0M83Zmn7O8UFujwxJ1JycZeuF3AehSmZZVZEICsYpULe3lN?=
 =?us-ascii?Q?rZCgDQwmUGAUdlcZEhRKWSpdstMa/GZMFlRLScMfbfAs/5k388xC0mK5UZzI?=
 =?us-ascii?Q?FikaxZpbAKBGDOcWrgrYxkLzW6Qqk97CxtgkCwBKBIQ/CasuriWVco+Ciuio?=
 =?us-ascii?Q?pu3ONqsgjfYlxShi/wIpVBaNFRbE9mtCQbXAR0DoiSTfMvgs71vS3ma+VUUl?=
 =?us-ascii?Q?UmvgzqSi7k2Yaw5i24AxeqctZoFoXA0lR9u9lLk1fxbwIKc4pNda7fIhKlWB?=
 =?us-ascii?Q?nRygOExsRofxYae876BrK8YvC528heI7F0nwheMv6KPjT7x+bCV6YEH7rorO?=
 =?us-ascii?Q?rYNqEKC5VO9od/OIb80/Bt+y3PobMWKTRJ7xBn85bvCuJiMrykfd0Xzzx12C?=
 =?us-ascii?Q?77m+OtcdvK11cDhhR9lsOncqzhTdjkLdDV1gWddtoZ3ZC1qxrHrYmzouyAkJ?=
 =?us-ascii?Q?w0Entpx7y1cGHRsM5A+VLD7xBpVW28qDka0l9yVSAcY3Hu3rsrSuJhZFF3qz?=
 =?us-ascii?Q?CZbgI62F5bCZE42cXOauj27xkyo49wh6ZJ3ezZSHa9GC6I3DpSFZ+MarsXQ+?=
 =?us-ascii?Q?4fuqSmyUVILsBsNJ9zD62BeqLXqKzh9VBVcbOFWZm4V084cYqFkXJpvRCOuB?=
 =?us-ascii?Q?qExcEqGvHdzvXRwBPMTc3ybuEEpiB8IGnQEMFkeUR9aLX1JJfUBIHGvn9JkX?=
 =?us-ascii?Q?cOiw3n0mpte8CiJ7yGmvTj1dKu+3D9ZkxPESDkTj9N93geITLhcgDrva7b1D?=
 =?us-ascii?Q?F12dMb7uM82lBB/mQ7kJLV5VRC3RGr5DKCSPfBf0dt099B1HTQyShIllybdh?=
 =?us-ascii?Q?fseMCJNMnPnH8J4NjCTAxv00r8Py6uuC4NHfCt3x/Xa8A1c2PKD8di+lMZ8h?=
 =?us-ascii?Q?AD9dmDufNc52yyj65VmQWOqXFNZ10WHlL51tBY7OTVl2LG2sYXPhK8LxJNwM?=
 =?us-ascii?Q?BwTm+0xbiWbutswNP3QdIWTWshsXVnjNHoaALk0gR/s72/ZtYk8uNmuEF/ua?=
 =?us-ascii?Q?3Bf2WhcV6iAStKoskrf5rQdckzExWTjqNkwrmzDAQlO5e4HmYrEzNhnKuuyK?=
 =?us-ascii?Q?Usqe9S3yZXk7hOYgLidf+kTdftAx+GxCXYxHD8tduuPabTYblea7LadN7Vl5?=
 =?us-ascii?Q?f01R5nv+c9Fsz8H+UZOURUnoWwTAlD14nM1lpKMR3rBoZmrLoW/F6/IqT6o2?=
 =?us-ascii?Q?lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be760471-d804-4fdc-aac3-08dd3b930aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:48:08.0594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LyiD6vDke0GOArFYRyIafy4S9CHyGgsb4HNDl6fiCq4fdT/POzu6Mg5vgjILv7EwDqj5VVMFns9EOAEqZdttlFHzZrbgsh6P5DQ5EhmMS/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6367

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 02/11] clk: renesas: r9a09g047: Add ICU clock/reset
>=20
> Add ICU clock and reset entries.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/clk/renesas/r9a09g047-cpg.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9=
a09g047-cpg.c
> index 1886eab9ef9e..1181e7b605e8 100644
> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -90,6 +90,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] =
__initconst =3D {
>  };
>=20
>  static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst =3D {
> +	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5,
> +						BUS_MSTOP_NONE),
>  	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
>  						BUS_MSTOP(3, BIT(5))),
>  	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
> @@ -128,6 +130,7 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[=
] __initconst =3D {
>=20
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst =3D {
>  	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
> +	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
>  	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
>  	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
>  	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
> --
> 2.43.0
>=20


