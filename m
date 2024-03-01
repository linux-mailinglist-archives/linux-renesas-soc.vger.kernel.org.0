Return-Path: <linux-renesas-soc+bounces-3386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0A86E4BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33251288DEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CA967E77;
	Fri,  1 Mar 2024 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iWE4MDJh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2067.outbound.protection.outlook.com [40.107.113.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E541A92
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709308514; cv=fail; b=Sxt0h2EE/wFsvsFrWU9dDRP4xlGzSkiY/d1Xzl/HoO5cMtHpGbLyeyYn90jnHadRyq2emMjnl2kqFmXh4eLsh+mQ+ptLDyHunAQjXUOMZ6HgLCJYwCL8t7s0oBTt8X9HdZmHXcYjKw2uqC3e1eDJBJsfWBy1YLtK46c13cYhf10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709308514; c=relaxed/simple;
	bh=osNJvFLbVXgngbNGrAZ+pZFRzuG+2SbOC+98YUsNDtI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pbo4S/o0flfxPN3pEwt4Zug/XDfsY8h9VaWfePjbPuYNh0S8DtytxEew4+k13zWL5H/KMyYVQsCLoZET7eByI+tt1IqF+KIl6+f4eGooD4EgK77IAearDdn388M3DT8ktsAIgXdX+EVFu5WVySZySt0GeOgAJX/H7K+M06mKuAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iWE4MDJh; arc=fail smtp.client-ip=40.107.113.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq0r5mnii/GfGJBfkc9MHh+h123opR7Y7HYIs97JgV+b5/5q+hvn4HEhjD+HEvDDcZoE4OWC3/5SXTMYnNEDuuowckewltUt+v8iLxIKUJXkoDAjvim6t2PwpTSDK7vi65USH9if+aojKE3Va1jACTQuoAY1tBJOLs3Qh0NRGJVN4GGO/nZ2GdlIQCLwWFZNkyCsyV7C3k2Ww/IDPecPeMe/AlJvHJfemBJ15IHzl2yP/e5NyizFK+F0RFburz83HO25pctOy6EGScGk5N3Bv7t8ICRwwxdm/LaUyi0W84bwk+ngbZqWPfsc6iyljkOX1VI8L9wJYMJvXq5GQsA0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cknzz4DJ0x4Em1OGv6Im/hAT/DRXz+VwtZlj8nFUHCY=;
 b=UJXzfX2pcOMU8xyCH4yNmZaF1WgkkzzNL3MLfI/8NbDKsJclPG2MMIDbiJ0LCKeZ/EqowCwrCU+FCzJT6Wg35xibJt7WQ9QJsS4/0URG1wD1XYPtA/+2NEnIlbPG2nZ0Doa0H/dvuJudZyJYmtP+eZsmgtRgcghXRdtTaCyOxiPjfmd5CXG35jwygi3572jU69ZvByKs9PvttuYvZc2aOgmSJ5e6dpe7RFUYQ/Kii/pPoaMkJkI4OsKuv5rZsthE+k7lOEFwOuYf8gRlQnboBChIZ3Pyq2qCM6f1KmZpEwzRVacoldRlx4NlsU4lOI0vLmdvrRnymFwoQBUZPeRfJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cknzz4DJ0x4Em1OGv6Im/hAT/DRXz+VwtZlj8nFUHCY=;
 b=iWE4MDJh1Dk47iu8iQSXlqJZ0dgS5f0gGhsXH+WEdesHPRsl9jnDVxu5K2u5qE/klc7Dat1p3d4etdCnoOFvwGPN7skOIWlSOKtUJ5OHllPNsGGjQKeyji6nfQoHWbMKdomA9pgskBlzrVm/SK/TB2PV4LHJVZNRRSlpPoVdMAQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB9809.jpnprd01.prod.outlook.com
 (2603:1096:400:22f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 15:55:06 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 15:55:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc
 Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/5] irqchip/renesas-rzg2l: Prevent IRQ HW race
Thread-Topic: [PATCH 1/5] irqchip/renesas-rzg2l: Prevent IRQ HW race
Thread-Index: AQHaXafXF04CwcOICU2iyQrz/+4DNLEjESYAgAAShFA=
Date: Fri, 1 Mar 2024 15:55:06 +0000
Message-ID:
 <TYCPR01MB11269F66B819E37FB9414096B865E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-2-biju.das.jz@bp.renesas.com> <87a5nixbhp.ffs@tglx>
In-Reply-To: <87a5nixbhp.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB9809:EE_
x-ms-office365-filtering-correlation-id: b19b4302-4833-4070-a01f-08dc3a07f6ff
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1/y3hHXT6IXfyyasAfdZCjb8JJh7Pc5a6AZFN61ZChENsh5dQNO3rwxAO40XdXJ9nmJejDu0IwZ8Ksc4DKHn51ID0aZs6A3vtlL4jSLC9b0fOnQJ0rqYs0QKu6/zvDu7v/Av68wlk/kYt4LJtstb2BJRw04+ap/MhPwHg0Uvml+tfHpfhU3hNfq0smgjX2Utp8ejeD3sARSqnUwSOFCo+Mk+Sly2NM9ySur02P20J22pLXBcljw5nWAgRfo4cLgYEUsWSxPs8pAt5VRY31/xvMjKfCkDI0Ut/rfQ4jDuKji//5pWFkPyhnwJ7qX0cGvP8H2CkIXZmZuHzF7PxC6Rm6qFvlo4Guni1fsDgu5Luq83sz5uhiARSq2kVyO1TJLC7ai2mAbO3RdE2XZztDMyaGFtavH0E08v9dFag3iQTcUYBUVz0eq55BZ7ZPrhCK/BTf5KWtJVYU9ps5rwu8yj+H8c7whMwFqGJtLl+78bC2nrdwOFbBT1P+KUpl27hawiMn8ghFHH2z9xFT4D7/0tAGPmpYjcLU9ymc57ybX2mUhpfBFWtNYbEecYq3gxamZ1TWyN6uY7LjqS6Ei3xyisihSsi+ZdEGL4xa9FkSUoomjvthJRbEqMFHwxZPYRiFJGcbaAkFyw9vPge/9gyKeyYLdYSghtN84JpkhPS1G3l6fB9QOY8VXPFDhN2tCjDVmwHV5Kdpg3TKiXDN2YFivFRA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ApHnZQeEuYJzxhjqHsDrUaYWz3tAnaKdLuifqfOvqnVc2N39uF/NIOffiXd3?=
 =?us-ascii?Q?dzOcX3ICBAi/grFmGElP07RwCAnoJNB6qbKqIp47ntn6WvZ45T6Aj0XU5Boh?=
 =?us-ascii?Q?9K85y6t8Ap5qwecHylN/auV+UPErNXid6nxw/mIbFWBg1NoYtZIoo3jzCEjG?=
 =?us-ascii?Q?7pnScLKEyUR9jEVxf3kuOgUPPXgcMeNwYq2p0zIYYVFkFwkJx81Vkqi1DOwl?=
 =?us-ascii?Q?VjcwbnKcrxIfon/DdltnjEV6O3RN2Gf20GtYyyv7o6wK60eeUFBdLknHlrcK?=
 =?us-ascii?Q?1T4KajDqUYGHIAl7c11Zt6S+lhdXP/GHsU+4yDT2dpi9eNpm/QiYvnPIansJ?=
 =?us-ascii?Q?NsIOaYE81xycoUSGaWarNryNd2jS09QPlg0vcrX30pmzl3EF/j3GWpdCFoaa?=
 =?us-ascii?Q?qKrZbSC+p1q06UndQ7KECi2ROlvQajx/cBUMq9T5flORK0ks+cnuA3ag/i0R?=
 =?us-ascii?Q?69s+1F03yHgMFeaQgbrMTMuUeSrcURIEt4zU5ntnx/1/Q36fj48IinGTP/SR?=
 =?us-ascii?Q?1/nbS0IUpJPAnDCVhivm6deK/hElRipQJTzXxK8WC/30eEwRu52I8B9qhQhX?=
 =?us-ascii?Q?7es5Kn+OP91G4+CHNEeT8cPVUjyKlfBNFxjvqXtDR1glRbdJjg7x+5wrUJ0K?=
 =?us-ascii?Q?3bjFE0GNh5gSfel6OpYcRKyw1qmTPtLGpKH+9MfbVikOk0tkHNfKmUHnoW2e?=
 =?us-ascii?Q?R5aC0P95aD/5n4PHA1+Ltih2O1XeOjkz0Y0jKjbT07k2XpmkeZRG1Ul3tj1w?=
 =?us-ascii?Q?hyq9de9S4D75F2jpFTREegU7OsLtcXYqpnNQwK6SSyuSN1CbwHWyYILr1U4t?=
 =?us-ascii?Q?+bL4BQAWaDgoyk/Z4oPrHLDIusYoBahgvZt2OCc1LO58mH/nHG2ERV0eDzga?=
 =?us-ascii?Q?mgpUggRsJehG1uJfh8llYGkgNHDpYTl4lLzesSQySGNx6dhuJaGij8yOjjn3?=
 =?us-ascii?Q?rHjWp0UOpQR+19G3OcYUZzcIGvQwgyFDRaDFutDxoXyRNcu6dakmIANBTcbz?=
 =?us-ascii?Q?S5HdEClvtb3Sz7xWb4w/+sJatsydKzbud6m7ZOn2KRRGyzhChDkblnG6psIR?=
 =?us-ascii?Q?ffAzftcTUNYhNHU4DorIzwfeB4AWPul0qrd36FIHfMex2TN07419jlhBask+?=
 =?us-ascii?Q?djEZUhNOXIYyZfnHvMdIsMNDbtQgGNjwXJfl2RrPcA5n0r0uRQkgCO1zCl65?=
 =?us-ascii?Q?1FOWa3KY4+nLAHjHZnbQoNaj2JukL0x+TefmHtLe3HvX/I8ov44u+AzUq+Yk?=
 =?us-ascii?Q?setCSUSHIORFjeVdFsn+U1ztJb21Fdoc6PZQUc8s/yXJGvpdAv9sBgG9L99G?=
 =?us-ascii?Q?jUJm3jhDC8rnqFbcVcoNtP85cx1DQqBfLboVzz66AOfj54q2QpocjWJKwU5/?=
 =?us-ascii?Q?EEJR0mpVIY2vANnTulWFd5gkS1cZyw36m9Xx1bmkDD567pOMEY8unyajGY2U?=
 =?us-ascii?Q?joGlwhbPDTXkGiqXm184Ii14PXqsQKFWl8hIOIOxeCbiHybC6BwUJJPf62Zq?=
 =?us-ascii?Q?dVeCOR43HVJ/OmjAVWIAlJ0HSwQ+VGxCx0HpyoWsNrOpdhoQ3imyP/7C8A/E?=
 =?us-ascii?Q?yYhlbGWmJiziAzhIQT0m83umgvm/caESfFy5gpRJ900YPDYZBGHjdL/DlbCx?=
 =?us-ascii?Q?vA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19b4302-4833-4070-a01f-08dc3a07f6ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 15:55:06.2761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjsydvFguP83JGDWF2uDOMEzEad/fAX4M7xjPlzkmQ5CEGKGEUuge2ZlZQU/osHKiyNtfv8UKCQBfrf4veSQ2rj4v1aJQ1+FDEBqaXCr2UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9809

Hi Thomas Gleixner,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Friday, March 1, 2024 2:39 PM
> Subject: Re: [PATCH 1/5] irqchip/renesas-rzg2l: Prevent IRQ HW race
>=20
> On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> > As per section "8.8.2 Clear Timing of Interrupt Cause" of the RZ/G2L
> > hardware manual (Rev.1.45 Jan, 2024), it is mentioned that we need to
> > clear the interrupt cause flag in the isr.
>=20
> We need to clear? Please write changelogs in neutral tone. Also use prope=
r words instead of acronyms,
> this is not twatter.
OK.

>=20
> I'm also failing to see the value of above sentence other that it occupie=
s space. The code already
> does that, no?

Ya, that sentence is not required.

>=20
> > It takes some time for the cpu to clear the interrupt cause flag.
> > Therefore, to prevent another occurrence of interrupt due to this
> > delay, the interrupt cause flag is read after clearing.
>=20
> You really want to explain explicitely what the problem is. The above is =
a novel
>=20
> Something like this:
>=20
>   The irq_eoi() callback of the RX/G2L interrupt chip clears the
>   relevant interrupt cause bit in the TSCR register.
>=20
>   This write is not sufficient because the write is posted and therefore
>   not guaranteed to immediately clear the bit. Due to that delay the CPU
>   can raise the just handled interrupt again.
>=20
>   Prevent this by reading the register back which causes the posted
>   write to be flushed to the hardware before the read completes.
>=20
> This uses the proper technical term 'posted write' which is well defined =
and exactly the cause of the
> problem, no?

You are correct. The 'Posted write' is new technological term for me.


>=20
> > Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller
> > driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/irqchip/irq-renesas-rzg2l.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzg2l.c
> > b/drivers/irqchip/irq-renesas-rzg2l.c
> > index 9494fc26259c..46f9b07e0e8a 100644
> > --- a/drivers/irqchip/irq-renesas-rzg2l.c
> > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > @@ -111,8 +111,11 @@ static void rzg2l_tint_eoi(struct irq_data *d)
> >  	u32 reg;
> >
> >  	reg =3D readl_relaxed(priv->base + TSCR);
> > -	if (reg & bit)
> > +	if (reg & bit) {
> >  		writel_relaxed(reg & ~bit, priv->base + TSCR);
> > +		/* Read to avoid irq generation due to irq clearing delay */
>=20
> 		/*
>                  * Enforce that the posted write is flushed to prevent
>                  * that the just handled interrupt is raised again.
>                  */
>=20
> Hmm?

Agreed, Will update accordingly.

Cheers,
Biju

>=20
> > +		readl_relaxed(priv->base + TSCR);


