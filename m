Return-Path: <linux-renesas-soc+bounces-13192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA21A37EBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AE28162844
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 09:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B77419D8BC;
	Mon, 17 Feb 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KCCTpcts"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CF19F115
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784971; cv=fail; b=PS/0PxEB1KwXuGlMySL5N1MG0aGSaesQ4G1mSgVAyPFEo8NSjscu9PnFh5QN9LE6A4XgyCiBRYXFtB2psvZI9zSFPFsR/1MxEm0PIdUIfryKreHgxLSCdjOpV1PDBn04IdyseQP+YlZzdNdMa7/e73m3vc1tlWfmOw4UFpqe9bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784971; c=relaxed/simple;
	bh=i6dnaoDWmGRNix3oNAj0IDsKzBXi6Jkkod8MjMbrWSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BvB5H0Ho+UBUN5B3v7xx92mDUitG6rRAYCvoSnHyx5yQMJCS7qz2zqiIL0YygfXuBeFwqO2/o27FVrBfKkhIpy5DASHJDigzNIHLR46nCk7PL/o7/Gc0hkLd1u4Os2TzuChow5JPXMj3BCWMhl49LdnsHgHqaZGEj9Y1kwu19w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KCCTpcts; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nN41XPcvWZfhV5XuPHkwrOXANt0gC/dItkHb935i/56R1DGXTxKyW8QNRNmmkRHWY16U2dnMb75mLFtzJvcwtheFQEmALq2owXcFRqelx47DhnaBFZrhxcc29tTPOtTI2JUH80wFiJfsXT5xBHmmwKKQZ6BrQz0r3F3rZRJIw/uYDuf+/27bvqq2LFiVkwHi6P/ItM8mDWpWikHtaJbGG3EzdmFMkfgk2bNFU7ycZ+JZ19/EcTBmo5or9i4ccBp7C3tcqmDb/3I58G3CmHuXOP0p8ItZcrwKtMb6sNYhOiIpq4hndBVHHmbEHr18drWDzhWxew8Zuzr/aoqWSWIqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MVfbRUvKUQuqIO8jMxsXuu8XLDSQG2hPaIOhebrZos=;
 b=RvgfAwdEvKgld66iNQd5hDxfS2h9vGMMQzltHhXsAp8E88NuvsbWkYkzGSrFUc0brrLNz849+CGZdqrtqYLvLL+K6zGmbFhxMvdJxntqFEBC7OugA6Keylddl0m7CKyTiTnHzNNTXLnOpnD7VawFXiXKvvUaPIwr+peq9Jvh7Ai0gx7Q4w7Fg9c8EuNIa9svu3090pT7Qw4nTB1kly2WcgVwqguXts5e6PZrM05yDCc0kkzuTFpR8keACYgy9mz34C+KwqDGYVaJbZpG6dVr+A1bN7r//CbrYB+a2neajiyAy9GKYoKsCnktNsuHJsv3X7fZFUm9VgNJtUrroPTRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MVfbRUvKUQuqIO8jMxsXuu8XLDSQG2hPaIOhebrZos=;
 b=KCCTpcts9Ku6q3pkk1zVV3M4Tjjvyn274em+/6E9QkmpTICrisFPAUvfIFI/f1EtHrGFx7R9AHDXmWJp7fkg0tyGHZIP3H6SwVegSOS8l8lj1CVD0uZNZY39y8Rs4Tcf4PWGnC5l+FDM0l/5+IJU9klDko9tkp0b1WL7ws5ECws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14029.jpnprd01.prod.outlook.com (2603:1096:405:209::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 09:36:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 09:36:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Topic: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Index: AQHbfT8Y3I1B7eINBUqE9x3mj8SpN7NLQhkw
Date: Mon, 17 Feb 2025 09:36:00 +0000
Message-ID:
 <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14029:EE_
x-ms-office365-filtering-correlation-id: 6a0e5abc-130f-49bd-2e6c-08dd4f367d75
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MFKrRaRjE7/tJRZcY1f8ohgDKpSHr6Qy/U3IhSiI9XtnqNB4AL5n7fOr4m8a?=
 =?us-ascii?Q?9uIN3Z7gUDGejo8Ond536EvfL2XxuanqXziMrVG7iUMOeXHtJTwgEuX4Px8I?=
 =?us-ascii?Q?q0r+KlIl8ZbqxKuX0VUyhDHGrHmd9M1qYAmJITrEtIJvwUgnrgi5tfLjFqZ9?=
 =?us-ascii?Q?qiOWT1GngYeggz3c3EyAC1YrLssob4zwM7W1KJdzrxfOINUO6UaiKIVBbdlB?=
 =?us-ascii?Q?BA/dcvBjoR5bvqdOY2qVvIN3KUdTYb9KV6Rgh/jyVPi8qgcBIuzkYdKUBGbD?=
 =?us-ascii?Q?Snskly1+Fd/bd+gethhJR6QfQj1ohnwUX9cKyBgl0bbHLBiGN8MzsztnUX73?=
 =?us-ascii?Q?HKFvojXAYH7asDOeMUl3fTXrflykebj7StwTO4wH2OKGDfnG0qh5Z1dY2Ri/?=
 =?us-ascii?Q?Oar5WKwLFf4mhVpoPM5zbKtxf2A9bNJjJVWv/1mJvpa4gA4BrVPkClhtoCOD?=
 =?us-ascii?Q?y0owNl2++1YnH+xL0aUjRpP4ExpH+hN3j5ateIfvGFamP0hbBy4quoudJPff?=
 =?us-ascii?Q?tm0+mB9eKedhG99uCKnb5Ubw0BMT1G08BfMWfRNCpQAyz+iRYu4d5oMqk6RW?=
 =?us-ascii?Q?w3c6JPVQ7TMVZ5C/3h06tO6NgnUBOtUMLGuzIqVxAPjJWvVaaq/2Qls9WXe+?=
 =?us-ascii?Q?75j2nuIZ9arc5Ez9Tr7U28k4eL9+EAicoaobtgKk3WDgXW+YPYSGvu1K0Jv7?=
 =?us-ascii?Q?TznS8ClXn8sQnSiyI76Z+QWYf6eRihlGLGKmlBsNposGRUbXqbU67jMZL3Gx?=
 =?us-ascii?Q?ZiaFFYvMCLA93WumWTipceo/PVdN0OpM1wqhFultdoMrXzGQGAxrfYD6vgfO?=
 =?us-ascii?Q?peDw2P0zM+aFDyMVNnw1vMxv5a6dvRtBpzVAluWX7hKP5djQai32a1obkFT2?=
 =?us-ascii?Q?A/9/fn4q+b1vEqiFD0PSqFWSckIsZWwLNjdONuQPYwGfk0ezu4RSQHn4CzFX?=
 =?us-ascii?Q?t1WxjXa1HAoer2z6bSB3FjT1EVSwgU32Km5DqmQnckdLySYsAOWNfjTKVPYv?=
 =?us-ascii?Q?uNIN+ykY0zadDW/rvPSECYzTyIOdBDnXXQfGJl/y/hWZpe0yaUrwRuWjoyea?=
 =?us-ascii?Q?u0Y7jZGRpzsEPoUV4RkqKKlFJ5BWWA6nQRuSKQJLLuawKWxpovYCmzln/MMa?=
 =?us-ascii?Q?KbPRlllX9Kbzt+oME7Sb/Y0I10Vl5V6BxS+xTiUD6NOWb04S6Uhm0vO40aQX?=
 =?us-ascii?Q?bQaiTl06Ywxt7KdKJi9h4hB60hYcnWaowHqCbaJiJkhTayGaw8qcN6zof1Sy?=
 =?us-ascii?Q?N07q+fq666WgtRqXkp1ea0WOW/gOfdH4WqWJ1e/gSiYwAr1dmp04ghyYYHXr?=
 =?us-ascii?Q?JGevNjwEielF0H4cy4cOLIFw21f6T+RuTHs0LBi4O22c67BP1NdsSqJ2JO70?=
 =?us-ascii?Q?c/C5RaIaYQzJBPyjQ3KvWedu6hhuaY+tgrDEBjA4g5fXpkbumakuSdt3gWYn?=
 =?us-ascii?Q?hhFRN4prFGrsaZxhfZhilZvgeh+C4IYT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cn3Y0+0eTXboYWY057wl8Dite+XJa9WIZ/sw3tZ9IyKK+EK2nRxfduRmOEvG?=
 =?us-ascii?Q?fZmzIC/010ZuVVxKi6SjqJjtxp1XVWwa+htCV1mRTz1Q1XGc6cHFdfgF49dG?=
 =?us-ascii?Q?41wP/G6AMpEGmG8/fKLMFjTj70KiDQRQFwQSohkFy9kq/6XYFEtjWFCC9sf0?=
 =?us-ascii?Q?bULdi91KLNOF5VIdbJSQkkppWtfNSP/DmWPJE6GBU+3E/srjriVWNk5v9DbT?=
 =?us-ascii?Q?iyUbFBadx3W6KljT1V7HpjvCdaqwWHimkCri+0/4UOFiHqL6omxI64sZvDgu?=
 =?us-ascii?Q?byYi17C5QF2LDTMfDflJtaT/YTyzORMcPnwOatcX3kOq27xkj4J0MQ6Tv8VB?=
 =?us-ascii?Q?+wCCN7Orh4W2Dm+2t7cxI/eO0mVPQ3fqsuyOhqxsIq4x/ISqajb89wYo3Z+s?=
 =?us-ascii?Q?JZG2ERayPZVSjswwAkjoCcN6aYjOhzhOcFYVZtkAcRJ0ppUVpybW7PXq/Mxb?=
 =?us-ascii?Q?6nvnNMzYejm3ECRWsytEXlH4eQcapCbWDhn9Y1ihzZamTGOoytRBUoKWfmRy?=
 =?us-ascii?Q?0h5ZaYNfrHxD4YZiD0WkYKR+UfhZvlLHnrPf4ooO+1xEM878gRVAjSDbE3Pu?=
 =?us-ascii?Q?BVyTRFS6KFjZ7hCi7Slx6UE0xu2MQiyfVUeiy7GgbK/6zcltwYLoWvFDiIrr?=
 =?us-ascii?Q?rpTCxKt9D/j1hY5TnEK5VxoqZEVQmv8yKmk5LCThqXfjqN8lU19woPxTgBNY?=
 =?us-ascii?Q?bWNy+v0OhJnpmvl4+ixF/bWIeq3I1fjuzym2287oclOnwZa6HymZTiOZlSVG?=
 =?us-ascii?Q?KcW0qAz1rj0tYlN72seFuKw8LaNce+B5ExDSTkjfFqvbNmHsYlO4m9PQyQU4?=
 =?us-ascii?Q?2JOatojz+OjVw5YBlMM87/Iwcj6l1bIilndIXY1cdhcP+NypO4yYC/rZT6/U?=
 =?us-ascii?Q?uYG2XuXrtmUVZjutDfw+KDDIkIHpL18zrtRIUvQA0j+Rz1mQnfn3HpDgu+BB?=
 =?us-ascii?Q?FzbTCGYLL9iMxWbbZ2yViiw0z0twxlXQ4jCHcMci7izmtgTk4UBwnOOM3NDG?=
 =?us-ascii?Q?HUtI021HIPjq1KX455PGEjxDynOVB+Nk2MVM+X0O15rT/AnBck+PBZXJka9X?=
 =?us-ascii?Q?rWHIrjap2MicayHHYJGUMQKeA7O0Bxh1CXCuS4451gliwvt27LvP8wG60+mc?=
 =?us-ascii?Q?FfzwRyXGAmDU0Ch/fUOJWrp3I3zYDO4GU5q/tvgDN0JHW+GTryqhiwNv5sRs?=
 =?us-ascii?Q?pyFw3sMb9TsrAywwdPTomGa3PW7UhWXAnz9EpYOjWeTxoJbZcaiJy/fB2sEy?=
 =?us-ascii?Q?kLDb1D3BS0O5Wbkrrmka9lxyAw90bWqe+n5POXS2U7OPq24eXeZg3RFyXG5N?=
 =?us-ascii?Q?U3ZKkuWMtfOQ93+ZtXpxDRGzP8t8sO/m4tHFdXnljmpSFJVQMFGm+4X1za96?=
 =?us-ascii?Q?HHk8FrEqnAK9nx9esv+ZczVrKwcDqs/kcHe61B+2kSzUYqK3WKu+43he4wJf?=
 =?us-ascii?Q?LQ8MZh6Z2vfLDO4OT1wPUujZYOjKJrSIP0O+O8zS51JNfG75bVBtExewlKAd?=
 =?us-ascii?Q?Cf1o97vBpZeWKO5/U2nTcqoI/1JWhR9qDnWasBZ5wWow8ZAN2tYGADIuEtML?=
 =?us-ascii?Q?DQbxvudFA2aQ8Ys+AmBO/eZPZN7QpeW7NFZGIfHInAXYIn0bQfgHBEyrVF7d?=
 =?us-ascii?Q?7w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e5abc-130f-49bd-2e6c-08dd4f367d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 09:36:00.7780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uk/rDAQc7k8pOf57ai+R+ZTVo1i/q/3l6xchFRdGRxlN2jh9dtBS1pJ0TY+htc/KjaX028JfepVdBxyuvuIS8Sup4ac03SkmK6gsAzV6kFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14029

Hi Thomas Gleixner, Geert,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 12 February 2025 11:12
> Subject: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
>=20
> On RZ/G3E, TIEN bit position is at 15 compared to 7 on RZ/V2H. The macro
> ICU_TSSR_TIEN(n) can be replaced with the inline logic BIT(field_width - =
1) << (n * fieldwidth) for
> supporting both SoCs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Shortened tssr calculation in rzv2h_tint_irq_endisable().
>  * Added tssr_shift_factor variable for optimizing the calculation
>    in rzv2h_tint_set_type() as the next patch uses the same factor.
> v4:
>  * New patch
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 98a6a7cd3611..3635597ae4c1 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -66,7 +66,6 @@
>=20
>  #define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
>  #define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
> -#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))


Please let me know, instead I should retain this macro with[1] and see chan=
ges below inlined??

#define ICU_TSSR_TIEN(mask, n, shift) ((mask) << ((n) * (shift)))

>=20
>  #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
>  #define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
> @@ -153,9 +152,9 @@ static void rzv2h_tint_irq_endisable(struct irq_data =
*d, bool enable)
>  	guard(raw_spinlock)(&priv->lock);
>  	tssr =3D readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
>  	if (enable)
> -		tssr |=3D ICU_TSSR_TIEN(tssel_n);
> +		tssr |=3D BIT((tssel_n + 1) * priv->info->field_width - 1);
		tssr |=3D ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info-=
>field_width);
>  	else
> -		tssr &=3D ~ICU_TSSR_TIEN(tssel_n);
> +		tssr &=3D ~(BIT((tssel_n + 1) * priv->info->field_width - 1));
		tssr &=3D ~ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info=
->field_width);

>  	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(k));  }
>=20
> @@ -277,6 +276,7 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>  	u32 titsr, titsr_k, titsel_n, tien;
>  	struct rzv2h_icu_priv *priv;
>  	u32 tssr, tssr_k, tssel_n;
> +	u32 tssr_shift_factor;
>  	unsigned int hwirq;
>  	u32 tint, sense;
>  	int tint_nr;
> @@ -314,7 +314,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>  	nr_tint =3D 32 / priv->info->field_width;
>  	tssr_k =3D tint_nr / nr_tint;
>  	tssel_n =3D tint_nr % nr_tint;
> -	tien =3D ICU_TSSR_TIEN(tssel_n);

tien =3D ICU_TSSR_TIEN(priv->info->field_width - 1, tssel_n, priv->info->fi=
eld_width);

Cheers,
Biju


