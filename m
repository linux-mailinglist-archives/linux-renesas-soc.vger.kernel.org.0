Return-Path: <linux-renesas-soc+bounces-15912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA0A88153
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD453AB447
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44012C377B;
	Mon, 14 Apr 2025 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HT9Akc77"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AE2D1F55;
	Mon, 14 Apr 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636376; cv=fail; b=Z6h2whrTzYi8Nsb+p4W/2K3uPNb0mgtr40B4TdUeoLEJBru0rspZ7JM06XZsxBD3LjpJQNhAFSVngr2wJa+Y6wopLFOQz1HaeB6bPB5H+OMR9ASJfkjeBtxIeXdxrp5JUgNJuaYq6PU2iWGjYa6yGGAFhAfk7cVjqbFXdL5MJj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636376; c=relaxed/simple;
	bh=nf9hdikBdwtjDM54e6UAVgy494fp4jy78vse/QdsKKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JUY5QSVVA/QgUk+7bOopu0qXiCJEi4Tc9h9+KGQ00yun9Ll1h5q7GZ9fi1niuP9tqpuKmuDAMtbtJla2oaoG7U8o840AmFk42Un/zpS5GeQaQoCjGUGVkX968RiiNBAVyN6YkDWNMgLJ1G9vSRA3dy9IXPeHCqttROIR857Z/Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HT9Akc77; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY5KHztz36jlJJu0o2r+5m6JKH2XT2mThUixFimlkX3o4dt49cCtqPC6O/E9ecdVtANtPO1xrVScR4T9pcaffhLAbXYFe/zEy10emoX8AWp82jnJOavL+h9yXmP3prQF0w9IFrFMnj7ODLEKX68Famz1a7rlbElxaXR82Q9COEKh2jrfpUsSodk1yVEcT/YiV4LryCqFtyUztKc2cZUKjlFMF5TTKE/fu2cdEcLkNMTTvV5wwqCMMYquC8+U9dWKrMgOOOiod1xzPzpn7BJlrWWxu4LOB8nIqeHrmx1PUcgz/tES1X0yyFS+OthSUbue6b9sNdQzJ8f2XZNPZ5j2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkFRfRYnEX0OQa/eXUvCZwJBkGV4uJkYlctURANcoUE=;
 b=dNzYRGE7X6eZZVurUGDhTblzIxVFh74J32D0H39dG63C4wQI1rCQzRLxl6Y+PBNYnG6Ieus+fsrk+KtkxFpWJAIAWqLcH8jL9XEuLhvomuTLkHRMo3UHxdWcZt1E9ChGub2Gz1TsHj6PMtW8yyLw33puXzUgYgXruGJJln43yfH+V4a53QqtV/1urgaFgHGA/p+TFtQAYhhEjdDlOj7qkZf9EUZKAEyYh+GIIdXMDaJ0Hf8em6J9Xj5A2jEF94wqv/fXCE+OedUxcLNmnj9hs4JnmhSCA+J+l6z0ATGcGyVNfEKv0ynROjErB76LerHrZQgxsmXfEUaGroZL0u1p5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkFRfRYnEX0OQa/eXUvCZwJBkGV4uJkYlctURANcoUE=;
 b=HT9Akc77FZfR6EorjyLLstZ1leWQwmn2Lk+Lqq5ZSl8H2kdB5Bwt4gkbBJ+pW6RuoJDNABjgpK9v9B63cnSGtuDNCZ0o3cOritYJc/og+FP2hXkmNKk4F/5ZbOEwr4W6nBimSvvFHYY2UHf9DmqXk7wu5p4gfd82ewnOE+uHRgY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12642.jpnprd01.prod.outlook.com (2603:1096:604:33d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 14 Apr
 2025 13:12:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 13:12:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar
	<prabhakar.csengg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbrT006JPvaQdayU6PWC6vZahsdLOjIFkAgAACvKA=
Date: Mon, 14 Apr 2025 13:12:46 +0000
Message-ID:
 <TY3PR01MB11346BE277FA935E0CA7B686986B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113469552384EB52CED89FDC286B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113469552384EB52CED89FDC286B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12642:EE_
x-ms-office365-filtering-correlation-id: b6a9fe57-200c-438f-f1f2-08dd7b560ccc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aOhJrw1oXBkTrXi9xPzOMSm5KKiU7CMZwpbdpop5aAOnuMFIjjAljrrcgC35?=
 =?us-ascii?Q?y9NBuM4Rhn5MmvWeVbePlC8Q7RL1fjS6BmSH5wxxqzdRIn1ZQxsOYt8IvNyd?=
 =?us-ascii?Q?cEBu+ERNOEr5E/41Rsi4b47jJVlA5whMFH2JkdleiVwtvox60zn+0/2Ezn6Z?=
 =?us-ascii?Q?8V/oidAll5a1hRfUwlGE4ihEyavQ3UEVDOzTUG2tUIbZOfyh3oweh/6xzQc4?=
 =?us-ascii?Q?XZoEEFhfv19fZnPKHwuvkCIqDFViPgu/pjkGY4CNQ2qBjrGZumSr/w+c6NVC?=
 =?us-ascii?Q?nDqx3QV4M6swCfUZ6Mkc//Tr4ifJ6EKpH/oZTkJfDKFrKfIfRGmwg8DyCVwp?=
 =?us-ascii?Q?wZdLqrIqbD62wqh0y50I4dqg0CDtmFGG6kj/QEdeFVAjWDn8AmU5+5CIZ0mn?=
 =?us-ascii?Q?kKdq+ZuRU74Feykh0ulpJ0XgAEH0VMDlANXlEbmHYiJMtQV1HGGZ+OLi5yuq?=
 =?us-ascii?Q?+8tH51EoCtKXcyzet1Ee4IfaKILgKkv/PoC2v2OYJJYvRhw31IOWH/UHZ43J?=
 =?us-ascii?Q?fAoPU8fqHks6bMNMP546p7S+xcubIzMP/bqLjnO/Dv21L6Yatf2pUHHCvsWK?=
 =?us-ascii?Q?SlhImsza766eMlfTHsBFP+9aPqjJmWsyvzCIIeVy24i7UdUGPsBgp6kUO3Lm?=
 =?us-ascii?Q?/tqJ48SAKjkAKvZbRt5FSWDFyi9tbireX8msD3sEtQPDKTdbSQf8l+VqUZMp?=
 =?us-ascii?Q?tKkqtZjSJGGc5pKVD7mNccusWOFMclQzRfDlN5OOQnp7MjF0gYF3NIJ6rfJ6?=
 =?us-ascii?Q?hWP/II+zQkv++3mEdTJXz+0UUyre8G7G+m/gQRlfAaqhb1Z/Q6ctJRlK1tjz?=
 =?us-ascii?Q?nDea37oj/u0u3F4ei50zXEh2nlHLchYe/Ycu7wVQNDzWHx8OiOt5QUHUvhRp?=
 =?us-ascii?Q?L9U3YYUis5HH+eIs8VqpPUF0I+YItqUHG+u+Mk2TlJbtK5hZpVT2lijuxT/C?=
 =?us-ascii?Q?ey8CujPV8GgzgedUtWJdbX2XpTnWX484i+EeCN//VN8Ktp/TC9r6I0ZGqkDL?=
 =?us-ascii?Q?PXBkax2XPce/Ig0b06Ky8cWwznK8to1slqnlbNf+SkJhmk6EmTVQwhNu0NRy?=
 =?us-ascii?Q?mb0MvwLpV2GTeemtLXLnkGASny4Opt8OCxLusmhH4SKTyly5t/qbn6fLNipM?=
 =?us-ascii?Q?3hRYMvsZCeiFb1bfW9FupcgDsX9lkMdODjhm45VMrMG+N1vCrKSTqslriAzi?=
 =?us-ascii?Q?1PO3SPqgMaaQVc26/zZOLBaPvSLKPFl+mt1UcCbc/FLh9ZyEQW636rSDsIGo?=
 =?us-ascii?Q?5oqY5aB5lHSogOo/MlYpxS7XxpYfZkZmFkk74uhjydU+Is32ZgSpe9CxPeGU?=
 =?us-ascii?Q?r2vR+KbdAHxAueG/Odh82lGUPxBLWirhgy6XZCLFJdTKM/HsufOKR/jo1rUO?=
 =?us-ascii?Q?E7vpUZTgepUNi+ysjbh4CSDtyw7+2IluDJm0wGT0TsvJ2F2qfMavQvGNx6gF?=
 =?us-ascii?Q?ggcFOp8kTHgNdv7WFmoSgDTf2f8O/a0f9DQuPvsVpNcY9aA4pCsXrQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G/KxP2lVjh0tfL4B7IYiCJWuA5Ws2WAZj4dJAHsDvHZEGXpLiMw0NE+oTmcq?=
 =?us-ascii?Q?db/KkOx6SyS/rl+9c3zaK3H5sS4I/HA8PnfH6d/1tanarhhejLzrRlHAs/ke?=
 =?us-ascii?Q?liBltKvCImc25lBBVzO0D20dlTg0seG5eGEO8QLxLrpJPJF2zEJK0v7y7aHb?=
 =?us-ascii?Q?kLTVOII9tElvwPx1LFY8sBWYQD+bGttrdC/7ateX3ur+Hw6dmMXW/dlAwMdJ?=
 =?us-ascii?Q?5MNi2KKUUugelFjqNqc6SCL9PDIuvDpGx7+XwYndpva4bkyr/Av0pluvi8jb?=
 =?us-ascii?Q?a7OHFviOuwnLdOg951r85cJ6hJqEuCg8wgnJJfM8SrMj+oDOWtwkuxc5O6AV?=
 =?us-ascii?Q?yh4Qh5VyOEUtepjH26iVuIiCWguR2SkDdD0wz9ClYCTHK8aJk/q9D6sAOeKG?=
 =?us-ascii?Q?jSNInW8oOh6pdddXa9W5kiGPUCDe9OOEGd9i+ps2LBnoO7sIWCD50ounSFnN?=
 =?us-ascii?Q?3frfrQX3RqmQINaWrNVS0QQ7Ub3B4A25Xgi9OZx3VqpGPQ9woyGEJG1f7FtE?=
 =?us-ascii?Q?Shv76v6IEENl4bzD4d/POr642/VJNA43DY4z/Q9qowanabGbKlLd/VDVS6TM?=
 =?us-ascii?Q?WeGLAL2qLRoQOFWeJ1iosdc7Ddrei/D4U0ijqUs5uRwvAxSdPzHQfSoLGofu?=
 =?us-ascii?Q?WRk8ByX+10B3wDDgn4LUoSbq4pU/jMC7EGjQbakXCQLYQHv6PTTC3ohbeVIv?=
 =?us-ascii?Q?xKn/vb5YM7AbeMkNpDmyk9VGK3h9EsOih89NJEiiZC0ErXeFHGlcAxPnWQPN?=
 =?us-ascii?Q?JtEEQizn8aMmiTAXnu7ig0dF5eirv0+oSIzcjthtz96DFxUKSJFVkcOoxyuG?=
 =?us-ascii?Q?c2foRbummlz1ExkerRnfpRO7qg815iG4kIKXtVEJMpbx+MlAgM3MEgOu5+/h?=
 =?us-ascii?Q?dS4ASLvO/A+LJioK3FJnm3HokSxbbc28LWXCV8OzLJikI0eLxg9xlp4MOynv?=
 =?us-ascii?Q?xQ9OiYDWoIbx6m9Ncnz3QDzrFi0nm9MknFyBHHLnPb54KMJ5L1obOd0wmaEz?=
 =?us-ascii?Q?ytQ6pgd1uGSAMYvoO5VRu9xtlnxV0/adjJZhFtDGuMfkhAzKO7raVlJnWDnO?=
 =?us-ascii?Q?uQ3wkZIbuSwG23m5tcM3KZdd7ijXnfG7Iokz7g1dw0rj2Z7TRt2WvP/pK0c/?=
 =?us-ascii?Q?Lrwb7MNQpALGw9QqnBPw2Cq4pYVuGkeT+14NoC37V/FzpNZSxiAMu6nUX3Fk?=
 =?us-ascii?Q?+GQoxaWKCO0xZ683hy+lCCQGNuN2qBwx3dxipkLC3unca2gN39d6fz97gEi0?=
 =?us-ascii?Q?yx6urdoEdltjhKndJBtfsxvOU8op9Ue1TQuVIJktiGq1Tcr9X0tDwOSu1JDX?=
 =?us-ascii?Q?U0Kjdc81oFpVvZk0W/TECextWaWY+ojOYFtHMhGLII6uv3Q5hSbGP3fGNDeJ?=
 =?us-ascii?Q?B+W7LuDhrQJDoaBeB8MHxYt8gejvJ+4LpGDa5b7M9dNfKcBvGWUbu2t5VaKL?=
 =?us-ascii?Q?DKnJgoJeE3kOWi0NA1g6khD0v1zWeMil8OE/Yf/Nmw33OVFbi+lj82aL37U4?=
 =?us-ascii?Q?9yfkFOzkgUmnwALAL50MOMA7k8roHysexkEIdupZbSCuJxkJlT6mcQ59tyZv?=
 =?us-ascii?Q?v+ou3NHLspWicYUP6VQyIHwp5A2kAz8CXH4eP6Tv26wLYHgaOyN4X0dH65Zl?=
 =?us-ascii?Q?kA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a9fe57-200c-438f-f1f2-08dd7b560ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 13:12:46.8170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VD2GaflS2ReFdqqnb71o3up6JEtGLuXzvFEwuTejT4zR1m8a1PzhDKdHY9pzlmm+so2KC2freTK6TVzYsZN4+GhGkVw/AJ7nElU7hgdXeNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12642



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 14 April 2025 14:05
> To: Prabhakar <prabhakar.csengg@gmail.com>; Philipp Zabel <p.zabel@pengut=
ronix.de>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>; Geert
> Uytterhoeven <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.co=
m>
> Cc: linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad <=
prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Subject: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Rene=
sas RZ/V2H(P)
>=20
> Hi Prabhakar,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 14 April 2025 14:00
> > Subject: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for
> > Renesas RZ/V2H(P)
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) SoC.
> > Enable control of USB2.0 PHY reset and power-down operations,
> > including assert and deassert functionalities for the PHY.
> >
> > Leverage device tree (OF) data to support future SoCs with similar
> > USB2PHY hardware but varying register configurations. Define
> > initialization values and control register settings to ensure flexibili=
ty for upcoming platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/reset/Kconfig               |   7 +
> >  drivers/reset/Makefile              |   1 +
> >  drivers/reset/reset-rzv2h-usb2phy.c | 241
> > ++++++++++++++++++++++++++++
> >  3 files changed, 249 insertions(+)
> >  create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
> > 99f6f9784e68..6c7dbd8ca580 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -225,6 +225,13 @@ config RESET_RZG2L_USBPHY_CTRL
> >  	  Support for USBPHY Control found on RZ/G2L family. It mainly
> >  	  controls reset and power down of the USB/PHY.
> >
> > +config RESET_RZV2H_USB2PHY
> > +	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	help
> > +	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> > +	  (and similar SoCs).
> > +
> >  config RESET_SCMI
> >  	tristate "Reset driver controlled via ARM SCMI interface"
> >  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST diff --git
> > a/drivers/reset/Makefile b/drivers/reset/Makefile index
> > 31f9904d13f9..30d0fb4ac965 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
> >  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
> >  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
> >  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> > +obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
> >  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
> >  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
> >  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o diff --git
> > a/drivers/reset/reset-rzv2h-usb2phy.c
> > b/drivers/reset/reset-rzv2h-usb2phy.c
> > new file mode 100644
> > index 000000000000..737b768829c9
> > --- /dev/null
> > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> > @@ -0,0 +1,241 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB2PHY Port reset control driver
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation  */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <linux/reset-controller.h>
>=20
> > +
> > +	priv->data =3D data;
> > +	priv->dev =3D dev;
> > +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->base))
> > +		return PTR_ERR(priv->base);
> > +
> > +	rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> > +	if (IS_ERR(rstc))
> > +		return dev_err_probe(dev, PTR_ERR(rstc),
> > +				     "failed to get deasserted reset\n");
> > +
> > +	spin_lock_init(&priv->lock);
> > +	dev_set_drvdata(dev, priv);

Also looks it is unused.

Cheers,
Biju

