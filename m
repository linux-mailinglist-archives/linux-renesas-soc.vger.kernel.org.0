Return-Path: <linux-renesas-soc+bounces-23947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 88138C237F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 08:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28DFF4E3AF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 07:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B508431D740;
	Fri, 31 Oct 2025 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="crGhTw3c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EA19F12D;
	Fri, 31 Oct 2025 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894511; cv=fail; b=k62Hf2923F1BRC4k/OuaHW+ND5Ucbc+BcAaE96eLOSgp0c5eqMt3H1GD7/U4aDpr4wvEsaaLVF9kVi36ZI/aa7BuY+toVQvkx/Som6QiO1x78poVgafkFWN8mlrG3ie8BvPdpFLHyHB8IpGjP56eQoq3FmPWo/uixN/gmn8grjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894511; c=relaxed/simple;
	bh=D+lWNUIQQIdyHCB/RSeGUbKkR9WRmvx23YzwdCV96T8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uznYlk4SswnaysiF2PSCddJQoZ0oUJlg94Zw0y7QDZ77KoWYFwlkC9HSsnKsT1rH1brI+wEqXWUcxQwYW/GBv03fEyTwIoyK6hrP1U3pn0C6YMfrw5Ka7WWbEhDpVlRAIqAnsYOhKeQ/uhFZw5JyZOO2+lom2A8/ftOIlkf18cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=crGhTw3c; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHazMJXU4LR7JWHZEEN1NDHy8lafL9BmuzhLpGItZDcgQN/tN08nZ9qEp6fptWA9dBTpY9HDMZbSqpvxg7/Z9CDr67uYKtjP0cPgy/4vCH7WJGtUIUBfX4gX4+MP65ySIa4N9kJ74GyPtvXKsPJS4Xz1QxSpWeo+keQY4dXNPffECgcJ7/wntqxJYyVlUC9UNwo29jxOgdyRNTeoOBjoCmohYVLTy91Oc/jfO5CwG+7iYLUA9/JgP0oCa4M1e4tnL+FgG9KJ9Pf5hwZEIvqBlMwfcMGqRKjIGgBUxr6/I0J+q7kgD8WYDBDbvuVRaVArqv84MOnv72y5+H8TevFtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfAfC9GvaDw1RXSyD/bQtz6NAdexTaxHSDeEnjEc4Ww=;
 b=iRJ+j9HNDA7It0ZF/bTN33VBTqxG4ee8cyqi8zXnE6kMtafYpvtcpCNC1KFSHuHAak60vi4qjGY7wVnNg4+OJWihTOR3ovFL6O6FF1Iepl+8+OHU/TnSz7OTs1oHzfgfbl1QH70N945/AyC5fjZy0ah2SE2Pyb5bROgsOJ8z/8uOWZFwDtF6B04Bs3gObd4cbN3CiSWortU3rc8dvn/i41ZJkSUeYBxs3zhjsiqSznwdy/MEcKECbn6xucu9aSEscTnIXDme1aXrh6cs/woY9kDfOml2zgHMzltagdBsyRCL0soHrcJVs8q4Hvb+hfJqS5sSYuSVoM2EqkP8/FjJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfAfC9GvaDw1RXSyD/bQtz6NAdexTaxHSDeEnjEc4Ww=;
 b=crGhTw3cbOGaR75rMAf7yApI6rAp6+DC+csZC3hvN9AJmH0L0OHscU9/jfVdB+a61dhy6dUjEu9+xtyMa6fDlWzIIx24J6+dyyAo9WzfSq39nwkJtaNF00dNH8OUBuF2HpmcOMDb6YIevmrHbhjZ9+y5oeWfzuIBD1cGcB7iVJY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12453.jpnprd01.prod.outlook.com (2603:1096:604:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 07:08:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:08:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
Thread-Topic: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
Thread-Index: AQHcScbHPfJOAc7lOEG5P8xJhHQqn7TbIh2AgACzrMCAAACpUA==
Date: Fri, 31 Oct 2025 07:08:24 +0000
Message-ID:
 <TY3PR01MB11346985328E37A14287CB3B986F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
	<20251030175811.607137-4-biju.das.jz@bp.renesas.com>
 <20251030162155.d08e9d6fd3100092be2ade80@hugovil.com>
 <TY3PR01MB1134686842EA2A6EF864E1ABD86F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134686842EA2A6EF864E1ABD86F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12453:EE_
x-ms-office365-filtering-correlation-id: cb7ac753-b456-4cdd-244b-08de184c482c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VxgLdcigLQsWBS5mUN6H7TV8yIHcpmFbG51uWJ2vhX1wMqPnBu1QD2yQIxpR?=
 =?us-ascii?Q?DULCfx1VpLhKj1Y5PON3iis4/o6C5BxzPgpREemhV94/AgCqk3/1krcwF2Lb?=
 =?us-ascii?Q?tLBGOdIt6znvPnGHMw+jZwBVV4dj3o9bn3a7c3vK/u5cfBcmxE3IRVBE3Hlw?=
 =?us-ascii?Q?zBxYvEXMvKIKerSemZviO63MVwCpHcgM/lmcQGX+zhhVYoXCSmL6xQPVXEb2?=
 =?us-ascii?Q?EEnflPf5bfAqPnrpze053k70nC4xYZSLofmWJiGt5CB/0ION3lyLlNBlToTi?=
 =?us-ascii?Q?WSmlY8/f5q6l6bSx+POTsy77wKapt4fRpgQFKIKVfuyVmhIIwELbVJFbm44i?=
 =?us-ascii?Q?y1kx41Noq++ncAtxXYDqEJGMqVGQ0h7S8ZFldsWUIDCwyz3LGj+WNiVUUTty?=
 =?us-ascii?Q?AG4QFKvNi5Z/8xd7Cp2yuOIoLxxsFccftZM7Dc/ZSteUwUMmABZReD4wFi8C?=
 =?us-ascii?Q?Rk9fcMfzqbJzY5gljsT2mXL8Pb50/hmXrRFz++Ieozb6boluhJQu0vNza67s?=
 =?us-ascii?Q?u9UxbqbXUIw57k6mJFEHS/nkxd7AoIpCaxo6+HhTYYIDFxt4qfRA40wpjm4e?=
 =?us-ascii?Q?DygALKLEMmHz5IlLibDl1g1FCDUzT53trLdFkA1CEviL3PhUperK4Zzlow0C?=
 =?us-ascii?Q?PLu8JMnChtBx4a0t9loM+zj5n0rztcZUYhceifZ4fBnT1bZwHLgrje4LGcQO?=
 =?us-ascii?Q?65TqbWHCc/XCLSKw/4DasrPqNr4mZlurOO1nrTcwXTirNiH0cdIfugSkqkIZ?=
 =?us-ascii?Q?A/ZxJL9w2Jra665lQFmFtIAUu9VPPx8JEkAqydDiI6d2veWTIVWC8H+7ZGsd?=
 =?us-ascii?Q?pKwmYu0cRHkRy4NzeOxS2byz3SI/4HyQovFRh9663Nm3f1Z7nfWR/M2BdXOe?=
 =?us-ascii?Q?TAsm2C+l1VTDhkZpHuVCcHz7QPKLAxE67GVH0oRH4hCNgsRokgzx3W3sGWDl?=
 =?us-ascii?Q?etSM/JkBfN3KBGQT+y0nuDj5q5u7kW9GK2aoNT94oW0BbStTv7G0oA5IyFzB?=
 =?us-ascii?Q?MWBbe83lbyBXBh2A6ttnx8W3FbKvJQHBk2k9jUHwjxYj9RxprB77nKVR+h4G?=
 =?us-ascii?Q?C/33Jpm82zBzZNxJlR1GsLbdD9fGmWprBY+OS6YbftuQwtwAFWO8EvMK34s9?=
 =?us-ascii?Q?5iq056ygdKcZsHMeuyQoxWQCvdTWyvZApBv6KtbPLcTwjhIgIoExLvRG2fOs?=
 =?us-ascii?Q?Ya+08Kxt60Lkwc44uVcdv4VOMIrQs/JnCE3PXOonqAwhTMcl8N3JnOt/+nwD?=
 =?us-ascii?Q?L0Mtjf2WaY1wj3SVmfwyAqMNIYwdLwsqQQKg7JfhtVgRVw6HrwjHPwL78Zvr?=
 =?us-ascii?Q?hq3nxdaB0wZ5L/jzzE+/OXshPKqauaI7Tdny7lp2kBEYdaMrExq6arztcKFT?=
 =?us-ascii?Q?9Ly9QmKjZ2e5H2ypRrecx8JtGkkF4YgzPLpByAgByba2rehxjdhPNEeWpCul?=
 =?us-ascii?Q?iBZMwEmGmJRKYAcn+1zO+8covaGBn/a9L04JmZGq1XDjcLezLlts80kKxlih?=
 =?us-ascii?Q?WtIQdnPFlIZFodU012U45000if2Qqon8Z1vM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MxkJd6hDzl9M5IWUY67lksDyWHQHqTe/d8tDCcvURt/3yeO6qa6Oa2ymtOFa?=
 =?us-ascii?Q?8Jial9VckcqiJ64AsMxh10y5URDK3Crs2zqnYmELBIQBg/PkPbm+TePCu0xX?=
 =?us-ascii?Q?3sBfmqvAd8khdFL4mMZNPovAP7Eg18Ko62Cl2+QoJ/Z68pMlu2Vvu7qUUhxc?=
 =?us-ascii?Q?R/GgMHENNAMsate2zMYpdpK/jaw11j1KWJrouHyI290GBM50BenLQMxjWG4h?=
 =?us-ascii?Q?6bsrP+NPyE6nBEbPJjBN3EwMN4dRPnh7+bye1cuiROyTCMXqCRIQbsW9CaA+?=
 =?us-ascii?Q?539PU/O4iqrM3gS/PPKxiSRE7sffSXcUjPjQfcPcRF0T7sKosw9NskaYyIZ4?=
 =?us-ascii?Q?QifFB4ozWojpltp/loJpLpkIMny+TTzBb+InRpfadAZw4CxqL64aQqUHsqlZ?=
 =?us-ascii?Q?8vmWPGIaqPYifKDloQIqTOJcTHvAMLmBAzg1rK1yeuwEiKDiri8cvx3yhmbl?=
 =?us-ascii?Q?yW56CB6lBq4H8OzKtXMS9g+TmVyqRBxEgkBubsvDguTAZmPhCnVcKBTea1IR?=
 =?us-ascii?Q?6Zu016GbljkcXFtL1m+654p2SVCCG0lfSj8kKG9pUnl5QCo+GqYljxXHjmHf?=
 =?us-ascii?Q?/7KAQ67FKTu2CEt7ZD3xj6fvDU8u09VAJxxXdb5YEcLI5HGtXK8A54X8112V?=
 =?us-ascii?Q?c4EmazapqH+wpNEAGKFSVhuiZ7JG7npJWPNhVKnR5xKIhuvi/40U3N/OsAuJ?=
 =?us-ascii?Q?pje/Zr84rR1vqp9fS48XQMAgSDtPyFIHFjLmHGiKUFWAFgssKH2hIYQ7N0SP?=
 =?us-ascii?Q?eM1wPlMbg/5dVX9t2rl1P3UeInsG1Tegb2zLt0IUpKzGMXNCOATwoKfuJiR3?=
 =?us-ascii?Q?qrThAQNVyndoYm9rLuDDWhmKwdxDDg0P+hGg/xyKz2foO/YJwhTtAASxDyTp?=
 =?us-ascii?Q?IOE6j57+UDt6SDvoiqdkjoNOHk7tzXCdc/YfybuSfuzpxIE4+vRrVwHCB8qt?=
 =?us-ascii?Q?H1hmDR+o8cTe/RboX05XniP7BOAcXF4xP8a1jrs3y+dPmCKvzag4+gFV1X8p?=
 =?us-ascii?Q?8btlZKRKYqnmQtXfALDDOjGxmd8E7nLzh8cgWYq4+/toPiilJK+R2JPDfdz5?=
 =?us-ascii?Q?yMAFBC4D1RPcdfn1VHMv1s7QpfyE5E/6CZNJgrh9ppud01fSF/SLY0k6mGCB?=
 =?us-ascii?Q?O7mLqpaGGSP6l+YLHv60Ou46qY+giFQaA2JDCpLidcXFi/Naxr33jv8CcP7l?=
 =?us-ascii?Q?i/GnugAdJzHn9uLQZAqQ/y/TC8U0qF4B47wM9qoAi2TeThscgyYjX4NkTY6o?=
 =?us-ascii?Q?KjYi0JVsJNtZYlM9tf/YobHztElwPVbLnQl7oc09+fPlbsk/n0Rno/mSKY98?=
 =?us-ascii?Q?cWwa/85i3z8B32lTIWLAqwdRIy4XHDAVIyGHZSsTmMSRAz2y6qLrwlGEf9dX?=
 =?us-ascii?Q?AOlifdg/RnUAW3VrS8A50/9R8vlxzAG+zQ1dNA9oFFUb5XnuBHg6rYuay4q+?=
 =?us-ascii?Q?5Q9fcVvWz44bv9FLxRu67SJwWJQVjke9eacUGZosd/i3AHXqbrwRI7bt8I/G?=
 =?us-ascii?Q?R+SoXhyZG+7yDvyJCSUW4ws+Fd0QKVf9QFjutniIz4Q0IxLQNJXn2zE1GUBR?=
 =?us-ascii?Q?RULrpMkSVE5O+QpoX1GNRLCmj6JbCrm7tywvgT1C0t1PDLqP5FuJdNR2156V?=
 =?us-ascii?Q?RA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7ac753-b456-4cdd-244b-08de184c482c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 07:08:24.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTtXiGusssQkEPlzzGRJITW4iBj51+mU9TOgsyLYl1urN6Uza1AUVsoaLtfEY7Gz1KiLfW2KQw6+G1Szl/nZQrSFNtS0xT5jvoM+JuK9T4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12453



> -----Original Message-----
> From: Biju Das
> Sent: 31 October 2025 07:07
> To: 'Hugo Villeneuve' <hugo@hugovil.com>; biju.das.au <biju.das.au@gmail.=
com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby <jirislab=
y@kernel.org>; wsa+renesas
> <wsa+renesas@sang-engineering.com>; Prabhakar Mahadev Lad <prabhakar.maha=
dev-lad.rj@bp.renesas.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; linux-kernel@vger.kernel.or=
g; linux-
> serial@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> Subject: RE: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
>=20
> Hi Hugo,
>=20
> > -----Original Message-----
> > From: Hugo Villeneuve <hugo@hugovil.com>
> > Sent: 30 October 2025 20:22
> > Subject: Re: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
> >
> > Hi Biju,
> >
> > On Thu, 30 Oct 2025 17:57:51 +0000
> > Biju <biju.das.au@gmail.com> wrote:
> >
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Shorten the number lines in sci_init_clocks() by fitting the error
> > > messages within an 100-character length limit.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v1->v2:
> > >  * Updated commit message 80-character->100-character.
> > >  * Increased line limit for error messages to 100-column limit.
> > > ---
> > >  drivers/tty/serial/sh-sci.c | 13 ++++---------
> > >  1 file changed, 4 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/sh-sci.c
> > > b/drivers/tty/serial/sh-sci.c index b33894d0273b..e9345f898224
> > > 100644
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -3008,11 +3008,8 @@ static int sci_init_clocks(struct sci_port *sc=
i_port, struct device *dev)
> > >  			return PTR_ERR(clk);
> > >
> > >  		if (!clk && sci_port->type =3D=3D SCI_PORT_RSCI &&
> > > -		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT)) {
> > > -			return dev_err_probe(dev, -ENODEV,
> > > -					     "failed to get %s\n",
> > > -					     name);
> > > -		}
> > > +		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT))
> > > +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
> > >
> > >  		if (!clk && i =3D=3D SCI_FCK) {
> > >  			/*
> > > @@ -3022,16 +3019,14 @@ static int sci_init_clocks(struct sci_port *s=
ci_port, struct device *dev)
> > >  			 */
> > >  			clk =3D devm_clk_get(dev, "peripheral_clk");
> > >  			if (IS_ERR(clk))
> > > -				return dev_err_probe(dev, PTR_ERR(clk),
> > > -						     "failed to get %s\n",
> > > +				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n",
> > >  						     name);
> >
> > This one can also be on one line (99 characters).
>=20
> It is 101 characters.

Sorry, 100 Characters. Let me run checkpatch to see, it generates warning.

Cheers,
Biju

