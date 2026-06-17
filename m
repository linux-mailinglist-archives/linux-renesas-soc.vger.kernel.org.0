Return-Path: <linux-renesas-soc+bounces-34170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i3y/H2WcMmo02wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:08:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA096699FA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 15:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=BWz896+l;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D72E0301E7DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 13:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CDE3C1400;
	Wed, 17 Jun 2026 13:06:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDBF3546CC;
	Wed, 17 Jun 2026 13:06:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701611; cv=fail; b=QTZk7eKm57YNe8lU6qXwNlE5jyyvNSqz5cnbhr412/grh44qq9oyfcZoPaCPRvDY7lyXsTOa3VfnH7owmh9QYPtVS4aPReQxuomPSnbzbDwhIGcI+IKdjM0/XETdHLYZLcEu6jRHEUXGXJmGOd6olGB4TTTisOdVM8aD5GwgXpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701611; c=relaxed/simple;
	bh=JXb8pTYwhrLVhuwhxm/S8zyM3b1Ad3aD1SPKP4i04QI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RvYvVjPISPJ054skcgLley40MMqT0wv/VG+1uSZhWLvRv+lstsUQ7CI2KgwAecfW+ml0/zzJx3rVAuZbVp2lQ2HfPdD9rMSwpmDeVB/zA04ceGOzsJKf/LbDJ4ZkAsHyJpYIO5mCp8ugBRDABSmIRdWZ5G44dde8C6B1uIK1qyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BWz896+l; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYwY1cDaCuYM0JzqkkYkIOui2lJEi0zF8E+2nu8tzvJK0xZIWS8ABboME0k4vzc2M4iL5VDMGox9k0sT5x7J+AFzgsuqjUsKLl/NuGMH6l9qE0YVncv2nPFlVLmFDTE+zTChOD8itpI+Px++wEB6jpGDgJw0riJXvPgdIYY5bcXUpIUXrqua9uIFnWFyTneFEs6VMU4Neva5ZUKyrgPIdHxOd7xKh5dOdB6ra+6hz9L2Tznv+/gdl8ITIWMbuqyiLO/7Z6teIyQU7TXX8sl/HdfCPsNpMkWCFJPQ+wNTonL4B4tPXcqHcUooknMSlmIe0VKisqr8DaaLDfYHr8OAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXb8pTYwhrLVhuwhxm/S8zyM3b1Ad3aD1SPKP4i04QI=;
 b=hmBORdfKOgvLaP94CBMzBvnTeRa0u4+zUT53o+ook9bc1I+US0x6OpoKsqC75g1AvLnFHUbn5xjb7azLva+iIcC/h4Er8FboT0XtxIVCgC8FjbsH2drKJHiVW/9uHdguatcAhk4kNK4QOWT0y7WKubKRgos5VPUxoJ/Qy75MEtJJKiX2xpi3Nub77znCgRA/WZMGU3uWBhj244WPRzKCKkN3nVCNKOf4CgtTLPhejCIdfjiKKssftD38Rmi7umVHaYE7rej55Z71hwRm89WdRO+HNWxnMczQ2ttxuhynUvMzgregUozgunwwmJl0WJLrgnracqIvdcPTA+5amx8vNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXb8pTYwhrLVhuwhxm/S8zyM3b1Ad3aD1SPKP4i04QI=;
 b=BWz896+lO0fQnBeymFIm0dBpx0mMShoNaIKZPAUM+yePSXeCt6g5ReJHBouHVsOnBluWgU0x2rhtppOrPey2Hg0nzosuOAU51rRi6bZ2gQf86P53OPhq/fCDZjyC/NivBGi3+k7afDhK7TFIOUnzUVHhAIaWtsLmWs7/FS1g3xY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14371.jpnprd01.prod.outlook.com (2603:1096:604:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 13:06:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:06:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 04/17] mmc: renesas_sdhi: Fix whitespace alignment in
 struct renesas_sdhi_of_data
Thread-Topic: [PATCH v17 04/17] mmc: renesas_sdhi: Fix whitespace alignment in
 struct renesas_sdhi_of_data
Thread-Index: AQHc8yZJ4u3eN/R52Uijnk6PcN1kC7ZCwUiAgAAMg4A=
Date: Wed, 17 Jun 2026 13:06:47 +0000
Message-ID:
 <TY3PR01MB11346088F8AF3DB4CEAE0A45486E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-5-biju.das.jz@bp.renesas.com>
 <ajKRO0lgr_99tr34@shikoro>
In-Reply-To: <ajKRO0lgr_99tr34@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14371:EE_
x-ms-office365-filtering-correlation-id: 07240f73-e080-43e9-27ef-08decc7149e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 kqB8Cy3uewvb0nZj2RQac11Edjr/RX9orURCBhm6IyYiMg7+sbyBhD5kntuXNAItP5DII4VE3iWQVjG9XIrY3MB46FkxlglxaRQmKROJOlZQdNmgoKnfIu5Jo1HHpXhj/57oatjUbz6VLigvU2VNuM7JWGhw6JfNMRT8ePVLI1TCg1li4SG1n2oY0xJkJtl8FbyizMzJg5ZkZrOH7nKnOpurGVJiIOkE8spUPGGq7aEluUglsdOYyBasbzFj6FfIOMCvDvszKSYGSXUECYZwVg3ojwJSqJXNs2MznCgyOgben/OeqlNTjsWnFCI6lxc98Km3qj5qkpPE8U6p5B7Tmlxo1S3qWB1gkeQnb5iTNxdl9fs0tsGIU/aYFezpwaQElNWoNpHfxqc7gtWoglsAbKQCMV2lmNAjonkEftASo2gQZ1HCGa2QuxM8DnuoPuslt7hVydYzbquXTx3hQjH3XcBAAAzz2wJ63E3fRxFoxVi/pJsksh59Ikai3MTLOeeqpRFc1aifSm4aS8EUk537WJvGzH0Yqp0fcYCRUX0FccpYaVB0jwKAQucC/3y7iDsirSZBgXw8kS3vA/DqvdaX4QSD4hnuY8znL1AZw2LYdrunAlRwpnyVJdb1Aa3zn6d5ItryivxGg3gkhzriaGi1rkrnm7GMOB/3dQHUKcBiws0Hp28qbCwpg7FjaA8RSx3RHQrxHxkgPfAaeXHII7W/Sixgd1Gv1CF39QjzWn1zhYRLy9bKZWH7R00aRGZt3yrI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9PVfsCVdxVI1Q2JPGvOmqfTaQFHy8+A7/ZjOQ/I0ODf7wyrqkz0WSkfdzbyy?=
 =?us-ascii?Q?zP4gQROdCYzgLRlkQ7+lu5D2q3aphbh6np9r9zavKZDJnT6sDexGgPONWMhv?=
 =?us-ascii?Q?gWP7JbWWYqSSPVMzdjrfZikrlzzctcB0GLy0dzqgT1bTO3e6BimVq+bC/p3/?=
 =?us-ascii?Q?2Q6jyJBqhBw8L3mpyiOriYDomAIFEj8PjcvXE7j9jynaqZ8ywl2M8jGsh5yD?=
 =?us-ascii?Q?b/ls8Oz2kUhvP6gVJWMh6TU15l4eP9jxYvYtay7iw0j+/C7f002NKsTvEQoJ?=
 =?us-ascii?Q?RNGhhhs3beUMctIn7fvEfO8zLlcrhqnTAoZt6DMUVxGe0nmp7ZkNFIpcQbsX?=
 =?us-ascii?Q?gabQaiKepsPk0n+E0SQmYxfYMVmkfITR+jZNxYRv6Wvr1jwhfb5IZQkch4cA?=
 =?us-ascii?Q?jIrq7RdotMWU9LaKvLgfevipWVGEJO3ryYsFv01P/RKApgd+Xp4fPvgU0g11?=
 =?us-ascii?Q?dBifeY4Htp3jUUaZ4lyfgv1yLDjIp80O+YfU9ZpJdVp5QE9PKSdQ7lLwrQkh?=
 =?us-ascii?Q?e+Px1a7bvGkp1btuKfTVK8czzFE/fIW3N5vGe5BAlI/U9n1HF6/xZlYoEtp8?=
 =?us-ascii?Q?WkqlfYv9M6u2eQy7LReq9XnVbILL+xbhl+niJAbLG2+bGUuyrd5D4mGkj9CU?=
 =?us-ascii?Q?JwWtg8x0pFQLK0U6cC4it22TWh/fVY0CkNYdwi+kUyZeZiOJkvyfSkVLgZa3?=
 =?us-ascii?Q?O+XwsPsv0W5E7TzURhlqULKQ4+R6ZwYAy0iIRD/qjirXQgZlj0oR/Vq/85VN?=
 =?us-ascii?Q?QxVp4gPgjfk7hGB/NrfxPwpHHQ7anC2X+UMQRxgbmS+jyosYOEWrkyMtL8h6?=
 =?us-ascii?Q?fEVK9T4LTYPf12+m9KHcbPFYqhy+8JifMINGj+5xAFeixxqvdp8BSLgZ+7Ze?=
 =?us-ascii?Q?EhMwtybNIEfRs1TssxpR0i7HmjQbvjdYMBxxiVK3jGz7NAVTy2vyqlFbAyTS?=
 =?us-ascii?Q?PFSMbmshgMXzX6179skgWnMdiRHy5nI/+MvqBg/n1AtlBjl+04mcyoNJDkIF?=
 =?us-ascii?Q?8FPX07H9YWIM6uqnMPwvzAePxI0XzzqCjmYtQaQwcVuv6v2pflMaDMxHCHYX?=
 =?us-ascii?Q?ldj9vALIJlwjuaRensmBYKjtpDmVEGwZ5E7aDwEQPp7V2GnZJ+0YA4Dxq6q/?=
 =?us-ascii?Q?wr7XSfhLTWDb9Yt+KQ0SQ+LMz8elYovVvukoO/2NrqFB6qGSRfqMDgVIhEfq?=
 =?us-ascii?Q?NtMXg28IF7umSe04VV2ht63HT+NG/5lrysCjtihhzvxYb02PdEK6Hm5UexT9?=
 =?us-ascii?Q?cDdvb86zJXrWUy6tXe05ql2JnuG0h7evS3MT/b87ejDQSwBbwF/vrN6nqYqB?=
 =?us-ascii?Q?oUj+fqm6Z+vQWFD73xg9Q3CjhuhpA0Nc3VQtmeklODVrOg3gpUWPq4iZJpat?=
 =?us-ascii?Q?qNKXWv6n9hoE//5LFFq2uI2lBWdVAVfcUXZ7dnBwHbA/hChhD6uCOJ4louI2?=
 =?us-ascii?Q?ZT3lDWDZr4YKXtMcSrweIJ+0CpqtGdP8YDwwwMwcAFXm8Raii6iACfrXIevU?=
 =?us-ascii?Q?1X081fxOR7ZkQ0BrOOPUxhEcgMfZC71+fY2vFliV6OF99L3RaKKmp1UVVdAY?=
 =?us-ascii?Q?yi7LHLUb+DbOR3dZDIOVH91RxG4Yqbbsueuu/dsQiDldsLSD/0Uo8YTKiMbq?=
 =?us-ascii?Q?krKZDnso1n/Ax/0lybtTwOpl4XAQu2vEdkkXQShnh2T1cHyKf9bwU4nSLWvN?=
 =?us-ascii?Q?oGYGeBHMV/CThVemFTMzTzUsSULWgeRRFkN/CzYHmtpiOPpxmARq67MPQObG?=
 =?us-ascii?Q?SSzGyBciSA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07240f73-e080-43e9-27ef-08decc7149e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 13:06:47.6377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrzR+0CnnwugJXQd0frveHF3N0JBk0mJFpZfk7YyfN5seIFcWeKLIad2Q5WcGPF+Phrdr1Y7EyD7f1N2moWH+DPp47NT15L6tq67cVah7Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14371
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34170-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,sang-engineering.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA096699FA2

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 June 2026 13:21
> Subject: Re: [PATCH v17 04/17] mmc: renesas_sdhi: Fix whitespace alignmen=
t in struct renesas_sdhi_of_data
>=20
> On Wed, Jun 03, 2026 at 07:57:04AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Remove extra spaces in the renesas_sdhi_of_data struct definition,
> > replacing the tab/space mix used to align tmio_ocr_mask with a single
> > space, consistent with kernel coding style.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Should be merged with next patch IMO.

Agreed.

Cheers,
Biju


