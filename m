Return-Path: <linux-renesas-soc+bounces-19624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D4B0EA0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 07:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7132A1C857D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 05:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024062475CF;
	Wed, 23 Jul 2025 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VqwlfGaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DD13A265
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jul 2025 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753248585; cv=fail; b=JusnOwVgtWAs9ikVIE6MeRAmapZSue7IE0hHBWA3glvJFfej8JPgthG2lLK/MNzqxuiVN8JImQsndJFfPMke05Eja08YyItpxulVnqF0pvL+CRrNVELoPDI2uWTg33FXcJcLTLOuo9M8jFaS05SSJ7749/deq4IM2zzsxfpkIGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753248585; c=relaxed/simple;
	bh=wSBEoTvjVOGNtHeALjyPY7/hRA1D36QEpW0cyAcYPx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FTPK45MTLJYL25tE/2/an7fWMhVVLF4e4FI6T/pjweeDv9xlaV0w/AzZDS4rzT/dMf+HLHaJSah+8YioNPUpvi3McHfKjs0m1cOhU138yZZdxWX640Zc9EOGz7ttuPIZAXL4cNX0QkFjHab4aZlcIM6Z3CTKQR39R5700ZAyfzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VqwlfGaK; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkU/VxLVG83GA6D+XcbYPxSj9e/ZcqQDiu13/UP4WeaALNQc3TeQwAjWqPbw6GdilhIWW3hirRdKZr0fo3lHazRr1cB+mpSwmrjzp6ja9vbfPTf9hYorAzUfwHft/IR4I2KcOAWF8Lvx1FH+S/HiBlQY4CXjN8EfOcjy6NT8LzUqJMSgmflbKsKaZ6wsDsjMjdyx5m5WeX0jt9jvMSGLk2iQpY32zhjlu3EEJs1rZCBBbdgI2I0FF3pnCZ1j5CFqb+lxHhfa/11L3pSqe3Y5c/B2Kxn9vQ3mP8vT9BS+FkRHkt/f9OUpbJmYO7FM2SLlZlJSapUlEaFSSzM/o9mVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pf77Vh/pWBkdwe+dN6gH5J5T0rjn7FGiE4CLcVzNaY=;
 b=CezKpWHqflqvM+YRprxfnTb3fPOb/Vy298VcDJahz2Hwgi/ZkBTF3H2wHRRaJh6Qa0zNxme777iGQqVon742aRIQOG2Lg+cH4etnC0hXdNsPxMEWz+SZUj93nVUL7HLW4hb8nwtNp7tY9O1kT3vmOUe2V8DxY2vtnidFBEnBU0TUpdR139nNN71Bf7V+3ESdsz++ZTAzSjgYPWJiE3u/iZYzbqD1cBW1p41zBWfrNLMYaXQzZzgQUXFxIdsyDkcNiWd7tVd3L3z1SMk+PEii/rhc3RCSlkKvxcNTKyJOdWLFLh/VQMo5q2enMA3mDZ5/Lis0AFGvZwVG8vXDgYmy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pf77Vh/pWBkdwe+dN6gH5J5T0rjn7FGiE4CLcVzNaY=;
 b=VqwlfGaKNQnznOhbyM0K8pAtM0aQk9RBv4hB+6bUHBCdOAMElj6ExHmkuzrOCy447iyk4IZALwU0LVgT2BlbXFE+UftSQsexKZtXgdrMUcYCU8fTVmeQbFvJUQTamCmoGXseicR7NQMNnZo3DvxIa9d/tFW0VAfxylTNnECOvcc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9929.jpnprd01.prod.outlook.com (2603:1096:604:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:29:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 05:29:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Topic: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Index:
 AQHb6ZbcTwodwylbck63zUQYC+u2R7QcGawAgACc3sCAH9qPgIAARUawgAHTcQCAAKfeYA==
Date: Wed, 23 Jul 2025 05:29:34 +0000
Message-ID:
 <TY3PR01MB11346D08D7E7BEADF787D5B57865FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
 <202507010308.KUbUR1fM-lkp@intel.com>
 <TY3PR01MB1134662BDC486D781E5B263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aH4jnz0RPssZ7SfF@shikoro>
 <TY3PR01MB11346D7F43A7073160EBE6BA5865DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aH_l2r0xRPCHM2aK@shikoro>
In-Reply-To: <aH_l2r0xRPCHM2aK@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9929:EE_
x-ms-office365-filtering-correlation-id: 9458e118-71b1-48da-b6da-08ddc9a9e897
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ev60kge1xAHRBK8yap4pwhleJeTee6uojKHjufEv7AQrgaHm0AiKrWdtVbhA?=
 =?us-ascii?Q?8Yv0TKr+OwlxR2pC2Ke/AXLfrm/J4fkNpLozRNMJVF069rtJdXY2Rmfpi1af?=
 =?us-ascii?Q?GfCbRxtNtr3L6SqaAE6kC8WCAS/an9Fl6HtAKPOEyF+aGBJu2FAMGiHVSAGH?=
 =?us-ascii?Q?fhUJYYh+cDEKWNQ40GEHpobI0fhU4Wg6xFjbhT9+DSRgVsJHn2g+drsnbViB?=
 =?us-ascii?Q?7KzgmyPfINdgbCRebi2BCmuqAB6zdKi0SL/6MI3ljDPdswTxyCitUIzmhpKj?=
 =?us-ascii?Q?afVnefChvAQCBCR1EMoHsgiCZeOyIN2OT0DQ5zm0kRqlTlF4G+lim8fmE4Bl?=
 =?us-ascii?Q?iuH0FVfEgnaucZ8v7zTXNHvBIFTVEkaBpZuJBq3Jkc5uHRgKmO25Nwde24R2?=
 =?us-ascii?Q?+THfOwxurch6sOSgYUpjFD94DenCQkxiPkasttGKuJE/5bxI8BogWqkMeyQp?=
 =?us-ascii?Q?UxB9NvlwodGUzm56A34Zh+EJbV/rtM8cXfXkyZGFBoB80UzaHMN6C5GffSDE?=
 =?us-ascii?Q?fPBFSsx/qT5kY7f4LyKNAr13L3T/znCtbhq58nNo/xuNYwdamBZljjNBAO4f?=
 =?us-ascii?Q?J8421YL23R3/Uf6junuiNkQrBTj7P8Ux41xr0wBMulbPW27gESb9NkljVmjm?=
 =?us-ascii?Q?ZdYAvfS0Q6LSUHmZ/PY8QTRjLeuxhk3inefoETz31zuEUgrWq9RAbwd0QKP8?=
 =?us-ascii?Q?LfF1DyJu3+53fdUNltSuD3k5ouP7jZO2xitIQkKi+olyPCpMlrkGED6FXK/7?=
 =?us-ascii?Q?1R0+XXuCq2ooHN1TL/48jJSudnwIHC/bWXwlCXBzsn4FmTHrNi2OlBdBd80b?=
 =?us-ascii?Q?fk2Z/fTVeRLK0ZryJ6TXtnaS8ndZphwlb8zE73cC0RPutAUQohpstGQeYQkN?=
 =?us-ascii?Q?sMsGlcxVxDqhrFcps5AOd7khJVizyUm0/dhJiPgfV/QCo/qtanARLMfXDPJQ?=
 =?us-ascii?Q?BJ32pKmXDHFbH+1Hp/yyDSVY5Isd0ypYQpmJ847hP+zsEeknV4nfRQ+Cokg7?=
 =?us-ascii?Q?pgr7u+/865o92iSWoCkRWSn1VpmYCTC9SZgKEdKdTTqXxPqZ9BwN4KjROnIZ?=
 =?us-ascii?Q?jz85ne21PeSVtzkHukdUYiTQrj9Bpr4jZgJ0VTMsrzu4mU/ksGhazuac9LlT?=
 =?us-ascii?Q?FIJdaAr9SWPtbTYXW42rHeZpJI++pMazy8+o2kIntX5zGMF0RYCxdqu7c4v4?=
 =?us-ascii?Q?L1d1wIICOWASbQjHISpSOMIujKXrln9IVLWtnGzXcncXs2OuJXKtaiRB9Ob7?=
 =?us-ascii?Q?Tt0wwIoGlDm6UFj/R4e+INQfKMBAeLyrEyzbzp0msSQ1afsh5I/lnSwBtPbI?=
 =?us-ascii?Q?uDkEeQK1WdZVCrdwWGA6jzQUZPAJvl+TBEylC47EJh3FBEGTvYR9NcATpLMS?=
 =?us-ascii?Q?l97C7rqM9TcoGd29tKyZGoFKx6V5FVYXeK3ERpV46XdBwCbnJQKISl4oWaCO?=
 =?us-ascii?Q?FlHPAhzrGMOpOscyH+pqzcE0tIrEgoluDqdXNDJD6pR9JhN3BpNC6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9XIsA4qCG9kP+ozD20wL9y4hqaxfRgNI0GTcQoi9UHwxCHnJfdQgkSYsGfp6?=
 =?us-ascii?Q?ZJfQfPrFmSxajHvms0cd9/rFnSbC4w02220fx8m21McgaQtFt6i451m0jBzF?=
 =?us-ascii?Q?xD7tqDyOZUcN+wrMxBwQiRhFXMKv1QJDE4dWqIFmktFuohdhxGJSkV1LRY8i?=
 =?us-ascii?Q?2rYqH3XmwyAX4Cl+mWeBuYMHsvwj3aACz68hjCRyiyFEsM/VcP6HHTnvweg/?=
 =?us-ascii?Q?P9VrTolRsNSnrZBLuqVg8QDJNzF4mkLATaqt93q3cuk9XWnyATw0xFYAL3Q+?=
 =?us-ascii?Q?TT7twuB5sPmJryKppttbmEAuGy5RySr/qvS7Nd1+2Ksw5nuvWMR7RpLvlJrJ?=
 =?us-ascii?Q?Tm5g/bLEcOfF+vWaWtmWGp5Q4rWf39VME1aiuOCmN4uQBVrcqbbOyZNf5/NJ?=
 =?us-ascii?Q?LVQZenZR/4Bc4/7In08PkTzIB/ZwZytNF6CcZtvvYyQ1o3TbeKXe2BWvbdj+?=
 =?us-ascii?Q?J2YRRETPF7VwxXK9UmlUA4K6VDhdi0gEVhFCK7749f4VVO8jNsZEOw3h5Sn6?=
 =?us-ascii?Q?HUOl1yRdeFw0yBBFEnSxxz1XTey6K+bauDOaZ5gl0cEPIRMs4ySOUn5MFDWa?=
 =?us-ascii?Q?1rK4d7wCLdSsH/d7PtEe7BmrjkG+PLeQyHBy3GXmbWYnLNEFlIAwaU4XTq1y?=
 =?us-ascii?Q?UzdEL0p1pROYSjvexaj62mSB20eCaOX9R6J5kCNq/ldOYp2iWBdHIHgZWSeN?=
 =?us-ascii?Q?ESEwKclegKJgsd7yDR6xS3IbVCbSUsewlwf+Io24Gh2Ya01Po4CE3mPXmVNV?=
 =?us-ascii?Q?aXz8xViVScJ77bdAYEAJ09eFJ90o7JaNcYe9Ep7iSiyGx8IE2LOmnOLFx5qz?=
 =?us-ascii?Q?tw4LzLKirDHTHJ0Rgw9560GF2uGXkxLAkXcfi4WsYP8EXz4o2t1LyvNBMhk6?=
 =?us-ascii?Q?DT7QQKAIUn/neq/nPYnax/WXICsb9wpG7h9ql4JpFCJ4TipyJTw7E3an/znr?=
 =?us-ascii?Q?l08AybJqxqypITnvqJ7CQCKYRLlPvcqxcZgjPuSFzWqe9vyLKFvQYVAAvm0C?=
 =?us-ascii?Q?CMTMBLaxZ2vKCXX3PtklLrkPS71f661rY1N1ZD/nOiAnpB8Lekasd46f+90Q?=
 =?us-ascii?Q?NMJ1XYqIwSOmVXFeLz6KfED7GrWE0T7IfNK/NtWjlWvxuVq4ViBjfV82wH2t?=
 =?us-ascii?Q?LiNxFHx5zuv80WEfntSaWjhESLz8i2ltDDB8HBtVURRAxU4ukiC2pcrKaZFE?=
 =?us-ascii?Q?aQMhDRg5iiWKQRe9pogk5/Zqv6TBKyDIcxz+eezmbZXZJFNtYr7ZgfGWO9Gj?=
 =?us-ascii?Q?B94Yq57b/e+RInUx1LooSig8yhzLRiHu2J8F9BFkYdfEh9C3IhVM59WqX5Fr?=
 =?us-ascii?Q?DyiR/oiYEprSN7wx3Hdm9x4LMDYZzfmmPaXaiW9weLOGVWbr0iCztvqZBCJd?=
 =?us-ascii?Q?Kqt4TFrOFHJ56ESIyQMcuO5qNe9Ol7Vlua78YlcVTxWEkICB60qDDwIIJojO?=
 =?us-ascii?Q?QNdQ+EjXoBYLgq21lLUx9hL0cXRgcNaQnpsYuYuYvRMLxXYi1AWwaLnajsiA?=
 =?us-ascii?Q?gSSpxZRHc3u0lq+lckRphSK0MWJfjVb6y1YpFpQdYa8Et0kW8n8br8sFnk63?=
 =?us-ascii?Q?6ImrevTdiUqB0mwCzAwrzX7s1XrlLLyZfwSaqgAam/mONuAUNMDA6ZyiVi3b?=
 =?us-ascii?Q?eg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9458e118-71b1-48da-b6da-08ddc9a9e897
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 05:29:34.4896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETC3D7qj4phrkZ1wIh9CrXa45EtDVtZpgcN+WTmW0ztFvHgMbQhkmZb84u6YxXwgT9cISKyBQqtGOrvxUgeOgM/ssGqdOQ9x7Mn5u3Q5lVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9929

Hi Wolfram Sang,

Thanks for the feedback.

> -----Original Message-----
> From: wsa+renesas <wsa+renesas@sang-engineering.com>
> Subject: Re: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support=
 for SD_BUF0 in polling mode
>=20
>=20
> > > Maybe just use 64BIT as the guard? Seems a tad more precise to me.
> > >
> > > Other than that, looks good to me:
> > >
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > >
> > > Wasn't able to test this yet, though, sorry. I hope for tomorrow, but=
 no promises.
> >
> > Ok, will guard like this in next version.
> >
> > #ifdef CONFIG_64BIT
> > static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int a=
ddr,
> > 				      u64 *buf, int count)
> > {
> > 	ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count); }
>=20
> Hmm, I wonder if it is not acceptable in this case to guard the new code =
block in
> tmio_mmc_transfer_data() with #ifdef CONFIG_64BIT. This will remove the w=
hole code. Your suggestion
> leaves some code as left overs which might be confusing.

OK. That is a good point.

>=20
> I found other traces in the kernel also protecting whole code blocks:
>=20
> tty/serial/8250/8250_dw.c, line 230
> mtd/nand/raw/cadence-nand-controller.c, line 1186
>=20
> What do you think?

I agree and will guard tmio_mmc_transfer_data() as well to avoid confusion.

Cheers,
Biju


