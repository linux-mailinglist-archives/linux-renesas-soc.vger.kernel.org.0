Return-Path: <linux-renesas-soc+bounces-30028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN4nNMJwvWmt9wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:07:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 745522DD0EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 17:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD99C300A304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 16:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854E3C9437;
	Fri, 20 Mar 2026 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t6IXHEsT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7E3803CD;
	Fri, 20 Mar 2026 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022848; cv=fail; b=kdtd603vS0SnMLUlWhPRPMvJ66lA1CqxWnM7w7xIr8/bNEV0cXD8MATbSMFhVGpftG9tpqAOBfQxr5aOhMFjcLcGrAhGx1RwuJ2EFs5IanRAuZ3tXVmPtyA6HKBRRzmwAa5pwLNnH4o2SyJPQecmI9B9z7vKE/GFYvi9D5Wbp2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022848; c=relaxed/simple;
	bh=qxocIhz1nbqsdZgcseTOhvLZ9LjiwjEVuYd7qX1Y6VU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JLcmAWlV/X3EFjh+NHhFo3M+oNfKuJoC4klijqL6ZW3wKUnwlXsuzhE9C26uXlRxwLLPvv7hKg4GexIcNBskzDPlT+1aOndE/qrdrrVZ0yjbsPKtAcwTLtgK6L8prd0+443btQH0VLDDOlKzwKeUeN+AsB68LRlBhH9LOt+rOjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t6IXHEsT; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKTR3JIvZ9zNbdOFKlIOtlEaRJGIwn7/7gwKxoxYBBGVmGMakYz5CrUWH3Y5nJZVrtsk3nB4witDqndwYwwPnh5WuoVO0HWwCbSM9l8vPtGk/knpFuXzPAbgU5qZ5sQiqh1JCPMQJomKWSXMtroFm+pZPbbrtFO4QrdML3QmX4Y4PBij/05qGJOtAfYNFEtDo1kzJvl8rEr+FwUkYnXQOD8MsBMseZg8+YCjbxcTGWECQ1uq3/Z9+18IUNck8RKcgOMvs4KQLXKJtOGAUWIvl3eFvExWkPGx2wm5Z2Cm+hCI3jYDmCgof6jbNjkRLGOPcnQ75+TsJI1qwss2DU9Jfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tjO5XuWE2vRFxhMEaOsIjPor1KhSsWOp5VRIXUBCf0=;
 b=nw3dqc8ij+Lc06GOaBIQZAr1HlDcqFQV7EPCpuESA1ACXkDKp5yAqBuRlB1WS3PgwUFezlrk+UmT8yL5IuPDSuQTZf/FBkpQGq6yVi4a+d9K6MJOYwFimSef8LdU0tWPF4Bo2tw0kVXzyo0tbRVb6MHWe3IFCO+h1SFcBdH0VfGVY6ubBrnGsH0cF//cenU8+wIcDOXJt2O+4OKD2uhaGv3PD1Ex2mCFZz1rmc4MnAqFiKT/rLj/0zVhi+vmhQIIMH3EZoNgj8b1H6+8jb0W9Z3kM5Y7rFwwVmVPhOE6edMHOayAk30YSWjRSJhh4Gs8XiyJn4+ECkNm2+QOjXlA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tjO5XuWE2vRFxhMEaOsIjPor1KhSsWOp5VRIXUBCf0=;
 b=t6IXHEsTr9j54hpJlABDB23K9d8HYLLcyfDunZ+RAm5J92p5WchItAAmQ23Mhsr7MPDdwWDheNav1zJkL53fKd/lZfx4zMapZrqQWjpLO+uINzhgvIeNP4G3/jdpzG6zB/b4IKlWIsJ3m0Osl+1ZcMWgPda7U/ftjZ8Ah0AbKXg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16913.jpnprd01.prod.outlook.com (2603:1096:604:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 16:07:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 16:07:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Topic: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
Thread-Index: AQHcsYzME8LKYUM6yU+Y20SUC//E7LW3LOcAgAB2I3A=
Date: Fri, 20 Mar 2026 16:07:18 +0000
Message-ID:
 <TY3PR01MB1134697576973F8C0E064106D864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-16-biju.das.jz@bp.renesas.com> <87fr5ulvtd.ffs@tglx>
In-Reply-To: <87fr5ulvtd.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16913:EE_
x-ms-office365-filtering-correlation-id: 9babd081-12ad-4178-376f-08de869ac301
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 qPAlQSnZteN7KyiOXKZqLZHVIzlYam20ZZXN2qv3d/94m3wBGNdfAbWVCpJMYDrpyJNAhXTcCgxX+WwhQlFkPXLAdANkb6yUfYTB+NNEw3MMsiBixmpsQs5faBMFFUbhFM9A74/MDN8qBGF3BcMh6NszqbAZ1hZ6Gl83MmelfdqUnaceu/7iuMotorikPEiUzTPtoY0oI9X/XcPcuAgzd/X6xDXEpHIcH/2+sXdLLOo+mAlclmTQZw3RXJ1FlCyU5f5amZzoaNxA4BoLaaF8lOfdOPEg18jm35kFTWisRgq23qbKMoXbS63KKKBPOmORQDtFSuOqeNN5Rsjtcorn+hDvJocXP0mhci4l4AcHVR1GxhdwNnmOekdsdj4Tx4VJ1IyGbmaWEnPtm80RXtNTsYo2ffEZD+hV21NYTIC7HneCwvNcNFqx2CUiuldSOAmlH/cZDRwNCBH9dKia48qCbzBYIu/4/8u/IoFVoudlfDds3LAbmPr4SemRYHd6zs4Sa35nZbsBq84i8/g5pQFIbOSqQeYCaOiUQ2Cb/uavf3FvYe9gKBEJdaqGldMgzJ7rRu3lYxanozpBJTN9J/SyveM34Ntl6YFFroJmi6pa25JFfDyPvtLtX5EJsjtLWbnYYb2VkkK5nSObcexAAs69cU/Z+KN30hRKk+de81kmlsA0vtg9Ovo6FF+ijPBMPF4mDXsSrOdPCYTld4cAxJAbG8cC2TLna2+mjOvFI+ab0C1aVOwluq7MZppKub/FdwnhxwkN2zjsDIIOaCKDDV66s/MhJ6imn1ezE9YJ+lA3Qgs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?R198TTVM/r/TDsi45oBTeu8Whfku/xmGCDngMT8WCQiFHwk8x8TG34gwyCE5?=
 =?us-ascii?Q?5Rx6xefWLS8CiMo+IUnkMT/aMB7enOo3gZzbIHhDVaAilW2CqE37u56aolnS?=
 =?us-ascii?Q?3qFx6WBJFIz1JVPzwYDhdYZ9kDezKJBBMryvLU5H2PdHS1sN8ykUggwbyf2T?=
 =?us-ascii?Q?WKWvMxkpmAbp69MEhRylUBn7gc39cu0FLnBBVtSFJWUO0joXB/Y0Z3xI6Oqe?=
 =?us-ascii?Q?tFvk95DRg0+OBVUkzGzkpTj9xe2Za/0slENM3jpRIDhSQjYNXkNdsueZ7Dw8?=
 =?us-ascii?Q?6c76nYgQIulHIAlHQyGNwqmOnOTGLL3WsZB/RWhuIuq4Vu6EnxvxL+kt7QiC?=
 =?us-ascii?Q?Ppy5R/rn8fyK+NKmngloM1WB0RfBnsSBt29QZQyAyk2B0HAQ7OK3eETv30p7?=
 =?us-ascii?Q?7MASLWzOCu7otl/AG9wsf+bWZVKYxFflraOcgsry9oRpwopqCdjufdpGaT8d?=
 =?us-ascii?Q?3OjfvLqWLqvtuw4CO6AVT7OmFDdvousFmvMUBRL7iDmMOF3G7DI+2Iaan0sg?=
 =?us-ascii?Q?Rd3dbEGlHI5QnBRpuinAiefrY9NHZs7odtVIYQfRhSRltNv3qXV86d7BpWe1?=
 =?us-ascii?Q?mwBI2zrcoSmYfa6rkoqNuoRunJllqm1UPrX6szTMvZK6GUaGvmP7BPgfwmwD?=
 =?us-ascii?Q?RH4isTTmPgTn9x1Zt96fIEsegaUgWza/0umtuD5DtrZ3r7LcD/Wi5l0xAkhK?=
 =?us-ascii?Q?RJ8Y4Ytj98vztmdNMfs8/WUEoZgbOiS1p3z5ISRSQ8q0PS6phUeiID7WXI0i?=
 =?us-ascii?Q?efy4Vi3HSzrHgW37598Z7B7b0cEdevXQBMxfxnZCfcU08xKKuK7NgAihVJST?=
 =?us-ascii?Q?q3EAXqlcX7XfoIMGI2Wy7nMYaPQTqA6XW7ptsFUyw9BPdeWeolpwRO08gkqN?=
 =?us-ascii?Q?BipUL7nePHpvtvIPdKfFMPTB+O3eY6kR+ELIUp75ZyiQId0ARU3GC8mrOYMf?=
 =?us-ascii?Q?oO+GzFqXRDwAnLnmrlV2PGh3ksv2Du0MaA6xAn/2jUL6Z7UlTmWsZFKqNyXa?=
 =?us-ascii?Q?44R1sY23hUNaJPicH7jjSn2o3JXXaKDl3tHB2t965N1SAeRmhRVxHtbgJhZu?=
 =?us-ascii?Q?oP/omXh/uwb6ucCr1C+UYVPWNHVoXt+14IfOsMJp1Pdo/9f4LG7mp9qtnoXt?=
 =?us-ascii?Q?QCkWq7qjvqOvp0MNsrAnFhPCz+O4HTypjgLqvSU2xBLDYUlQQRvwvZ948T1a?=
 =?us-ascii?Q?ieptEFb8R9p/1ppuT7cRsjWu7NoAI3cJGOKx6jLp0r3jsNxaiygeBECvJGTQ?=
 =?us-ascii?Q?aSsAa8i/iaaHJKQhETBxOWr6P5LqXMP5kcgWGx91PkFoPADXejoeksmJ6QmN?=
 =?us-ascii?Q?R/4G9CdY1v+7oLu+jTZVLNpWn7QJJaZCH/ee7L7AdpoewEJ2fl15/AJu0y8p?=
 =?us-ascii?Q?mVCFmbabXrEi80Hol6hcwfS5rsLu8SoNOipUiyNCivOdKQ+u5eyssLGvTDOZ?=
 =?us-ascii?Q?MIPZpOcYgcVpugBCZj0jQU7fOeBaZi8rJRiF69xLam/0TyxENFxZoqEAEL7i?=
 =?us-ascii?Q?UHjBBI92JvRbf3OFVoM55vhCCVAkepW2SjNE8CK7W+S7Op+eln7UDWmm7NUg?=
 =?us-ascii?Q?h8vjElxMMFnGaKQEsyYDZkxOUOa2FDafXjUBVexJJBki9dLXQXg6u2xdsk6N?=
 =?us-ascii?Q?Hm11ooMYGw3lXLQirgZs/faKdFD/KN9q34L/f0dR9ipH0adCYkdyeF9GfEhI?=
 =?us-ascii?Q?VZm/SK6pY+gRGOI9pgCjIa0gp5kOJOjipy0c3ivUD/RPx5zbdzM1tPDlf+Ds?=
 =?us-ascii?Q?hFtza+YlsA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9babd081-12ad-4178-376f-08de869ac301
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 16:07:18.7500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqy2nFH+6edkEceYMgvaSO5DkJ9LgYjUGkka1oBx6aPGCQ6Ys92lmuavjsbe/ocJuSL+0xa+epT9RRsO7bVyrgd6oOqld0gcbUOJgCtF2oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16913
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30028-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 745522DD0EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 20 March 2026 09:01
> Subject: Re: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt=
 support
>=20
> On Wed, Mar 11 2026 at 19:24, Biju wrote:
> > +static int rzg2l_irqc_irq_request_resources(struct irq_data *d) {
> > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> > +	u32 offset, tssr_offset;
> > +	u8 tssr_index, tssel_shift;
> > +	u32 reg, inttsel_reg;
> > +	u8 value;
>=20
> Once again: Proper variable declaration ordering please. Do I have to rep=
eat that every other week?
>=20
> Again the same type salad.

Sorry, Will fix it in next version.

>=20
> > +	if (!priv->info.shared_irq_cnt)
> > +		return 0;
> > +
> > +	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
> > +		offset =3D hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
> > +		tssr_offset =3D TSSR_OFFSET(offset);
> > +		tssr_index =3D TSSR_INDEX(offset);
> > +		tssel_shift =3D TSSEL_SHIFT(tssr_offset);
> > +
> > +		reg =3D readl_relaxed(priv->base + TSSR(tssr_index));
> > +		value =3D (reg & (TIEN << tssel_shift)) >> tssel_shift;
> > +		if (value)
> > +			goto err_conflict;
> > +
> > +		raw_spin_lock(&priv->lock);
>=20
> scoped_guard()

Agreed.

>=20
> > +		inttsel_reg =3D readl_relaxed(priv->base + INTTSEL);
> > +		inttsel_reg |=3D TINTSEL(offset);
> > +		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
> > +		raw_spin_unlock(&priv->lock);
> > +	} else if (rzg2l_irqc_is_shared_tint(priv->info, hw_irq)) {
> > +		offset =3D hw_irq - priv->info.tint_start;
> > +		tssr_offset =3D TSSR_OFFSET(offset);
> > +		tssr_index =3D TSSR_INDEX(offset);
> > +
> > +		inttsel_reg =3D readl_relaxed(priv->base + INTTSEL);
> > +		value =3D (inttsel_reg & TINTSEL(offset)) >> offset;
> > +		if (value)
> > +			goto err_conflict;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_conflict:
> > +	pr_err("%s: Shared SPI conflict!\n", __func__);
> > +	return -EBUSY;
> > +}
> > +
> > +static void rzg2l_irqc_irq_release_resources(struct irq_data *d) {
> > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> > +	u32 offset;
> > +	u8 inttsel_reg;
>=20
> Your type choices are really interresting and both variables are not used=
 in the outer scope. Declare
> them in the scope where they are used.

OK.
>=20
> > +	if (!priv->info.shared_irq_cnt)
> > +		return;
> > +
> > +	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
> > +		offset =3D hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
> > +
> > +		raw_spin_lock(&priv->lock);
> > +		inttsel_reg =3D readl_relaxed(priv->base + INTTSEL);
>                 ^^^^          ^^^
>                 u8            u32
>=20
> Seriously?

Oops, will fix this.

Cheers,
Biju

