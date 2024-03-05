Return-Path: <linux-renesas-soc+bounces-3480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D83778725D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 18:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83EFD28382D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 17:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2326817555;
	Tue,  5 Mar 2024 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P+eXHmH9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2068.outbound.protection.outlook.com [40.107.113.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0F15491
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660471; cv=fail; b=nXTb6gCR8oWn84NgjGdC9RZqSf+7RR3zMKHMYgtQiECcj5YQmVS7eDMKV0GpeqyioKonnA/XIht7WmF8GFtELUF74+LUjOtUQ7zhiE6zMMVdZ5w2Nyi1b7/PChl75d7dNCw/Pc1J2XLA1oan7osypOsL7EBY7HjepUPdyMRctD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660471; c=relaxed/simple;
	bh=lhjiT2vj03gyLoMgyN5x50WUim/w3Yj7xv8sxezwFdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cprpBIRwKptnkjp74/HzeFV6KEjZfBN9MmfyzLUbO3FaJ/qQKPTq4QFIdW/z290XNNzHGiEjJTZfgeWNcPdsovxM2E3KLjV3GzOfkSQ0rvvS8P7t0UG5VrYEx4CRS5FebZqxpjT8AStHBqigGVs0QzEXrt8vu8kG7gZwcT+B9eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P+eXHmH9; arc=fail smtp.client-ip=40.107.113.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APRLqnN/lSPyd6NY1KmvWJ7zQNrFtnmnVL2mO55j2nMKHhseftCQJk6lM5wHBvtXrKgLkODBQOIt77ACg9ByAFYQ5cjUsLKsVvlpwlpVb6ME+NY5s8li4rT0zEhPLRl+9LYTkCIHn6PGg5Aba31buOh1B3nKKJt9zKCgYztNJ6d9eMykZKXLSNxPsId9PEOWC7b9EzWQ5j2S3HXnU2XHs0cdLWWdDM7cSBo4B+c3Q6aGUP7TCOpuGP3zfsS3n+BELFvLZI3RqqqnQs0vL5McZWSd13aNAVdnQpu0zy4y7RFtFOxdHaOcvmIzACg6V5y2q6d/HUdZ8YqoqFavYEOiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjZ68qQbpSuBRfHWYFT/MXSEQCy5+pzHLHGhQAy3OqU=;
 b=ODgURJ5Py4dBey+qsh+y5GjuTWMW//FlILTPwUweJYFNbGDzuLnyctmrv+kOEjyDxw+UtEvBzzQLrJhz4xxj0aj7qHsjOFcaSzbKikUTB9ekkX5NTlM3+lf/V68EbFOYYvx8bt8V/g+lHPKZYfiTmT1BqIbTaevr+fvNZMalgmf6mL1RGNFrIvItS/SURDqRkvI0KA05amc7a8eDzVi2tHuMCVOB2/xzvFeRlresHHmB5cKSk5W99lNPNTKMuOmpEyylOwL1HMZaZJpfEVJwE4pdXACXDeHFK+Uj1iXNIwlD8xu1uvHURHY4AnFo9Y2/kYy5t7Y7lw0zimkenqhvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjZ68qQbpSuBRfHWYFT/MXSEQCy5+pzHLHGhQAy3OqU=;
 b=P+eXHmH91HXNrb8sDe/0/ZHSU+CJCN3y9XM5GMqSf3GaUqwvozoo9qVINQs7ZY86flS7fd5Wt3W4USNPJvDiZdOvCRjpZ6lG8av4edWAB1DaqBPRlZwNSsaIlOIKlmvn407tUaqeXlkqBUu8FwAKflrSy3UnARFgmPRUWOunaNo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5498.jpnprd01.prod.outlook.com
 (2603:1096:404:8043::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 17:41:03 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::9013:d19:4845:e226]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::9013:d19:4845:e226%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 17:41:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc
 Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] irqchip/renesas-rzg2l: Fix spurious TINT IRQ
Thread-Topic: [PATCH 3/5] irqchip/renesas-rzg2l: Fix spurious TINT IRQ
Thread-Index: AQHaXafbkVE7deydZUiCCh2xtUl/x7EjIRMAgAZncXA=
Date: Tue, 5 Mar 2024 17:41:03 +0000
Message-ID:
 <TYCPR01MB112691F731C24FA0F6B0165CA86222@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-4-biju.das.jz@bp.renesas.com> <8734tax8up.ffs@tglx>
In-Reply-To: <8734tax8up.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5498:EE_
x-ms-office365-filtering-correlation-id: f455b68c-0de9-4a77-4d15-08dc3d3b6dd5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jd54qOHhdJB3aPUroxiF+2KKWA2qdGqKkLTSgPZs0iOYALofEyZgT5JBblSPU/pv7osHCUUJ2c6n3Dxc2seMDAJKL/GMv5wi+gu6o9Qtw+7hwdLndrWpu4/B8rz7C9RxLwukARkv972nbdqhgpWlGwOHgu+RbDynUwyyYjAHfQvsUKnKjts4pyagfYEOJVfmh+D1kuuqMWOnq9yjJtnOZwbXKeQrxEiyGnX/t47ExwmkErfC0lnH+6y830om2wRYyGdzxRMi5wnScbMenCKjJJbLtaJhaRL6h8QFfSF4WEvIczzyrore0PwDbN4F+VhSvJykRiXujrZERk5Wmf/d5QZPpkzHch0nVGGUOn9N0YO42A3A5IWz5goCWg6Bbsnb9MXK3Te3GLK+bHzul9OIiDIzLzLa04tlcND/YlQpvh49pHrlXwKZZMarUr62/QC3ZyvgABfaiExQDTMkroRKyhXS907Rt77BF+bkOq2JNbmV2KjOdehDa7BNEH3Ha47Msqt0sW7MP7jQICPW7Pd86smJwBQY4Dfp6bAILycaxM+IHJXdNkS455KIbV36+Jd/jBkWDSeyrJuZliegXiCApGf2lZQa6B40LtYOGt5fUOoP819+P5baY1b6blMYfNSKEnaNMQkvMtMjPwNvu9OkedO4bCzLNYibvLeJ8oVLd/vk7kXwgqZiyUp7wBdHxcJuqLvylxDs4fWRVm83n/OzUg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Jpu4qRTcYIvYPPB75qqe9tKfwSRVLd7zxVuKA82ECVlBVtoLHMpJMO1mV+sp?=
 =?us-ascii?Q?zGvBxE0lIHpFgT3Oryj25MHS5atXDkZpYtjvAtJSZKMIwr9+Z7RXmx5V6s6p?=
 =?us-ascii?Q?IaYf9HdL3vaM6NnpwH1gFOOGu/s3IorV5RJVhi9u/sLZdENNwvWuBc5DAHZ8?=
 =?us-ascii?Q?ZAeeDX8+ciLaYLWOJnAHvIWyhBRcpRYw9XaIx9wur7up6tHYyjSZn30eQFtI?=
 =?us-ascii?Q?YjXxGxH2/EJW20iXKfIhuai2zCiZvWVa1abWJBhZGaYcL2Az25kljrg0jPk8?=
 =?us-ascii?Q?yld7TMcC19jywPyMrvvLl2q38idEw2UP4RriNTvsx8SCsxtXBMcBa9wyDIwi?=
 =?us-ascii?Q?y8j3RGNdplJgxwwMeHw2U6DkH2ud4QETWWTLrB1BadlmYv9rimFA0r0+hK6Z?=
 =?us-ascii?Q?z4llVUU5fi5IXiTe5sg5XoHGWeowf3Y+owfKBjLMfT9LUIr4vIzf8MF1aW/3?=
 =?us-ascii?Q?JybHpj/HbYMegTTMxtIXe0pcPolZgytCvTRTufS5YduuKPJMKPvuziCbc4UH?=
 =?us-ascii?Q?5hjFWngBoGPrl6bn5JN0ZXg4wnhk2UV54zJRzoUDXtC5ngZHVZrTUzvkoRWW?=
 =?us-ascii?Q?W9L6RTaSJ2Q8YGH+GXU7tccu1o88OfPG7e554BHNg1B/dEidum11mZbyw8ll?=
 =?us-ascii?Q?rDjM9BSB/q2mEtegDsFtwDR6KwXH/3BGk8es1ajiUgmwudZ6CsUk8zYReJRT?=
 =?us-ascii?Q?EPWw9gcMJrFnMNYD9OOwtbfPpT8+hSrO75A+6UO7qM5fxeiS7AYteqNeOKhm?=
 =?us-ascii?Q?6WQRD+d6GDlacZlssCOVxK9rn9wsS4xuoPv15XQB9DeVjWBOplWs0pg2YYuZ?=
 =?us-ascii?Q?fO5vpary1qIuwi2QirkvpPXRrTu7dJtiYv5RnAfCOE91Qt+ZJVN/ZDfIxhoR?=
 =?us-ascii?Q?ZFL69W1775U2gTeTQ7tGLDWShDIRfVV9QdBDEiAs7tM56X29OxouVBonSVAS?=
 =?us-ascii?Q?5JV+2e34wUS9eSlp/P9rJbxzfZ4mBEVAdsq5SXLVAfDrCdR3e5CurXi8pBXM?=
 =?us-ascii?Q?o9QZ4WLFZ8PHHI+HjEp9TDiTO7gIXF3R+4jpo4AG5ZyFkxXNlpOGOWum8a2N?=
 =?us-ascii?Q?hLOgIfTPhAz5lSqYHep2812Meu95q/a/yuyqooiWXUxccYlx75TTJyf+/Hxt?=
 =?us-ascii?Q?iqM95KSOhiGta2WIcXKXX+QAPZ4zlZ620hciRzGK4lF0dkmtOh6htqoobIju?=
 =?us-ascii?Q?s490ddGjWjEMF1T3JItkyBJCQNa3QONIbt97YqDVZz9nP9dLCTw/vK4fPmmN?=
 =?us-ascii?Q?XIdLb3QJeuIzkJD3ay+4Esl4IKcR1lYxEhITiJiHU5s490XygPeTgBpX+y5Z?=
 =?us-ascii?Q?NgRybv062ruVcHfCcI/qmIHcP8w7V+m3nassFKhf9r7L5cHi7BKIWqnFIDo1?=
 =?us-ascii?Q?1OLhpy8Bp3ymFBOjEnImeLoVcjjzQgFLSzTjhOYqeQTeze5ldvTUwiO8EJ+K?=
 =?us-ascii?Q?LIEJl2D7YcPBJ6x6Jgmzvtzs/uJRpwBX3pZ1Fy9bO56o/LwCxQZfz7j8ZfWO?=
 =?us-ascii?Q?yX161xdvpCO7fzRQjK1J2rOo762Jw8LMOhXEGVRfiRrhRsE3KcaoHsvymliQ?=
 =?us-ascii?Q?G7UQQFGkZ/mhCWe8gv/I6DMcvpTDOnAxrNOPx8YgNRBuTZydi93XwpWnhdue?=
 =?us-ascii?Q?WA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f455b68c-0de9-4a77-4d15-08dc3d3b6dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 17:41:03.4666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFXEviOougM/wCnCYT0tgfWuWOhTRkVvfCXev3nID/0sGD7LfmEYNOAUW7UQZZorb96rJIdXtoPPTkpf1wPp4R2UvH2WYmXZ9G5pmMZKPtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5498

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Friday, March 1, 2024 3:36 PM
> Subject: Re: [PATCH 3/5] irqchip/renesas-rzg2l: Fix spurious TINT IRQ
>=20
> On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> > As per RZ/G2L hardware manual Rev.1.45 section 8.8.3 Precaution when
> > changing interrupt settings, we need to mask the interrupts while
> > setting the interrupt detection method. Apart from this we need to
> > clear interrupt status after setting TINT interrupt detection method
> > to the edge type.
>=20
> No 'we|us|...' please. See:
>=20
OK.

> > First disable TINT enable and then set TINT source. After that set
> > edge type and then clear the interrupt status register.
>=20
> Again the above novel about the manual really does not explain what the a=
ctual problem is. I can
> crystal ball it out from what the patch does, but that really wants to be=
 written out here.

Ok, will update and send.

>=20
>=20
> > Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller
> > driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/irqchip/irq-renesas-rzg2l.c | 46
> > ++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-renesas-rzg2l.c
> > b/drivers/irqchip/irq-renesas-rzg2l.c
> > index 74c8cbb790e9..c48c8e836dd1 100644
> > --- a/drivers/irqchip/irq-renesas-rzg2l.c
> > +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> > @@ -117,6 +117,40 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc=
_priv *priv,
> >  	}
> >  }
> >
> > +static void rzg2l_tint_endisable(struct rzg2l_irqc_priv *priv, u32 reg=
,
> > +				 u32 tssr_offset, u32 tssr_index,
> > +				 bool enable)
>=20
> The 80 character limit does not exist anymore. It's 100 today. Please get=
 rid of the extra line breaks
> when adding new code.

Agreed.

>=20
> > +{
> > +	if (enable)
> > +		reg |=3D TIEN << TSSEL_SHIFT(tssr_offset);
> > +	else
> > +		reg &=3D ~(TIEN << TSSEL_SHIFT(tssr_offset));
> > +
> > +	writel_relaxed(reg, priv->base + TSSR(tssr_index)); }
> > +
> > +static void rzg2l_disable_tint_and_set_tint_source(struct irq_data *d,
> > +						   struct rzg2l_irqc_priv *priv,
> > +						   u32 reg, u32 tssr_offset,
> > +						   u8 tssr_index)
> > +{
> > +	unsigned long tint =3D (uintptr_t)irq_data_get_irq_chip_data(d);
> > +	u32 val;
> > +
> > +	rzg2l_tint_endisable(priv, reg, tssr_offset, tssr_index, false);
> > +	val =3D (reg >> TSSEL_SHIFT(tssr_offset)) & ~TIEN;
>=20
> So this shifts the byte which contains the control bit for the interrupt =
down to bit 0-7 and clears the
> TIEN bit (7).
>=20
> > +	if (tint !=3D val) {
>=20
> And now it compares it to the TINT value which was associated when the in=
terrupt was allocated. How is
> this correct?

val is without tien, so basically it is comparing tint source. This is corr=
ect, but I agree it is hard
to understand.

>=20
> Depending on tssr_offset reg is shifted right by tssr_offset * 8. Right?
Yes.

Offset =3D 0, shifted by 0
Offset =3D 1, shifted by 8

>=20
> So the comparison is only valid when tssr_offset =3D=3D 3 because otherwi=
se bit 8-31 contain uncleared
> values, no?

Oops, you are correct.

>=20
> > +		reg |=3D tint << TSSEL_SHIFT(tssr_offset);
> > +		writel_relaxed(reg, priv->base + TSSR(tssr_index));
>=20
> So this writes again to the same register as the unconditional write via =
rzg2l_tint_endisable(). What
> is all this conditional voodoo for?
>=20
> 	u32 tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
>=20
>         /* Clear the relevant byte in reg */
>         reg &=3D ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
>         /* Set TINT and leave TIEN clear */
>         reg |=3D tint << TSSEL_SHIFT(tssr_offset);
> 	writel_relaxed(reg, priv->base + TSSR(tssr_index));
>=20
> Does exactly the correct thing without any conditional in a comprehensibl=
e way, no?

Yes it looks complex.

>=20
> > +	}
> > +}
> > +
> > +static bool rzg2l_is_tint_enabled(struct rzg2l_irqc_priv *priv, u32 re=
g,
> > +				  u32 tssr_offset)
> > +{
>=20
> The 'priv' argument is unused.
>=20
> > +	return !!(reg & (TIEN << TSSEL_SHIFT(tssr_offset))); }
>=20
>=20
> > +
> >  static void rzg2l_irqc_eoi(struct irq_data *d)  {
> >  	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d); @@ -214,8
> > +248,11 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned =
int type)
> >  	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> >  	unsigned int hwirq =3D irqd_to_hwirq(d);
> >  	u32 titseln =3D hwirq - IRQC_TINT_START;
> > +	u32 tssr_offset =3D TSSR_OFFSET(titseln);
> > +	u8 tssr_index =3D TSSR_INDEX(titseln);
> > +	bool tint_enable;
> >  	u8 index, sense;
> > -	u32 reg;
> > +	u32 reg, tssr;
> >
> >  	switch (type & IRQ_TYPE_SENSE_MASK) {
> >  	case IRQ_TYPE_EDGE_RISING:
> > @@ -237,10 +274,17 @@ static int rzg2l_tint_set_edge(struct irq_data *d=
, unsigned int type)
> >  	}
> >
> >  	raw_spin_lock(&priv->lock);
> > +	tssr =3D readl_relaxed(priv->base + TSSR(tssr_index));
> > +	tint_enable =3D rzg2l_is_tint_enabled(priv, tssr, tssr_offset);
> > +	rzg2l_disable_tint_and_set_tint_source(d, priv, tssr,
> > +					       tssr_offset, tssr_index);
> >  	reg =3D readl_relaxed(priv->base + TITSR(index));
> >  	reg &=3D ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
> >  	reg |=3D sense << (titseln * TITSEL_WIDTH);
> >  	writel_relaxed(reg, priv->base + TITSR(index));
> > +	rzg2l_clear_tint_int(priv, hwirq);
> > +	if (tint_enable)
> > +		rzg2l_tint_endisable(priv, tssr, tssr_offset, tssr_index, true);
> >  	raw_spin_unlock(&priv->lock);
>=20

> This whole tint_enable logic is overly complex.

I agree, it is complex.

>=20
>   	raw_spin_lock(&priv->lock);
> 	tssr =3D readl_relaxed(priv->base + TSSR(tssr_index));
> 	tssr =3D rzg2l_disable_tint_and_set_tint_source(d, priv, tssr, tssr_offs=
et, tssr_index);
>   	reg =3D readl_relaxed(priv->base + TITSR(index));
>   	reg &=3D ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
>   	reg |=3D sense << (titseln * TITSEL_WIDTH);
>   	writel_relaxed(reg, priv->base + TITSR(index));
> 	rzg2l_clear_tint_int(priv, hwirq);
> 	writel_relaxed(tssr, priv->base + TSSR(tssr_index));
>  	raw_spin_unlock(&priv->lock);
>=20
> All it needs is to let rzg2l_disable_tint_and_set_tint_source() return th=
e proper value for writing
> back.
>=20
> 	u32 tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
>         u32 tien =3D reg & (TIEN << TSSEL_SHIFT(tssr_offset));
>=20
>         /* Clear the relevant byte in reg */
>         reg &=3D ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
>         /* Set TINT and leave TIEN clear */
>         reg |=3D tint << TSSEL_SHIFT(tssr_offset);
> 	writel_relaxed(reg, priv->base + TSSR(tssr_index));
>         return reg | tien;
>=20
> The extra unconditional TSSR write at the end of rzg2l_tint_set_edge() is=
 really not worth to optimize
> for.

Your logic is simple and correct. Will use it in next version.

Cheers,
Biju


