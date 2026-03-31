Return-Path: <linux-renesas-soc+bounces-30663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Lc3EF4LzGnGNgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 19:58:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E236F906
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 19:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42C63306B915
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 17:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61519436348;
	Tue, 31 Mar 2026 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jChqZCiQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8733263A;
	Tue, 31 Mar 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978509; cv=fail; b=MSLeXs0JkwFN5Uzed7TAAsPQ0YniZDAaFi6aNzi1KUROZgXPNgllAQgMdkgpG+Ix3Kxqlj8raUsqXxDYtOkeOH0tgJnGrPk0NYbtRm4H9Zk/FSVZgPBV8BCEh9q5KUGOcwwkQoxDvg85yE3Zjkaivq6vyWaK7z1FT8e8Vm6NOu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978509; c=relaxed/simple;
	bh=hsEZkfFEFBsEhZpTAkJTmsJA4MxP9vb6KvHH/xFhE1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tM9QdocTY17K0vGEOttq4ooh1lr6dgegnHKMYIxZO0louswqvq5wIHd0LdaMt822P6HhaXX/0kiIV6xkoUL+gP2b+NlMnZ5lL25XhEdTht50P4eiOYlw51ZU0FhvmLlL0CQJL+VpqERU07664q5VyOPWLCt5Mt2LB/s+JYOjCa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jChqZCiQ; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uhb+17j8IGvi47WaxnTxPMbgnnfhldQjQVzoH9yu4BYh0+RYAtuI412ARgQAZHtsp/J6UaaPjc6K2slZ1yL7ZNDToxyLxcZll5SG05U7UBiUANFrlSiY9Zl4RPXHbpJcNs3bvlUyQLmEa+BM7u29FJkPFI3+FBVY8t2YXSe+ov4bQMhd50h3S3aYTpU4+ah81aUjZjYzuKhLO8C6nTHuWZigk/0ag65ZPTMJrncKT/dBTCMsFtIbY1SUKAd5badOaWYVgeYyv4cmK9zy3UIjEOIxktOfxPxKhqsgM4CRCpPqOpEAOfqj2hB2RrztkgZwm/ckyvMAhUzb+htefQdeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=femsl+bEmZKE4LYjeRMFtJ8zm1SKp24HeT3ElsYXLfg=;
 b=QuQEwZBQ9lLNV8Q+fSbzJ6yEZCujjGjuyEt/6yE9MrtxuFzugzzQcXF3Jlykx5/LCqPFuXXytb/0hTAriGKMPbar/3u0NVyu9ywGR0esrfendPdt+EZNg3gtKJ7pQA/ZHZYBZJlsjJ1L8soNnEkIzxqtSF5ZuU8Q9ve5/CdbrXEqwijQrQxjOcksYzPjNWSwwcsGhb4uJJTQk3Icgeyqxw/15exKgOP93WAtkkVtJ2p2M8Q9y5bZJI9sHYhad3D6KP+touYkAmgU58L/2BA9CNc4r5k3hXmpbGJtizxxBAc/I9bvwX3h3KoXJjhLGAs0fM8kjwHh5OKkdnxBTyIIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=femsl+bEmZKE4LYjeRMFtJ8zm1SKp24HeT3ElsYXLfg=;
 b=jChqZCiQ4vdaNrqdFbxeSBr7iY5WqbpyQcBy4y4/KicDa5ggjxR1kzFoXhyj7novrtSz0wGmN2f5/3ZSslH40R7C/xGvdbmIWVDWli29MfA4GGy6TBYM+UPAJN3mlc59MJOcsJbKbFEiT6Y9O0SlZcdlNneO4gjFlFIiAZ4IICo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17353.jpnprd01.prod.outlook.com (2603:1096:604:440::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 17:35:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 17:35:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Topic: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
Thread-Index: AQHcvp5UlC3Sbj2+60yBPqFW97WwkLXEIAIAgATGzsA=
Date: Tue, 31 Mar 2026 17:35:04 +0000
Message-ID:
 <TY3PR01MB113467189F6E96251B5261E358653A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com> <acf_hK6_TiAa4cWx@kunai>
In-Reply-To: <acf_hK6_TiAa4cWx@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17353:EE_
x-ms-office365-filtering-correlation-id: 05efe8aa-afdf-4bf7-4c40-08de8f4bd846
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 JSEj57b+qyEA1THV/6rafpYNFOUnlfu49QA50o+bAAZuYfcdAdLeH1/bfKZ4n/KN1tmGINRVeVcTAAyN6xfG7ZXylMu7A2jvLgE+PiHfo+stnMhD0TJoQUrScAAcaYbG99CKyMoDW7uiQrgnyyu0iJV+BYuWPGVMZdAPItGDQmJjx4D1/XKg6XaNlJJI6PFjrvkW4t1Ble6EicxIUO9fP6VgX5Ix4WiFwyS3nxtSFIxLF8EXf78ZvB60iL3GP5ZJY9+NB3lZbpxUDOvmnNvvhcEUFwEt5cenW7gZZZYN5JSue0dMAnVZD7Vv/P7OfadusZZRySo2/7jGymbFmvk+woar1EFFG6n+KwVQLwEat1y9+5s/7IzoML//jum5VOGKXWa9vAlirTyIuHn092Pr5ULTBSMx8AUeYzqaEuNpc7J4mVM3VqPplJwDPTWiVKZmaSvVJlu1T62q2IlcwXhrwSCGRuh6qneHRbsVkUlbGBzkFwluKV77/ax12EUczJGTM/40+YUrJO3linmY/OuvDJZ0Dt2uhLbLRsVLbjnPjyn8Qbdhu+eqbSeFa7b7cOwl12DV9QBWD69sbT5iM35ZoSXnGt/8hBGwWU+C7uUcNXFNfAu+1jUpY/nLNVB37o2qBpBXW66pIzz/5XW3XXtVti2QCFAg/1jhf8LbhLQTyIgLsV1qaHiQtNVjApdRpY42jk2iYiztVpiZ0UnH8u6XL0NJa5vXF9czUIsB7sTzdpra+t0uHSVwxQLT/ltTJjAXeT/ct7hmV4dLBrtz3GCen4xDo0SX9JgDpwkLOk9Uvgo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wej5ItLhAndu4tUVghOFtx4rPAiI6SQyzYRZg+jrJr/yXolJWjNUSWGYa6Dd?=
 =?us-ascii?Q?vsPzS7pijRUoobQyj+UluS9/89qdaqKeUNcJBnSEm7yL1on9ODEw/smk7XH5?=
 =?us-ascii?Q?yeglf6w3cPKNjgnA3IpbPzz6Z6OPhLCGYUPtBi7Cgd3BmK1v7YlNbkx75Mhw?=
 =?us-ascii?Q?4AzdBd3Cw+6s6QIq4EJlr00BKxJJmURTmDRIFFoscRUSCcteXB2wRT4D1PKf?=
 =?us-ascii?Q?TNea24EFgHyX33U+GFW53c/yKNEh1dN6T0hqk1hBQpF3N/Bs322lLZvxboiz?=
 =?us-ascii?Q?JaYvGIKszRSNajgv/UX84RXEHKwuYbWeAEZm3Egkf0Dmm48d4k8dJML6Zhn9?=
 =?us-ascii?Q?2ZSoYrdduqBXA0bxVCEMsqAGklRVQubxS9KA2k8aYeqAXkENWVBmsDpz+TSl?=
 =?us-ascii?Q?rQ/+qvU8vHpVhJ7QdVj6ppjy73UN5+weB9fFTiZVzJPTmFaqNBsCZ2RNTnfo?=
 =?us-ascii?Q?laEQgyGcq3NNkZIM/4+/e07MVGDRvhXFI4HvwJ6TRc2GFd2IZ6AHEY/M6fz5?=
 =?us-ascii?Q?vohkv1tZ8V7btnXrm/jf1P0W2hQa7VGq2o+3FgBcLdqY/ATl/NH7EWavOLYT?=
 =?us-ascii?Q?dXBlppflwMjr+ZlIlsty4MRYpk7s+iF+j+So6NRnEdHkIqSbq3EA++JfoUIw?=
 =?us-ascii?Q?Gx8QfeajpLBZZ8Tp6wMIGGDWwWHKSbmZr+8Y92ORrEl7Jm8Augdo02VMueSM?=
 =?us-ascii?Q?qc04gT4y0PCo+AMsgqgxRRkPlhtJFVdtjzrn0zsIcEEB4sU3IIY+Yqc2ajoK?=
 =?us-ascii?Q?5QpZb4xqG4+OuN3u8vCoF1+wZwZutqjnL2xmA1sb6yMweCn6jWIu38k09f/z?=
 =?us-ascii?Q?VwnOPSuHr6xXHSTBKEduebM8fUAE2VN0/aIWKHamBTWm9XubVOLcvKaRzguj?=
 =?us-ascii?Q?WQd6niJQ2QfxU6OeH+AxLHExrgDgl3n6slkNYYQLjcB05TaCBLpuvLn8Yw2/?=
 =?us-ascii?Q?Q5NUqYm0L540NeaLotCHKQH1Imjj8xnTXvmtqvEd1a4hFXEcxAmhq38CfQdu?=
 =?us-ascii?Q?9YCxIX0jQDXn10fwE8PuITXoVFiFa9fFALp8PRpBp+kfx0M46ieLE07lfilL?=
 =?us-ascii?Q?tqxLrgvkqAhHpYZNBiUwVwvVxwu44iRWX2m1NU4vR0qLF7tgWztLon+yGA1J?=
 =?us-ascii?Q?g13GhglbNtrRJjDjJR5SBY0MAiXwdzlbyZX+pUqyZsiPHCuXkRluK8H/Br+i?=
 =?us-ascii?Q?13fBtlhwKmyHK682WEov/rd7Pgx9eYp2+4fLalbNq8XSxQsfzMUTnX2wCJVm?=
 =?us-ascii?Q?uWnzCpLa/gd9fSGvaIm7oDJjErWv0+GR0rTOH9lVCGcXZcY5oN1gEeJiVy/q?=
 =?us-ascii?Q?+yxb2R2hOc6odVq2H6XDqpLxGR76WwXU8Iht2Ru1aC+VEcfIFmcinsXvxbYw?=
 =?us-ascii?Q?FOoBrk98qmcdRVT8acgDA3wHa3Ha/TSsqn1Tk4fXhhNrkHSC45a/JksWYs6A?=
 =?us-ascii?Q?pzlXjYh3u0p4QIHV6keTgzf17eAgp2QLKPQeAmXbRBiZW7N4Sc3ORhASl5ZQ?=
 =?us-ascii?Q?8elh3POvWCmny2i5aouA/11aIgT4JEjW+XXSlO8u+98313EYWI7kEwQN+69v?=
 =?us-ascii?Q?QKh4FY/whA3TxmZ9xawXxiiiPcHYa18i3JmEng+brF2fZ6l7p1lVxEwlYHw/?=
 =?us-ascii?Q?ByKjq21eHc7pJniP/+TUr5QUWbMfYb3McEoWFMUtFm3XGsnUMfekYxMnmj42?=
 =?us-ascii?Q?z8CcNy7/t5ySuVJ2MEZs/248Wrkkl8tGn9RDZkdYSwAFtut5SYB5D122vBfV?=
 =?us-ascii?Q?CPHtFg/v5A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 05efe8aa-afdf-4bf7-4c40-08de8f4bd846
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 17:35:04.6594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEmII72zVVxF/dv4gI1eUBPOnpa/cT1TxUG6WlPhKsoIneEm2zzTgeBeFYajQxIWlP6Rl+ub81uZCjzezAO2sgkgLA5WaMM64dD6a4rmQbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17353
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30663-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 3D8E236F906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram Sang,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 28 March 2026 16:19
> Subject: Re: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
>=20
>=20
> > +static const struct irq_chip rzg2l_irqc_nmi_chip =3D {
> > +	.name			=3D "rzg2l-irqc",
>=20
> "rzg2l-irqc-nmi" maybe?

irq chip for tint and external interrupt are using "rzg2l-irqc"
for consistency "rzg2l-irqc" better compared to "rzg2l-irqc-nmi"

It reduces memory as a single pointer will be used in the
structure and also reduces number of changes.

Otherwise, we need to change

rzg2l-irqc-irq --> RZ/G2L irq interrupt
rzg2l-irqc-tint--> RZ/G2L tint interrupt
rzg2l-irqc-nmi --> RZ/{G2L,Five} nmi interrupt

rzfive-irqc-irq--> RZ/Five irq interrupt
rzfive-irqc-tint--> RZ/Five tint interrupt

Cheers,
Biju




