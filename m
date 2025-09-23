Return-Path: <linux-renesas-soc+bounces-22227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F5B96732
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8FA3A2A77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6AA1F5846;
	Tue, 23 Sep 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hX/7mnvd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF802045B5;
	Tue, 23 Sep 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639081; cv=fail; b=Uo4oeIKc5Azn8LSfCEaPQLhh9iuRMPXiJAzDPZ2X7oChYOvRFkIyeXRDMVS7efwM1DhfNwZSBPSBO9AauE6+oZpfINeNZC6C/hpub08H7Mv6FY2XcgVXGN3SKKTvM00MYGfcYf0bgzwLCQEosVcyfu/TWyCWjVzbYFe1uD5mBG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639081; c=relaxed/simple;
	bh=ibxUQZg47hEm6RWwxFWnVtEBeXgq/40PC+TEHJDEv1Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fymD+j0hMABW1dQoXfRRHipp2MDqgHpVVTgeKu/2SHnyvz9JELj/vH5KkXZ0xAlzwi+Z405iOoTnGfv7uIVM+a1kyj0/rvceJDAP3g+EAeD9bepfoMZFxH3nmf/ndEvw5UEf75V8Iew3b76GbV6hPjJi6S9aCsY68OOj1U01KBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hX/7mnvd; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZQ+03FsXgZEX7Y/5z045nyW90+V1P0vSFtyP6RzmEku7k+fyQWjOD1jMn8gZi8uiNMirrCp+yQdgDjlVp0texlS/1FLoRSCaG0XyutY7LwHL/K/yLaxqbV1BhW8kD9n3/91E1NwOHcT53o2+2rzS+3CRhr9PBDWqA55omlbM5/jrQfbC/Jz3Cfz9UYPHFr7yYoFoMkM9RcMfZXBaEAupDpGiqLwnA0XdH4y0w8/NjgRUCLWCT7T4bPIl65rcdQcb3HPCCpvaR7eDGwnvKVTEaYwaiLJheSEsF4AHGud47uL9NgORq5xbotfFTeaD3iOFByavhBlqVUCULFj+pzwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvi0qpthMJwnZqisLGA13vaKBhHgefm8COXn49mSwZ4=;
 b=OhG/EyNSgSPOibY2aelZc3x+IPCr6A5sMKDobQvGCLo0gyZScpXctuw6NaynAC5fFmfqwSKi+xFiKWAhGPw0TeTFXypyxfVgbB8uTzuP0PUM/DagwTPQ7mL0yENB2JxD84TAVZHWrg/BOFFSpdkAklreGJTgBDIrGgOAfoltG9et/HNii6UGRjyrDfR3tDIzjTZso1hOYOCqDucAK7NDju6jqBbAiP10cXRPwHfTsqa0DZvNZ3jenFtAlYkKM/WrcG44XXbZohFA3OCP480xtBI9GdpCqDTQWrHZtS5GrCNtMfKkk1p9W4roSeb1gSA1Mj674kGIh7MO5jQIcAESJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvi0qpthMJwnZqisLGA13vaKBhHgefm8COXn49mSwZ4=;
 b=hX/7mnvdAIfsonHjdDn7WkCQyM2qJM3h3y5ycalqSCgHd3fSUtGiyJpdWrC9tAXi3OzEAE9mzefEHavuPPTaLDp3v5iSJD+NiCDHnq1jNvDaqxhPgpLB7kqp/vrY1S2O66/e6JUsqf81l96VAtUldPcH7Q9QxJMR8h7nSm1pvQ8=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB6584.jpnprd01.prod.outlook.com (2603:1096:604:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 14:51:13 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 14:51:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] memory: renesas-rpc-if: Add suspend/resume support
Thread-Topic: [PATCH] memory: renesas-rpc-if: Add suspend/resume support
Thread-Index: AQHcKumJ2m7CvGwmyES77CEN8sgCqrSg3MmA
Date: Tue, 23 Sep 2025 14:51:10 +0000
Message-ID:
 <TYCPR01MB1133276CCA2D8EC9D5238B2A0861DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250921111855.103566-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250921111855.103566-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB6584:EE_
x-ms-office365-filtering-correlation-id: fa0e3f9f-7a84-4317-cd1a-08ddfab0a277
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ENx92JLEtDREeiZXpsBFIxjneHnkyz1DQIraXj/QlmI9K7An88dweKk32grm?=
 =?us-ascii?Q?k75aCvY6ic6oF2vi/k/jp06AgZoZGoCvEAHySffM6y55iANH3YYi4jOxzlPZ?=
 =?us-ascii?Q?hKA677aW2Gb6nod7Y80TRr/6BKX+k+u9uwGySmxaWD3hzVTzPop0iU5MV+ef?=
 =?us-ascii?Q?icAKQxjJKK8WAHvd5JI5jqXNPSv0gtZZUoErRWsfEYRBzAaNmGp0Es0+nDiS?=
 =?us-ascii?Q?YfpGE+l22hPmIkRgYZxtIcLoqV0TR58g2LgmgpSYAauBFM2tcqUO5CEWwaQx?=
 =?us-ascii?Q?DrngjPfWAz3ULNKgjx1syF/1XHYDL4GFdGeCqX2ypHWNgdJMPXt+UDmk/2Uu?=
 =?us-ascii?Q?cYQfuUlX5hEYhD08KquNyA3UpP+Uj5mDq5E6c4SJpk2oMM4/70k3QEPmcP20?=
 =?us-ascii?Q?vlrnmvdX/uXFU9KjjUjw1nWLN2kAtx/OMEBnsDncseQZrTuAWDrooS7O4EVi?=
 =?us-ascii?Q?tG/IOpRPmubaz2uvM0G2Nsnj64kNtFMi0JSIIBrziIblmbYk4S8gUh3iuVwF?=
 =?us-ascii?Q?B6KNR8yEhWuai6gWS/y4MyY6aF2vY+EamX53q8+uKefBNMga2B+/uTDo5O9T?=
 =?us-ascii?Q?DK6dVJAomkuLNmgJh9tEZ+GauarVBbRFiIrFnMO1ljBFZ2R7m14NHyuU04Wm?=
 =?us-ascii?Q?IcEU/fturdtbJhGJIB7d9Y7IOZD//f/1KlB8jlgWkBJpw/uSOlXQjyHYc2CX?=
 =?us-ascii?Q?M6BCzGPFl36h/Xz2MuI0hQULDYUlE6wmzUSQaVstOVGCD58gt7o68rDByJk3?=
 =?us-ascii?Q?/Zz4kTuB7JNvGlqMGlbaYkn5SVe4PZHWTZjGBLsA2bWO61fCfyHbJEJ8dipe?=
 =?us-ascii?Q?YDwKx0t0xdKZjr2ud1fA1Ocz6V+ivJbDw7O3+Pc8JLgjA+Ayuycto0zuliuN?=
 =?us-ascii?Q?haPxI6/LRJqojN4M9w73NdlMVxLnrOxbRyR5v1uC+XqFJ73Ok4QfAFwaH4/N?=
 =?us-ascii?Q?fTU93b1Wd7XItdCwN2KLfdvOo5nR9qepMbiva8nV938gSOS6lEFoy/4S02Fo?=
 =?us-ascii?Q?HRylZ5jqlv0Dz55dzH3XMgbM+J8kRqZpfGWG/reQnaXAK4pAe3JJyrhAS1rc?=
 =?us-ascii?Q?AxiPxp/dngEoz5tWYy/NHIfp8RQ5RrHrdVCDX46w0qWtOqmpjbTtptiUshlm?=
 =?us-ascii?Q?VNLGaIr5q02KVqkbtnyrtmSyHmnTcZ3bUVv06eBEn9S+9H1fdoItGk1kjJKk?=
 =?us-ascii?Q?fz4c3ZvAqjKRkRZ3x2qfDoCy8Tl5Z/LAnNvQQTwrr6SCSMULReppwRckQZbQ?=
 =?us-ascii?Q?08fc5axD0BsIFGraeWGmlFn34r+TtK9tsHV81LUhI/d1pmpVa02vYhX1iUn/?=
 =?us-ascii?Q?Qm+vJVgEDiwiQh10bmkvnBSMfIXDRK2gUF+3itpCENHIiCqAWiuEqq4v6o51?=
 =?us-ascii?Q?ozqBCHpUGrSSN1gTwuEv4fhBRYR0lbyzvCNrAlpVfPuGtK+o+E7bzo+fkm5u?=
 =?us-ascii?Q?AP9UdoRRinqNlHzMr8yJLj6zWsZpCOAXKfi6gKVjvx+QeMbEnojqSScS7Zll?=
 =?us-ascii?Q?HcPOwktis57+5Fg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FVYJbCEzrBGTsI+VYiDR4cCwkNPRkf1jFqZK+nFtJp6aUNe0LQsQWkH8m382?=
 =?us-ascii?Q?STuvNQdgDX77nkXtAJ09BxULawEYwEPBNo+3LgTkUVVTeSAHaUbNmCQ94BLr?=
 =?us-ascii?Q?asWtoYN3QgWMlGpeNvPjRL4eoUJVeR0YJAjC8DlwGCuixnY6m2yqrBNDq3Gr?=
 =?us-ascii?Q?o6F2ZV2L7kMLu9hskyBEDJsOKBxOkvCjXYqiSi4TQ7n4VEOShKP3DgCWVuiK?=
 =?us-ascii?Q?fAGqLhbKHl6zvVdbjiJ5o6X15nAb51EtmrH4w0RCH0vu1flwau3gieLNfXcB?=
 =?us-ascii?Q?5sMFZ4qV6pLYaekTrP3KyrXNlasNRZz4syLhlcTNC0jYZM3sYGHR+qtJ2O9B?=
 =?us-ascii?Q?nB1MUSehJfnFXv8x/xuiKX8ufRDLaiRhSAG/sKqyIeVHvtbv/X1IqrnhgzIM?=
 =?us-ascii?Q?LBFDFUXrfd1JuyfJaKi/bbmYwmMRhWGIlCR4Nil/Lrq/bSIfkNekiLGZinHW?=
 =?us-ascii?Q?m4zl9vxHccerCuqXM0iB+9UHVz8aFxJt6w+kId82rr+RMRekrEqocLBzdHgm?=
 =?us-ascii?Q?1f0CpBPE1TkdyKBBfXldXxrvLGHhzHSt3KswWk4ugHwwAXVb/GRh+0qO633e?=
 =?us-ascii?Q?kQ+R6UdTR2TUSb+Lk9Ny2/UOALqLI52xAGJkva4S4QY/7va8uE2gKUAI8NDJ?=
 =?us-ascii?Q?ofN7rDw37UaHjJ4jnA/kRgppS7DGo54CiQBjOolg2xlAJvFd5pMV6FiJsmSs?=
 =?us-ascii?Q?oWtomFT8vnxxAqjq13pI4Wh0ZxncStTduxc/Glm8sueabVWQzshLb2HagyAr?=
 =?us-ascii?Q?/pDm+ckQ/z6rlnSbwXuQsiYItq1n5WePPZ9WvXP/t/WYkNQgcxGmAI3H167U?=
 =?us-ascii?Q?2oReafcMZ5YWuyMV8jkzCqPnGa0t01VNFCbGlEiNvU85zO5GMpzklWaoMJNY?=
 =?us-ascii?Q?o0aw+HD4GUH2U0UXBU4MEzAb5bM4KXcmMJeB5hETyd67pePAgwlvAPFOapCL?=
 =?us-ascii?Q?0jDqdG56XLbnnr6MY4GRYYhcDhhc08qvjq6SszsnKv8blvlWxTz6H6U6njCw?=
 =?us-ascii?Q?zWIEkc81dKWb7HpdVEvY7b08aFASw613GT/8W6qwJv+ik+sIL4SFvxyTLYLy?=
 =?us-ascii?Q?N1VIBkbdDOJ19fhEP3tI6bUvvL1bKHmkyYB3KrIec50digbl88XumCfSzCqY?=
 =?us-ascii?Q?tjOwgvjMGGlWc0EHANJR3M9BQ4motBhnn2T1nvA75USXGzAHg0mbuEM54tj/?=
 =?us-ascii?Q?w/RhQb+VAh/X1DWY57lt143153mBICQpC90jileATFYr5pw6uctaPE3GxjEp?=
 =?us-ascii?Q?mR4Krm7mbdD0QexdjWdfN+H/XQMh+nDAlrFXAFXjdrUo8GetmEanrzw8+B1o?=
 =?us-ascii?Q?tOEqzIsbq6YRtOFh4X00jY4+3bJwpykZLWdsgl9HxqcH+AL/KvQqlTnG8o05?=
 =?us-ascii?Q?9SL2n+xEu/BT1PGDQ7X+MTvLlSiGRvIYnElwXRW2DT+GyJ141cbV90ajcQnU?=
 =?us-ascii?Q?C+id+G736Ns0KQThFvIyQSSuBicEKWS1ShEgbZOSsoZrONH4C+q4uARkX+Ir?=
 =?us-ascii?Q?xu85wYs4c0/54FImGLF2tXcWOS6PZr8pRy6usLc8sHDI7LJ+6l/RtfOLNlR9?=
 =?us-ascii?Q?KOwXOtSBq5VZNL40FY7IdcXRLOpCZ2p7Q1imYtaRIgD/xr6JTdgbbYzjqCTk?=
 =?us-ascii?Q?JQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0e3f9f-7a84-4317-cd1a-08ddfab0a277
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 14:51:10.3382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hg7z5GJ5IY0DLRN5I5UFXHm3LpIEMH911CiBkT7PyH0Ps5UMe64o06cwSacUp42Gr/+4bAv5LWm/jExcahlMM93IBH5qbnyGk9MINNZieAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6584

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 21 September 2025 12:19
> Subject: [PATCH] memory: renesas-rpc-if: Add suspend/resume support
>=20
> On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume callb=
acks to control spi/spix2
> clocks.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/memory/renesas-rpc-if.c | 56 ++++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc=
-if.c index
> 4a417b693080..e1fba157982f 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -67,6 +67,8 @@ struct rpcif_priv {
>  	void __iomem *dirmap;
>  	struct regmap *regmap;
>  	struct reset_control *rstc;
> +	struct clk *spi_clk;
> +	struct clk *spix2_clk;
>  	struct platform_device *vdev;
>  	size_t size;
>  	const struct rpcif_info *info;
> @@ -1025,16 +1027,14 @@ static int rpcif_probe(struct platform_device *pd=
ev)
>  	 * disable it in remove().
>  	 */
>  	if (rpc->info->type =3D=3D XSPI_RZ_G3E) {
> -		struct clk *spi_clk;
> -
> -		spi_clk =3D devm_clk_get_enabled(dev, "spix2");
> -		if (IS_ERR(spi_clk))
> -			return dev_err_probe(dev, PTR_ERR(spi_clk),
> +		rpc->spix2_clk =3D devm_clk_get_enabled(dev, "spix2");
> +		if (IS_ERR(rpc->spix2_clk))
> +			return dev_err_probe(dev, PTR_ERR(rpc->spix2_clk),
>  					     "cannot get enabled spix2 clk\n");
>=20
> -		spi_clk =3D devm_clk_get_enabled(dev, "spi");
> -		if (IS_ERR(spi_clk))
> -			return dev_err_probe(dev, PTR_ERR(spi_clk),
> +		rpc->spi_clk =3D devm_clk_get_enabled(dev, "spi");
> +		if (IS_ERR(rpc->spi_clk))
> +			return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
>  					     "cannot get enabled spi clk\n");
>  	}
>=20
> @@ -1063,6 +1063,43 @@ static void rpcif_remove(struct platform_device *p=
dev)
>  	platform_device_unregister(rpc->vdev);
>  }
>=20
> +static int rpcif_suspend(struct device *dev) {
> +	struct rpcif_priv *rpc =3D dev_get_drvdata(dev);
> +
> +	if (rpc->info->type =3D=3D XSPI_RZ_G3E) {
> +		clk_disable_unprepare(rpc->spi_clk);
> +		clk_disable_unprepare(rpc->spix2_clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpcif_resume(struct device *dev) {
> +	struct rpcif_priv *rpc =3D dev_get_drvdata(dev);
> +
> +	if (rpc->info->type =3D=3D XSPI_RZ_G3E) {
> +		int ret =3D clk_prepare_enable(rpc->spix2_clk);
> +
> +		if (ret) {
> +			dev_err(dev, "failed to enable spi x2 clock: %pe\n",
> +				ERR_PTR(ret));
> +			return ret;
> +		}
> +
> +		ret =3D clk_prepare_enable(rpc->spi_clk);
> +		if (ret) {
> +			clk_disable_unprepare(rpc->spix2_clk);
> +			dev_err(dev, "failed to enable spi x2 clock: %pe\n",


Typo 'spi x2'->'spi'. Will fix it in next version.

Cheers,
Biju

> +				ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct rpcif_impl rpcif_impl =3D {
>  	.hw_init =3D rpcif_hw_init_impl,
>  	.prepare =3D rpcif_prepare_impl,
> @@ -1125,12 +1162,15 @@ static const struct of_device_id rpcif_of_match[]=
 =3D {  };
> MODULE_DEVICE_TABLE(of, rpcif_of_match);
>=20
> +static DEFINE_SIMPLE_DEV_PM_OPS(rpcif_pm_ops, rpcif_suspend,
> +rpcif_resume);
> +
>  static struct platform_driver rpcif_driver =3D {
>  	.probe	=3D rpcif_probe,
>  	.remove =3D rpcif_remove,
>  	.driver =3D {
>  		.name =3D	"rpc-if",
>  		.of_match_table =3D rpcif_of_match,
> +		.pm =3D pm_sleep_ptr(&rpcif_pm_ops),
>  	},
>  };
>  module_platform_driver(rpcif_driver);
> --
> 2.43.0


