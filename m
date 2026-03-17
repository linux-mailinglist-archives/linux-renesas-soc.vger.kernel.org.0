Return-Path: <linux-renesas-soc+bounces-29604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O2kJnNOuWnj/wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:52:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573B2AA266
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0BD230B013D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 12:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25C43C5DBA;
	Tue, 17 Mar 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s64xfP7m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC733C5552;
	Tue, 17 Mar 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751840; cv=fail; b=JeEbbBklSeDNjz1geXeMAhxoH3n2FGhhApJi4lL+mUOGtFdsiBB/AYqP0HNW/GQ+czGV6bFMGZKmPMh29d2bJTID9l3+2e33/6E3h36ydiwRS1RBGtt/WTn7npvwf3xWA1oAWbOb3tFILhi97UE1Fk8yzhRPUECB9iprnqfU9pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751840; c=relaxed/simple;
	bh=OAM0TFOMoI53Wt6oE58dZAZz/Izw+IJeUtI78Ai7Zl0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HPHtSVVz9zsn0YgFnhxSNL1ZYk7CHFGCoSkSneqYTFGYeEGDgI0uYIcCGxFkX5PHMe50RieYEyL2y/MqfhNdt2uWzPZv2o+JuAnPaSLM7MQFYtsGNKTIf/ERssCyZSJrGTb8JwLMAiwHFRAgviix1vzGd0Y4fOcSSyDPqwZxO7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=s64xfP7m; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diIk9Rb4zMmS29/a/N1eimi31LbFN0Y1EpOn6kdOtItxDkZSAfnOrw0abXCRNmpBQci1cNJcV9PXX+ZShvqaVr0Dej63d95+0KJMuPFJBTLAjXTtN548J59tjPcC4sc6qRwVSTsUJhviUeFZglkj4rhqP6fATBvlHlgLRKg0yWtkJ0e1C+1KxRJ4qVrhfW2ufOlld5j/sCmSBOyFYFjbjw6WeSFhPchR7lBH6tari6nvLVSwiZeH5MoTwKx6r26SG7yQhjcj1Q4hgW2tjjWLEnpGv7T9IMlEEkuJNlY1YB5pmIBWUAW2xMDIBr/Um1Q4TPZSvNv7xnO3HWYTIzoewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFgfEM3Zlm4cfE5SoB16r7rAKMgob1nAhUNJEhz9KR0=;
 b=t6K6wbpdisnGjpywwBwKoz7/fmi6my5h1akw7/LGiX3MisT33tAQrAV3Je5B2ph4tA5E2wL+ArRgelythFebITz74matCKvQVRTeiEy9QPwBsyz7c7eyQrGkz554GaRy1WndtE+ovy/UGQOrUGTbQFJfUg20XeWTB9Ykxr9lS5rSNV8nxX2hUf381/0MbuvJ2Z9vP9ZVXh7ybsoZNV+5NM339D2qCfQZVghDJ0477zo3Z1CPCfEs71FejsOlYfdw/33JWHBW2DIr9mA1onVLWioomO2f2f7cSa1Nrtwz7rmw4QnH4qdShHdzkPa6q2A48h7yb9V8nLT46sxVU43gpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFgfEM3Zlm4cfE5SoB16r7rAKMgob1nAhUNJEhz9KR0=;
 b=s64xfP7mojMjvdfEVaB0UqqVh8CtGJ58tIJFLuXGguqdIPgqDWY09fjQ7+RjZX/aQtrzWsYmK8QovHbySEWgbqoG41B4q0P3cyWO7hqlFVlSZjrOs/a6mRLr6eT7fICr9qAF42u+R2I52y8FB8IZukuqoiX8Ri5wf7OzyGDcEnk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16070.jpnprd01.prod.outlook.com (2603:1096:405:2ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 12:50:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 12:50:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, geert <geert@linux-m68k.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
Thread-Topic: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to
 OF data
Thread-Index: AQHcnQX6QRn9VDLlIUu6i6kMHzIo37Wy3jzQ
Date: Tue, 17 Mar 2026 12:50:36 +0000
Message-ID:
 <TY3PR01MB1134613D59A93FC741A3715678641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <54edf1fa30f571686b55a4d67a2b100089739d10.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <54edf1fa30f571686b55a4d67a2b100089739d10.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16070:EE_
x-ms-office365-filtering-correlation-id: 13584342-39fe-4c94-c38d-08de8423c8da
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 ++FsZywDcTkwm/dRnerAeXAr9Ly93sbF/+ezW6WX5x1s6qM0WN17182SFzI9YlwhcGptti7sfkvP2BRyPSl5H6QvzwOkD0VeZ+qKlBqzhcliSTO2v/sKMSHn0tEYzPmiKUp0mJ0XZiLRYla19uealiifLSTcYQtwChDlDKOhs9ts2OCOm2NsJkRZyb25w4/wZxbH4MzRyWfAKAXBjX0K2J+QlwZCeEmgGjPuq1Gj12ySOcF/gd17bcICPorr5acR4cb877l+DvwmX1Btcj6W68IBCNMVyn3cYde5LN1C866LQQgtnDO91JFjR+47c3SZMIHPH5RWAZ6MPAmEleI3ZiScFAKqtu+ySCkZi/3xKFtxw9kf2lzQOwoXDEArf8+RRTXsXfOhRRXkZRNu1d9g2qNiXquUiGEnSeD0hkXndC4nWQoR3Qrq7S1WnANWApSS1nGww8Xqlh7Dmjg4CDSXa6VYjx5f2cn1DQroaKOM4PuK3qcI9ODz0+DZWr87hQRYxK1caVdwZfH6tsi1uQjEzI1Py+5NLCiD+1/7tKN1krrjbRi9ZasCfl/4STQUouvybRiOtTf7aLb7MKz/T8iaZimwnBCBcjCCKZf44GJrgIx5TYLfjO2LUh6y0v9L81jjm1gFd5Z52dg+w7kOOgwWjssG6tWrr3K5dcV6Bquz65NRLaP07q3/jo6sf+gs1Xn1ky0K17QT+t7jLw+Ym05xNleL4VkH/MDybNJnxbQevA2aa1sJnkyByeiat529yvA0xWFrx39t7zsk+D2xucYCZzKF+9CyzuGUsIcHwocqQPk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yM821DeyNE47kkAuq7efUz2OPr5b4tk1ecJbXW02vHRESrPjsDDmcbAm1j7c?=
 =?us-ascii?Q?nqtRYFb0MOpbHddhufcje4N5HPH6GyXv7hHgYNe1DPODXj8ZklCu3FHfO6Qi?=
 =?us-ascii?Q?1bRBkQA0Lz5MOL7bt33xanTpdsH82PDEfOBCG5zAf5ytscjgM3W8EMA7kbrU?=
 =?us-ascii?Q?Mo/DZo+RXZGy7XNpiu/okXGFuwleLoas861JO7jYgqUvp2v+qY8wdfC28kiJ?=
 =?us-ascii?Q?jQJMA3bWsALUgI1QpnmTZyEZwslfPAwZcSbMKha3JJsRBi3Qf7v0OJFtrqXN?=
 =?us-ascii?Q?UFOwx82aKXLwr11DT1k6Tb/NPInz/IFegVeVuYeJx2zFHDYuOqMXVGzkCxyi?=
 =?us-ascii?Q?rNmiHkdXC9cpcZIvocUS4YgGup+hV2wAxDLS4b747J/umHrWXTle2Fqoy7aY?=
 =?us-ascii?Q?VW+Ngic6UvqbS2HQ1nSCXoZrAw6pf4qexTmwUZRtFZJhryMrxIYsaHNiTBWe?=
 =?us-ascii?Q?XeaEkwYTX0RGnIawlPrq8WoqKeBg6dzthA5+3Fb1zVDKrZWu6yZdrPncNQoW?=
 =?us-ascii?Q?OJzvatq3jUlAbH3NhwR//V/Utw4p4M3NCSgobfn9REw+n4w4THHbPKVmF0Wr?=
 =?us-ascii?Q?r5hBiaDmbtemaowOZdibPoptVfqe4xuN68skxERc3JtS4tVfXYUgZpf+QopN?=
 =?us-ascii?Q?P/aFfuYrxzTZRETCiLg8Njpvv98zTfoAK3XK6+XZgwbscQ8YCCld/+d3Zez1?=
 =?us-ascii?Q?7ud/9bHTJyjCGv1gaq6A3GyZsDc3HsOxNwBwdrXo78oMkRCbvpG3abBqg0zE?=
 =?us-ascii?Q?eF7oo52gi6uVrQRxJF3f1rFA09xwPZTaDydiIceqaRgVsSX3xY8Tsw2EWaYG?=
 =?us-ascii?Q?QlRZ9Rm9InBmxJsYikWWJa3eX/MWObw4jrY0Ok94YgcEXoV9Gw6OmGHYCAtU?=
 =?us-ascii?Q?JhW/Sr3ANwX02kMWdTwlLql7u54mhgZxBC386qsqQLli/90fFj0khmpYSdQG?=
 =?us-ascii?Q?XPm5S0lfh6CpJRJJoHi7KADYfSjBHZJvOdPjCeX6rlzxb2KVgWpKiqbZYsAv?=
 =?us-ascii?Q?FxKgoyb1C2DNbmXJQmL1SaDQzykkb3nZoLv7VNUbdOTg1oweyZt9fgas7MiT?=
 =?us-ascii?Q?2GFyjJ46agJX6oA2/ToXwsvExbbaogMeE36ctQrt4RBTmOyZPazBw4mAthha?=
 =?us-ascii?Q?WMy3gtuvxJCu8WtLgYvFzCCFU5lrlRw5IbCLidU/9ThLf51VpHc22Muv/chR?=
 =?us-ascii?Q?sq0LYciQklbCNGwxT336tx0PsFNeXeTjBUqRiOfvX90jmpgkiho17yDf0Lzk?=
 =?us-ascii?Q?fl+3pvVQahwd8iwMzzl+uL4tVVMfZTjuWAk7KAm608tfzMOhgpwD/9LUp9NU?=
 =?us-ascii?Q?jD1INpRCYFNJ38vGW4UDhSPMiHgnxjvNjSU4IC2S7Ow70jN0m00YYnAt7rHu?=
 =?us-ascii?Q?0PBxzKK5xR4fj0Ax+8SUlVl/OiBNV4JeOnLHfi6LWCxcMkcRTSbwa7HRwoa4?=
 =?us-ascii?Q?XRFS08ZTMVkciL9SV6itHUVYhhrX0+iQclSOvI2rZUUccUc/VHQuPlsJ+nTW?=
 =?us-ascii?Q?W6dqZWG1gzA8Kp6TBsBedOYiwYwA7Woq1OYcW9p/eCmyfTEdetBazNxgKNgw?=
 =?us-ascii?Q?xj9MTbbyplVtMpS+UAq8c4am4A2J5MJSwHZni2e/x1VJHRbdBJw3/E6F1H8m?=
 =?us-ascii?Q?yyZ6rESTgdVU+4ZgYdV5pK6G1zbCpOfpWgOgVRjd6TqFIJz+hTNUlvZU1ur3?=
 =?us-ascii?Q?sspI5dAkyEEYf5otkpNdyLWJ6e1sRrPcnl+rungFNME4FyDUwglusQKKWqUA?=
 =?us-ascii?Q?BuBupmKUNw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13584342-39fe-4c94-c38d-08de8423c8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 12:50:36.1482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSn93lXeEamVjBFM3mpoRfc5H1zpDZOxyn86viJ4nEVLvlx6vsOXr4jndExg5pLPI4UzA58PkJ1KeBoFhSM/UZNseLQTbSU7QnHLXbKsM40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16070
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29604-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4573B2AA266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 13 February 2026 16:28
> To: Tommaso Merciai <tomm.merciai@gmail.com>; geert <geert@linux-m68k.org=
>; laurent.pinchart
> Subject: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to =
OF data
>=20
> Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store t=
he DSI output port index.
> RZ/G2L and RZ/V2H(P) use port 1 for DSI output, while RZ/G3E uses port 2.

Why RZ/G3E uses port 2 ?? why it cannot use port 1??

>=20
> Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to use=
 this `out_port` from the OF
> data, facilitating future support for RZ/G3E SoC.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v4->v5:
>  - No changes.
>=20
> v3->v4:
>  - No changes.
>=20
> v2->v3:
>  - No changes.
>=20
> v1->v2:
>  - No changes.
>=20
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index f74a0aa85ba8..8ea8594afee8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u32 link_reg_offset;
>  	unsigned long min_dclk;
>  	unsigned long max_dclk;
> +	int out_port;

Can this value become negative? If not, use unsigned int or use u8.

Cheers,
Biju

>  	u8 features;
>  };
>=20
> @@ -1153,7 +1154,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_d=
si_host *host,
>  	dsi->mode_flags =3D device->mode_flags;
>=20
>  	dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node=
,
> -						  1, 0);
> +						  dsi->info->out_port, 0);
>  	if (IS_ERR(dsi->next_bridge)) {
>  		ret =3D PTR_ERR(dsi->next_bridge);
>  		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret); @@ -1394,7 =
+1395,9 @@ static
> int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>=20
>  	dsi->info =3D of_device_get_match_data(&pdev->dev);
>=20
> -	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
> +	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
> +					     dsi->info->out_port,
> +					     0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
>  				     "missing or invalid data-lanes property\n"); @@ -1508,6 +1511,7=
 @@ static
> const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info =3D {
>  	.link_reg_offset =3D 0,
>  	.min_dclk =3D 5440,
>  	.max_dclk =3D 187500,
> +	.out_port =3D 1,
>  	.features =3D RZ_MIPI_DSI_FEATURE_16BPP,  };
>=20
> @@ -1518,6 +1522,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mi=
pi_dsi_info =3D {
>  	.link_reg_offset =3D 0x10000,
>  	.min_dclk =3D 5803,
>  	.max_dclk =3D 148500,
> +	.out_port =3D 1,
>  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> --
> 2.43.0


