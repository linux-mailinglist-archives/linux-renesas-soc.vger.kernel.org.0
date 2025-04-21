Return-Path: <linux-renesas-soc+bounces-16206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4BEA9567B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 21:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47BBD18961DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 19:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752B51EB5F0;
	Mon, 21 Apr 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hFdxBwJn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A31EB1B6;
	Mon, 21 Apr 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262362; cv=fail; b=ndyenErP+YkvmW7CSH7Lo7fyEVoh+vPeC8wa/hA7rqdj9OtmQKUmu/1rc2kDHRgMVofWBjxYPz9yuOpaKTEjk0rPM6A4MwjEo6d5pgFPbnqnvtTVNWPgxKg/KDe8dvACx+Q665NdqoDyRAvBDWLKWKvIZ8C5BXBVxwUCwqCVbzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262362; c=relaxed/simple;
	bh=k3get5d4k93nVztRu+VNr7wxZ0fKuaIfLkhofZNNXNM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A3UmxI7jjvx02tPfOzJD2dler6/VwN2Jt4bf2LaNhRqSJo5qKFoxbGYWxrD2DRstTCoiZaRHTB2zZHzClfdQqawcp05J7vOJI8jncA05ylkeshLrIq0NL0pyneK5j9A15IXcpW3wTAvYDX7bvH3n72c65cdRnnO1fVloY8FikkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hFdxBwJn; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmN+sFIL8Kiqzsk+jEw8I0A8z57pSz+1Fy4fa+wieoLfj1nNlUdGuzCXQBDNt3N7J10pXwNt2LQAco1r0HQ90i1WOP4vnkfDVsW5x3LG6uIZBacTY5D/Dy0MM2IrjlpNjeOpUKh+NC3eTRXD2i3HkPtFP+aeQF38w79DNqSH9Wuqyb4Yrx7EbFG/EkUJD+htuDg+ye3wvpfPBbXJStu8Nz0jOCwNj6q2ssEhfTJS3GHNRJVmFgR9H4lRzi1koFaWW4vVwFnzqYYoMDiYYvlYGX0o79BvRQ4FPBa7DPkNOOko7qGHtNz/rMHReBei76X9aiib4vp0ABpgLzkB2rcH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3get5d4k93nVztRu+VNr7wxZ0fKuaIfLkhofZNNXNM=;
 b=cbTNyxyhAU5Uh5QKkm3FTwWOH/vgSND/EU1Dio52sttndlOG95enK52Ox/NFGhsfpmH5p5GGlnl9XEg3VRBZdOAl7PL1B0QXM2WVWcxCB9Os6CCANnl9mXQdTKBu60mymm3BQuvZt3/j073rsReUH+gEoIEpBpgPsjJP2P4BtSyLqzfoh8ey1r0OS2PHcB+saZ/r0X3qwDaRnfUH8lK68pkhorf+zjoAKwLgzqRcy0usnD5XChb+0Pd/KwqBsEv5DRqFu/BahZ15V5xpXbSzdLK+H1GfM3kAiBI+E2WANpn50qnd5rlC3msVZrDQYoXMtKyhWxh0qwmb2vo9GraNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3get5d4k93nVztRu+VNr7wxZ0fKuaIfLkhofZNNXNM=;
 b=hFdxBwJn/n51OM85r+hQwSMwyr3/KNmonK8Tzjap7DDxM5QGuQL1h36XeZH7LqpHHj7RNdo4tAqwnHbCjxDlKyDMPasoawc+0PKt4K+Eg6nw9ASnz/qThIK6FvLQZeC3v81chCsyHomn39Vg4xQAL2HS3vpIGDY6Tv8opyUHa78=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7093.jpnprd01.prod.outlook.com (2603:1096:604:127::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 19:05:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 19:05:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgABZJYCAAAD3cA==
Date: Mon, 21 Apr 2025 19:05:51 +0000
Message-ID:
 <TY3PR01MB113461CDEA58CB260ADB9FB9286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
In-Reply-To: <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7093:EE_
x-ms-office365-filtering-correlation-id: 3afe39a4-70e3-45ff-1e7b-08dd810788ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VQ5oc5sofqd6/0pShrg9yugBqYlwt59ABbSKOvkt5Gi98kxOKp6MpftpIXV2?=
 =?us-ascii?Q?AKigIKDOgrFC3DwEStoiew+ziEdh4KWQcm7JbNIbEYQQfnwdgfp4dUvIloQl?=
 =?us-ascii?Q?kodErtTuJvvy0gD8T1LopSSOuZGfyD9o0OkCEKDM04wGIiVRlPA89Ni+zsjN?=
 =?us-ascii?Q?gMGdKti2KYfev3E/3TZVjyoLl+u1bd/DG9VVCVm1PnwvITgCb9IirbfXWLcn?=
 =?us-ascii?Q?JgB+7+S56egEPXtQAt4p2emE2sUZ3wGyHGYLo4ryv41bD3FVimp2wG8jCP+y?=
 =?us-ascii?Q?fH82zlxQjajiXC34CkfxK5Y2z4zW7A0sOORONlqOUf0MKPggWtOaXFZNzlDI?=
 =?us-ascii?Q?PIKzpVen77bWdH09kyEpPdtuLLnk2mcbUDMFbjbp3SudAD59Rd0bsgJGij5p?=
 =?us-ascii?Q?cGtijqS667sHubar9xjdMICuU5Wam7+tSM7WPfLjomfCmAnmlkWkm+E8WEm+?=
 =?us-ascii?Q?A23PgmnbMiRHGcmupnsuXRBTIbSdeRCw4Dbw3uoXBfRn4BQ9s/WbVzYF/Y5P?=
 =?us-ascii?Q?hEMZZQa+gWIEAuY3QKHpBDzJI2JMkFRq6SsnQObcwo4RyNVnDYJBbcUZ5SqS?=
 =?us-ascii?Q?eSxrjsLU3xitPf3mzPKz3SLRm5qb8J2VBFWOzClw5zlQHX7O7wsXQtB3pALL?=
 =?us-ascii?Q?+CBHkMFzexHrmBmsMh1V8ca6h31WJ6Oz5omNLTE2grse0f2fIHBzS461SWnq?=
 =?us-ascii?Q?l6iMSg472SvKljrB46RhnRz6bYcsn7krD1Kf3+8V37WHGC+T9fS2xBk72cJT?=
 =?us-ascii?Q?pwdrZm1mY+kIp1yZfUWoB4Sgwn9sM3oLH+8/pErFWCYGI7X5dDLhDqIFDKve?=
 =?us-ascii?Q?/Nabfw3CY8gYxC6hDXHwNtzdL8CgZEhQPonpGJR6Uwzule+TEz1Lq3Cj6eXy?=
 =?us-ascii?Q?4UFA79WeCF0xH7plmR3qNXgrOv2GDoRTsV6AhVZKme3gKWfnQHRZcq3Yf+ze?=
 =?us-ascii?Q?EmSzBE86J6ChvxtMg+1bplK+OEnN6rPRhwryhCu7dp92KSlV28CPvti4iPvF?=
 =?us-ascii?Q?SNrSgNWBJgevgU8I6IoPtBO9ltTJn7g85nD+CaYBx5wuvV3FE39fD+IAEL1R?=
 =?us-ascii?Q?zl/Zcv3gf5ysdJCzXyWwW3BEs10JHyR/d5F2Ap/0BIGiXteUkqplp9yd3koK?=
 =?us-ascii?Q?V+VT/YUOeL/glEBNSORIKXzItLbh4qov50jx4CxEL/1osifJf1Ty9XKtUWSf?=
 =?us-ascii?Q?RaEhf5ARy/muXYkf/oFrp7+7jlpw+Osaq5CpWO6GtBT/hwC4goFPC7CrMGLn?=
 =?us-ascii?Q?h+uiqW9L1mI7+/HtljcvX1cwOQ6Tx9OO/4Y9Rjs2WmzppWv4TUhpVldb5xbY?=
 =?us-ascii?Q?KUsaa3rA+Tv039lEu37gQWsIDsxNrU6fVQWQunVbb3PxW53s14JvzQihmijO?=
 =?us-ascii?Q?RudJ4KGYj1sEV7VxGxRhS5cAJm9S2zZg4mMkM//502qGCK4v92XwqCkUN7kQ?=
 =?us-ascii?Q?+/j6/O8/ObfL4rbEizoZnipEKdL8Af1nmOE8KUngtv425AjpumlE0iIooMdR?=
 =?us-ascii?Q?TVHBk2lZ6zvj5A4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Vw5izmDCStzirC+aV4YQg48H8GHixwH/jtXMxxCDj1bDi4QvIni940TTlJLx?=
 =?us-ascii?Q?piJ+7LbtpF78aDZR2rJL5LOcavEiMbRzEShXZmK2DOCNFMeajsVaJcNliSsM?=
 =?us-ascii?Q?yrY20Ovqd5LIjrtnAyJUdeGt1BcGnZLKv1IJvTV31jXB25muQnoiedGrFXyb?=
 =?us-ascii?Q?OpesC2I7GgM+1zBd4XZa1FAyh3wiS3JLB02/oZ6vJe7xZXUsx05gtCqAlCCs?=
 =?us-ascii?Q?XEMtwQkBCxgO95VNVfIIccN85jggKCfbYLku0VOiAFSfX3j7sTBYfZswmVVn?=
 =?us-ascii?Q?f3ToRiRNzPCc6kwmgB5EF7rgCYINkmuqV+sT7pqi4+E+0QT+iwGEBo6rGy3C?=
 =?us-ascii?Q?ki+f8241WqGIQAhur1VLfw6lmwkTz81ykilzxVrzDrJ52/3ZkdRw6A+ra4Vc?=
 =?us-ascii?Q?70pXeB+goNZaAqW7UwvY1Q/6wY+hSPa6wbMo5fmkAVUpMmZr/GnyWixMblH7?=
 =?us-ascii?Q?6old49MqSFqmS97a7bHrVwU2g0AOFBRFpoLmXOqPnQ6sclPW2jnFWdZAvy8q?=
 =?us-ascii?Q?lFQxnbDPivyk4vKDzSW6xJ0k81qLPfYVFmSfNfYwuzUDxiyngwSNTQKGWm0h?=
 =?us-ascii?Q?XjrtrRTvOCF0sjPBp+lMj1A1UjuOh6EFoaBIsdz7I5uTHBj7Yp1j5NhR3fL3?=
 =?us-ascii?Q?dU5WkJoRAC9zgvyzkgq2jwsd5c/JiBqdGdyB5V5/uxnZyhqrlf7RhnvfjDQc?=
 =?us-ascii?Q?18w18j1rVuHs7+6UoLpvEtTcnRdV0keob3dhDp9IEBhWKtAadfRdVzTWgDNQ?=
 =?us-ascii?Q?aMF4OEBzjihAXTxjPr93wdyOQ+GDeNZ1c9xJGWFfw9cJ7k2OAA4y0PsUgbYZ?=
 =?us-ascii?Q?Or/Dr7z6jPJgYGKXqJHGMjGU6uwhIQNeggVkV4ipACrvnqC/FC675fQ1FaqY?=
 =?us-ascii?Q?qi5V9sL3OvfIOjV8iEolB9WEzYq0atJzfGonQJ5gEvKjVd0lWnEjY49QI3zO?=
 =?us-ascii?Q?jOiiY+vP/2kqzl6FINtYhwquYM0w2HXVAqIJEd3B8wKBevXlgymtsZVsEogP?=
 =?us-ascii?Q?leeITbJAqqJbynzYBdvG3SsaonhNb3RWe5+H77YkFtJYaErOvnVYj8J92Qpa?=
 =?us-ascii?Q?jwkbKTNCAXzJ+ewwBx9zQ7exuifC3T2acAsyxzzJqGBDSCXLs+fNnQ2tURho?=
 =?us-ascii?Q?SDp9vqKn9bc9GsK5lqLlCPr4sn+fX0oHXytMMJc2MsMmYFrxoaSYa+zeb69I?=
 =?us-ascii?Q?Xfvi9JC2q25ftYGc7zxjn2otXjNZVNjLR6iRnOGBjFYpKA093oPbTWjyXB/R?=
 =?us-ascii?Q?nyhvGzXj7nYq6LSmND0W6v4Tt+BJqmIcuexYErUCA5hYUItFayBz4w+Lz+Y9?=
 =?us-ascii?Q?roV1Ep57dJ+x7w/dY6VVxOk/WYd9oODmzvKe0l6R/PA+Wg6h9BaZ5tCJxN5+?=
 =?us-ascii?Q?3sH5Slv2do27hgxjROUukhUznQjH6Bo4FDrmFlFpsIWKYw3eFgGzWptDkiIM?=
 =?us-ascii?Q?ihoJh6ogOS4ohjMRxw1Sjp3H/g9/xOPMJbGuGBC0R5atrsSnjLqWEb464Ri/?=
 =?us-ascii?Q?jMEEyzzc3/laaDlXY4Hhx05EoAxVaPsoXAyL7BBndot0NO5LrgJvOBpAxf8M?=
 =?us-ascii?Q?hrtjJd7LXF1nZXIIevSi0iuK37TeTLHpq0dvq3wqwbLYl+hvjshZleK8ntN8?=
 =?us-ascii?Q?2A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afe39a4-70e3-45ff-1e7b-08dd810788ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 19:05:51.9452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SY26PIBeZeWqfVCWJiLacWgCxDsfmjLT4pJK9rr37/TdQbz8THuT5l9Kywt18JMczuTrTR31ZNDs7ho9ssBKl4RMrBxVPAuRcAD0WJwafag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7093

Hi Russell,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 21 April 2025 20:00
> Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> On Mon, Apr 21, 2025 at 01:45:50PM +0000, Biju Das wrote:
> > Hi All,
> > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize =
the PHY.
>=20
> Which "mainline" are you using?
>=20
> Reading your emails, I suspect v6.14 rather than something post-dating v6=
.15-rc1, since your latest
> email suggests that the PHY driver's
> ->resume method is not being called early in stmmac's resume. However,
> commits 367f1854d442 and ef43e5132895 made this happen, which were merged=
 during the merge window, and
> are thus in v6.15-rc1.

I am using Linux version 6.15.0-rc2-next-20250417 + renesas_defconfig with =
CONFIG_PROVE_LOCKING enabled.

Cheers,
Biju

