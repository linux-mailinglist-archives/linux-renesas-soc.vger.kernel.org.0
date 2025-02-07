Return-Path: <linux-renesas-soc+bounces-12956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB1A2C8DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 17:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1972188B07F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 16:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0313D18BC20;
	Fri,  7 Feb 2025 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QWLRtdHo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFDF18DB2F;
	Fri,  7 Feb 2025 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945654; cv=fail; b=kcM4TjWXm/SQ4h4qWvYCaHct4pWKftHlwuXZIhOd8O8ek9YhMiOeXR047o4Ft4FsA8r23WjQogqbNmyYtmChudEyKfwRkRXFgbNp1IwiOMD7J1qyANV9hMb1IsivcMtVeJBuhtHfQqidq5vRMcWCdVrTqfya/yksriZFRFNP5cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945654; c=relaxed/simple;
	bh=cfrCEMW143HWndSzNKpSmY0rrGMjDM1m/CTl0d/RapQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UgN88ba/kqMYZuuaDZUwoRsMM05dD82BwnUtVYZ/gmC9rEmX0FsVeHdduafspDchqvZmLpRJPNFU/jYLcOCeh+pMuWZfFgEPT1puE15MKXUnHj9YECXlRrIe4NTlrPM7myPoFvL0jAh8Bi85dAkoriCZG/VOxH1OyaslIynjzh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QWLRtdHo; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdIx6bi1t5P/WnWVNtZarYOEQ9Nw5nktLTEMDt3zZrSiKS/Ybv4IKh3qfZMinOXN2FYayXHSvj9bm1n+WXeTHeijHbRj9bOxPSch3s3spqe0NaKlOWWgFfrFx07b825l+sZQ9xsV4lqE1IafYG0m9sC/GxYcuT0iGBtG/o49OI3Rb7+HKJyHxhB7JCL7UbnEGOPLjR+7lBRu0lOBJRdl99t/ntv2UmQRN4INibjGya5YoKrA/jBEINarpLeH6fACgraHccI1a2inH2ykuOK96fE7w4XLTPdQaOcz4G4Ghc8gnRSR3m0VEs9MCsnGrzoEQsNYrZIjefTELsrMfJUZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnH22OetQ4WI+mZylvMgDYFgRWfN9Mr7YNtpVMoVa4Q=;
 b=Gz8ja37SHY3oVvxGgW5ZMyfeJ1fTAsq2RvhVuV1DHnoxsHmuur2SRMD7+enn460o0w7P6QRvm6OGyMYtYpoJjPsj6MCx3NwoxR48TcQFzzWtLl8yh/HoCXw89YGmwvUrDVePaSYI2S2J5A3DTWManYr+seno/YyhyeqQeKDsHQbJZGoF4/EW0QcZov/9pDTfEPkFAVF35bK2WKZed2rSG+JCn4sYNPOw2xwKdmUkpa2fhbWLcitQpSWqATS5Rm7uhurpvPMFDXASN6+UwfCn0JR7Djzk6oxTvTSlkqiFzgmcZj6ZCYfCcjOzejODyarDQabNg2ANgng61kJan4x5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnH22OetQ4WI+mZylvMgDYFgRWfN9Mr7YNtpVMoVa4Q=;
 b=QWLRtdHoyKwBU3jTVhTpeLqzmSL48Kmi+Wmkd7PgwymlcRl+cX2uhrm4exuDsK2iFM8+DJPUyaXkY+dvXtZ0Ue4yE0lbobD+zGfbrl+qxOEdlogqnf5ULM8AuxI7ErHVt2e/1IGmkXnb2LpBnZ3D0FR5o0vl8JFah6FruqKhbuo=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TY3PR01MB9665.jpnprd01.prod.outlook.com (2603:1096:400:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 16:27:28 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%5]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 16:27:28 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
Thread-Topic: [PATCH 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
Thread-Index: AQHbeOL5bPsQOvz8+kK7Cg2wghgRhLM7d9mAgACMB5A=
Date: Fri, 7 Feb 2025 16:27:28 +0000
Message-ID:
 <TYCPR01MB12093B5AF218BEFF2F2FEC08FC2F12@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250206220308.76669-1-fabrizio.castro.jz@renesas.com>
 <20250206220308.76669-5-fabrizio.castro.jz@renesas.com> <87ed0amby0.ffs@tglx>
In-Reply-To: <87ed0amby0.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY3PR01MB9665:EE_
x-ms-office365-filtering-correlation-id: 1d108b35-e984-4619-b499-08dd47945041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jgEv+RowU0raXQPU4oq+dtEoiA7TnUR5RGFTBSpJFrw1IiGs+tB7+ttfjRRJ?=
 =?us-ascii?Q?SuMz4/1TA1JyFpOxbGSTp6TNXeBaJg8h/b8HyfH3/yU/wd+RW467T/D4jr/E?=
 =?us-ascii?Q?2QjAVqutxlDjL9F+9cMRaeGSpL3NdtQBtwgqJKl/h8bkqtPLjBSUsXJRDL3d?=
 =?us-ascii?Q?WbVqx8bjC9zdctPwXRiGhd2XI9fn0tz8OUWaOGFM51WsVDreVYt1gk/9eH/I?=
 =?us-ascii?Q?trWSoLmEH+rm5mtu8ACziVmLa+bVZ/fTG/osm52Flb6p8X7T8UYy8kMbBTHo?=
 =?us-ascii?Q?oXgcq0M/GzlHETDZmzFNjXMYc6mIol1vn4gjmdrolj0URM2Lk6IUgdYiMRcC?=
 =?us-ascii?Q?mIaphdAB5TDnVd3PypibU70LIsrexVSB6ARcFDBVTak/WQTKJY2K3cL5RrMD?=
 =?us-ascii?Q?WGWDtjQVXwc2xrZaxTuzK7w0rPTeB2xrneUV6pCTImXtvDgBmqQkdkO4xBhr?=
 =?us-ascii?Q?m7fl3D/54kzvT9uNcGZ4L83kGt762cYUqIhdt4VZ9oxJu0Wm8U1cAuKhPfjG?=
 =?us-ascii?Q?oRIiSLwuG0WG1LHvcnhtZEXAczVR6NiZBUidP874vfdbtV14fHkcQF+6XrPl?=
 =?us-ascii?Q?+PXCcur9AVNV6e9nB3K93TII12YbvU9S+p9IU5+GYwrxa8L5tltGiLK2ERic?=
 =?us-ascii?Q?uX30pgKsaVtXjVWMp5J241eM+QDJEvwQIJrUf3jsRP781Mdiy1aTseajx00u?=
 =?us-ascii?Q?jrGQCLMiGvz202jsu5sUWpqj5gHZdzt9Ab7b8kWIrYVl2LXM5VtKlblUisVg?=
 =?us-ascii?Q?th52rZbuzhJ2r4nbWSkEiSFRB0wZlDKDwuigo8shuYTKxe/UlRLYMfSoC1Qu?=
 =?us-ascii?Q?Cz4zVDvLTTt7r6W1AEqZQ0IrrvwD8aZo5GPgNHL5dqrli2bojvxoIRUg5XPP?=
 =?us-ascii?Q?j0tBdW/JIQSvmQFK6zCpCpbmseKkcP4NU8i+YjNkfvUr9DFEM7sARLe3wlf3?=
 =?us-ascii?Q?pTT7uxs70+CRGECvjNPQEjAZ4+tF92PT7OFT2Z+gcDFxj8JpkSoXhT2E5mlm?=
 =?us-ascii?Q?PYBMGFLmy98Jr16h9mdanMHKPOXiDZpdHWYuKg07sZ3+AqQmOdSmeaFzEUYE?=
 =?us-ascii?Q?j8PGuon8UBOk8lhXAJXNzRpuOsPSnlU9fkuPCjFD1TSgwh6xD8k9Yfr1UF2T?=
 =?us-ascii?Q?jxZI6G2Mg9bRwhpKkZSMhZ5Mrc2XKSiPMLqYld3qnIdafQn+pYn2pxnHYBuu?=
 =?us-ascii?Q?kHR7H/vaApdyvfg0iYTtcoG1De3k790D/280qJ4f3ywsfdG2xrpewpgThoPU?=
 =?us-ascii?Q?iYzc8OhXMOLOf7vL3ylr4dt8Q3PEWlF23p7JLfiZOC5P1tG4/45JPUQ3Py5F?=
 =?us-ascii?Q?hdYQSLUcTgRwEseWYU1k8qqxwiO/2DNVDhgYDb82+8qOMwKmyOqo3mCcufjG?=
 =?us-ascii?Q?OxtQHe0DHqxT4u3e+Ls3+bR4+LFdQzCkCqZJ1w31NokV0mkrqw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Gc60RUd7B1iigifQZ2PRMDM8NOMnFHAU26xkoosbgcakc6072s7foAAuu34x?=
 =?us-ascii?Q?JGdNKv3K+Gdu5CU4BKHOVgOSDbDwgHvf7HGcSyRQP5zyiKSXNpCugs0dix9Y?=
 =?us-ascii?Q?/MH3GbFUx+FLFbkW4b5KM5NhTQ8uzKHtEORLxAOvop+ds6g7EtM8s/JzsmEo?=
 =?us-ascii?Q?gFQ6xoBJjaQHNQomjt+45+vsnOy+3aDWbApyD6GyBlMQytLnB/qTSMgfHbWq?=
 =?us-ascii?Q?B80PlEY4hqqwKVxbsh95I3HhEMS1214uSdyElGWcVWO+/56cqy88ZelIBKwW?=
 =?us-ascii?Q?moOpN9FVV9R0EholzEm1Mob8pHnWB8RLMPO0lFApuZNREJ/ez8uql/PDvp1J?=
 =?us-ascii?Q?yVVXI/582ImlbuFechJd1fsZ3zoWiJ5JvgD0/zD+obJCqGqdC7jj5Jv9JiIU?=
 =?us-ascii?Q?gpPn6rEB/Am6tV8IWzbJZSOcoz2UwEH6q+ff5zO+jj0+tMw6aEGfkgGigyXW?=
 =?us-ascii?Q?eClJL/swT2TW05nSR0piLY+7Evh8g98JTK00hppFIWdurDuGumR5xGOyWFIP?=
 =?us-ascii?Q?xMKA9ARCdKLt7ll4EyIhkU/cALI1VTTF6V+vqQN5b+fO49t/sMSI1LKZGLzp?=
 =?us-ascii?Q?ifL38qxs/bTAxKq6/LicpIfGGoUFTbIBvxjijDDPTPs2k6Dn+SWU+n5R999M?=
 =?us-ascii?Q?Msi4gHcQKZBe8TlRLRRmBuMftLwnuK5oEhKFItb2EbJWzjrRnD2iMx4gXvhC?=
 =?us-ascii?Q?NAsaxyqWUJ9eC16BqELWfRO/uNL5ku3bV1Sea4s3SAJNfWNwlAaNZLXbm7Nb?=
 =?us-ascii?Q?RnlFzLG31Ghgak0QIDfhtZZ9heDuvXC/ExcojjgObfmqTqZZ0fhxT1RRkv1m?=
 =?us-ascii?Q?2f7lsTZFwDKhvtQhvjX30/+DPgvP2+m+AAeKrsYkOt1S0hqBlMd6ot4Njy0J?=
 =?us-ascii?Q?yGo/HmB2uyhz2pr6/RvITFIi77u3FvXgF+/y8UnUcTbA/4hT08I8fVhPFe1c?=
 =?us-ascii?Q?oHjLRq6aHR6xUyUZQUxNatuuBAroNEZHAKS8QE9tQQD2+c15KIy+AMNX8jSt?=
 =?us-ascii?Q?S+5tOt0LWWGPEeSjmFU4IaNIzLQrDKZOyOpdPZHBR1TisM82FVHfCOCAx9QL?=
 =?us-ascii?Q?KpWpkLq52MzBqhQlavMU+K5aWreWBzv6YgSbeL/PforMS86MVvKlNk7BYM5F?=
 =?us-ascii?Q?pFJVJnDZ8QfXRyEu3kv7RTiBDiY6VWKhBdClOooACPFZDvpt/81blmrichaC?=
 =?us-ascii?Q?1hAZpl/fYSNeT2e1PUIOZG2qEV/E4/Fe/t7sPiSI40761K7AInsNXVonAYt7?=
 =?us-ascii?Q?lDO9Tj53aOY+/WuagiPSSFeaKiwmx0/3CZqW9v8d+Jk6WDtzv3PmbQg/byLx?=
 =?us-ascii?Q?+8B4hFKQjGPutAT9buz4LT0fd4HEdUa+CbssWA6BWVF9GblIq4VAnQWyOQn9?=
 =?us-ascii?Q?NV7PbHl21mPGDrJOxMbKLjkGmb/Tp0rjt8NPiWrCnsbgR9juTfRP/3qZmRBE?=
 =?us-ascii?Q?U749mWEq9a+zu+b61GaTO2d0Khah4BUQpewV99HZ4MUcHQ9SzsMTZhX1FkRJ?=
 =?us-ascii?Q?YHI+NV6CF0CYPyL0ywbj1vL5pmVL/TYqbgh+haWT5Ldzw+7DWR0Ts0VfmU2P?=
 =?us-ascii?Q?EVyTpz6M9fUb8LbBFtgbthSwMQ+m6p8irJlP0MNg8Td8XnZkEZ5FQJ826CLR?=
 =?us-ascii?Q?oQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d108b35-e984-4619-b499-08dd47945041
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 16:27:28.3145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dm9++2dZNBX2xgbSU4igU+nvqC838sMuWlVAu0H5wnvdbjFcDGR+qhtObxVKbMWUGk5pZlySOZyWnuRFiINbe7dSSF1LYFQsqdhaR6TJCps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9665

Hi Thomas,

Thank you for your feedback!

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 07 February 2025 07:49
> Subject: Re: [PATCH 4/7] irqchip/renesas-rzv2h: Add rzv2h_icu_register_dm=
a_req_ack
>=20
> On Thu, Feb 06 2025 at 22:03, Fabrizio Castro wrote:
>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#functi=
on-references-in-changelogs
>=20
> > On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> > to the Interrupt Control Unit (ICU).
> > +#define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
> > +#define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
> >
> >  /* NMI */
> >  #define ICU_NMI_EDGE_FALLING			0
> > @@ -80,6 +83,19 @@
> >  #define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
> >  #define ICU_PB5_TINT				0x55
> >
> > +/* DMAC */
> > +#define ICU_DMAC_DkSEL_CLRON_MASK		BIT(15)
> > +#define ICU_DMAC_DkRQ_SEL_MASK			GENMASK(9, 0)
> > +#define ICU_DMAC_DMAREQ_MASK			(ICU_DMAC_DkRQ_SEL_MASK | \
> > +						 ICU_DMAC_DkSEL_CLRON_MASK)
> > +
> > +#define ICU_DMAC_PREP_DkSEL_CLRON(x)		FIELD_PREP(ICU_DMAC_DkSEL_CLRON_=
MASK, (x))
> > +#define ICU_DMAC_PREP_DkRQ_SEL(x)		FIELD_PREP(ICU_DMAC_DkRQ_SEL_MASK, =
(x))
> > +#define ICU_DMAC_PREP_DMAREQ(sel, clr)		(ICU_DMAC_PREP_DkRQ_SEL(sel) |=
 \
> > +						ICU_DMAC_PREP_DkSEL_CLRON(clr))
>=20
> That's a pretty convoluted way to create a mask whihc has the CLRON bit
> always set to 0 according to the only usage site.

Indeed, it can be simplified.

>=20
> > +#define ICU_DMAC_DACK_SEL_MASK			GENMASK(6, 0)
>=20
> > +void rzv2h_icu_register_dma_req_ack(struct platform_device *icu_dev, u=
8 dmac_index, u8
> dmac_channel,
> > +				    u16 req_no, u8 ack_no)
> > +{
> > +	struct rzv2h_icu_priv *priv =3D platform_get_drvdata(icu_dev);
> > +	u32 icu_dmackselk, dmaack, dmaack_mask;
> > +	u32 icu_dmksely, dmareq, dmareq_mask;
> > +	u8 k, field_no;
> > +	u8 y, upper;
> > +
> > +	if (req_no >=3D 0x1b5)
>=20
> In the DMA part you use proper defines for this, but here you put magic
> numbers into the code. Please share the defines and use them consistently=
.

Thanks for pointing it out, I'll fix it in v2.

>=20
> > +		req_no =3D RZV2H_ICU_DMAC_REQ_NO_DEFAULT;
> > +
> > +	if (ack_no >=3D 0x50)
> > +		ack_no =3D RZV2H_ICU_DMAC_ACK_NO_DEFAULT;
> > +
> > +	y =3D dmac_channel / 2;
> > +	upper =3D dmac_channel % 2;
> > +
> > +	dmareq =3D ICU_DMAC_PREP_DMAREQ(req_no, 0);
> > +	dmareq_mask =3D ICU_DMAC_DMAREQ_MASK;
> > +
> > +	if (upper) {
> > +		dmareq <<=3D 16;
> > +		dmareq_mask <<=3D 16;
> > +	}
>=20
> You already have macros for this, so the obvious thing to do is to put
> the shift magic into them:
>=20
> /* Two 16 bit fields per register */
> #define ICU_DMAC_DMAREQ_SHIFT(ch)		((ch & 0x01) * 16)
>=20
> #define ICU_DMAC_PREP_DMAREQ(sel, ch)		(ICU_DMAC_PREP_DkRQ_SEL(sel)	\
>                                                  << ICU_DMAC_DMAREQ_SHIFT=
(ch))
> #define ICU_DMAC_DMAREQ_MASK(ch)		(ICU_DMAC_DkRQ_SEL_MASK		\
>                                                  << ICU_DMAC_DMAREQ_SHIFT=
(ch))
>=20
>         dmareq =3D ICU_DMAC_PREP_DMAREQ(req_no, ch);
>         dmareq_mask =3D ICU_DMAC_DMAREQ_MASK(ch);

Thank you, I'll adjust accordingly.

>=20
> > +	k  =3D ack_no / 4;
> > +	field_no =3D ack_no % 4;
> > +
> > +	dmaack_mask =3D ICU_DMAC_DACK_SEL_MASK << (field_no * 8);
> > +	dmaack =3D ack_no << (field_no * 8);
>=20
> Same here.

Will do.

Cheers,
Fab

>=20
> > +	guard(raw_spinlock_irqsave)(&priv->lock);
> > +
> > +	icu_dmksely =3D readl(priv->base + ICU_DMkSELy(dmac_index, y));
> > +	icu_dmksely =3D (icu_dmksely & ~dmareq_mask) | dmareq;
> > +	writel(icu_dmksely, priv->base + ICU_DMkSELy(dmac_index, y));
> > +
> > +	icu_dmackselk =3D readl(priv->base + ICU_DMACKSELk(k));
> > +	icu_dmackselk =3D (icu_dmackselk & ~dmaack_mask) | dmaack;
> > +	writel(icu_dmackselk, priv->base + ICU_DMACKSELk(k));
>=20
> Thanks,
>=20
>         tglx

