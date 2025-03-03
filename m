Return-Path: <linux-renesas-soc+bounces-13906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE1A4C462
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28BEF18898BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 15:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A0E2144B7;
	Mon,  3 Mar 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kiJ0ZDnx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA5C212D63;
	Mon,  3 Mar 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014634; cv=fail; b=kCGQn2oQM+8PdFXO+OdaKkHoPGCnklpEGApb8Y02Pnau5axdbwH8R6NdP0ovk/gFCv+hMNzB600/iJJYt2Rk4ZImScr1DdZd544Yn36hIU8y6X76dqhvxFprA9F06OQj5K2Wq0EvDgOl70/epqz5PZBbilYPFx+nw1R0QsVGXVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014634; c=relaxed/simple;
	bh=FMzZxvRwbNn+UvR+aoWn5EjEmKDz7YJkZPMK6Dr7sTY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ef2VE4wqefYWNgPrLRftMgPBjHnVld+R6rghtYzLtm6OQsok3khBCbBwTOp+k6dzHJfT6kwp9rP8HzVWbk2MEkIY0FIhGCWLgV9eII/PC6fuVTHfPUz0waNNFL9v1tWhJOLZY2qr768fRquZ4YFhFh37U5qXLmhWvn8Idr0+Iv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kiJ0ZDnx; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njtt7VoeSgYCDQ7v21XC5+n4tVrOfEeRhh4yvmt2TEUtb7uI+xLzguEpU+XhwfvO3QjoVptxDRnJ7gJLMAucMZbnpvvb/S4u1fVE3rlNWhRns69zQDZFex41Dily49LQ/C//+TIbdVOKtOM/6e7cttViYkIsizZUKYfy4A1FwbJOLAX812qdU9FJXWQK/p8Qv17AhmKyac8BidtAAZ6773J2RH5mDjJPKih07dr7eXJHPk300itaklq5yTIWvIirefpq8JFlH0gAN+4KkvOozhrmJIB5+SOGuWKCs8znBO4sz/6+7EcPHewUITPx3/H1LKeXbBTcxOsFrfXghxWuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CrnVGBKDQ37zFGJIwRphcbtotnGDC0KIrXf4B32jGM=;
 b=bV8wx3tcKgUfTRXkWiSYV0WFLZiTwkfSJAVTY/RSRFySeFuMwSthob9mQgsdN0fBCVJG4EEDhRsS0qSlIcewT6x/Vf9aZc3YTlp3Q7XAg2KdasruJoIpXFDTBRpTo5jSEiKV6YXkPXEQ/AfqGIuW/o4iyDJhbVVVTtsVBPFrYcUGGvTZ7v/fQ6ShgtqLLMOkpv3B85IIQDsNJeKlq7bEubDOE5DY91YoUYSS0O7f+DRkH2ysC5LC8cr13N/xA29w+OIpdcDSWD3niE+l2ALjHrcngsFehBycMwtnJDcHoBgcpQ4oGPJI75XnKyQ+mL8om9apssiX2V+CGIvibJThZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CrnVGBKDQ37zFGJIwRphcbtotnGDC0KIrXf4B32jGM=;
 b=kiJ0ZDnx5VpJmnNA0VeO9CNKy0jZJ6Tnz53spht9q3+Uard9NvAvWdPOaWSu4eMlAlAAodoSt8WVe/oPitq1DyZTkozqAyDVrFkl+wUl8C6+48siVsyA4z3l48cEL0/2k+Mwf97luQOibntbNedYSis89fAtcjwCQc/cR6KUuYE=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TY4PR01MB15163.jpnprd01.prod.outlook.com (2603:1096:405:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 15:10:26 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 15:10:26 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
Thread-Topic: [PATCH v3 03/13] dt-bindings: serial: Add compatible for Renesas
 RZ/T2H SoC in sci
Thread-Index: AQHbiE+9xahEIxgc80WhwZlQr+1p0rNhca8AgAAZtXA=
Date: Mon, 3 Mar 2025 15:10:25 +0000
Message-ID:
 <TYCPR01MB1149261DFCD83872B2F94435F8AC92@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-4-thierry.bultel.yh@bp.renesas.com>
 <20250303133540.GA1681980-robh@kernel.org>
In-Reply-To: <20250303133540.GA1681980-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TY4PR01MB15163:EE_
x-ms-office365-filtering-correlation-id: 385e54f0-3d86-4cb4-e7bf-08dd5a65870e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cMmetqsUQ6TfqNBOQjc3NqXA9gZF1KdIVG9BAwtX4n2Y+1LFHdOZTHm8aHTj?=
 =?us-ascii?Q?rJGLsBybtcdRp+IgG3oiYK1iiWnzldw6sap79U/Zp5VKc2ybnXZlJ6AnA3uz?=
 =?us-ascii?Q?r+Heqwct3L8a4KS5M4nvvTzkWe65ehnnrqCWt3U26T/Jylc9ssCmQOvagWyy?=
 =?us-ascii?Q?M8QCgLcTtcM8EANCNJQmfDBdbQBnJ1m/3HeiLx5uPwCKV4jBJdIto18chQ19?=
 =?us-ascii?Q?k3/hOcZi5zVsV4uQmr+r+mDpH7vyilSJ2v7JOyS3xJfJ+4hGXWRYBfF0UvQn?=
 =?us-ascii?Q?e9fLcT/tHAHK0gXE8IjQA2CZ2a60HKIqIAWpPuWkw6CcBFW4fSFwwC8Pj0mF?=
 =?us-ascii?Q?LpKZj6UH3LIfDai3YxMeEi8ueZi2MVAz5kcJ4g2v4b8Ya6TJuRyby7hAmaCI?=
 =?us-ascii?Q?7R226LzSRYkrY0vL1A60gIRXWcCHb4QzAH1/qIRaYtCKoApM+gZPIeA9L5VA?=
 =?us-ascii?Q?7dBdLJHHdFTx63Frs/iZSKjbe3ggNu9dQR0aZAEJk2WXcNjNkhFi/HHAI+4u?=
 =?us-ascii?Q?POELikuuNiegFUU7K3cK+2lgNtUARt33ckytqb+KpB8zHmy+rI6pAGyueYwJ?=
 =?us-ascii?Q?eFvPg0z6OBBosflofW3nQ1J8cdnIuiRUXw3+eL2Twr4SYb4GBg4/JKW+YCSa?=
 =?us-ascii?Q?xATcjybTeArr5hAK7sor52EZXwJSI+2YWuO3MwWu7Genri+1EdvXAZSdH6Vu?=
 =?us-ascii?Q?2PM9IGmp63NtqpUy94avPz2tAlDDnJrKOe9WDe12UvVlLhhttgdFdR/xJEo9?=
 =?us-ascii?Q?qDfJ4UZ8e1Co7/nK7JVtdvisMvbKF/rVCrIbLwxlGdtDlC1UAMQCrFn6rb+Q?=
 =?us-ascii?Q?T7jfv8wtJHHyrXrfW4cyyBxfyhAXPBsyKKmYeNWYvprHlEeAL1GozsVc7luJ?=
 =?us-ascii?Q?pptX77GXkj/1aAyJN2Ej06ccxTTVtchX527y8mRB01Or5Ipt30rGfXnJXG/G?=
 =?us-ascii?Q?xvBBGV2+dBm+owlhi7se7WWWGXehx8QjBVUr5ABSo+IdygpbSVxQMyqykH2+?=
 =?us-ascii?Q?I421xZHxFKd6XRf6ZgdAMMjHDr2TarLNBKvQRH4MCeCTIXAlLvy6KtK0v+AD?=
 =?us-ascii?Q?AETP67BykNAmle2SR5CtMuaBwXB/F3XTC0O2HQSZ692UKAyT47GyepW71dN2?=
 =?us-ascii?Q?z4bEep1+8BJbxcjwkrjGeuuEPI7om1WnZGZ73N03MUoT22wYRB8TTG4126JV?=
 =?us-ascii?Q?bktzTaPYnHiEad6VHlpikqwWNXCrfihN9o7o7QRKVwTraaFLo42AmobAFIxv?=
 =?us-ascii?Q?sTIhlxdFMCUwGkCgfUURFHx0DRtrpycCPZacTObYwCIaxfdZuMUtYw4ToFgp?=
 =?us-ascii?Q?0fbmsKCvCyI4j0MI5J4y7mBhWFULTGddHfmIuLduwAQjliJ0WbH1KeWj8uEi?=
 =?us-ascii?Q?jmetFUdu+YBeXcDff3JdMTwNbv064QXk2vv7fS0YHiFihSeM79MRsbv2FVtG?=
 =?us-ascii?Q?5PXzBePe+1+10rR6qdMn7DgZm7sF5OjF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BbIeEts7q8XDZEimVXmTepQcDxVmQOKeGxqif8JUaic2m/1P1aCih+a5WHfT?=
 =?us-ascii?Q?6C90Mh0FAQjCHYsMiVs37vgj1HRcsM2q8CDfNsfCLCLuDW+UraLB/OlreluI?=
 =?us-ascii?Q?K1NFxM8FMliwChNgHUVTS10XHwJnWQ4wmvhh/X7u37n8j435zJNO4+Ag4CR6?=
 =?us-ascii?Q?EP9N+P/RPAUZL+8rsVrPKSzE6hep175t+kAvBuPa9eCzVxLnZpMRknoPubYm?=
 =?us-ascii?Q?Zix+OUO7lBovJ+R1Vers6mh9DeMiIIJXp9L5d19mRe7lbnwkyJ2ESNe093M9?=
 =?us-ascii?Q?V9bcTMfFTlrfzOyARH+Fd0FpyZUTt2rse8qtS1NXXkX7kmEe7eAt+u4+J/UR?=
 =?us-ascii?Q?RSPj3UihCRURm8WUBkSOyEQzLedtDUN/6P2cfHYXcZVJjxPjocoW98/WAibv?=
 =?us-ascii?Q?vTG0WOl1xvoxYZksQY4aCDvirpwexy+qJoe7165IK2dqzoxZt/UZooGLSzJ1?=
 =?us-ascii?Q?Wd/FcqLGqSHkfObOs6xy0Ve0Pe8Gpu2hCv52smb9HT8cQ2sRL1KRK2b/m6L+?=
 =?us-ascii?Q?kj2JX3DSQ7dL1K+z2o0rI2t3Ush4A8M2wR1ryELhwzPFg5QwoUpH5bwPKnLp?=
 =?us-ascii?Q?hufcB53hLT68DkzAVATD89o8iynsKsO8/P2FFMtY5f9CbBgKGztZ9AhMFMSA?=
 =?us-ascii?Q?AhQ8Dv6tmG22GfXVa013YqlQDgtJTO7dY+7L7CfHppZKxB0Blbcf1QA/S+sk?=
 =?us-ascii?Q?q6Q0EsUfMs41R5U6TdAdJrEixgg3/P2nM5/HpNJRWRYrjQzF4l19zaarANpn?=
 =?us-ascii?Q?YyGW94KXwCX0avQlYYqvyGFcoRY3hM95FOH5z3azTXbEqlGAGIWF7fgiBjrB?=
 =?us-ascii?Q?8xn4k6wYS8vlHmgTxEDg1xYJWIx3oI6Us43HF8q4Ri9LxT+1AUq+jCaNKdNQ?=
 =?us-ascii?Q?/ZipASnKgOakeaQNOcwvvmGUk5FwIuZwgVLgjh5/ye3YbJhrGHExLRssno9k?=
 =?us-ascii?Q?VP/o4U9cxfroJj8zKPEuNZ7Flgl/qVE09yjfmCL2vMItfCVuXT6p8Gb27nI7?=
 =?us-ascii?Q?py5Dx2LXmqV23RBsqjPrPvQvtOmNVoc+D3H/hW7kkXX1Z7iKHbOeJOsSvcP5?=
 =?us-ascii?Q?os3KGk2RTS/i9eGF0FfGcdmeoWkt4//tpnWOBMMKLtML1siwSTBaDLzeI0Ds?=
 =?us-ascii?Q?hTw9R0vik/oUIpFNlWnOwxfBjEPxGhdLoU7qL7X9mspBP/qkG63ey3ogrASa?=
 =?us-ascii?Q?8COZXp+0z9KWPb7R3UgqBG2bEQ2rDOoh1wOzlfODAFKRf7SaLFsbZ3VWN2jP?=
 =?us-ascii?Q?OZQy1VLY0spfAQNGB1sFcx5WYyS1ceMv3GVnrJhpXV6K9Vvct27xlo5NWIqi?=
 =?us-ascii?Q?49YsavPXMLfIrkGyxWp9SB3DPYo6L21Ni0atsyjyxa2wavoOD691yTyBV7qt?=
 =?us-ascii?Q?+ONJhkna7SilqcApa8sA+PObag7b5PcwLY9U1Sw2tNazBlaE7/e/CJoEJUSt?=
 =?us-ascii?Q?eCttAMTqtXwv9kiDVlER9t5SMYCsq69JYGwf2wkuM5AY4VgzIM5ufrVtMlxH?=
 =?us-ascii?Q?3mY7t/Bg6wLeHkVFhPhlk2UOQRDtURFb+kJ7zSRg5aE0uCPB4rRBPhBy9p5y?=
 =?us-ascii?Q?BabOpLrU+poGZ8qV8T9aqQwRL0ZoQytsZto52YoOASsnnwRsAGPpIbApqLpL?=
 =?us-ascii?Q?Zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385e54f0-3d86-4cb4-e7bf-08dd5a65870e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 15:10:26.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mp+s9tY6rc/+iy4tcvuB1UYPWHw4kbKd1rjom4QiZU01Ei/q5qKCmLWa9lmMqmgE7Hig7nXbBxWeeDgnP4YMthBMqoF3swBOOP5SER8ANEniL92DmMYy85hPhLxy6YM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15163

Hi Rob,
thanks for you review

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: lundi 3 mars 2025 14:36
> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; Geert
> Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.org;
> linux-serial@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v3 03/13] dt-bindings: serial: Add compatible for
> Renesas RZ/T2H SoC in sci
>=20
> On Wed, Feb 26, 2025 at 02:09:22PM +0100, Thierry Bultel wrote:
> > Document RZ/T2H (a.k.a r9a09g077) in SCI binding.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> > ---
> >  .../bindings/serial/renesas,sci.yaml          | 64 ++++++++++++-------
> >  1 file changed, 40 insertions(+), 24 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > index 64d3db6e54e5..2c4080283963 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> > @@ -9,9 +9,6 @@ title: Renesas Serial Communication Interface
> >  maintainers:
> >    - Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > -allOf:
> > -  - $ref: serial.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -22,6 +19,8 @@ properties:
> >                - renesas,r9a07g054-sci     # RZ/V2L
> >            - const: renesas,sci            # generic SCI compatible UAR=
T
> >
> > +      - const: renesas,r9a09g077-sci      # RZ/T2H
> > +
>=20
> Perhaps explain in the commit msg why the 'renesas,sci' is not applicable
> for this chip.


Would something like that be explicit enough ?=20

"The SCI of RZ/T2H SoC (a.k.a r9a09g077), as a lot
of similarities with other Renesas SoCs like G2L, G3S and V2L,
but a different set of registers, that moreover are 32 bits instead
of 16 bits.=20
This is why the 'renesas,sci' fallback does not apply for it".

Thanks !
Thierry

