Return-Path: <linux-renesas-soc+bounces-16721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E4EAAC62A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 15:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957834A2BB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF6D28136B;
	Tue,  6 May 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TgvahhxU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0628031F;
	Tue,  6 May 2025 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746537755; cv=fail; b=dHRT8cJQgd//8r0LhsYlzkNYGFag3Ba2RiPEaWBlOfEFlHS1sjJ/uAZNZ4JKWQ/kXg8EzIrNyifdgyIAUyUT4ZCCBEMrmNLPUCod0VtZ4tKw15h86+Uwt8sgCRDQvZEc2+uogrNVFuCLYmkltVsfZp3JSB4NvcrG9HGdaK5bIFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746537755; c=relaxed/simple;
	bh=jb/kwcqxSC8jIjFlUKVHO9JwuV/n1kEJRO95aH5yHMo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ONQ8mvd2oRG/U5zg8J741/ZtmnQxthCmRQIFsGWUWYnB7Iycq/Qeq5NKp5vZlUufmpoDnHdC/PKVmxuXMZ4zlOq0mzwegYnYZY1DlC1PMRokJowmRPQPy4mRIoRMYRrZNefbzSx8PPP+KivBfWLqzX1iuvBHCTnsDNQAZqgmANc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TgvahhxU; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxY2aHHCcgELrP44GIqn8LlGKyXTdhU7DnXqmZ9Znli7ZsQQ9/z37B9qkMvZ40USNRRDut1RFIai4Q50/MXU8Eavonh0bch308rjxUcvBk+E2tMVQeWRBBv+69Rf2jOLOFn7Gvhn1MrxVHSqRcik3s/omKxhG1juzoD6w6l9h8obRbS1w7PCH4RnswHTTCKfB1Du7tOdlJlvYN0oYdImUrvE0bMZn6lXy3tv84Yzh3BUSxldUSwC0C8GcUagSLXQwYvj8mL8q1uxNHT8eglZdXumBlWrJ8M1Cg4XoIltO5Wkl7ctObsh9omSZCmXNaOx0R/oXVeM2TMRGoYXdmKC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3miHgBJYKHu0GEtscWzCgho7GVdy+YklRUsXKNAOhzs=;
 b=GeNLm+0LGdjBIuYc6jZv5JgctKDTajmyMSsfR9iW9aeOaz7Ugz3PlTbk+Ow4KFpRmn4+OwRsH5pS4vWSYn7rTUy9XmIPfv8vgt2T9dcefWlkoMF7cyf7NB+cmeyR3zxGVfFoOF3OIYvLzQf1l67gvzMlddrJENnUHDf2hXqtGDSTnEO4nHz2vND4pJu3OFKJaZMdSzKjeCYFlaNXREnFKUjIpKPgdwu1eV44wvAL3GD7Y20r/Wtz9Hp697F1ssRQCdcUl+WISyqW51BsPyK4ZnlVco68a3kxvOEIUOkwLClXOxojyNNyT3bE2EfMRA8WrBbt4uHDDo/KAbMawCzKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3miHgBJYKHu0GEtscWzCgho7GVdy+YklRUsXKNAOhzs=;
 b=TgvahhxUcHKW1JK6XermFMRYrHnvcwSXDXwAu7jsZaSV545LuvdUkzfoRgfx2Asfzz2IEAqg3xwafy74xRfcPTSH8yE6eaS1KxapnwSa8mLINnrm06F8Ob5cx641H4eHM2Cer2AKmO1xhNMD42mOWfrrlUVAAxid/r6uQZ5X1mk=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYCPR01MB8533.jpnprd01.prod.outlook.com (2603:1096:400:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Tue, 6 May
 2025 13:22:29 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 13:22:28 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 2/4] clk: renesas: r9a09g057-cpg: Add clock entries for
 RZ/V2H ISP
Thread-Topic: [PATCH 2/4] clk: renesas: r9a09g057-cpg: Add clock entries for
 RZ/V2H ISP
Thread-Index: AQHbvoBK/rUq3sm3IkmzYZWljvJcNLPFkFhw
Date: Tue, 6 May 2025 13:22:28 +0000
Message-ID:
 <TY3PR01MB120892E147CD3099118F9F484C289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-3-dan.scally@ideasonboard.com>
In-Reply-To: <20250506121252.557170-3-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYCPR01MB8533:EE_
x-ms-office365-filtering-correlation-id: c09ecf9f-e16b-4195-ced5-08dd8ca10c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eq0ss8itcZ1sYURlSxiNOY0cZR5/SDzebT84FFuHgYK38TMcivdfbWuzEm0Y?=
 =?us-ascii?Q?69xY/tLjuyeDABTOXEYxDnPGeUBGf8J9Ws3kwPIs8xKWn7bxYRxd2YFj8p2c?=
 =?us-ascii?Q?aGm67+JiARFiyFTi8NnJHjGk27swdWPlKWsn4hT8zD9W6TAm+bbUPauWW3pA?=
 =?us-ascii?Q?SMB/ZL0XsRvuW16dzSArUpGY7N7SC8axnoonElOnUPzVyjzA8QKu0H4VP3QI?=
 =?us-ascii?Q?MMUSRvRI2j5vy5CUSlsnCN8oyMK14Dfxkn1AdZ8RB5I4+tttY1LncFDOGU/t?=
 =?us-ascii?Q?cd4Cv2JmGE4958yXZLYRhitqmNQsenSj+PIE8MNePKd21HclwyUQ2yGK/NCv?=
 =?us-ascii?Q?ZebxwjgWGVdIeJNG2ykjYBCCSlLVSs7fjtxCvfFJykW4Yf3t/FnlU3Z5c0yD?=
 =?us-ascii?Q?/v14y2VgdAxMLqnyjrT48ndbIPHkoMqEPXalY2dCnk0DxV14hWlnsmyarS9H?=
 =?us-ascii?Q?U75Bw0Hq6rSmjTnj6nTMUc5+78MDGZXrfnDM+ybp5cqKrDjVUp6ABXXK6qRp?=
 =?us-ascii?Q?AC9FV7rNzZYkEpnv++PKQeqIczeWPbjr5kqCLb1vmmZY/VW1zg7HOKe+LU2E?=
 =?us-ascii?Q?uI1vKbhqE2HbDHyapmdytct7+OnihgpB6PmWXR896CwnULjuWaSTxuYFQX1Q?=
 =?us-ascii?Q?4pO232u7gE6BsAU3RbQxPFxV/AGi8EYXEF6LrDIqftzdakex+nafqPqlTtMF?=
 =?us-ascii?Q?KMwDPUxnwYi/dwkKj0Y/qqBHKSmRaJMJix3K9bYWbZqTOAo78WQoocq7RYpF?=
 =?us-ascii?Q?bXtYVoYfHM4+GwxV4R5ZNcGGtB39BWT2Sj0lapLB0oTA1bcYcQKYb30HRe40?=
 =?us-ascii?Q?qZew2T4BNbi3DhY7msJpbKESNQg3aEnD7hcTpskvxdB8VrMweptwRB0FN/iQ?=
 =?us-ascii?Q?Is0iyXhwjVfI3OQNSpWXpmVfG7kFtxPRhJLDsgl15ru6ggIUFwxkqvCkVAio?=
 =?us-ascii?Q?X7I0xnswer/N89NOw3kvMVWh5YtMcOl6Mt1UCfuBhFP9QSpBbiCRHhBGvvJc?=
 =?us-ascii?Q?+7RvUOKIJG0Lx1HkIVnbUMcyr2CQ4MWEp4SBGGNSNeXzoVK/JZDnAC45jUQH?=
 =?us-ascii?Q?gBtzgpbGkvvDaMeUy7zyii0+tR0mVrnhig5TlIwoQGdvFHLtZf4ZafcWqDK/?=
 =?us-ascii?Q?iZ/OAt5Ki3gyVrytvFnnCjTM7HuptTPCXJnWRfYVZWxSUq3uwPgMmVKET7YY?=
 =?us-ascii?Q?CTg6QSa0qvXBsWdh+zuHlH94YrXq4vqM7fvVlTIBq3qzWu9JlS+ZhXml2C2t?=
 =?us-ascii?Q?oc7FJ9m1nfB/9iJC+VU4YJPEIb7n1UyjWk8ZaihFdRYzCoZ+jpS1122a6YHq?=
 =?us-ascii?Q?CMGPg8GyMBktkJoCMjLUr7L0YMgwrJXkLbjT+jHDbj6hrkNsIojMfjC8isjl?=
 =?us-ascii?Q?bnSYArq0QMoQy9lvzZeZXeXkv+9yekZqCsBoO1mY6SsPJrR0gRbMS2jTF6K6?=
 =?us-ascii?Q?fS9qBUDoyvL/VLOZWQUBW+LCglKu3oH4RBl9v7uWCt1DaHzwNOSWfdZ9oAGC?=
 =?us-ascii?Q?YB+B42aqfqpTzyg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XXRwWg8n4iTKLpHxn66+mHZVD6ZHIyEm8KIOCXJAOdj6+MDuMYTVlllBNF7y?=
 =?us-ascii?Q?icZPOTZgRQH82guBLqojgCrYkgLjyxbEJjs+ux9nwwLoQvNW7VND1OVjm39f?=
 =?us-ascii?Q?2cm9sav/aNwqLgmDbXv65oC6Lf0P9T4ZtsrymfMEAVYZ62Q9cxEt6OHes08m?=
 =?us-ascii?Q?Za76IorZIsKpnNrdFsNxWdHdfQmeLGqyv3UtSVU+rEa37zFIwt93H7jIcv+4?=
 =?us-ascii?Q?9J7mi37n7OGQlsDtuSLbWDBXJLWWndfr9vrr5WkuAfwlDsMeSzOtY3OFMGRm?=
 =?us-ascii?Q?Mw1LEN3kZoKuhySpZa/Ids+Co+TsuNdT9lNW+zdK6Ww/yYCw58ozx1sPl6Uk?=
 =?us-ascii?Q?elP/oApUpNy4ieWCkrEOHcSBIoWmP0FrQafJd+p30ahrF8T/onmWHLK+tOfT?=
 =?us-ascii?Q?tM1KbZoCE4PMtauTfbB9M3WcFjYkXjx3D8jcUxehSRm32HKhz9B90vDTF6/m?=
 =?us-ascii?Q?19YkLXNJLw4R9jf/N0fh9Yw295g1+4B/tjdKMDEkcCrJ8ctFxv2GM3UHiFKm?=
 =?us-ascii?Q?u+Z326sFPLvyoFjUG2kKJfHFWXqa33srcbzIVQMB+VXhFZCnjgFcyHGz2Mi0?=
 =?us-ascii?Q?cGPJOS2glnAS38m6SU+Gx9/6yYiB43lUe+dgABFB0LxzjDIVlxHuuiymH2V1?=
 =?us-ascii?Q?1cnzf4tEpSHkEZ8vK9Y2mpDGCoTKYx8fNs3Q6oWhVmG0rkpBWNAKEUQfO+RU?=
 =?us-ascii?Q?QrQGFzcl0zlJZoR6faqFdn8YOKlKVs5wnIAhJG8w8Pbds+1lSU0wwn4CH19R?=
 =?us-ascii?Q?oqTivsHV+lSKUoeW+1hEU00o3DdAuTGALydOhHq3m5Y5UyIaAOXsydo4ZgaR?=
 =?us-ascii?Q?4+awR9jgYPjSuFkl7nl7aA6ACWz4GCUs2xuzylij+cFjGZesyBTbzgipi6sn?=
 =?us-ascii?Q?pT3DBgXY3cpmmY1CuArdSdsbZzDfRWza6oPba01e3CPk2+sm9xKipGcwzpfd?=
 =?us-ascii?Q?1nhUzWYOklW1Jc7VBqUsv6xGH3zmP8cxOl4ZfTjhMo3ffMfwkXR/t5g4W9sM?=
 =?us-ascii?Q?FxwFCuqRROQ3iK02qzk/GPcWVx4909CF5gD9ruEVt5O4fXQBnORkEq326HNk?=
 =?us-ascii?Q?4t8xPpvozdfnqBx9RyyIFMmVcShS4vfYsX0fFLLYGJRSzmFcgb/8RrEnZXvW?=
 =?us-ascii?Q?B1pvREmJTej7LezNoqIdu3Smwgw5zn0GpaWVLUe05g4wgk+wS259G76d+8aE?=
 =?us-ascii?Q?UOpkzkiU59U8gdiX7XxM73anJyupwaNd5I6+4X763O/mmty9+vl5Jgg/7D2N?=
 =?us-ascii?Q?aVJuAWgbnHulAKvcmV4llZbu5+nGgwwbkzEe14XXbzRnHs+1NrVnM9W7zzCz?=
 =?us-ascii?Q?NljI7kqO3hig3V6SV3SQlKiSOdQmQgSnMROuiu1Wi6KfxYC2JzRDjMTfo4wu?=
 =?us-ascii?Q?fi4aXw9Yos7bN8fALWaFUv2ByskRyfh0JD4UgC5S67qCsmfEzJ+f8rLbzvyc?=
 =?us-ascii?Q?Lhfds+lShZuYf28eRCXhnmHLqYhyWxxLbatX1leabLZ3HnFE2RdrzRxa3w/J?=
 =?us-ascii?Q?0rXdFHqRKhSf8TIffSklGUQcmwSGQzuu7fMaMFWKSeZ3cy+slcY4UZFmjaGU?=
 =?us-ascii?Q?gwDLtNqp9r37/23gL4c/6zjxXXE/iKs1TSyZyQX/ETdN7Q9EUdHHMbaZguPj?=
 =?us-ascii?Q?mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09ecf9f-e16b-4195-ced5-08dd8ca10c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:22:28.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3d/8zFzp2O616S98U5qcTk7GVSuDmTQZ2/QIuLvWBhM0nlbnKImChYU3aZ/x67/wGIASTmoT6v2Y3NGhmX25MlafH3GI89pcnx0tRTY1YrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8533

Hi Daniel,

Thanks for your patch!

> From: Daniel Scally <dan.scally@ideasonboard.com>
> Sent: 06 May 2025 13:13
> Subject: [PATCH 2/4] clk: renesas: r9a09g057-cpg: Add clock entries for R=
Z/V2H ISP
>=20
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Add the clock entries for the ISP in the RZ/V2H SoC
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 11 +++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index d63eafbca780..cb001ae5f98b 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -47,6 +47,7 @@ enum clk_ids {
>  	CLK_PLLVDO_CRU1,
>  	CLK_PLLVDO_CRU2,
>  	CLK_PLLVDO_CRU3,

I think you need to rebase this patch on top of the latest changes, as I ca=
n see it's
missing `CLK_PLLGPU_GEAR` after `CLK_PLLVDO_CRU3` for example.

> +	CLK_PLLVDO_ISP0,

Shall we rename this to CLK_PLLVDO_ISP?

>=20
>  	/* Module Clocks */
>  	MOD_CLK_BASE,
> @@ -110,6 +111,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[=
] __initconst =3D {
>  	DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, d=
table_2_4),
>  	DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, d=
table_2_4),
>=20
> +	DEF_DDIV(".pllvdo_isp0", CLK_PLLVDO_ISP0, CLK_PLLVDO, CDDIV2_DIVCTL3, d=
table_2_64),

s/.pllvdo_isp0/.pllvdo_isp/ ?

The remaining changes look okay to me.

Cheers,
Fab

> +
>  	/* Core Clocks */
>  	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
>  	DEF_DDIV("ca55_0_coreclk0", R9A09G057_CA55_0_CORE_CLK0, CLK_PLLCA55,
> @@ -238,6 +241,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks=
[] __initconst =3D {
>  						BUS_MSTOP(9, BIT(7))),
>  	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
>  						BUS_MSTOP(9, BIT(7))),
> +	DEF_MOD("isp_0_reg_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
> +						BUS_MSTOP(9, BIT(8))),
> +	DEF_MOD("isp_0_pclk",			CLK_PLLDTY_DIV16, 14, 3, 7, 3,
> +						BUS_MSTOP(9, BIT(8))),
> +	DEF_MOD("isp_0_vin_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
> +						BUS_MSTOP(9, BIT(9))),
> +	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP0, 14, 5, 7, 5,
> +						BUS_MSTOP(9, BIT(9))),
>  };
>=20
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-=
cpg.h
> index 576a070763cb..c2e09199a8cd 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -35,6 +35,7 @@ struct ddiv {
>=20
>  #define CPG_CDDIV0		(0x400)
>  #define CPG_CDDIV1		(0x404)
> +#define CPG_CDDIV2		(0x408)
>  #define CPG_CDDIV3		(0x40C)
>  #define CPG_CDDIV4		(0x410)
>=20
> @@ -44,6 +45,7 @@ struct ddiv {
>  #define CDDIV1_DIVCTL1	DDIV_PACK(CPG_CDDIV1, 4, 2, 5)
>  #define CDDIV1_DIVCTL2	DDIV_PACK(CPG_CDDIV1, 8, 2, 6)
>  #define CDDIV1_DIVCTL3	DDIV_PACK(CPG_CDDIV1, 12, 2, 7)
> +#define CDDIV2_DIVCTL3	DDIV_PACK(CPG_CDDIV2, 12, 3, 11)
>  #define CDDIV3_DIVCTL2	DDIV_PACK(CPG_CDDIV3, 8, 3, 14)
>  #define CDDIV3_DIVCTL3	DDIV_PACK(CPG_CDDIV3, 12, 1, 15)
>  #define CDDIV4_DIVCTL0	DDIV_PACK(CPG_CDDIV4, 0, 1, 16)
> --
> 2.34.1
>=20


