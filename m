Return-Path: <linux-renesas-soc+bounces-23807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D91ABC16C71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 21:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F252F4EA792
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA2B2BEC20;
	Tue, 28 Oct 2025 20:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="A/Xk7YqX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CB21D5B0;
	Tue, 28 Oct 2025 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761683258; cv=fail; b=J71sIEXxnbKbcsgT1Yo36Y0ukPP0ohVz/K9dwjljyMZThWXi9mLJTWY7BhKESlSPskGBH2O7PdaYXBQAxoc2AyZnn+8UZzJ1q3GHI42lp8A+keoKKi9B9jOTjyD7wxbgpSiXdjOcKsPcKTIu7vkKk987XTYApLHLYslrHnI8S4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761683258; c=relaxed/simple;
	bh=rsIB7vu046eggLvsOuf88JQGOjgGdlmLIOk5H3usEi0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qk2zAdG+2SckRqaHrBu/yhItbyNkkJcJSmVLC1kX7TS3JIt0f25CDiLnnnVldUFKqJ/WN7z8zotiy93kuO1QVzFswdTu5bD7lrzX2jpALrOMQnnt++qZU04Tzx8bQhSyyDmeesYYYP2g6Fydikk9tc7kxUYBl/co+kCjreRHcbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=A/Xk7YqX; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYHt0wmpGVMImUNcUDs+2cm1CjO3WFNrRGKEA/rSi9TyLmyq33907rPNNUzgmGBx8UYQeKIzM35osl2JR0J9P+Bzb/w/3cXZfZ2p31kl325/s8SZ1S1DYA3twebxJ3WeA591yZfPqhJ/EJmuiDNttrhEJKARA2dSfl35edn86d4WpLsRzVnesyUSVTZaSxe9Vo2OxVO9f0te2Km29i71o8+UdeuS/B0B9RliqIi97tvl/jv1WObahyBuA1keI8SJPrK7QXuqZ+c54goOAyVzzbScRVu+T5jWNoFtUuRA0Mc94s7iMysYwJNJsHuYj6RA9nlmgIN1M9I4kmZZKNC1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsIB7vu046eggLvsOuf88JQGOjgGdlmLIOk5H3usEi0=;
 b=hU/hA3d6xdC5kyrR872t4eb5XrtZJg4ZHXyYgMcWBvJ6T6mGucqsRT5i3D1w/dz4U3eppLGFBr9z12fgY+V341nL+4LYocsGQCD7hn1fBKUPfFwP8U7+zbdOmG+7bZ8n9dDOejOvvHYQax7CA0f9rdd288Tc8ARo90CQh7akJGD/4Mb9FEE8IMdSke4u5CMWDFCvicjvRtjUIxrNrm0EyHmJtKaon1x2EykTnsu+qQ369NdZVRXJzio7eI6lQnQRl4ff37QNHh4te7WN70YBjLxjJ8FoebLGhRcUl/4A4veKnOWt9WDTw7qnKiLxWKETmivNTzU9M6nARXo+L02ugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsIB7vu046eggLvsOuf88JQGOjgGdlmLIOk5H3usEi0=;
 b=A/Xk7YqXS2Lg7Ok7LbQ7/aS38vQEOx4j/ELq9nFO0XediPndATflreKQ8KVF3kpaojDgj61uezp9jtbpJuOJk6xyD1qU13DZ5MH2tnDfYrI8+myqH0QH9qrwp2Czy2IztQUSW888n28sCFF5fdq7M/cO8h1IDqmbSunsSxbbe5w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15956.jpnprd01.prod.outlook.com (2603:1096:405:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 20:27:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:27:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Thread-Topic: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Thread-Index: AQHcR1jec/+s+O3qwEOlwSimibGIebTX81kAgAABcWCAAATNAIAACfdw
Date: Tue, 28 Oct 2025 20:27:33 +0000
Message-ID:
 <TY3PR01MB1134620FB621BECAB44682F8B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-3-biju.das.jz@bp.renesas.com>
 <20251028-griminess-undocked-b6918de546fc@spud>
 <TY3PR01MB113460F737A66E71E86482C5286FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20251028-desolate-roulette-e678476fb039@spud>
In-Reply-To: <20251028-desolate-roulette-e678476fb039@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15956:EE_
x-ms-office365-filtering-correlation-id: 69153116-c814-41b8-078f-08de16606cdd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cjTAt7RZPP3qVQh3hZfV6eLKMPhE3IT0opaqOiSgz0E7dUKM6ixwqIFVnk0A?=
 =?us-ascii?Q?naoce+0IzsN15xNyd+WlszZlOfoekY+mP6FObjSNQgYxnna+nfsnGrVZtVGA?=
 =?us-ascii?Q?iwy0M6KSEEt5+SFBPl5i+6yqNH0EpDSTEhJByXagxwV/PSNDlG/ZKTCsekHY?=
 =?us-ascii?Q?WQNcuKwZlF3ZLzZ4Bblt8+LquTBq95n5IgvcAipuoxq5KeEwGV1Y1lHGDVqx?=
 =?us-ascii?Q?7ASn1VY5M6+Riq8YLr3EGhbIeY402a1256g1zX1smJMxSQNVoMFk6hcdYKcY?=
 =?us-ascii?Q?VOXJw9BeOx/6QBNFKJbQg9fTXEWeIp+eEcwhNAecbFrSEVHS6jSF5a0D4DfJ?=
 =?us-ascii?Q?b3umAneFw9HfmUkHp7+qVy3hXOqbZsaiOEOqlO5WL6QvCYcVBlIVYSYP0exy?=
 =?us-ascii?Q?KbNxtUEpqakW9AQM2+k5uhPKQzwIPx+mt7cmsTL/okIYLiapaQMszpGIF0aM?=
 =?us-ascii?Q?QGM/kW3ZwjiqXIH50BkkNfwQGRhbjmaeM38iPTFeI4jmXYWHfVOfBmNfs070?=
 =?us-ascii?Q?ms9UNmT3dFKhUNbjvRZAwB7a19SZChzdjSeyWIC3zyHLluHH1fewkv7EIpi+?=
 =?us-ascii?Q?vfsuXmQJcnn9HhisVTAeQ/rcYusQ/M7Ir+oB3JkOT3a92zxXn6tCkyfyuIXz?=
 =?us-ascii?Q?MXdn0gNk9PMU5RHU1Rui6/eRISuDcd0NQ0FSj5q5M9K+m/Kzr2SLp2/MZO3h?=
 =?us-ascii?Q?4amTfrtMi5s3tO9npIcWJ+M7vQAcfPG+BYxS1W3P5P4wPNXaRUWC2UnExXFf?=
 =?us-ascii?Q?k0OncnzIOn1mcT85n8cgMyVVds6c6VqWTJM28E0ANBh3Ftl1y4Q22VlYYvAd?=
 =?us-ascii?Q?BjzBQf03qe+9qvAWxWRIlPwEDm/30VB8Zq8RRgGXAZdYTmkw5kJxdVlVBaq5?=
 =?us-ascii?Q?/RgyVv3DOJKitv/SEkOpNXo+/VNDuiq1dCXEFNNQidqHNdUokjQZ7ae721rp?=
 =?us-ascii?Q?5SxGWItsGtYC79eLmhBf4C1SCl+nPdSdpGBRmvrIIjo1CwfJCi59W1AjSs2M?=
 =?us-ascii?Q?LQrDBsh0tlLBBm61vAEnWnn8jt88S5P4FzcMRdaKkKAqK0T3iyiV+mkvMpaS?=
 =?us-ascii?Q?jY0U2tUc+IGRBicJ5utwSEmTxUOrel9+y0kv9gBC934+bTwuPv8QJsTvMODX?=
 =?us-ascii?Q?hYSGOZbbAqlWCa7Y2IOGmNDeaYSSpioB1yJlMYVpTBxM0gowD3HFKhB79EVk?=
 =?us-ascii?Q?yLtOu6IL7bQ7/dy/ZJ9+abde4lNaSDVuEAg3Y38OMOTnQwlTGOb9EGLcodCl?=
 =?us-ascii?Q?8Cjm094pIH/5axD4MWzEkZ39av6SNUDA8FsOcDzp3C9sxO4vYTanOTJ5mYWY?=
 =?us-ascii?Q?SAuTeVrhGJaW1bl9jpYhGmYph/iv15Xhg6DFYfk9LsD38cy9NTrkvmE32VX5?=
 =?us-ascii?Q?cLOBpvZ2J/3ml5OZM4C6u//KztL7TAeoupKBWOIrKkDu4snlnFVxROcisLWQ?=
 =?us-ascii?Q?VMvkV1tGInLFlz2hjqsX1oxMx8FF2Wcr+6aLiahRCLFTQudyxRl5GvYSSsSO?=
 =?us-ascii?Q?X0zyps6rtTFgl2IZKClrwI9TI8pe7yuZB8UF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gFglkWzi/Cj4K9jo8bb/TP41fsBUytUbjY/YK6t2yDjvU8EIKtm/1B2hA8e/?=
 =?us-ascii?Q?tBsdeuZVMWByxLqPpVPOzCtcNAtB3rUJR3jdjxL4YdAXBTi2E26bF+C5+g0h?=
 =?us-ascii?Q?C1+4iFK+FioJw0W/PBUZ/qF9eviFUFZT/Bh3SU7SVPpV4jSuE03H9xkmIis8?=
 =?us-ascii?Q?JrhWrlYFi9oUt4UQVDPBurOZyzdivUVyrd5TrEk7wmXzOoOokMg/mPNo08kr?=
 =?us-ascii?Q?GMRtO5KwSYDVrSMpCGiC0Uy4Fl42omdYu6FRasWCYYy8wvfZKUGM0uhAEXkz?=
 =?us-ascii?Q?EgM/Ixz1H9fioIv7fUPhwCm/FZo7RwjT+uoLRMq+f5/rz2h1mX/imw2GvGWg?=
 =?us-ascii?Q?iy46qHAnJIdxGGjVeGAWltsCJMy4mr3k9FMbO19zsv1mT6V2z2Nupmeo6qat?=
 =?us-ascii?Q?NdB5YpRC4fQw4S+i+gvDKiZdydKYnTTKRiio445D8PaUJrpsXf71RDJpdjcs?=
 =?us-ascii?Q?mEh00hburS8qXIaMna6e64ptNEAt4/s740NXseKi0o4WxTHdLcKS5XgFHOMP?=
 =?us-ascii?Q?wBQqDlOPz2yOy2fBrJHyrZlBo3Dc5+AcoAeK5WPs7cc1qNkwufF2AglPrqdR?=
 =?us-ascii?Q?wVpsTduIqVt9AKCpNxA0fY1rluD3Z1hfj/eJPQbyVMwK9QvdwoJDIVk2flPN?=
 =?us-ascii?Q?mmbsoZYjjfhuGlIUyXsowO+dZc+tXnPCQUeBbEDLDC8bdlvlWV7gsMqwqTdJ?=
 =?us-ascii?Q?9oGEQQnA3+Y2zN5ANrtRX9x7fdP9ah01Pfkns5MsDe69h7ETLbB2RN97UfV3?=
 =?us-ascii?Q?7+c1/sc1XYUBVsAhmJwTiG+iQs+FeDVqRwOaHfKV13YOhCy5j2G/fpb6Nj4w?=
 =?us-ascii?Q?it9emGXPOspjsKqQO/i0Rfr0SaFqw+Tebkl5PXer/Ns8kByW/iY+gW4tSqsR?=
 =?us-ascii?Q?cC9w1BCT0KfqDzhVRD0znlGqJfWGhUgZ+oyslbkrcIuEAXJI/8nKDe3TSi7Q?=
 =?us-ascii?Q?lu6kZHZ24iIn455cffXnGUVROf7maVlu76Vf+gvaV+Uwm6D1sGyBJzGjZh6k?=
 =?us-ascii?Q?xvTKBba1/t30oVFuYMSO2UBV35rPZjbskfGADIOuLvgs6XPqTOMImyYGi9ns?=
 =?us-ascii?Q?1QFGyvvRAIaUFpUsltKZ0SzOo2DiR2/ETDPdiARiAx+yJt+moHMKO5u9zY+/?=
 =?us-ascii?Q?dPOMkfpjgpRvY+Y+56UjXp6SQI2qnCCeUCfSsbdf1mHk5eQmOJSl6py29aw2?=
 =?us-ascii?Q?85xe+PHgLU9POYZDRkf645Py7FuSwlrJ+EOZwbk3+GmnwC+eKNOtC3xAM8/0?=
 =?us-ascii?Q?75J3gcAbwbQhZejROIXR2m1locgPINstMBoWdi9s1MFJSPt2LXakriiEUfRh?=
 =?us-ascii?Q?DZuZJjhl/Gw/Unkyh4kJ93YFfx/FkMSrUqSXifxL2/cJlc1FTL2hfmZvygfZ?=
 =?us-ascii?Q?ZH2bgmnOICQbt0w3xdqzIKOaeg9KzjfJ68X2uEUvWDTuA1WAqxN3Rr10Yl2z?=
 =?us-ascii?Q?L+RoXTr5PcOelu6432+0Ad0Wouplz5JSK24tshJipcvZtlbv4zPTISxMlzkd?=
 =?us-ascii?Q?qJWqrvsTAhtUZCLpwIVXTYC2jR8DLoJV2oaDttm6+xUCOGwOMEHswbDMXKDT?=
 =?us-ascii?Q?Bq2fmypHvM8zcI3wy3hjKPXogJCq1a0CEY/NKXSv0aF8vGIAoF9NIJKaVK/u?=
 =?us-ascii?Q?yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69153116-c814-41b8-078f-08de16606cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 20:27:33.1825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59IPuB09fNgdmuTwEh0Vn+uEAAdflp2kl7gmBJiLRTt8AbUvb+Wbo1fL8fCScZa4SRgWxUjx1FHRQw9wbgXDqiyB+2ZB8Wz+ncaWBqnytXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15956

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 28 October 2025 19:51
> Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtsc=
ts: false"
>=20
> On Tue, Oct 28, 2025 at 07:39:41PM +0000, Biju Das wrote:
> > Hi Conor Dooley,
> >
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: 28 October 2025 19:28
> > > Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-=
rtscts: false"
> > >
> > > On Mon, Oct 27, 2025 at 03:45:49PM +0000, Biju Das wrote:
> > > > Drop "uart-has-rtscts: false" from binding as the IP support
> > > > hardware flow control.
> > >
> > > Why is it being removed, rather than only being required for the
> > > existing devices? It's not clear to me that the comment about the IP
> > > supporting flow control excludes the integration on these particular =
devices from somehow having
> flow control disabled.
> >
> > It was a mistake previously as the driver does not implement hardware
> > flow control and is excluded in device tree.
> >
> > Actually, the RSCI IP on all SoCs supports hardware flow control.
> > If a channel need flow control it can make use of the property
> > uart-has-rtscts; That is the reason for removing hardware flow control
> > disabled property("uart-has-rtscts: false")
>=20
> Could you update the commit message to be clear that that's the case?
> Just something like "as the IP supports hardware flow control on all SoCs=
".

Agreed, Should I add fixes tag as well?

Cheers,
Biju

>=20
> With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> pw-bot: changes-requested

