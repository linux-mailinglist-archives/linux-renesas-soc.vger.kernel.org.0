Return-Path: <linux-renesas-soc+bounces-29623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNnKHCF3uWnQGQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:45:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0F2AD423
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B5A230266FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70AA1A9F90;
	Tue, 17 Mar 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fvXr3IQQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAC1386DA;
	Tue, 17 Mar 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762334; cv=fail; b=WknVHKvlwp4v3gPgO6N3EufbNy8FSmT/a75zDSi0u2j65fAShniWK7m89+za1QOEDIQOGIPtsc9VZGd9GzU05RnPbc5s/1eVTgw8HRPV7ghOpgIi9tXCDfQgRkUREZ3xC8xlKHoSRdjFMpEssflDKx3Z6NkJFPZGasPjKxVPv4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762334; c=relaxed/simple;
	bh=iDQNIPD2rl+MUG+WVY2fEgAp+Z59xjCky5/kRYY3blc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jmI9C28qec2SGWviE1Hf7WlHprgvTGFyydyQlBSolnSKs2XRpbYjjQc9OoVi9ek2n8oKrISezH0nkICed+9d2UIJeq0Qfe9im6nq0zNljIdqoHhcUSna3ZhS89r03pRoNSVK/pDDAcoC01uBPEa8afsty+7R2DzgBHzO+Thu2xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fvXr3IQQ; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSUfxIg78ktbnWf0zvWzhrrM2W1McpM2nY5JZFISDA9Au335+Lk1hNUepwkCatkDjBi+sVubkGyB473N+Bc9vluY1veNvtWGhCZjkH2wIn9xzQOChUSWsGmDp+Zab7+T7mMNXC+nH9A5HuBe6uhX8HX+zTGBE882Hw/FKpxo0tSpooqZzxziZxtpPcTpeaPxszrYlfjYrF/4KlolcyBS8pdrTNL3AsmPGC2zuN7byoGf7/YgOfYAjYVvCknmuEl0YuWhakHSHIDU4wmgqdtGUHts/GM15h5QpVTIz2SGOQ9/qnXCRwpD4ODUmaih3rhF+vkRlqmn6VErT8LbQJJDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=typWSBdR8Hsmb46NDDU7C75vE6ivf2q353Nv2ALI/1A=;
 b=B5r0gvEifEPlftjKBiK3w4+6UeAKRonk6dNHDp475X7yWRWYYNFBj/D2kj23MwI+HfIMu2/f3KxqT5G5Lda2o9kqrHm3VovzRRrDeOILRNnBrZub2ofPjiLLzYrEiRMkLI3EzFHIPtY7OIUjO1OfBViMOvegdcEan9yzaeIq+RBwN7qKu51iZkAp/iqr5RH8oShISgk4elDxdSty0yPNDVguifh07cySYNPdKmIuwrb7eT2helzYLuCNnKiEgQUkk9IH5dJLXR2z+eswSJtEH7/yyl6iLE0qw7rFJ9NrSRtaV2NBPBBQ2zQnRzFWpDoZjpsHbqec56ZXUS4zsy2RtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=typWSBdR8Hsmb46NDDU7C75vE6ivf2q353Nv2ALI/1A=;
 b=fvXr3IQQbufkB2CodPdVqXzpp+8HCMLolGMS+n3qyUnE07+coLHOfPe7wx67fy+Mkzgfpx3w0Kh6mZk7eRxUXyG0jpVfVN/SXW8wHn+ytvLesm0HHbDml+omRBURJm7vhgxDfE7+0i3T4z4jhIIU5pw+W/HLn2ssy2dfugJhUY4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6770.jpnprd01.prod.outlook.com (2603:1096:400:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 15:45:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 15:45:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: biju.das.au <biju.das.au@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Brandt
	<Chris.Brandt@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Topic: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
Thread-Index: AQHctgqqun0iZdWPQkGCYHsU3REA1bWy0bQAgAAAR5CAAAU4AIAAAlBA
Date: Tue, 17 Mar 2026 15:45:29 +0000
Message-ID:
 <TY3PR01MB1134627E19FCEA40819F8C6578641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <20260317110112.338259354289bb60a57fc259@hugovil.com>
 <TY3PR01MB113462F9E8CEA0506984299768641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
In-Reply-To: <20260317112052.3dc4b56b42b906381df80e94@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6770:EE_
x-ms-office365-filtering-correlation-id: ab55b4a0-e1a8-4693-991e-08de843c3741
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 T8eGBSwQCDyuZ5z1OWvto2iJ2UBj+/xmlYnhV5rpuPQPh4LM+/WNMp1z+rFvFClQJlJOCP8PYrl1ZtDKWMWxnZQr9p5qyLPeZMzBUOkl00fUSr2mOqhYpzRvunPgeX/P7uXDFLBYbTYOuJOfss4BDTrNeB137Vc8jgm5hd3ITOfLz8ugnBz6EvcqZx3eQbxtTGUTi5uCBv3zcPhLwP1afMgJOQlYugYapqiHx5xzgCpLPVhtp7Y4T2qKsw7j5gyS5Gcv6ziAYgWSkqZc5taR1KwGP8zvsLT63rV59OOvY1e01sLdmtsCbMqTPnU+TsDMIWYWlM2pXTW5sA7iPp7LJW1jZkyZ90z5kEOQd6h96Bt8I/9YdtL/eaCZkKshEEV3+BnwJZ3QM2iOos2LvxASV17CTXbwglpkAq/tgvdR1EZzAg4HSYO0WnpyxdLj+ORcFlC4FqIpIldR9FzJZ7a8qtWAYy0/HM/TQhaNMbxim4goPXFC97BBDGxwbMOd5pN2kpcuI6HxRgwjPe6iAVqqV0WgQ8djFXg6yGNCeNlbzeRKXrbmXiKw34+uV3PW4mtbGeVr3mJFgHg5n+6VRjdz0BYafHNIMgwdRBRiUie/wiTWCwGTLkMqugKfWcmZ3Y4GZ26oDA/2DouwJbCQzVFsNTIqYfD38m4OEIQK4aggK0qar7V9dEITNqRud0HJgN1UMw91C+emMal4nNv1xmM5wN+/5nE/T2HJfC9fIFYSgCIQVAR9W8umDKayGoDllSh0Dn1NOekm+RtIg/mLk1WQLvNJWr1HkjRPS/GLaqQTDWA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3f1gQF15nsfhikK3nMsek6HfwWuyoAE/ayksJ7kHlRIJnCViuqpCaZG0nv9U?=
 =?us-ascii?Q?m4WQjUoHhxxa0Ttl0+1KPZjIpra87pG2DUw5x4nfGQac5m78p+rv7g3CS7Gm?=
 =?us-ascii?Q?aZiM/8TPjkvz0Pe4aNtvRUe6mZWO6UgzlEvwJWBBB0Km1pw3rSQwTJezY9/z?=
 =?us-ascii?Q?aEEMV7QzedFb1PegNwvN4CsO7B+NOlU0JiB/qO9ODRzC7pnn6Uodil5ePdZo?=
 =?us-ascii?Q?MFSib5EjNoMgnMVSkmXhnORd5wZuyoaYbMFWbtyzZpZCkwpByN8sAH+kx8kD?=
 =?us-ascii?Q?NTOJe0CzC91/d+oGlLVa9U6g0S12UW9WvXJvIH/r1Q4DuMWjtv/YtW3TVD6o?=
 =?us-ascii?Q?4LtKmZ3KSCELJ1HLLrClnxtzI31RpPrCuIvKs6sg4aBmxA1mVNAxRlub0Xaf?=
 =?us-ascii?Q?4FFkiQY/2wWesxenK3GdChR/GwZE8JMgscglddKIEAgweYw49mSl1dqzQI/7?=
 =?us-ascii?Q?9gz1vCFqGhHmFEGv2MbUZ+mGu9WyaqQcyBu9Io14X4BjHygNiQ9KWUgMeKNc?=
 =?us-ascii?Q?PNxUPEehGQLk9pfLlxZx2aRtueibAfLR00le746kv5df9jW4zIKWLE0AHYvR?=
 =?us-ascii?Q?pK3+V9v3uDgke+IZDyieD5i3foznjR6p4RlWrkMxYRU2e3f0bvpEt1m0Ygz4?=
 =?us-ascii?Q?W33qwlKKZLzSEoJNB4bzciC9UYUOTeFncdY7oBWi293igwySDhnDfOM71OGE?=
 =?us-ascii?Q?+/HGMkml8S9mFAjVgIjC/IH3Dcf0hs0W4jUbBqbOb/VhWOzzeU76nMpbHs3d?=
 =?us-ascii?Q?hjMd/jY7Cn9LzC16c+tcTvYtiCIvrMzzAjUsuJx3mPW6SGWsxBHK9tBmdF9G?=
 =?us-ascii?Q?h5uF+OWfa1Y/mHpZDwitTcxgH3lSBa40tVkx2RI/pI2JSROMJeoIZA7Qw4Q3?=
 =?us-ascii?Q?qIs21GDaW1RQ1QjolRoJwW0EVgPLO6oi27NzJxiRrRUUp2KQsO7Lp7RttMHe?=
 =?us-ascii?Q?wDs2zWT6F6BKVW2KvZMtsJ2zvur4CubWZf4rqnVaYlkuMZyLbr1h78G6ASHv?=
 =?us-ascii?Q?eqTwC3Yu7EnISoVJ104UiDkGc10EEkOTgQx3UYtgKfEtMDFUOkgbb8rhjKVp?=
 =?us-ascii?Q?Kg5gHBNu9YNRB5ZVtjs4rs5oDld5c7NH7VUQO8fSbiugaQGLZu/wVzBjxvHI?=
 =?us-ascii?Q?cApgbDx46zzNUFuqpFFToblZzKebnI/+nsNviOLAIyHEsTqtDlQvB961hSMf?=
 =?us-ascii?Q?D9pQz7rY7ZiHYXzfRSJjt89appUip+LVstnlsaW45nd0fQ8IXmtuApaPkbL1?=
 =?us-ascii?Q?5rOcYQ5LbT3tYFxkufCWQ4PXgNa3WgQNPfIMWC3rFpiqkG/msADK5VO87237?=
 =?us-ascii?Q?qSKNtDV9OeXopW57Q+3J1/kOBufMg1NFaHKzHNtWlhW5TJuKq6Fl+gFQgcTs?=
 =?us-ascii?Q?PRv4Ru5MhsktPdkAJhWzCoLGR6AW11xdG+0KLgHK0hFSlMO6BiaI9kSDqpuA?=
 =?us-ascii?Q?maoDIf9sFzeiHYEdiOC/DaKtlXj6/Yz8IQe/XI9uzn94vx+rhywXVgNYs6f6?=
 =?us-ascii?Q?6MuVnG6z75YPWFiu1zd89hqMH3fzzjDiuSToPPYC0zjgpGMnSylTVYDuCnYE?=
 =?us-ascii?Q?bAvh2BWGuOddb/uou3FSZPWV2kRCDpRLetIdOfROV2eGmhGhNtc595bQSVl4?=
 =?us-ascii?Q?dSJsdIWIm2/3LylQ37FhGsEcNMuwl1MCZKgy0i2sxbEuo1yL2CVXwoXcHFVV?=
 =?us-ascii?Q?7vOrvnAa1XJmFjJAW0p8DUx4gI9lX8r94OYtsw7URGjpFO1OphHOVTAUPU7T?=
 =?us-ascii?Q?ioMP8zGEqA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab55b4a0-e1a8-4693-991e-08de843c3741
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 15:45:29.2523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcoQC77Kxq0W45D03CyY6gaTIYfS1EwQfuMSM3Ap2l3Ndq9ilNbWI3hgSs28XrsKVA2ZaTp3lJmCXjyYExtvvPddT0NhT4IB2chNCNYfc1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6770
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29623-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: 16C0F2AD423
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hugo,

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 17 March 2026 15:21
> Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on s=
equence
>=20
> Hi Biju,
>=20
> On Tue, 17 Mar 2026 15:13:07 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Hi Hugo,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Hugo Villeneuve
> > > Sent: 17 March 2026 15:01
> > > Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the
> > > power-on sequence
> > >
> > > Hi Biju,
> > >
> > > On Tue, 17 Mar 2026 12:36:01 +0000
> > > Biju <biju.das.au@gmail.com> wrote:
> > >
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Move reset_control_deassert() and reset_control_assert() from
> > > > rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
> > > > atomic_pre_enable() and atomic_post_disable() respectively, and
> > > > move
> > > > rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable() to
> > > > atomic_enable(), to align with the power-on sequence described in
> > > > Figure 34.5 of section "34.4.2.1 Reset" of the RZ/G2L hardware
> > > > manual
> > > > Rev.1.50 May 2025.
> > > >
> > > > According to the hardware manual, LINK registers must be written
> > > > before deasserting CMN_RSTB, and the 1ms delay is retained in
> > > > atomic_pre_enable() after the deassert.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Seems to me like this should be backported to stable branches (missin=
g Fixes / Cc: stable tags)?
> >
> > OK, will add fixes/stable tags.
> >
> > >
> > >
> > > > ---
> > > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++----=
----
> > > >  1 file changed, 16 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > index e53b48e4de56..9053ce037b75 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > @@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2=
l_mipi_dsi *dsi,
> > > >  	u32 dphytim1;
> > > >  	u32 dphytim2;
> > > >  	u32 dphytim3;
> > > > -	int ret;
> > > >
> > > >  	/* All DSI global operation timings are set with recommended sett=
ing */
> > > >  	for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i)
> > > > { @@
> > > > -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_=
mipi_dsi *dsi,
> > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > > >
> > > > -	ret =3D reset_control_deassert(dsi->rstc);
> > > > -	if (ret < 0)
> > > > -		return ret;
> > > > -
> > > > -	fsleep(1000);
> > > > -
> > > >  	return 0;
> > > >  }
> > > >
> > > > @@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct
> > > > rzg2l_mipi_dsi *dsi)
> > > >
> > > >  	dphyctrl0 &=3D ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
> > > >  	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > > > -
> > > > -	reset_control_assert(dsi->rstc);
> > > >  }
> > > >
> > > >  static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi,
> > > > unsigned long mode_freq, @@ -1030,24 +1021,37 @@ static void
> > > > rzg2l_mipi_dsi_atomic_pre_enable(struct
> > > drm_bridge *bridge,
> > > >  	connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> > > >  	crtc =3D drm_atomic_get_new_connector_state(state, connector)->cr=
tc;
> > > >  	mode =3D &drm_atomic_get_new_crtc_state(state,
> > > > crtc)->adjusted_mode;
> > > > -
> > >
> > > This is not related to your commit message (coding style change).
> >
> > Ack. Will restore it.
> >
> > >
> > >
> > > >  	ret =3D rzg2l_mipi_dsi_startup(dsi, mode);
> > > >  	if (ret < 0)
> > > >  		return;
> > > >
> > > > -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > > > +	ret =3D reset_control_deassert(dsi->rstc);
> > > > +	if (ret < 0)
> > > > +		return;
> > > > +
> > > > +	if (dsi->rstc)
> > >
> > > This seems new and not documented in the commit message? Is this a fi=
x?
> >
> > RZ/V2H does not need this as it uses different IP. Previously fsleep()
> > is in RZ/G2L specific function. I will update commit description for th=
is change.
>=20
> Suggestion: maybe move this to a separate patch, to facilitate review/und=
erstanding...

The only way is to introduce a new callback to handle it for RZ/G2L SoC.
Then we won't be able to apply fixes tag as it is not fixing anything.

Currently this is optional reset, and it is no-op for RZ/V2H.

What do you think?=20

Patch #1) 1 us-> 1ms =20
Patch #2) Introduce SoC specific callback to handle reset_deassert followed=
 by delay
Patch #3) Move the code as per this patch =20

Or

Patch #1) 1 us-> 1ms
Patch #2) Use this patch as it is, with updated commit description
So that fixes tag can be applied

Cheers,
Biju

