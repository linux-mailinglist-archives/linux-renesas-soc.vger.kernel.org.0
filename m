Return-Path: <linux-renesas-soc+bounces-17865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D87DEACEC2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 10:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 984497A5FA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 08:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D6E2063F0;
	Thu,  5 Jun 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hXXBrxmn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F2201113;
	Thu,  5 Jun 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113007; cv=fail; b=JNEvMbfqIYzz/eTuh99y9TgfjOYl9S25SrE1FxmZzl9uYkibxHZrULSwHJOpfSFYUg2Ym2dKtxzgG6DtfQ/CkX7hmLCItmOfT/3GWzDlUjT7qb5gLeHP6rOgpJyleS3x22+A3UWc97s2mXF9RKsSaMOYl5yHdstDgdsHmIPo0jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113007; c=relaxed/simple;
	bh=4iMCkEnEl1xni62bDI1pxzm5POQPzAGCm2hCuh/g69M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=frhpYn4NVZNq4D4P09x5dZ4m4q/VAu99LHTBLKc2n+CFbdaYwrHl6GHM86+vqEyXRD6qmPO2Cu8hHXbdYHWhQZ6PUsF/jHporoLofjWWs4NQPT/JqaZnkGEdZvjiNfg0EEpaBETz4B3egkHCOKMRkR6Kk4NskYRvoTCdgcTRF98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hXXBrxmn; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0ywpS4xy/hhTlPUEFQuwq43zp4oqC+0Aw5Gv3p06s22TtUTBXrc69Rbl/aUyj6YmYWNzrTLrayyH3qDCfi/xy+jPFMSKghnm1VoneCPBPU5ao+LNPJef6FjoYnBlZAeVHbxFUaS2XvdhP9kN5HmPhRSJcxDjvTvlpx4wlbkwJXmEEQjGD/DA6RnAeLSEz06dJ8t+NWM40CXLAhn2uI5TyMepwzHANYkQTtXQbxryCot2M9TVBHnmrVhs2ThkLxpbJfsmsA1VB5TC8WB/xG8fjDt2LzGlDQ5w7gw4sSEF9/vI9rw7xPhOzafKgPLWt7S4hFHG/rF/qzelcTdfUJRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLTGNqhB66Ep6FxO4syWVngWit7SNfPVbvoSdRgf0x0=;
 b=HnLEgR/NX25DR/RoPHY/Z2sDLbs7HiDyfJtGPI23r9jAHGxtgI/mC0MsDHsMY30t+XVPvSBOeAlTbrYh1mNpHGJBMC71Ko3qlaYhazpSas2R9EJJEKLKJstiINENPOfSXnzlavg5osjeqX1UvT5Y3KPUHbU/UAzGtDTNa4gjxN0Lz2FGjYBAx3HQHksV3RPEKgBz4E5NIxUTRgBjYmpmUd3atGN1jtd4RymFrQdv5Lr5vHGFs4qXAIOL3G17QCrLW0a3uB9VYbWVi5jhfN5FK/t06F9tJa0qLnEloCuWBzGhqLeIB0013uwbJkcKzGh9+jZ5OE+bCH4A8SXOkXXLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLTGNqhB66Ep6FxO4syWVngWit7SNfPVbvoSdRgf0x0=;
 b=hXXBrxmn81eRAMUP+GHUeOPPKZnQefaxD4pKEO3IAH+KiAI443LCHYDsHq1hg0eI9AEb8VTrtm6pq5vPrmrYib10kh1bDkB9N2OYfeMJkFNffQ0AiPuYoBUso7WRfr8zB3ng91TlD4SOBxlxgRGTGztlhzIh2Z3XgZfU275LSWw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10173.jpnprd01.prod.outlook.com (2603:1096:400:1da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:43:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 08:43:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1}
 (GBETH) interfaces
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Index: AQHb1R1I7xpZka1LZkuNtdEMvwHzKLP0QXwQ
Date: Thu, 5 Jun 2025 08:43:22 +0000
Message-ID:
 <TY3PR01MB1134622253D7914085E3D0F12866FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
 <20250604065200.163778-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250604065200.163778-5-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10173:EE_
x-ms-office365-filtering-correlation-id: be070058-77db-42cd-6bd5-08dda40d075e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XChmFxoU2lSHsMoRcWIOvLqpFUYZZYsaSxfemTSqLzey6CAyg158AK6retHW?=
 =?us-ascii?Q?3j9FLZJHaow8nOIJ7KWsWvKbwtJXt+axVPkNj1tQly3WfslmtPQsGf6gM5Wg?=
 =?us-ascii?Q?5/0z3E/IYbV2svpIFdEbfTSDzW5qGX9sLWgsVfppHQ5sIkTk1Wfrz73A4vs3?=
 =?us-ascii?Q?Z/qXhgm5uglrCtZYol/RHW5KzMUg9Cpenz5O1f2uLG/TYbKUSrFmuEc5jkym?=
 =?us-ascii?Q?eAzmqzd58wisv6YU+0m0SCtEfwaqUROMIrSjzTtnskPVURDiGzl3qbP9tYWj?=
 =?us-ascii?Q?Tf0hW19GT2DGNTB2BRWFt8+xuK6svaJA3YPKeRqenJKXX/znaHWjshA9oOe+?=
 =?us-ascii?Q?wBFuB/8DRqEys9rLa5ji1suN94EosxJTpxebqtBL2jPEPuMV0R+xikohPjOm?=
 =?us-ascii?Q?E8yhTLgoYF5ccSjOG+gZRLzjua8fJaD3PKcXThbZHy3Hod/186yBEzbXSL44?=
 =?us-ascii?Q?XzR1/BCGkoOvP7Os4YSBVWUBHW0BTqGn0PbVZd+W8TvY6F1zod2gOG2qcjjC?=
 =?us-ascii?Q?iNFi2RH5vmVQmsqXzyHXTo97QHXX3J6nuGACbePOHJ1cpTuHRxbeV658BJb4?=
 =?us-ascii?Q?usip7rLAwngTQghwDqecQoIQtFbrcQQI/M0Y7+iHvymR44CirXd2Ot1JVMv+?=
 =?us-ascii?Q?mTLGwOmYoMXy/yPg87v15WGpt2pCl7EHDFgAE6rhy4iLADeR4fZnIMPkyC4A?=
 =?us-ascii?Q?3zCBvncpGCkkXUVf2kIFqmi1kwCWOkjlT9yT2OPQRiN7C4Rqr/UgceoFnlGK?=
 =?us-ascii?Q?B8MqZP1xZCVU73vcIGoZVfR1MCEZyWHS0HiUpQctigkMTrDlXcbRcDecdXkJ?=
 =?us-ascii?Q?pYsCJ77jy+uV8uYHIx4tCUJoENELM/8hBs/mNw45OOO5PoDlgHBlmcTTPYKf?=
 =?us-ascii?Q?C+bD/BxfetLMWRadMFIffoNGxGnJEsH2l1UIMTdPoUkFtPmVrBq/F3JJtdHl?=
 =?us-ascii?Q?6V8f/j+JfY16srCli4+QeGn08fCW1g9MDgQZTmt5SW3gkjdEAcOwTZcwJ0Zp?=
 =?us-ascii?Q?HhPlvlEKXGET7WcMUiAxp13emUPIM/tlrX/YHZHIJuVAMOEo7xm6T1D1XqWv?=
 =?us-ascii?Q?s4KaoGKZCmENIw+A+E9u7ErQcwTLhpGnnSHQWP8x+jIkJDD7a2E2nfkBBC2G?=
 =?us-ascii?Q?uo/uQoY4F4CMTGDFYuvwV5AWAWPj6EZFy7Bpr91YpAv3yU5mGXwvui7w+VA8?=
 =?us-ascii?Q?U1FXEVXSQe3hIWoANJ9fcHqLLSz93dR5XujAOAFlRKEOiW9OfNZb7sgXiBUe?=
 =?us-ascii?Q?U7aBpgpQjIOiKdzcVBq1/bzFrElby4urDa5TcVYwgydJK7LDFO0rQQGicOfs?=
 =?us-ascii?Q?2AO65tp8OD/ZWQh6/Ztg9F+khUO+N6uXnB0pyMTFM06LQ+hIZIuPm5anKpO7?=
 =?us-ascii?Q?Pas7oLY4kPvaLbkQTcG7Kv65RQwlQE23ZdVBs1aK9EaaljkMj7Gy2RhjAgh1?=
 =?us-ascii?Q?xaMHaEjy4h65GKZHutvDVk00bKv/VfEsup/arV4CYGAZdsk3U0sE5cCqmNFJ?=
 =?us-ascii?Q?nlAM+9Z3OZkLv1w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qpORZPNJ80OA4RPN8GEgdIYBjZMbV6TsnxkOsB90y+PyRJ+XS8365xuDj4WH?=
 =?us-ascii?Q?ulAebWdIZyitsc17WJW9tR4K7kteNYwy5BtfHglrAiGMzbFe/IG0j6VN4qIb?=
 =?us-ascii?Q?rlb7Zy0k/Qnhkry+5KObOJ6KWSJHWl3cEkkrQfpuOvPSILVzJhKGxIBXgIBh?=
 =?us-ascii?Q?dUIXMWhOcU1SscnStZLdKwxAZHiW+EHQaYFmhRfThegCeMGPxY8Aw/+2gqwP?=
 =?us-ascii?Q?R3VRQmnG4Exe6nHCdd6dJeoGlsz0C+/VGsHzpv5QFIfsOnrkw3F+USI28aUU?=
 =?us-ascii?Q?YfehUb+la1xBxM8Fxlg01yrrws0ccronU61fzLiGxmVJRoWJnEEJUj0p3yZi?=
 =?us-ascii?Q?yVTywWUxGka28NXIJSwNuRTcNK+Y0fxsAUjsBAaid4Ik6TliK9bCMz/ksIOS?=
 =?us-ascii?Q?qJ/Z8t+vwN8sPYKeUPqyrfcGCx5q+MUCLPYL3K2DcqfJfgzBf5th5kL4t7un?=
 =?us-ascii?Q?zL7IZV5o5hm+MqI6FkpJwtcMr0fUZL9pOZHiM2p5wudgQYKVhN7twxThJGPJ?=
 =?us-ascii?Q?hpIe+Ina0m/zDELAQ1MzmK3pLM083Zqf7ufjk+KgTgQyN/OAgiEcS28527zV?=
 =?us-ascii?Q?pkqF6ru7waTqRD9BB8BbBm8kW1wmlxHg3yOuLtqgeqHjeZtufZmgmSxYIn0K?=
 =?us-ascii?Q?EvY8eESWCEkwR669rqRL0BEM+d6a8+A9MXCSYodYfaQJ215ngAvI0Gvl8Ovd?=
 =?us-ascii?Q?8bdN3dIXxn7MKFcikBbmJTHFH4iGhtKwqkKBv59+lafGZJycQplxYd/XQcYj?=
 =?us-ascii?Q?opvLx/h6u6BZE4e8F8RDzzyiQ28eL9aKvUkkRN1/zSZyWyc0crfZOlNy6qAo?=
 =?us-ascii?Q?bY9CaL5mXcWJ0xA9e5IUjRukqljys1W4HI46Zpr8SX1zQWayP5OvdntE2XsD?=
 =?us-ascii?Q?zkU7Sp2NqZtCHr0/eIrIhyJw8C7gt+Gjatx2ezhMRY71pIruryJcFMgAa8z+?=
 =?us-ascii?Q?wtOOylmt3ib/zxIO0YRt5SxPV+hsoVtv+L4VmNVJzw8QPpMzBH5tkcuDEewg?=
 =?us-ascii?Q?cqXsyUUnL/bLHVKTx8ICq752jP394TAlEbW9qYRLYH7KRkUZ/sQuYIJ1gxiZ?=
 =?us-ascii?Q?S8eBHcOcjku41mCgmtI8mQ916Cgrz2rAO4XazjKrwZ0ySotXP1sc2+RhjwqB?=
 =?us-ascii?Q?kof47yEYKABTELFmI9Ad1lcr8w26YQkIdjlzuxv1sLa6Y+tWcBSa6QUNGV8A?=
 =?us-ascii?Q?/NBx1EEZ8eKvG71bNBrDlJX1beZ4eOVOS8wb1BUUbw6QbLZOz/QmZGeJMrNU?=
 =?us-ascii?Q?fifDzbuPhrZ/1OrihAXhwt/dVmREUsA4KYbX9GXvWJnt7QzmhmTRPpZfEJAw?=
 =?us-ascii?Q?cFRd75GFTtlxwfQdT4IkR/gv/AQatlCKSrbCFRlVxg+40qWYmv+biUTQ7MWf?=
 =?us-ascii?Q?ts2d+TG2SvKkuUN1JwMOylcKbQNed/Kxd7ErjPjM3TwJ2ZBi8XWUbkwz+0gS?=
 =?us-ascii?Q?bBDgSLpgMhAoD0mgf8bShZDLy3u++PchJGaBL0uKENjTQx9y22+SehgWAEng?=
 =?us-ascii?Q?oDLT8M+ZMD7Ef2JGMvIig9W2uN/LRt/MkaeCljXi+RXeEpKHALhpJhm4rRNI?=
 =?us-ascii?Q?50Vk4umgqnksDABYCA9Pgs341Oqc76UeNGZe1DXC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be070058-77db-42cd-6bd5-08dda40d075e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 08:43:22.1376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auvG0BoaPL8lp+dQ0W16lhMCgS3PTrbP6qoktdilutJmdM7Df48tPE5r2+1aMmzHNOwDBh7t2gNH+Wli0JrDjgh4lDOinuXNcBDzbIhpgxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10173

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 04 June 2025 07:52
> Subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1=
} (GBETH) interfaces
>=20
> Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SM=
ARC EVK
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> ---
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-
> smarc-som.dtsi
> index f99a09d04ddd..4b4c7f3381ad 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -26,6 +26,8 @@ / {
>  	compatible =3D "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas=
,r9a09g047";
>=20
>  	aliases {
> +		ethernet0 =3D &eth0;
> +		ethernet1 =3D &eth1;
>  		i2c2 =3D &i2c2;
>  		mmc0 =3D &sdhi0;
>  		mmc2 =3D &sdhi2;
> @@ -77,6 +79,74 @@ &audio_extal_clk {
>  	clock-frequency =3D <48000000>;
>  };
>=20
> +&eth0 {
> +	phy-handle =3D <&phy0>;
> +	phy-mode =3D "rgmii-id";
> +
> +	pinctrl-0 =3D <&eth0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "snps,dwmac-mdio";
> +
> +		phy0: ethernet-phy@7 {
> +			compatible =3D "ethernet-phy-id0022.1640",
> +				     "ethernet-phy-ieee802.3-c22";
> +			reg =3D <7>;
> +			interrupts-extended =3D <&icu 3 IRQ_TYPE_LEVEL_LOW>;
> +			rxc-skew-psec =3D <1400>;
> +			txc-skew-psec =3D <1400>;
> +			rxdv-skew-psec =3D <0>;
> +			txdv-skew-psec =3D <0>;
> +			rxd0-skew-psec =3D <0>;
> +			rxd1-skew-psec =3D <0>;
> +			rxd2-skew-psec =3D <0>;
> +			rxd3-skew-psec =3D <0>;
> +			txd0-skew-psec =3D <0>;
> +			txd1-skew-psec =3D <0>;
> +			txd2-skew-psec =3D <0>;
> +			txd3-skew-psec =3D <0>;
> +		};
> +	};
> +};
> +
> +&eth1 {
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "rgmii-id";
> +
> +	pinctrl-0 =3D <&eth1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "snps,dwmac-mdio";
> +
> +		phy1: ethernet-phy@7 {
> +			compatible =3D "ethernet-phy-id0022.1640",
> +				     "ethernet-phy-ieee802.3-c22";
> +			reg =3D <7>;
> +			interrupts-extended =3D <&icu 16 IRQ_TYPE_LEVEL_LOW>;
> +			rxc-skew-psec =3D <1400>;
> +			txc-skew-psec =3D <1400>;
> +			rxdv-skew-psec =3D <0>;
> +			txdv-skew-psec =3D <0>;
> +			rxd0-skew-psec =3D <0>;
> +			rxd1-skew-psec =3D <0>;
> +			rxd2-skew-psec =3D <0>;
> +			rxd3-skew-psec =3D <0>;
> +			txd0-skew-psec =3D <0>;
> +			txd1-skew-psec =3D <0>;
> +			txd2-skew-psec =3D <0>;
> +			txd3-skew-psec =3D <0>;
> +		};
> +	};
> +};
> +
>  &gpu {
>  	status =3D "okay";
>  	mali-supply =3D <&reg_vdd0p8v_others>;
> @@ -103,6 +173,42 @@ raa215300: pmic@12 {  };
>=20
>  &pinctrl {
> +	eth0_pins: eth0 {
> +		pinmux =3D <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +			 <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +			 <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2) */
> +			 <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +			 <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +			 <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +			 <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
> +			 <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +			 <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +			 <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +			 <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +			 <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +			 <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
> +			 <RZG3E_PORT_PINMUX(B, 1, 1)>, /* TXC */
> +			 <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +	};
> +
> +	eth1_pins: eth1 {
> +		pinmux =3D <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
> +			 <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
> +			 <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ15) */
> +			 <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
> +			 <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
> +			 <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
> +			 <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
> +			 <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
> +			 <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
> +			 <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
> +			 <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
> +			 <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
> +			 <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
> +			 <RZG3E_PORT_PINMUX(E, 1, 1)>, /* TXC */
> +			 <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
> +	};
> +
>  	i2c2_pins: i2c {
>  		pinmux =3D <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
>  			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
> --
> 2.25.1


