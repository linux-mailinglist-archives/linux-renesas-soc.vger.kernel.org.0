Return-Path: <linux-renesas-soc+bounces-12810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D08A24D88
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Feb 2025 11:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13DD57A20C0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Feb 2025 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930E31D5CFD;
	Sun,  2 Feb 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t6vjHh/z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B11798F;
	Sun,  2 Feb 2025 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738491488; cv=fail; b=rzxEX0G3SLjQZbtxWGyvvzh1C3QTp4U/ADPAbsxBvP9fTTgPwEZX/rC+/rKtjhh47cQ5mthZtS5AQldhWYAh4dRekitRSuGIfw+GNK/TsBa/0MtzYdW5K6uEihzUIBzOz/HCdxndF6YOdU/d+QfLF7N7PbUi06rxeDSN6MRhnf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738491488; c=relaxed/simple;
	bh=cNtBju35brw/0E6RhQTyVfvDNKaddqWMwhAMt6anA0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qv/zqkoddI8Bd+TaCCT3frtDaKNnaoQzqx08yZRyz0zHCcJO+QZlemnreM4lx/tDnFJMnwKHarp5DUC+4T1aG+cGEjcod0rF8cZNfJ2uElXI/BmbctG8t3zss8CSOi5Xkn0w6Q+JRuuGjvzk4uslYX/Bp3si92cV23OyL8KMIvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t6vjHh/z; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt6fdVEhC9ON2ywuPX2mpR2qX0cwAIu5RkOP9jvuG/FNQPoVZychQkSwC6+FY3qCmDF+83OnWCb9x8iCWKqyh8izEJys7jDVIbniA87NWIJ5hT9i7v+uFtu9olh746xkYjN7AhUftZQJDR/XpVxGELEudCN1X78RtDZH2zZPrEyEko7xbqY0KgDabUdUsUk7VhyWgUKivL6ps2X4kAxr5T6ODEQshiRvxMV6NVkKWZFNxbtarXLS2dogMTDO87hsQtsO3xFVQKfv9jBYw8uxv6vvqX6vYN1cMNyGkx6Qd1AVzjSTeb+v/Vf+nAGalDMi4yHKb4Wpl41oorPzkYVU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtBju35brw/0E6RhQTyVfvDNKaddqWMwhAMt6anA0c=;
 b=lUBTRiW12O45TfJ+5TYZzxqNUF3k6NcraXHzcqKWJmGQyA5W2k/fBxs6EdM7QJ7R0Xt5tIkNSIH6TxDjQEUw0whavV1fACP31evAwF9QYLPoOEwuVzYfl4Wv5FIl8gLMyrHLnLs1iBafu9CHJcTyh42SdetXjTFvJIkHodHJuzz1mtkuAYbTXtsevkQ1vS937I2aMWaDoDGdHTJcc5G866azMFjp6UbVy+4D1aeoblpoj0u19fireHmWQK3SPtCWoYGh7sMJwfyYJ68LdEdq+U7WJkDnMkqEEvkbzlTCBMUnsLG5z5aLqFBM96j12BagsEMP7rvtUBRMeCVAosTJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNtBju35brw/0E6RhQTyVfvDNKaddqWMwhAMt6anA0c=;
 b=t6vjHh/ziuBZIY9YPuqsYdfdCtUrMx4ADjU8yZl2cAdLMgMSW1AwoLYmQHfU4PoTEEH2xhynByJP4UIUnAR2f5uMRNFP3u015AabKKcGIQUKvLc/BnWbsxe1mWmBOJSzvTVYB6nVBVokV3jITF1WMzXx22Ak8iiMQnhI3eZdRx8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9540.jpnprd01.prod.outlook.com (2603:1096:400:19b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Sun, 2 Feb
 2025 10:18:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 10:18:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] net: dsa: rzn1_a5psw: Use
 of_get_available_child_by_name()
Thread-Topic: [PATCH] net: dsa: rzn1_a5psw: Use
 of_get_available_child_by_name()
Thread-Index: AQHbdMcVzj+Fza2rsU2Pw6osp4yrC7MyyIMAgAEFOpA=
Date: Sun, 2 Feb 2025 10:18:03 +0000
Message-ID:
 <TY3PR01MB1134685A66E76A1DD6166416786EA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201163345.49779-1-biju.das.jz@bp.renesas.com>
 <96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn.ch>
In-Reply-To: <96fbccd3-fd79-4b2f-8f41-bd0e3fdb2c69@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9540:EE_
x-ms-office365-filtering-correlation-id: 72c78b29-9673-43b3-0eb7-08dd4372e116
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BQq4Rikio2w/QYeOJwAgggA3fTypTMmtn0EnVl1XO0FSIUjYHKxrCdIs1c?=
 =?iso-8859-1?Q?utvH1LEPQVTTTklvaWtuLcYXicowIjs9yf9YB8Gd9o34mVKzeqL7UCAE1N?=
 =?iso-8859-1?Q?F4PFzIxK6QCsSQ8bZQ81+3U3knUGGo6dvbRCquqjx9R3ZAnlAj/nJbUlEy?=
 =?iso-8859-1?Q?633TTzHzlsvRqqFON2ubCWWv0OS2u350EGGl6/KHElSp11uQjX/lEhqISL?=
 =?iso-8859-1?Q?5RNUVriz4Z6VzYQvmZY1O5IlmXPDr0mvsmlXQH5zSaanVQsedgSW07KsKM?=
 =?iso-8859-1?Q?b7VGCY7NxBDYb4LVkMPQMs5xC+UkQnelNTPLU2eb8Vky+gf0k9pV0QxvqW?=
 =?iso-8859-1?Q?iWH6WWOmmnmJy2rz5B1A9WtCyYHPvOJ0r5utHNXF8NZ4CcA9lKJFi9s1lR?=
 =?iso-8859-1?Q?anh5Q4GtQU11D+PLImhblr+IxFNR3VhFGCZ7kkCkEgpq8wRqI6hFOv+lDH?=
 =?iso-8859-1?Q?/uzWSeWlRvOWUscBO7yg2crg20mX0prmJskRMC9qdFPEOEdQG2TuYRc2NE?=
 =?iso-8859-1?Q?Jl2EWW6/2Iy1/DtLPEpLduKYMsfmXjhJFdV+xSTXRWPNFpLQQzAZeMVQSM?=
 =?iso-8859-1?Q?GpCegPKJdJa/GIFCOCt7JgxZtyWVsem/1I4HiXceDtYqknN61dGmnUfDSy?=
 =?iso-8859-1?Q?W48yKU6YjX/czsZOq22ZfGNOkbmXRW3PVc2EGFkkRNoP/NgA0w85rNPlvJ?=
 =?iso-8859-1?Q?Eqsx1eIs4+xP8sSN+fKQLY02pZU4IHeJjFbBD93iLQFzGtJAm/1cwcV9oD?=
 =?iso-8859-1?Q?29e9Hbrj51f8CRswLtThpx5Spgvz5XjQ/jauAzY5U1u0z6fYsJQgNxlN2o?=
 =?iso-8859-1?Q?PR7KA2oeKrQYVHsplxaAlqJhiLhScVeI4FZ4F1aTJupNg1CSzFhEU5JbNB?=
 =?iso-8859-1?Q?qCGx4nuXXO3CgLF4GpVu0+BMK038IgKY3v9lo2aYWWLdsIWTGACvBsRdtp?=
 =?iso-8859-1?Q?xAZglENBot9RYBcZfEQwraubshTxzvKvK4AWNSl7rKqqIAoiP/Gy6oD9H7?=
 =?iso-8859-1?Q?dG9xxrgkdkyPpNtDWY95rapwAZN1uFsM/cGH3rHO+gISwQp1e5qe14XDXz?=
 =?iso-8859-1?Q?3sSQmygkrGHFB+8HF1LyQpB/RqYfvBXr2EELaHIYMZG9F48xMFTJlJLqma?=
 =?iso-8859-1?Q?7KZ6fKEfSn59xRSIHPxWUCYPUOKlWQVifaGexF3Jf6BaMmRYHga/KqiCnr?=
 =?iso-8859-1?Q?MI13IJw6CdXp17j6VSH6Kv0GSyWlFLLH62EJ1DcihKxtgt0O3ZXR00uIB3?=
 =?iso-8859-1?Q?vA3LHgHJv0fDUo2T2bIuyCFVrlhas3XZL7msWYWlq1JmkL5FSNChAbkT67?=
 =?iso-8859-1?Q?W0u2Rktl8pyf0cJmDi/6kjYk3PTMiMonZ2wn++3Z2YVGMu5MVCBEXElq2i?=
 =?iso-8859-1?Q?1OQ/Jg1d4ZjlWo3mQpW6ydPMrI10h9tpHSM6d3i6RYzD3hKofZLhzFzeWE?=
 =?iso-8859-1?Q?6APSpOaP/J+zNT8G/GP22JIERVCvsay+qwWWTFqPRZN30CM44LWqIMH1fR?=
 =?iso-8859-1?Q?SkQPwK/aYyRJYLmFxlomNJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xKWBUilEXtbpWJuP9JKEBhUgZwi2tCyWmLcDoxqecsbRBA0mWL9PyQzg8F?=
 =?iso-8859-1?Q?PjmcAxGAwsAbA8T11jqAys4O5QREIOhmhaz7md4izmO/rLPEjq+HdOIvX/?=
 =?iso-8859-1?Q?0KHn7bBujuRKo5Y9XkiySBOWhPo792xHOISr1t+FvcAEn0LJXFvo/nKZps?=
 =?iso-8859-1?Q?3Gm89EOBqzyj0/WWkAa0ICqg5GEUrmUEzo4G5wK79EUSlVEqxR1fIsHecO?=
 =?iso-8859-1?Q?Xt8vKzt5qG4AiR6bHZflr8wxFXzdYmahOzjInariN3eBdpQgRgQIrFqV2Q?=
 =?iso-8859-1?Q?pDow/3L3ndhIDc4PTYHJagFVhe4Xudhxn4hoepz2W9IkQYp8kALTr8WDRP?=
 =?iso-8859-1?Q?GacGLsNpPUJiLvwJfjAd04OTWRbeo8ApluUE3O9RGcMR3t3MtqGaMeOI9/?=
 =?iso-8859-1?Q?NlSzHEM73xuUAeb5gakRceKFZpfDSjBKm8pDs8yx3pzVsJip+SfemuAp7f?=
 =?iso-8859-1?Q?HPWLCw5Ds5kgOulymojkEXM9rClom8874Ilg9FmAhOSprJe88nr+zgx/ZT?=
 =?iso-8859-1?Q?ALRqEPHtpghODFlbkG50+d/z9N0QMYDSLjA5Bjk7uXVktOIzrrtTBkXPTp?=
 =?iso-8859-1?Q?9CXDW4t2YrCTTaIHuVNtrTtGeIbz38/kiJfeLXEg4wjysq8sH4HFbxm/s1?=
 =?iso-8859-1?Q?6GzYOOzaPUjtqbvUVzqYn/aIKDMgg9jjrAXNP6ekBw4RXjqhcSHVzR8Jwm?=
 =?iso-8859-1?Q?hLQvQCNC9R/VJAD064EMAHa7aeplI+/2J2KvFaRRdM2PwmSpW0VO2fteQo?=
 =?iso-8859-1?Q?majkpmed28FhI3A3T/F3vhIfD0yRr6lanBfp1u0sNXtArV1VFX2RRwRNdi?=
 =?iso-8859-1?Q?hRlncI9OKx0A3FrHbrtn/SrY1XlqAzyNfJ6C1Ao+tas+C3VwL5xTWMak3X?=
 =?iso-8859-1?Q?tfWB/G6dLpSTdd/GOMJvsr725YsQlWVykEHX4kA5Im8vP4sSHrsZ2AgWDM?=
 =?iso-8859-1?Q?il2mUb3a6DzKjX/2DCnDEEW9SsN+2Hbk+nlPuQsTdGbHXfvdnTPFaN/65Y?=
 =?iso-8859-1?Q?1+Ws3c5i4aasEUl2o8AdbRBbYISKPRGE1//ABrGBueMDR7ideo9iV95wAF?=
 =?iso-8859-1?Q?YrNjfee0FLaRoIHa5aoGo5i49p77ayBxalig70G6lwjTK+g63pbk2BaaA/?=
 =?iso-8859-1?Q?U/2XuMqaDwVLlbVR58x+hTu7+aHLZigJnPtNF88PXeB19j8zWQA9E/M/g2?=
 =?iso-8859-1?Q?lLf9MC43mi8wIjl6PulqWzh/i0/xYZJSOQV4f5hKLpwZ+kwaliouUz5o7O?=
 =?iso-8859-1?Q?eFhUT814lmJBHvKGDoCQ+PifZGKb5bRIUipkBnB93J2UvEmq3YYMiJlgIO?=
 =?iso-8859-1?Q?PJo8m8Xtr8+toC/rNZcmdlqdJ0SGDLXL1ypmM3+Z9iLpYlnwZyaCTKI1ib?=
 =?iso-8859-1?Q?Q8vU7p/gDb93uwBWtTnxnBVvi+ASa6XdEDParYoeuidPpnNOToR7o6q5TG?=
 =?iso-8859-1?Q?8wzepq+wvUWmU4cqsw+Gx8LUj340NVHGMuOz5x6Fi3zMxcU1N8w6AWMrs1?=
 =?iso-8859-1?Q?7fRJz5UIZ0+fhzli5cSUdjT9FPMDlRGoEGWO2c2OxaWKwSJGn+C4H+jd5e?=
 =?iso-8859-1?Q?XPLebSh3+ZTpQuMETP+i160PpL/hvrasotlr/CtFwEPawuwklTa1KlwAPn?=
 =?iso-8859-1?Q?5l308kjmSHzfoMpN87z2gyG1RhaIoGEjGFGT55JTAheZxnRXWeSLQz9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c78b29-9673-43b3-0eb7-08dd4372e116
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 10:18:03.7871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dj0l9pIlCRydDeziAJjIme1gFArnOw4HAMaqkPj3CY/jOb5v1pPkBHBKEIA1o2GrjsOlJ/g+qh5140UNZaaW3nLV6MB2g2ZGpYkAAmC4wRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9540

Hi Andrew,

Thanks for the feedback.

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 01 February 2025 18:42
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH] net: dsa: rzn1_a5psw: Use of_get_available_child_by_=
name()
>=20
> On Sat, Feb 01, 2025 at 04:33:43PM +0000, Biju Das wrote:
> > Simplify a5psw_probe() by using of_get_available_child_by_name().
> >
> > While at it, move of_node_put(mdio) inside the if block to avoid code
> > duplication.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This patch is only compile tested and depend upon[1] [1]
> > https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renes
> > as.com/
>=20
> It would be good to point out the status of this patch. Will it be in -rc=
1?
>=20
> Since netdev is closed at the moment because of the merge window, you nee=
d to repost anyway, once it
> repopen. The tree you will be basing your patch on, net-next, will includ=
e -rc1, so you won't need to
> mention the dependency.
>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Thanks. I will send next version once the dependency patch hits on net-next=
.

Cheers,
Biju

