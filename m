Return-Path: <linux-renesas-soc+bounces-33473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mwifK+G8H2rrpAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 07:34:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7A6344DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 07:34:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=MpBeCeTz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4B7C3020A91
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 05:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF6737C106;
	Wed,  3 Jun 2026 05:34:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51403314B6A;
	Wed,  3 Jun 2026 05:34:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464858; cv=fail; b=WZU6lJoq1I85/VnKPYS1YFBuOp7TGNcbIdz/ad4QQ8esi3XZLtLllysGs5IUS9HUrxK+FqPAgF+/81qOWilHAvgw1TbMP2oiyPTMYrleR9SJUYr7IrhYP8c/IGU/ooreDHe+Rihx8zu9OVOzeIILIjdsQyxiEuTEiDx4vtjF1uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464858; c=relaxed/simple;
	bh=XK/OLeKP+BqNdOvlVc+u5WKbwMwbvmY4E17sFLLf0Dc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r59WztovBJkEoyUO4ssnIFaBoH/h/Gtt+kTYmSJoTowms6+ErfayzuVgYOH/O97xpoZU8fRLwaPKKNmi+Ww70crhu7KCUXp305rO3GbcOC1E/bW3Mgy67//F3G3q2GwrBjg7kBA0SOhcuQ4HIfPfWOfcZctVDEcX/VbhLNYfraU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MpBeCeTz; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtLJx2f4cyUVpqts7oUgs17hO1wHoRjZNnBLip0ql45icLG144AtF8fgXoFQOQPb/23eT5MqVlI6RKOe79y0D3CSk0qfPcgRtEm4kNaD+oRHiUWoP0imjFqvmPkmW/p18NLMFKuAhNzWvOk04lN0yIIB+wNFM6J9oy6BmiBAcrm11BDGDtk4yHAbVzk+3sZ6FRloHRDxDs/NTtyNZRbcZnLIBkVyTLdDi1gbb8m9TWGNVi1hDSIkUJmdnk351xKNo74H9qeSYD1ID6FF9IHivanwIsskh6o720aNzjeC0K3NXypbciOHI24irDj0kwEFsmlbAMIlG5ufi1YN5JLF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK/OLeKP+BqNdOvlVc+u5WKbwMwbvmY4E17sFLLf0Dc=;
 b=rktyArboihV1GXZUwEGBA/mDi9LjguWedgJFTfqGqxIQKNpJCqz5naYE1W4le7Ep+/wFHMxHHOkubS4+wvovdLoSPqwiPl9OhLx1SvduGH/y2c/97DYWeVaY6b2ou0HYRgwAfxk472AWrTvJkru2smY+y24U0YqXoP3xXrtMADxlkCZ0PMfWcbdSymap3GzIykCDFN0TPCv3lEsklX9pUfVXR3EqtVWOrLaVmxltDCuvg/Tkne9AW0wqCncN42NmMWSEICn+NKUYyWHtUfdRjzS7VrL+JRviCfWrwjoD9CBy0B1CLvF3ttTXyxTLjrlXzkyEcDH4X9I0io0jhRn4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK/OLeKP+BqNdOvlVc+u5WKbwMwbvmY4E17sFLLf0Dc=;
 b=MpBeCeTzweeK98w5BoGSMhSzyDF/CSwVYvHHbK/NC4/SVYuu841IDdpJlW0Qb9B9UzrF4osMps7fdfgF31EJ8OCN/EFmYE+FTwKT6w0MK7Nbk5QK10CQZpIf2A1vmASSdOsyP8ViuzDByETl/vrtmSCjs23nLWWC/w87V4TYam8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY6PR01MB17917.jpnprd01.prod.outlook.com (2603:1096:405:347::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 05:34:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Philipp Zabel
	<p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHc8E6QpDBIGL+CrkWvAaD120COd7YrxWiAgACOruA=
Date: Wed, 3 Jun 2026 05:34:06 +0000
Message-ID:
 <TY3PR01MB1134642457F86522A67AA86D886132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
 <ah9EtYNGBiyms_KY@ninjato>
In-Reply-To: <ah9EtYNGBiyms_KY@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY6PR01MB17917:EE_
x-ms-office365-filtering-correlation-id: f25934a1-f1e8-4c8d-7621-08dec131bb24
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 zYITggIL2PvRLGOs4VptQBt8ICv6X2qk/5VmUaOwRIb+sDjUrJl3CklVguQv/JL5QOjQRfaF1dXIt25cgdU0QEXiGf0wSV9wC5ExG9nsGBs6i77ZDg++CiUY7rWxPJMcrJ8nJ2oEZ2QZdHczA1xz7FClySTntniiDUcqokyscgJxU0u8H/Cvf0l2Bn0c6DRlaWYha9LupNwKSnHwEqGb5kEcv474YFqzeb3Ef3tWn97sR5eLQB3ynvC+jck4DGOIjwPF1YkKcwasZehbyqNBJiEGf4NGErDGIikWoUWYTK8Z10FUo/ubxb/bxS8hMTiB+3J6yAZTfgzI1oNCW2CTQl4pc7Odud2GEh6dL/8PuVUSfpkLyRG7HjbqNjvewPjjy8d25GY2zHLQP4NoyMLY1tX0zIUKntBmhktlPFR2dKYUMAtdVa6CqSXDfOtdmpZGICPpEOryh3xrp1jBuUsbmpWfzhcHhr3op39UU9z//J4F3FHhn7N5VHo4jew82t77IkuivX0Fy8+mkcde1lav1G3tkt0eO15XMy1Kxt4heJOVgxVIhllqcK8b6u/gE61Yp2oH5EBOmyfiIHXLTDMr/Hwqi/6Csbzb5eyGARL3REJ0jzXNKzRuHul+bwWqyO2jJ945lmrZxsQXZGxWo75eUvYWcZ3ViAqkapWrAMS4YB1PXhqE4O+k7P7+Lex4coMiIvOohwuSs6BbYbAPG81p19C/AoTPmbhFzlmnnm895Dzd8M64ySzaa/qCc3955i2C
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DeAu823arEM07Mt+YBOEuXTjgqztzLWJEu7uUN6TvFT9Dah/d1ChN0R1nYOn?=
 =?us-ascii?Q?exDMbRUMYBdpy0t/c8qKGcfHd9V81SI5Qv0CBlsBf6r3i27wI/3LSTu8vmzO?=
 =?us-ascii?Q?ddIAVAhftEbGYv4fGoZksGjC20GpMwEfejA5iLib6CHe2liQOdMqZgAa5XJI?=
 =?us-ascii?Q?HaMVt6d359kkIkWbUt0vDMdjdMHMo0j0tgUxJiH2KrgFQLmINDJwBOJGbZty?=
 =?us-ascii?Q?n0Yob677Xo8PMz1itQdkNI9yLhJmCO4WTGrVmNBX7BFAp8nuvwY2nuh9/5io?=
 =?us-ascii?Q?jpPWnwjRsIiCZfD3tzbEr2k9n7Ml66x+P667qRZVxtZM10nBQc9kMKo6NXtu?=
 =?us-ascii?Q?sP1OHfN8qeVCHYswM4hCNmI4Yd09trDe5buJ//6T5zapo1a+iCfip/23xjQ6?=
 =?us-ascii?Q?rmzUScoeFR4Kng3J1i8KFgNPqH/sfqhQTRvZsJQE4aP25IaeJzJi7fGCos/Z?=
 =?us-ascii?Q?xkDP5WKFrfRxxPfRnfbt/VfbYamFPlIcaBHycMFiYSHGo+Hw1Z7wdF3yiLJb?=
 =?us-ascii?Q?Q3Q2g/7lbNRkof6MjGjazosVHyFk6dQ6t5MEzadLWj5jz8ZnxqniCQXfATi8?=
 =?us-ascii?Q?KARK/cPMtsh7tb7TaD/Tajq+GScyCtmVq8RPC7CmjCAQjmu+TQMLElPObVfU?=
 =?us-ascii?Q?jTXedelR1QuRFA3oE86/9fkSUuDOzW3mGFBPzKvgMIH0Qs+APw7WK3ge6hF9?=
 =?us-ascii?Q?75Z2SemolTCGPs98fLddBddpBJNvEo2NYyljnhFXsmZ6WAYmO7e3vN7jHgl5?=
 =?us-ascii?Q?HlNf0+7NvW9FJF7iX9ZdQrvA6CsWZdi+ZDSjvSyZPqBS8Z/iV8e0ipkGVOCp?=
 =?us-ascii?Q?FX70QYTa2U6IT2wxzrzjM/A5wkC/RUKmhjF52U2Cs35jW3Sb42JhcxiGn1h6?=
 =?us-ascii?Q?RJwU6YVB73iLO3HtTpE5g3hw4aBgbSpjxlLLg2GILAnbe8RX2+m/MMbW76oE?=
 =?us-ascii?Q?6l4mEqvKKlOLFjEM2uHqM/9n4VBQ0DzduwQUh7GdD9bwVaY9EvFfExMo1jlo?=
 =?us-ascii?Q?3DuG8u0FhDh2EbmpOmihVHZP/pMIeKYtw1WG8X5/HTQxt5dQ7pg1Li4ZIIV3?=
 =?us-ascii?Q?qs1WDmbG7aubWjPGKNKHSYNqMNWwhCn7QHBrFU4X5OzmRUxd/lQkRyqXEcJi?=
 =?us-ascii?Q?Wn9qTsF/Ui7gRsQMsrWsmaP8fTEnXBGOFi72eJ5451nkqIw38lt78U/lmM2E?=
 =?us-ascii?Q?uKXT0cfTWgD/wGE86EoQ141GLjh/ekv4v9niSfmi55nOVAKvMcs8b1+dq/ev?=
 =?us-ascii?Q?8ctd8IHzEsUZjuRJj4YE8VX6RGOAPQONMclbj7Dy3BjYJqQ8BNTb15kRgDkJ?=
 =?us-ascii?Q?QjOndCnonOPO5417aiOURsGIJxWp9IWBqUhWUrwMiqWuZ64dQGolddEIBYpn?=
 =?us-ascii?Q?BRsDfjj2QH1gNCDDlDznx2ITVWOJxlPiDcCE0IsWNoiCv9yhFg1+lRmhnYTF?=
 =?us-ascii?Q?FIHzDeGbXLKDrR8e4RrlUfuGqvM6UARSW9LAY/ro336NNFIXHXRdwQx6NKcu?=
 =?us-ascii?Q?STyVAO4TV25YxPXbVanhfvwBDwnnyCFvfByGJ2YecaiQKicGAUPfXwWTsoYf?=
 =?us-ascii?Q?8JQwMhDyi57YPdYkd/zYgjHIfBzw8FEDqu/eBJuRlrq4y13/PN5+3tU3V64O?=
 =?us-ascii?Q?yiZgZy8ACLQgwXyAmBU9yJUo5HgAGoeaaKRzWgbAv2PbD+BGg6+I6Zr548jP?=
 =?us-ascii?Q?LG4KBuToYB/exIk7B5npp4tceMcDvdbcuQ2D3l03INPVcqcjvTc2Ns4IR8lu?=
 =?us-ascii?Q?AhYxPk+6Dg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f25934a1-f1e8-4c8d-7621-08dec131bb24
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 05:34:07.0008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfsqKEVXyxCwnvITrlhC5znxkzuATpgldj+Wh5RhqUjxzn2Y/wi6LSvWbymT+GYzk983+WpK1PLSSdF0vVLDbSnuMqb5vtooty+XQ0G7VRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17917
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33473-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABA7A6344DD

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 02 June 2026 22:02
> Subject: Re: [PATCH 00/17] Add Renesas RZ/G3L SD/eMMC support
>=20
> On Sat, May 30, 2026 at 05:07:54PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > RZ/G3L SoC has:
> >
> > Channel 0 supports SD and eMMC (including HS400/HS400ES).
> > Channel 1 supports SD and eMMC (except for HS400).
> > Channel 2 supports SD.
> >
> > The SoC supports a maximum frequency of 150 MHz. The SD0 interface
> > does not support IOVS and PWEN in the SDHI register (no internal
> > regulator), unlike SD1 and SD2. It has an internal divider for all mode=
s except HS400.
> > It also has a 2048-bit divider compared to 512 on others. Moreover
> > RZ/G3L supports HS400 enhanced strobe mode.
>=20
> Sigh, so many HW changes again...
>=20
> I want to review it but I won't have time before the next merge window en=
ds. In the meantime, could
> you resend the series properly in just one thread, please? From patch 14 =
on, it gets messy...


Sorry about that. I will send v2 with tags collected for binding patch.

Cheers,
Biju

