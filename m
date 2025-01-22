Return-Path: <linux-renesas-soc+bounces-12318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B0A18F8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A15C162770
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1041ADFFE;
	Wed, 22 Jan 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bje7vKMb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5B18CBFE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737541153; cv=fail; b=BrjXfBpZWKg+qsDcpEzyynAdhEXzSyaMRpsLl5cEbcsIwszKlTETzMFC8pb5A44gDosXL5oajiDCesx/FZbKfKh7n/8L09CtGs1xftOiG5bAemPUX1X1e6rvcEwG4TOek5InvKMK66O/AORffXphanIHQzUtMStqbWDCey1a3vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737541153; c=relaxed/simple;
	bh=x6akcvwsg8E/v599gbnlNknd3L6Is90GRvyEHj8BFz0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F1//oGQ8/HnSb74ug6TpoC7V94AVYar8ND4DB2dp5X3KKvHFLIcPRS1tTfr2FKcFtkqNH+595zHUX5aVyGLywvzVPerRzQpGdSD4cmsXfuLpjPF+y8CaHQ9LyPAtIXpzaTuJmhNq8etWyChj4OC4+9xK7K1lOJj9+W9xtTT+4ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bje7vKMb; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0fXNaZ8KeouzZdT/3BQWufts+i88jwjogDCmq5HvQ3tFzt7Vx1yCzMuynnfE87IomK2JKW3PBx7x2o7OxgecQ6PdzpeNUEJhAUXwjwsXeYjzpxfatI9665AsZYL+AGcGMt9cn0doM+cwDO4h9nlDYtuTHZCc0DyCDouzbaKI520VVfLu/wW+ijzBh4+IpJaP/uokyyMAsmlf+TPY3DkxYhs6oWrs8oy591QQHtAeP7Df58z+8U8cHUMEnYhkbLugyRgiMWcmyKvYrLsE3KkYzaCPGfeXkulFsKTZLhYd1Tgf0Xn1cSVVbkeIJX7Re6YSTnTASJ0BwA/GnktWow46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTjR36KTkYoeCKKeGWA5ak3pBBVbyZgODt3ed/X1Ra8=;
 b=eg1YNmK/5bxKclyhOzoeCbM0SNNeDjS5Lh+GLkI6bk+zXEurre6Q6h8L7JfvbJ6VSkOHYtbwo1ZTUrCAqwdw6tNodFHiSwTuW1uH4v/uu//VWvjcnEYSh18hMfcCkxG9LJi21i+PCkoQEQTi/Pm//lU9erjz+rB5A65SosO9K+IZorAgyAG8gfrtWHCRug/wI2Cwuq8f0TKtK38nYVWQXDlHNLAjmfdUrYNV33phdC6iQJ2jrRL/J7ikf4Ja9q2r2g/HFCjBLAdgWRx3c0/0AOcEp55tqKvSzSIGQRiqUmSCqPEW+7DUifa7wo6eBa0iH2K/84QTmfhuba1kzpB49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTjR36KTkYoeCKKeGWA5ak3pBBVbyZgODt3ed/X1Ra8=;
 b=bje7vKMbXEa+1ZY/DZ2f5CJvXNZGPGeZBXIunv1hjYwIQKilWA9KUAZw4EymlcLNDEHWwjpLZUAwQdCfjBZjkzCXmFyHG4oroQ7/6PtUqUvtqzsoJWqsxbL0CQ0P+/G9jFRFnk4HcFSGItvsq8GNfdFncJZbLIqozpxS+dYsI2s=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS3PR01MB6533.jpnprd01.prod.outlook.com (2603:1096:604:100::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:19:08 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 10:19:08 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
Thread-Topic: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
Thread-Index: AQHbayBeT+uMHEeD50e6xPiRv0gU3rMil7zQ
Date: Wed, 22 Jan 2025 10:19:08 +0000
Message-ID:
 <TYCPR01MB12093D55A7BAC597AC532AA96C2E12@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS3PR01MB6533:EE_
x-ms-office365-filtering-correlation-id: 95a7d19c-389d-48ce-0261-08dd3ace34df
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/ZSc9AvdHVaSsmR90FsbC2KzW3F+8UtIsYMjlCelcMbZoWfrELMOp+l0vdTI?=
 =?us-ascii?Q?UTHSNlugIfQZJkeNGqioOCfj/g9+s1z+VBOQBQUexvTBkoz9CNJqel1psRKR?=
 =?us-ascii?Q?t/ikxn+nvAyqtagOsNsPqruvQKEVIUQEXP1PSlyjasLS0N1hL4uPML124jwe?=
 =?us-ascii?Q?UxSHKEM/GpThx8/+O/BT1Qr2XvSDAvj/FbDqMowf7LSfLgPugdkUXyiQSBQH?=
 =?us-ascii?Q?UI/6keywmLx5WW1i9yB8CVDKPDt/d4AWZ6N72GaK6K816nmk92eBLq2WGQDp?=
 =?us-ascii?Q?3HekSoIDviGgAyPuS/PRYBdKlvtD45f0yX698KHXicEGFS8WEttOiTdhCys2?=
 =?us-ascii?Q?8rJ9I9yRxjx8jlX+E8OUmu7NSt/9yIco5DWnU7hJKw5rESAJUZFU2R+8JHrT?=
 =?us-ascii?Q?YpRMecY+r77MdQdjlINnS5MHO8M5wkBSGehH65aY2gTaeIL6VbRptih24DB8?=
 =?us-ascii?Q?Jo3O+pZKmEzGmOuNYEsHOF5RWdaftY1yVp0MAaC3TG906OLn4VDM4owz+pPf?=
 =?us-ascii?Q?NjmOf8qesndaLE5B7Ndozu8OP4m8BPmhBf6+DIeG8Paq3IMZewFa6m4odCPo?=
 =?us-ascii?Q?7FGI7IG+zZmB07XmTV9KfWH2d7+gfMRysTLF9OvXcDorTyiUgtXFcQixfUQR?=
 =?us-ascii?Q?JMvIkk+YVdZtZu8CZJZuzeeS+MldJpdX823dn/inXDVpvdN91dcJzXGk7wVU?=
 =?us-ascii?Q?khMKaZ7+C+Wr9k5iKSRO/Pf29uQjT97pEj/6P1M+oBSrjIIJcL8DZHKGyVCg?=
 =?us-ascii?Q?J9hAhXoJ0LelSAU5aqZscqyPj1Y5r0o622PWiIZICbwWaCBhyoHQIaYe6msr?=
 =?us-ascii?Q?ttlACThBu1PsHbsIGR4BOKTvWm+Ie7KRo4HNDCVj3OkodQNeVAUedxu3L5Jo?=
 =?us-ascii?Q?FtvJLMaATi7wOF57igeqFMuU+SGCVZIB7cXNYfygNRxZtWq5NDQ7gS3VTKb+?=
 =?us-ascii?Q?HPjARjx4yKpjcIou/QrivkKH1mWaubm0kNY34TzfycO7TeQEaKm0C35lCWvN?=
 =?us-ascii?Q?XY3T13kx/MxfDZzmRDtqvkultCjpqV5x/Ig+V/2rse29WJd9ITWFSyvHE4HY?=
 =?us-ascii?Q?FNorDTO1VwN8l36klPk+yR9yB4/9+AuI48b2HAWjYWQuFPwXP5IYCtfvXI2q?=
 =?us-ascii?Q?03dFBaH9JckVWkYAen8Kw/s8sX/t3B5RWgsXkwgGpT+Yy/eBlgba08B+z3os?=
 =?us-ascii?Q?wcmrU4BhTAWUbA2RYUW4UlwhEUJ6aID5KhtehZUvRYRQCWz+ehVJMDLf1bmK?=
 =?us-ascii?Q?hztCbJ6lKorTRYKiL+TvFmO/ts3nsPpSGCTpkwcsH91KIf4w3dGb5nEZ2it4?=
 =?us-ascii?Q?soBdpv1VJX0phUUHV9H1H1CzXE3TmY/hzMtSsdh0lCVQ9hBJqeQDl5CUcqZe?=
 =?us-ascii?Q?zmcb0RcbYrlt9j2WhUJ0XEHxDVofeM3R3zFt/2CL+/guLYJDJu8Dk0Sz/m6Y?=
 =?us-ascii?Q?7DNBh26it2f1von6WJsbiCZUKBtS6Fv0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z0Kr6tRR274pN/sERgFw1WLJ052Ud+g6qbbsb4G7dEdiS3B7Ct7cq+wQl589?=
 =?us-ascii?Q?TVtuIYjQyr2GnQLQKeEvtTKAuex88NDCdsdkNPYzrwAOFX5F3szXEwue9w0I?=
 =?us-ascii?Q?WetWNeY25591aLd5TTfQK0iE8yxV4c2fFtWiOJSKubi8zplImRxLaR/6zJNi?=
 =?us-ascii?Q?HXkxRMGCBUWLoknz8+V8Mk+CChHVHL7e4gcAs/Ez+z8hByKHFBtzJwz2lapA?=
 =?us-ascii?Q?XNC8AjMBBoXl111rUTM8cnwKVcrEIFtoYN2xzkLMAFFTpD+B+/HhndwU+6Ey?=
 =?us-ascii?Q?BYwyD9CyM+jirTBqRRJCMALjMsB0T543qHCQVVz8xWKmbTc/Feia6QHfwaaC?=
 =?us-ascii?Q?ZYxaCsoVY+/d9z6g2KL/qWSV246GeGAcjJVlQtiMdwAuVZ/onDUBDF9+ArLp?=
 =?us-ascii?Q?HANtypAuAvzY+1XRrEhsgOVWquxTFiaBFAFjxpgVz92z20z5wCobM5mjJ4/K?=
 =?us-ascii?Q?nF2Vaxs7zK8RISNvY6LdeFdXXar8vLFdllo90udDa9JVf1Y69PQu19XQQaHe?=
 =?us-ascii?Q?87apyQl/kjYsup456TYnC1lw3/tettaJZszVAAefV9oG2M8TxWVI1mTm4cqO?=
 =?us-ascii?Q?+YChfTKT6AYTWcPnlMSYeC6fbHXy+B708+om6VF9H2orYFKYTmFwyhKh5UJ6?=
 =?us-ascii?Q?rVa3tWU9roomwyEDdi0QdniHJlYmazZRzWFhKdZ5Sf5qJ82+6FvlUHEESzkT?=
 =?us-ascii?Q?qMP3l41hoZMScySpgqqfZBDcRQ4e1zsqZh3mxUP98DZyzK5DxrhaKeIiFbIQ?=
 =?us-ascii?Q?KgX5l2KnOZ8RGF+tHXJWAqFxdvT+TUhVYzPamflnNWSukXb50POjgEGZ6bBa?=
 =?us-ascii?Q?QaSW8+qrs8Onc13210N4zmJqxE8e6z+nL7IZTOs/6foSrx5B2jityFQPVsEz?=
 =?us-ascii?Q?UDQ87yKiEFpIAkBDOANtcdO0rbCbO7G7hrH+/Ou/Y6d/aO9JdwA/wPLEZJSX?=
 =?us-ascii?Q?Dw348L7Tdc8xeCp3wHlYK4wGlWxcS0RKkjVU1J3+psklN18yJhjTTZiLdWio?=
 =?us-ascii?Q?czR8tYVGyv1r7p4XF/AU43V1sX/zllpL47n32KMvpC4/p8r2HJQ4Odv3RGxM?=
 =?us-ascii?Q?5QznlBN2yAl2u9cPgyxdrU8fOSGOki4n/Q/yJsexPQ3+xtDoypzqtEK6UuUk?=
 =?us-ascii?Q?Gvnw2cr6/g0EsSLfrQqeBKGK4H6oZ8/QM+HMQZz+NuRfE4hF0Y4virhmIVNe?=
 =?us-ascii?Q?NBHrLU0+l5FgqKgq65Vv+7ji3JT5Opxa9ggNXH9TJwLA81AtFvDdOYYH1Z4f?=
 =?us-ascii?Q?NylgmGbuqbfX7aE/VRUI5/ph5BcSLvHhONwrHorP+rbKwPJGp/xOGgQFYOu3?=
 =?us-ascii?Q?M+f1uC+GYjfbhgWHQKcaVf8TjxQZdq0yJvdyMdnQ/WBfZuVfd8OJhg+f2HRG?=
 =?us-ascii?Q?O8lg4vyF9Nix2Yd0D0gsqTBbPiTQjdBZ3AZENpl7u0k1+m5F3dtSyCFQ0F6R?=
 =?us-ascii?Q?JE83WvBWaSkH7xs9K9TVDXDxRGYyMRBtlin8WyfAuUwEFEpD8WaM2gEbk65+?=
 =?us-ascii?Q?eUpA4QKQSk6bXXR3xBuBj/DY3OcDISFxdXhpk3vHPEH0GrsI5JLv63SeZt2f?=
 =?us-ascii?Q?uuNwhxPPrvq5AMBcWIPxy1xWji4ltZoF0MJBDz88PctZsjHx3CSkmGGsGEQe?=
 =?us-ascii?Q?bQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a7d19c-389d-48ce-0261-08dd3ace34df
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:19:08.0887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wagL2ocNs+1QHvWb0y7K0KKLWiqSZbDNDXBhsjW+y5F1DI4Fm2usBb1MdFSrUkSAyufCnzFCj5fN2R6fRkzGO3G7X5pCw976dzpUHFuWD0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6533

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to s=
truct rzv2h_hw_info
>=20
> The number of GPIO interrupts on RZ/G3E for TINT selection is 141 compare=
d
> to 86 on RZ/V2H.
>=20
> Add max_tssel variable to struct rzv2h_hw_info to handle this difference.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 195ce9c5e5b5..b244cd61cba4 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -78,14 +78,15 @@
>=20
>  #define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
>  #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
> -#define ICU_PB5_TINT				0x55
>=20
>  /**
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
>   * @t_offs: TINT offset
> + * @max_tssel: TSSEL max value
>   */
>  struct rzv2h_hw_info {
>  	u16 t_offs;
> +	u8 max_tssel;
>  };
>=20
>  /**
> @@ -298,13 +299,12 @@ static int rzv2h_tint_set_type(struct irq_data *d, =
unsigned int type)
>  		return -EINVAL;
>  	}
>=20
> +	priv =3D irq_data_to_priv(d);
>  	tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> -	if (tint > ICU_PB5_TINT)
> +	if (tint > priv->info->max_tssel)
>  		return -EINVAL;
>=20
> -	priv =3D irq_data_to_priv(d);
>  	hwirq =3D irqd_to_hwirq(d);
> -
>  	tint_nr =3D hwirq - ICU_TINT_START;
>=20
>  	tssr_k =3D ICU_TSSR_K(tint_nr);
> @@ -514,6 +514,7 @@ static int rzv2h_icu_init_common(struct device_node *=
node, struct device_node *p
>=20
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs =3D 0,
> +	.max_tssel =3D 0x55,
>  };
>=20
>  static int rzv2h_icu_init(struct device_node *node, struct device_node *=
parent)
> --
> 2.43.0
>=20


