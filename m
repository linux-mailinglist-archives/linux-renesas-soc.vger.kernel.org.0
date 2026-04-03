Return-Path: <linux-renesas-soc+bounces-30880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJVhBHYd0GnN3QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FA3980AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 787453032F55
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 20:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0858C35B636;
	Fri,  3 Apr 2026 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NctgbzQ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B82EAB72;
	Fri,  3 Apr 2026 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246450; cv=fail; b=dtrz8f+8J37ecCi+W6hlwKO3ftgMoIHSeSg9BaTSaPvS1cZuVz1BL74480Q9kPH4ysMwmyamQGUs3qbl3d6LqsvdOOm7bF4QuiHEFB/K6mrc262lNCbuZDimxyyWDbYtHPj4FHO/qygYXgV5qHo8nVFkBnoOubo+SAs5ZQg5Usk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246450; c=relaxed/simple;
	bh=QwpSnRM5n9arGiqjKeuOcE5/xsznZxC5fnQgJ5STJ2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gTkoO9mEWGRT2xP78hJYM2p1wvDjWyEBcKZgRPQQV3ZUy6AQC/PVvRwBr+o6TmEU/YgI09QFU0R5MgbtnpTy+m8sB8sFeZajvqjJNobnIlv5eCT4Ru2CSw8bFnlJvwEtMGpXIlOWsVImHwDV7gXxL1yOqy+VElAlIGZT+AVFiRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NctgbzQ2; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMywVUh/5LxLUn2FwcVtpgDJU5/TQyLVmy6xaNeCINAD8hoYQr8n64LQqU0HTRt6+SZAGhrIubB+Bb+mjl6qiaQy8bSg6X51++Bo7XJrlQd0oj1QtaNkN8PcejIIeo3yIEXryRDU4K0kkqB+GKz/9HBAWiLf3z1P9qEu2kZ+uJc7VT0QLUn0/uDhyS8tS2C7OoPWHtfzO8crjW7ckVgBtIQ16Ulj4Xkp3EbvqZUasB0Jcsmuj005c2YFxcu1vdXul+wXZD7xGMF6Hn2lOv5v8/MiPTQCj3DESTR9xz6TohC3eB992uevs1ggsY6F2s/gveJv1ak3iMt3wq5VaBBeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/x8HkyUEuvHyEbmZTEgJ8qoBI28zEFQ5B27gMyO2/I4=;
 b=vG1mflcwKscvKV9JuucVVo3kNDMZ91iPT0CEaZFFIV1kxlGBwj9uQaD8sp6zHz4QutpmWcsxK8clFy9ZgUUpNA6iBAsvMePCvb6wb7rgPWSaEvBNMRn0uMGdJJtIcRdVScEIwHAL430qLOimq6PrYsWSsI0qMZZ1Y3Q5Z3VVg8doqWGDeHFU10VxXbagI2R1Lm+5z/QuQ2wXTJIEz4txREb03Xj0XQGfpDnfws43qcWxGuThpMvRA6QhOaK30JDnEQMIQ6Gp7l9C1UyM/G9i6sIIILSnAlxmtFdG+fkovHQCaAYl1iBC7vr6IZML0G8q59Xoo5tfT2Ks8R+QRT8pYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x8HkyUEuvHyEbmZTEgJ8qoBI28zEFQ5B27gMyO2/I4=;
 b=NctgbzQ2FWJSDm1Xv1njQ7mzI3raSu7iFv4lPATQdqw2sHca43hOnfByFJnuMgkdFQchs6WXGVs9JQgVSCZRKr5RMFca5fdUbe6QwYsng9riLBDYxpLmI23193sf/7YGxw9E5NB/89SOKhxCo30up8r/lAIBaQUq4+sr02eYW2Q=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB10008.jpnprd01.prod.outlook.com (2603:1096:604:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:00:46 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 20:00:46 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply
 clock management
Thread-Topic: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Thread-Index: AQHcwr1pAzAyXF5bLEakh+bcszcXI7XMjkKAgAEz21A=
Date: Fri, 3 Apr 2026 20:00:46 +0000
Message-ID:
 <TY6PR01MB173776C77BC7D557C87D28E86FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
 <87ika8g74p.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ika8g74p.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB10008:EE_
x-ms-office365-filtering-correlation-id: d1d53465-56bc-4f6b-7cd6-08de91bbb1ef
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 67ajACkIfKxgCL/I01WaMXYtKz0OfN5cBHPZuZ2hauLXXRZThEd4TWoI9Kh6XDovyPPjQmBNl2KDGUOHk1zd1QIR53T8jyVgGuf2PaW36fwnabLvGmxVJQN6NvE3UlfrupYat1TNqcvy+3hC18l7Jk7P4ZbfyhiKz6+akdJq8Q2on53ZWlWeWx1+ctWfkfOiRbTc2qm2zayTQHRPzPS36TJqxVi1XCeW68EpUvGg25YZF0MXZU19RZlzlPhouthV8z8QoGGBYfQds/tP+Bc+qxyNzE2YVJxLS+in7NWFGGSoDs325GbQoFzMZC56YHNqPUlrhOD/51phk8T/NzUuAXXR4XKpESe3cUU/eGoseZbb5rXuFJmvI4142354pNGuBBasfwXNOnbpPFymbx7k4ZKkoULPk1VPaekovteXYBEKWnUzjEzVPvP+7VP9WQBfXwSe3KiGm1aCjIBp6W9uID51j4D+1ZCS89RkmWCTIFTsOgCb3VWM2dQ5Z5zDIc3wnpZmYTpc1PqWaQaYN0jsBfISwVvVkNoeK7PrYovoQQ7LPmaGY2z4tUfcZ2SHH1o7a98UXFXcTevFK8kr23RgQsUiJwD2G6tZJSFq2aOf94hCyjzuVBFBDPeHlTqOtpwf8LsvoDuDPhgTEgjVlgBtBbbLGg0HWj1iz4kthxZdeTSzh7KxEM6SK/gu+eg1IUqbzH2nS9VF39xUToWyFwUVbk/D4xP5E+Q55v7FIbto99J3agr4uvEpu7hlAIPQLEOPIM0ujreIj/KJvlesFxhgO9+4xxsUwLdDnj3ZOGbepXU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?spShJhuDYN4zsSnHyLs1ApRGdZmqHci6KHyGYfiSoZRAzk43dxtW5YuuSqZb?=
 =?us-ascii?Q?8/rlyOYePUnv8hCwslZf5ooe3NX25GwRBhdjpfFsbRWL2AKU2IEklNnPdkIF?=
 =?us-ascii?Q?tR+VQSGalA4yec7XwCiblBSFkZMdpIzpGPKaH/dttiBwzb+jNmOU/N6j86xS?=
 =?us-ascii?Q?5V8vd9O4EANmzv+00/4ABBfjrNvgUp4udlWVtNscewSugDuXjr7mFVhiWzMf?=
 =?us-ascii?Q?INf/PDrjI+K1B/eLFlZPm5QzwzabXNeEUN00YXXgRZHd2uz1o/BNaMWFbGx+?=
 =?us-ascii?Q?sQFLstrVFWSrKS6L2fHuH/E9ObVx4ZUe8NAiiBihT97HGAGLOq46Mf97Qnxk?=
 =?us-ascii?Q?9zm+ZTwH58Wk/O2/Q9h4VVwFLqg3pbx6eHJgeoYs+dRcw2WMRDvQ+KoyNMW/?=
 =?us-ascii?Q?2GV43tVgHu8bF4p6rUO1iYChk595qwHpeMYbaYxEejjFQE/294JFNT/6ahkz?=
 =?us-ascii?Q?VjCVmwjwQbCidFvG6EPMEdB+Nwi51zHLZU4z+t6QjHla/X4VFrSZa9HPMKbn?=
 =?us-ascii?Q?4WJsoDAv4NrIWA92DZejGq0FgKffgpPAu3BkSRIahAvtBfW3HMhEKDN2ZN8E?=
 =?us-ascii?Q?gpAAS538zTbHitWCsafOuopkvQHpAWs4gd2y2OquE10XdMG2CYC5Jp6V2Pi/?=
 =?us-ascii?Q?t8/yQvSi5B3skKu63516vPncmtWVidSvPpAiXxKAHNtvR3Yt/OsC4vn1W5h1?=
 =?us-ascii?Q?UGm3i8JEnuohGA0+GS4a2OTe+RA+ZFvXY0BYvlI0Zgp8nDIHpbPR3kFOC094?=
 =?us-ascii?Q?cZ4KbkXmrA5FdvsfhM3UzNlw0+b/18uA3HmWj5YSgtKi66G69548lDxPGoTa?=
 =?us-ascii?Q?Z/WyDPzci+o64VC2qMRWkn7gBlWeRTmMl2qMLsMBcdtJWhyDIlEJmQiEoE66?=
 =?us-ascii?Q?8syd6iqAMBN/0ixGnWX10iDbq1UnX5xDpHsud6xg/apC+kWJdJHCrPnr0j2s?=
 =?us-ascii?Q?zV6J/v2ttpJYv0v4L+hVVqJMwGtveT8chFG/71eDBKFXgIbv7s+l81DIVFiA?=
 =?us-ascii?Q?DTlrMwj4veG11aAlRKwKPZg2WC4FYjr/KaidhgEjTnwyx/E35ZDCMXRJYwaZ?=
 =?us-ascii?Q?q64yI8Igx5O/U7KlkRO3dlTzrclk15fSXLjuCmyxpRdN9JHr1BdG1QUDLafa?=
 =?us-ascii?Q?NyWbFlUihnSQtqRuVis6uYojOq9sX2ZoWt3SECPyv91eaqiEyES11wroMkaW?=
 =?us-ascii?Q?UE07qvq2it68cya+/S+6D79zWvEc09b/TGZfI8qmYYf28cuaBoAsWAMEPYRn?=
 =?us-ascii?Q?+pOVg4sqlj/jJt5nDW418TH1wsGF6KLGuGCozFg9QDl90fgeBB8SeidsZHhl?=
 =?us-ascii?Q?EzYIo6Bdvcxj95PagK6xOkQ5gnFq2kUhwR6yYJkEHT8LG7w68Hwp+scbVKZG?=
 =?us-ascii?Q?z5pxXpDLYB1LI0mTmKdtoJ5pdaYFJ+mXVGTHdnW9tGmI4lq79LPxT61X60Ed?=
 =?us-ascii?Q?2RRcMWkMRnfnQEuI5YQWhNZ/mJDwq2WPt/lTu5WzzV/zqWMagWvxcG4Lfroj?=
 =?us-ascii?Q?OXJ+6Z0VPwGjxWIRkScE/Gh1EfWl1R9ghMmCyjxskxJWVr96MmfGyWe5jhLt?=
 =?us-ascii?Q?ep/2xChGQw+pJp1GxptBqHVnPyhU1nAgzYgQ/L3yPJTTDl5vwZrIaUtBhUex?=
 =?us-ascii?Q?7t6GFRt34a2RYILzotVIO4eHKiksKzay5er4KoiHwkq4xUx+Yuanr8+0m3tI?=
 =?us-ascii?Q?ep1D+Tg+vGNAAxkNBBEIbO1kTLr1pxwaBxEAA7vpAAN9alN+cHJh8EBMk+qW?=
 =?us-ascii?Q?eF90B1uHbITOr/9z4TCWTiNAZLMyECI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d53465-56bc-4f6b-7cd6-08de91bbb1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 20:00:46.2890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GS8BRWOGWWHVxiVvWPAkvUwRpFJOSgaK+9SdXVMgSUp/nTSaS93biIygUgKwVL/Uxw2a8kQ2lWV3vwAGebRXq0flTKHiMqx2wS6Ln9ne8n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30880-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 598FA3980AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:33 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
> supply clock management
>=20
>=20
> Hi John
>=20
> > RZ/G3E's ADG module requires explicit clock management for SSI audio
> > interfaces that differs from R-Car Gen2/Gen3/Gen4:
> >
> >  - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
> >  - A shared SSIF supply clock for the SSI subsystem
> >
> > These clocks are acquired using optional APIs, making them transparent
> > to platforms that do not require them.
> >
> > Additionally, since rsnd_adg_ssi_clk_try_start() is called from the
> > trigger path (atomic context), clk_prepare_enable() cannot be used
> > directly as clk_prepare() may sleep. Split clock handling into:
> >
> >  - hw_params: clk_prepare() - sleepable context
> >  - trigger (start): clk_enable() - atomic safe
> >  - trigger (stop): clk_disable() - atomic safe
> >  - hw_free: clk_unprepare() - sleepable context
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > +int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod) {
> > +	struct rsnd_priv *priv =3D rsnd_mod_to_priv(ssi_mod);
> > +	struct rsnd_adg *adg =3D rsnd_priv_to_adg(priv);
> > +	struct device *dev =3D rsnd_priv_to_dev(priv);
> > +	int id =3D rsnd_mod_id(ssi_mod);
> > +	int ret;
> > +
> > +	ret =3D clk_prepare(adg->clk_adg_ssi[id]);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot prepare adg.ssi.%d ADG clock\n", id);
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare(adg->clk_ssif_supply);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot prepare SSIF supply clock\n");
> > +		clk_unprepare(adg->clk_adg_ssi[id]);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * RZ/G3E: Unprepare SSI clocks - call from hw_free (can sleep)  */
> > +void rsnd_adg_ssi_clk_unprepare(struct rsnd_mod *ssi_mod) {
> > +	struct rsnd_priv *priv =3D rsnd_mod_to_priv(ssi_mod);
> > +	struct rsnd_adg *adg =3D rsnd_priv_to_adg(priv);
> > +	int id =3D rsnd_mod_id(ssi_mod);
> > +
> > +	clk_unprepare(adg->clk_adg_ssi[id]);
> > +	clk_unprepare(adg->clk_ssif_supply);
> > +}
>=20
> Can't we done clk_{un}prepare() at rsnd_adg_clk_control() ?
> It is the function that ADG is calling clk_{un}prepare().
> Performing similar processes in multiple locations makes maintenance
> difficult.
>=20

This solves both issues (raised by Mark) cleanly.
I'll move the clk_prepare/unprepared for the per-SSI ADG clocks
and SSIF supply clock into rsnd_adg_clk_control(), which already
manages other ADG clocks. Prepare happens once at probe (and resume),
unprepare at remove (and suspend), and the trigger path only needs
clk_enable/disable() which is atomic-safe.

This eliminates the hw_params prepare leak concern entirely.

Regards,
John

> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

