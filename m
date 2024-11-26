Return-Path: <linux-renesas-soc+bounces-10706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600A49D9477
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BFBC1658D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA511B6D04;
	Tue, 26 Nov 2024 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="b7XN0F/o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B219258B;
	Tue, 26 Nov 2024 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613325; cv=fail; b=cywOUNdtzuLuupThrKn3NzNbLTE7BSYPoFO7mAwahZQkydyCm+7aLP2EXHtbPxRWY93SBsky32fMYajIg+xpIWRcVlKt8zZOSYavP//UAiRt0MZ7cJlS7k180J+Np8X3Bk1bgZi7YHKy8UDX8WAkGBwjLX7ODjUM7Bc+P05dAhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613325; c=relaxed/simple;
	bh=fnOpIBY18YKA9UbRXKbEBpYfx/rsS09VSmOnXPwefuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G6tD8YZYYNmL9kfScRDqiSrbN4Ts9Oeei84X6GnYXWO36OjTGk2bvtxDpbr063+Id63V8oAVH7vxBzgt5bddqSBQ9wPQHeCRkgBiGS6XcyFocyFa2mf4MeOoBvQMMQHJRXip43cdxuSubQ79zrjKt6J18Sv5HL3ckn+FYFs/YM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=b7XN0F/o; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbmT6j5e+oVllKu6AAHBH/YTbpfpqIRsaIVHaTP5dK1EdLxyPMULl+cDz0s6f6hsUjP127xjx3CIeOOligaj3a8AwuP6wzrd1jzxv0f44IZ58eAdC1oNyG9WgTi+vOpsaTIwJW0PrBp3+NFp5xR7TXraR0yPx7dRu/CfbHzceIpZ5AKf5iDhTUJiFrT0Q0Mw2UqnsRDfK8klIXBt3LnlZhQO5XXJ+G8Bho/hqA4osnJ13wnrJG7hFJtVSRhfhjSBkjS7+V1xbLd9jnugDqa/2HYY7x628dOnLk6pCLlhoZHcOTteaI+sV48envaKOJxXQZg/LEveEP2a6HKrENFfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BopX6XdzFFE93/PBwPuJZQ3oJ1sjQlwr16ALSpgn+sU=;
 b=o32cOAUsIvaTyw3BzsLi3UPEmFighV1ceosts9ErlpuU179w3IbcXbK2zDwWUfB6SFLGXHkHaoQjAa4qWP0cGDBTEb9eVfMdVfOdtgfZ2OtdSzE9KNk/hxFtqSvVTScTizFE+fo939geRAIZh7dNdhh0h8LJo+/ez/MMRkOHmmkDNhBck4FXcO5H2wRCxQWA+gRoN64iwD6cGb7iKjgcZUu29f5XsUcHVgs1lTaMA5KLwDZ0QtiNmSmVafe2jJZxrI+Me+IUYX7wM0sDW+JPufGI8fIWv4zX6bPFZk5wWtL/OZXYQwpvINw7zsrHiJMyuelT09VP0FvaKYnAEPA3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BopX6XdzFFE93/PBwPuJZQ3oJ1sjQlwr16ALSpgn+sU=;
 b=b7XN0F/oO/49oWSfAEp8NHNyszOL3PTpLZfEvo3l2oBToi31xX1Rs/pSXsoA+zEuq3b7cSpdNI4/WURIpm4VzD0jIjTd0XOSNzD/go27c1PV/xe2ghFgSJ0fD7FtvpjMBBRw4dnUDwsnlFsoTtMZyhfmTyGhz5jgyEyOBQOhgqc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10381.jpnprd01.prod.outlook.com (2603:1096:400:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 09:28:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 09:28:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Topic: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Index: AQHbP+SZef71s6SoPkyzSsFLPei/obLJSsNQ
Date: Tue, 26 Nov 2024 09:28:33 +0000
Message-ID:
 <TY3PR01MB11346C9A56B483666575EB23A862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10381:EE_
x-ms-office365-filtering-correlation-id: 78a1c0c4-468a-40d2-5e25-08dd0dfcb2b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cHmCsRJqArI/tqmLatzZusvaCAesSEZZ7XFyFyIK6mFkVD31Ktz0zn9FmuXu?=
 =?us-ascii?Q?NF28o6X1Zzeuwa3X8mVljI7V4N1xuVBIB9/5FpA0g45r+Q1gy9hrT+iC2a22?=
 =?us-ascii?Q?ifmjhwfLmz9uI+sgr14cdBB7duX2oIN8PjHgB3TNovhy6+jYY3LbxdVbmThl?=
 =?us-ascii?Q?JVqP5E2hfqI+zlmEr9UqFbgbqowGjaNe4PZulbEvhCdA81qsLVfmmH0zBCYn?=
 =?us-ascii?Q?aJiOys5JvQ9ddGbUDsSflXB4MZ2iz5SMBs9pNpwEBwrKqnEi9ugcBeUmN866?=
 =?us-ascii?Q?CO5f6IFmy1SmnQmLVWDxrGRU22yE8D0ZvcreWot0QuSVTFZfknJn9SREc1+m?=
 =?us-ascii?Q?Z0TYm4pjrWBXG7UguAV3Avu8wgO0TJxMgX9DE4vLAF04xxJCQ7YiqS5AYY3r?=
 =?us-ascii?Q?ruCLlWzresfwLFJ8OoMTbmXI1g54p0+2k2S240OE23vJ+DkrXL+mYhEcD2fq?=
 =?us-ascii?Q?HSpeOBNkzyXX7zAQZO6BRb9ew6n8Q/7SYf+TSkNi9Y/7Dq0F014lt7eGPdRo?=
 =?us-ascii?Q?8UigODrd2z+glwyBYJJ2mtlGoJRSWDbKVBuAIywfWEg5kqrSFGxcoxQ6MDSt?=
 =?us-ascii?Q?jVlpi+t296f9s6QVkpbMpql6jwVI3+kya7hQfQ5IByi/xoyFODFEfEyndP3Z?=
 =?us-ascii?Q?H/b+3vypVqIhXkBK//o8zhFNIH+w9MDN7vPifS5jxNjCRN94xTg+Cg6XWHyr?=
 =?us-ascii?Q?3vi1AwD67N3knoTeGocKnAiG6XfSsM0Sjp70rnZyXMYsikTaPvsuQzap9pWf?=
 =?us-ascii?Q?2Lc0xLvuEp5HeSYRlKXd/v3yktMRX/KxOQOLmYiuC8W6dyruUxIxogdrwC8X?=
 =?us-ascii?Q?89e9Qxs5/lXDGOoh2NeX696no9rJsBv6pEeAxlCUYHgyQj9IxdbMQVEJcBX6?=
 =?us-ascii?Q?h2sb8bQ8lswlhW1w5464dtJNOIW41QkgToXbJ85DqjO+NjdtoKKl/ueWMbOA?=
 =?us-ascii?Q?1UhBtyhr2YDjOOS4ycnh2mWbU765+vVZTyitlV+9+KM0Src1v0Jj0qVBIL0F?=
 =?us-ascii?Q?hA1waO7y1qHYOiD20bgixKi82z3U4XSXoubf1B3U/V+U7+xlj4RRoTdofyBR?=
 =?us-ascii?Q?YwZNWRm+2FviHxmE1fYWld1gSZmR6/mGdERKTWSC51VyrmVTIb/2nCNNuDJe?=
 =?us-ascii?Q?2NXvjwCxwyWPHzr95ZhHyzmuR+AHy5gTzTTGq0n8JwDycUF0589RZ+KXFoxE?=
 =?us-ascii?Q?PxxKoCTP5nz0xsVqJKOgX+++aYH0KJNKn56CoAPSA41tAoFnNkDIrOjccGlE?=
 =?us-ascii?Q?7NeJkzNlcsMtcY9Z4rdFvgcogIe8daZsIGu6rldjaUT0mTkKcj5NqIyJhkb1?=
 =?us-ascii?Q?vmaq29bj/ldxrDNWYR5X093CvCsdOzI5iq9uLyXUpZjsV9+Znt4Vc/BVwAo7?=
 =?us-ascii?Q?uVJZ8Bw0O1bBXVGP0JY7Ca5+raHt9N589rdXLZlMZWmVOiEwsWW7Wt+cQpWT?=
 =?us-ascii?Q?M9+n66eXMyc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fXuO6VsEcSrPFgTgWeNMRlNNPTIIap7q/v3WWU2erfXSaEbPdcT1xhrSnuKg?=
 =?us-ascii?Q?Xu9EwYvRLFf8aThnTo+uDgoSVY2r7qIn8Hj2BfsdQAyJy+BRSWHYmE345Ip0?=
 =?us-ascii?Q?23OEe0bsQCBs8x39Wbe8hiuifK1JrvGzM56q5QTXHwNcGXKEzrD+vnogAWxx?=
 =?us-ascii?Q?KTF2RAlT7LQ6lZu3fC3yc/4/c04RWUQOOXDwdRtWoBdNrJKfDolAmCEVPKgM?=
 =?us-ascii?Q?QXsMPnktR7gAxGy9vMY+0f/gLoIcCIcyUleHUz2yQkolLYR3t5eBchAJfa8x?=
 =?us-ascii?Q?YRt3VoOx3ddGOROH5+kJja1SJ2r8ILOxXENC3K+97MVqhexbC1fjJvdzm6dK?=
 =?us-ascii?Q?7uWV9Z2yrYIjgfHl72duGgbrgLw2GbbLiVw3hHu0foxinZneol6Yv1T+eRSz?=
 =?us-ascii?Q?7sX4HMlLJnb8ujtgazKbEi3G5CRvvLs1ijIJ0lo7mETrp0NW7/FD2MszR5Qg?=
 =?us-ascii?Q?GD81babn7SmkV93+EtbtVqH4MsmUvLuafDRizeUtOpvqwTMDufIw7BTY/Vmh?=
 =?us-ascii?Q?H6MZqMX2NkRxxRSowmjchiaqNq0r1hvTC3L5sOeeNKv7yEC3YfHJS6I6ObLS?=
 =?us-ascii?Q?7Tr7b9fSLbQR6lb3EegTFHXiSOu99+LjE6n6QaR0VQSHMekBlgltk2JzZlcS?=
 =?us-ascii?Q?8/GZ7S+TiLt3kc1/BMrpPv1nPkIeZm4ItnAtXw3OME3HOx/fZ1YiVjcMaWqF?=
 =?us-ascii?Q?ptBcFW/eTMJbx819MNEXDNMAySGZiAv3w4aVzbnD/zwoEdNd4a8wqPAQ86b1?=
 =?us-ascii?Q?BgbZi4/h+cij2erVMga6LtYGPJrzSHtKmOucbZU3F9HJDitAZS/+205/X1ne?=
 =?us-ascii?Q?b89R/Z82YWqvAAz5xwGrSQokvlONR0WHlyXbtazseqG36OfKB11cq3TbBpDJ?=
 =?us-ascii?Q?gSfywyCt+8x0564WXeAjiFrbaLqXIMALrkU+bwCH3aa1KeetUScZQ98J270E?=
 =?us-ascii?Q?CaTJFObr+5WHhaERLMhJlT1IZaW8kAlUx2bVNUTPxBG/28QdIYE5KT3n/pGg?=
 =?us-ascii?Q?myir21kaXvQ6/s4JPQbsRJz52sE7MFk4qEjYzxIIk2tOV1lyJeNJYvyb1dvu?=
 =?us-ascii?Q?bSXE7oiCKk397a5JQGMzc86D0SG62RSv9lEjpx5uQx0QxngzQvjRUAvWWNKI?=
 =?us-ascii?Q?yMNeT6h54hYmp7uvHFJTBHNDBEKbnUVsR9OwH62YjuihYSNIKd+1ej3Mazq8?=
 =?us-ascii?Q?vtTFWdGcKX9UoWLdIINidlqbhl9kLGtifqd1nMOEh72SEQaE8GsjOo/3I7Gn?=
 =?us-ascii?Q?bLzBCj4jGHw/U+HBasFCpYDmrMOGPztNVMhcU3gSo4ZyUF1l5gxzLYO2elTZ?=
 =?us-ascii?Q?9c4nkhP7vOUcaKXOWI6oou8SuRfvTM9TKpKQYnc/42zSw/G9LKPNt3UTWTE6?=
 =?us-ascii?Q?SxuHGliQM6p0MCPwrPEH4o25Az5BRqDMMz8S/e0xIeUQgwi0+jix4hilGBxs?=
 =?us-ascii?Q?GrHW8n+cZBUiLnKWubU0B893Mdrotu8TJXBDuFoZbOZaaaCDYtepaQD0DRw2?=
 =?us-ascii?Q?fexDq6cBVY3IXjQKcUSpPBI3TnlmHJazv6HBnXHF7dHZK9yOQIPs/mNAX+hM?=
 =?us-ascii?Q?Tj0a8YsSJyWcbcFgc7GcMFitRhfC4Z3vKY5fOw2U3/XZmlPYjrMLXTElJk7R?=
 =?us-ascii?Q?9A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a1c0c4-468a-40d2-5e25-08dd0dfcb2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 09:28:33.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXkHhWyXCcafwzoYSw6AQkSqWJOHtkDXNQsP7W6wu9pEjj1+n93CDyIiFCIyrRhiAAWn6ToORTxzllE/Sf0cnnyO7aSVXZaWgiuyxMSvdY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10381

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 26 November 2024 09:21
> Subject: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ fa=
mily
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The RZ/G3S system controller (SYSC) has various registers that control si=
gnals specific to individual
> IPs. IP drivers must control these signals at different configuration pha=
ses.
>=20
> Add SYSC driver that allows individual SYSC consumers to control these si=
gnals. The SYSC driver
> exports a syscon regmap enabling IP drivers to use a specific SYSC offset=
 and mask from the device
> tree, which can then be accessed through regmap_update_bits().
>=20
> Currently, the SYSC driver provides control to the USB PWRRDY signal, whi=
ch is routed to the USB PHY.
> This signal needs to be managed before or after powering the USB PHY off =
or on.
>=20
> Other SYSC signals candidates (as exposed in the the hardware manual of t=
he RZ/G3S SoC) include:
>=20
> * PCIe:
> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>   register
> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>=20
> * SPI:
> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>   register
>=20
> * I2C/I3C:
> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>   (x=3D0..3)
> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>=20
> * Ethernet:
> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>   registers (x=3D0..1)
>=20
> As different Renesas RZ SoC shares most of the SYSC functionalities avail=
able on the RZ/G3S SoC, the
> driver if formed of a SYSC core part and a SoC specific part allowing ind=
ividual SYSC SoC to provide
> functionalities to the SYSC core.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Change in v2:
> - this was patch 04/16 in v1
> - dropped the initial approach proposed in v1 where a with a reset
>   controller driver was proposed to handle the USB PWRRDY signal
> - implemented it with syscon regmap and the SYSC signal concept
>   (introduced in this patch)
>=20
>  drivers/soc/renesas/Kconfig          |   7 +
>  drivers/soc/renesas/Makefile         |   2 +
>  drivers/soc/renesas/r9a08g045-sysc.c |  31 +++
>  drivers/soc/renesas/rz-sysc.c        | 286 +++++++++++++++++++++++++++
>  drivers/soc/renesas/rz-sysc.h        |  52 +++++
>  5 files changed, 378 insertions(+)
>  create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c
>  create mode 100644 drivers/soc/renesas/rz-sysc.c  create mode 100644 dri=
vers/soc/renesas/rz-sysc.h
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig in=
dex
> 9f7fe02310b9..0686c3ad9e27 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -378,4 +378,11 @@ config PWC_RZV2M
>  config RST_RCAR
>  	bool "Reset Controller support for R-Car" if COMPILE_TEST
>=20
> +config SYSC_RZ
> +	bool "System controller for RZ SoCs" if COMPILE_TEST
> +
> +config SYSC_R9A08G045
> +	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
> +	select SYSC_RZ
> +
>  endif # SOC_RENESAS
> diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile =
index
> 734f8f8cefa4..8cd139b3dd0a 100644
> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -6,7 +6,9 @@ obj-$(CONFIG_SOC_RENESAS)	+=3D renesas-soc.o
>  ifdef CONFIG_SMP
>  obj-$(CONFIG_ARCH_R9A06G032)	+=3D r9a06g032-smp.o
>  endif
> +obj-$(CONFIG_SYSC_R9A08G045)	+=3D r9a08g045-sysc.o
>=20
>  # Family
>  obj-$(CONFIG_PWC_RZV2M)		+=3D pwc-rzv2m.o
>  obj-$(CONFIG_RST_RCAR)		+=3D rcar-rst.o
> +obj-$(CONFIG_SYSC_RZ)		+=3D rz-sysc.o
> diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r=
9a08g045-sysc.c
> new file mode 100644
> index 000000000000..ceea738aee72
> --- /dev/null
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3S System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/init.h>
> +
> +#include "rz-sysc.h"
> +
> +#define SYS_USB_PWRRDY		0xd70
> +#define SYS_USB_PWRRDY_PWRRDY_N	BIT(0)
> +#define SYS_MAX_REG		0xe20
> +
> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_dat=
a[] __initconst =3D {
> +	{
> +		.name =3D "usb-pwrrdy",
> +		.offset =3D SYS_USB_PWRRDY,
> +		.mask =3D SYS_USB_PWRRDY_PWRRDY_N,
> +		.refcnt_incr_val =3D 0
> +	}
> +};
> +
> +const struct rz_sysc_init_data rzg3s_sysc_init_data =3D {
> +	.signals_init_data =3D rzg3s_sysc_signals_init_data,
> +	.num_signals =3D ARRAY_SIZE(rzg3s_sysc_signals_init_data),
> +	.max_register_offset =3D SYS_MAX_REG,
> +};
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.=
c new file mode 100644 index
> 000000000000..dc0edacd7170
> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/dcache.h>
> +#include <linux/debugfs.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/refcount.h>
> +#include <linux/regmap.h>
> +#include <linux/seq_file.h>
> +
> +#include "rz-sysc.h"
> +
> +/**
> + * struct rz_sysc - RZ SYSC private data structure
> + * @base: SYSC base address
> + * @dev: SYSC device pointer
> + * @signals: SYSC signals
> + * @num_signals: number of SYSC signals  */ struct rz_sysc {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct rz_sysc_signal *signals;
> +	u8 num_signals;
> +};
> +
> +static int rz_sysc_reg_read(void *context, unsigned int off, unsigned
> +int *val) {
> +	struct rz_sysc *sysc =3D context;
> +
> +	*val =3D readl(sysc->base + off);
> +
> +	return 0;
> +}
> +
> +static struct rz_sysc_signal *rz_sysc_off_to_signal(struct rz_sysc *sysc=
, unsigned int offset,
> +						    unsigned int mask)
> +{
> +	struct rz_sysc_signal *signals =3D sysc->signals;
> +
> +	for (u32 i =3D 0; i < sysc->num_signals; i++) {
> +		if (signals[i].init_data->offset !=3D offset)
> +			continue;
> +
> +		/*
> +		 * In case mask =3D=3D 0 we just return the signal data w/o checking t=
he mask.
> +		 * This is useful when calling through rz_sysc_reg_write() to check
> +		 * if the requested setting is for a mapped signal or not.
> +		 */
> +		if (mask) {
> +			if (signals[i].init_data->mask =3D=3D mask)
> +				return &signals[i];
> +		} else {
> +			return &signals[i];
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int rz_sysc_reg_update_bits(void *context, unsigned int off,
> +				   unsigned int mask, unsigned int val) {
> +	struct rz_sysc *sysc =3D context;
> +	struct rz_sysc_signal *signal;
> +	bool update =3D false;
> +
> +	signal =3D rz_sysc_off_to_signal(sysc, off, mask);
> +	if (signal) {
> +		if (signal->init_data->refcnt_incr_val =3D=3D val) {
> +			if (!refcount_read(&signal->refcnt)) {
> +				refcount_set(&signal->refcnt, 1);
> +				update =3D true;
> +			} else {
> +				refcount_inc(&signal->refcnt);
> +			}
> +		} else {
> +			update =3D refcount_dec_and_test(&signal->refcnt);
> +		}
> +	} else {
> +		update =3D true;
> +	}
> +
> +	if (update) {
> +		u32 tmp;
> +
> +		tmp =3D readl(sysc->base + off);
> +		tmp &=3D ~mask;
> +		tmp |=3D val & mask;
> +		writel(tmp, sysc->base + off);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rz_sysc_reg_write(void *context, unsigned int off, unsigned
> +int val) {
> +	struct rz_sysc *sysc =3D context;
> +	struct rz_sysc_signal *signal;
> +
> +	/*
> +	 * Force using regmap_update_bits() for signals to have reference count=
er
> +	 * per individual signal in case there are multiple signals controlled
> +	 * through the same register.
> +	 */
> +	signal =3D rz_sysc_off_to_signal(sysc, off, 0);
> +	if (signal) {
> +		dev_err(sysc->dev,
> +			"regmap_write() not allowed on register controlling a signal. Use
> regmap_update_bits()!");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	writel(val, sysc->base + off);
> +
> +	return 0;
> +}
> +
> +static bool rz_sysc_writeable_reg(struct device *dev, unsigned int off)
> +{
> +	struct rz_sysc *sysc =3D dev_get_drvdata(dev);
> +	struct rz_sysc_signal *signal;
> +
> +	/* Any register containing a signal is writeable. */
> +	signal =3D rz_sysc_off_to_signal(sysc, off, 0);
> +	if (signal)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool rz_sysc_readable_reg(struct device *dev, unsigned int off)
> +{
> +	struct rz_sysc *sysc =3D dev_get_drvdata(dev);
> +	struct rz_sysc_signal *signal;
> +
> +	/* Any register containing a signal is readable. */
> +	signal =3D rz_sysc_off_to_signal(sysc, off, 0);
> +	if (signal)
> +		return true;
> +
> +	return false;
> +}
> +
> +static int rz_sysc_signals_show(struct seq_file *s, void *what) {
> +	struct rz_sysc *sysc =3D s->private;
> +
> +	seq_printf(s, "%-20s Enable count\n", "Signal");
> +	seq_printf(s, "%-20s ------------\n", "--------------------");
> +
> +	for (u8 i =3D 0; i < sysc->num_signals; i++) {
> +		seq_printf(s, "%-20s %d\n", sysc->signals[i].init_data->name,
> +			   refcount_read(&sysc->signals[i].refcnt));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rz_sysc_signals);
> +
> +static void rz_sysc_debugfs_remove(void *data) {
> +	debugfs_remove_recursive(data);
> +}
> +
> +static int rz_sysc_signals_init(struct rz_sysc *sysc,
> +				const struct rz_sysc_signal_init_data *init_data,
> +				u32 num_signals)
> +{
> +	struct dentry *root;
> +	int ret;
> +
> +	sysc->signals =3D devm_kcalloc(sysc->dev, num_signals, sizeof(*sysc->si=
gnals),
> +				     GFP_KERNEL);
> +	if (!sysc->signals)
> +		return -ENOMEM;
> +
> +	for (u32 i =3D 0; i < num_signals; i++) {
> +		struct rz_sysc_signal_init_data *id;
> +
> +		id =3D devm_kzalloc(sysc->dev, sizeof(*id), GFP_KERNEL);
> +		if (!id)
> +			return -ENOMEM;
> +
> +		id->name =3D devm_kstrdup(sysc->dev, init_data->name, GFP_KERNEL);
> +		if (!id->name)
> +			return -ENOMEM;
> +
> +		id->offset =3D init_data->offset;
> +		id->mask =3D init_data->mask;
> +		id->refcnt_incr_val =3D init_data->refcnt_incr_val;
> +
> +		sysc->signals[i].init_data =3D id;
> +		refcount_set(&sysc->signals[i].refcnt, 0);
> +	}
> +
> +	sysc->num_signals =3D num_signals;
> +
> +	root =3D debugfs_create_dir("renesas-rz-sysc", NULL);
> +	ret =3D devm_add_action_or_reset(sysc->dev, rz_sysc_debugfs_remove, roo=
t);
> +	if (ret)
> +		return ret;
> +	debugfs_create_file("signals", 0444, root, sysc,
> +&rz_sysc_signals_fops);
> +
> +	return 0;
> +}
> +
> +static struct regmap_config rz_sysc_regmap =3D {
> +	.name =3D "rz_sysc_regs",
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.fast_io =3D true,
> +	.reg_read =3D rz_sysc_reg_read,
> +	.reg_write =3D rz_sysc_reg_write,
> +	.reg_update_bits =3D rz_sysc_reg_update_bits,
> +	.writeable_reg =3D rz_sysc_writeable_reg,
> +	.readable_reg =3D rz_sysc_readable_reg,
> +};
> +
> +static const struct of_device_id rz_sysc_match[] =3D { #ifdef
> +CONFIG_SYSC_R9A08G045
> +	{ .compatible =3D "renesas,r9a08g045-sysc", .data =3D
> +&rzg3s_sysc_init_data }, #endif
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rz_sysc_match);
> +
> +static int rz_sysc_probe(struct platform_device *pdev) {
> +	const struct rz_sysc_init_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct rz_sysc *sysc;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	data =3D device_get_match_data(dev);
> +	if (!data || !data->max_register_offset)
> +		return -EINVAL;
> +
> +	sysc =3D devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
> +	if (!sysc)
> +		return -ENOMEM;
> +
> +	sysc->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sysc->base))
> +		return PTR_ERR(sysc->base);
> +
> +	sysc->dev =3D dev;
> +
> +	ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data->num_s=
ignals);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(dev, sysc);
> +	rz_sysc_regmap.max_register =3D data->max_register_offset;
> +	regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return of_syscon_register_regmap(dev->of_node, regmap); }
> +
> +static struct platform_driver rz_sysc_driver =3D {
> +	.driver =3D {
> +		.name =3D "renesas-rz-sysc",
> +		.of_match_table =3D rz_sysc_match
> +	},
> +	.probe =3D rz_sysc_probe
> +};
> +
> +static int __init rz_sysc_init(void)
> +{
> +	return platform_driver_register(&rz_sysc_driver);
> +}
> +subsys_initcall(rz_sysc_init);
> +
> +MODULE_DESCRIPTION("Renesas RZ System Controller Driver");
> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.=
h new file mode 100644 index
> 000000000000..bb850310c931
> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ System Controller
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
> +#define __SOC_RENESAS_RZ_SYSC_H__
> +
> +#include <linux/refcount.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct rz_sysc_signal_init_data - RZ SYSC signals init data
> + * @name: signal name
> + * @offset: register offset controling this signal
> + * @mask: bitmask in register specific to this signal
> + * @refcnt_incr_val: increment refcnt when setting this value  */
> +struct rz_sysc_signal_init_data {
> +	const char *name;
> +	u32 offset;
> +	u32 mask;
> +	u32 refcnt_incr_val;
> +};
> +
> +/**
> + * struct rz_sysc_signal - RZ SYSC signals
> + * @init_data: signals initialization data
> + * @refcnt: reference counter
> + */
> +struct rz_sysc_signal {
> +	const struct rz_sysc_signal_init_data *init_data;
> +	refcount_t refcnt;
> +};
> +
> +/**
> + * struct rz_sysc_init_data - RZ SYSC initialization data
> + * @signals_init_data: RZ SYSC signals initialization data
> + * @num_signals: number of SYSC signals
> + * @max_register_offset: Maximum SYSC register offset to be used by the
> +regmap config  */ struct rz_sysc_init_data {
> +	const struct rz_sysc_signal_init_data *signals_init_data;
> +	u32 num_signals;
> +	u32 max_register_offset;
> +};
> +
> +extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
> +
> +#endif /* __SOC_RENESAS_RZ_SYSC_H__ */
> --
> 2.39.2
>=20


