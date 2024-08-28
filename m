Return-Path: <linux-renesas-soc+bounces-8426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E5962407
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 11:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 762F528442F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A646716B3AC;
	Wed, 28 Aug 2024 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WcmLz4nV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E99165F08;
	Wed, 28 Aug 2024 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838788; cv=fail; b=HhK5RhFb5169Nq/98YoQFcix6hIGEhausXl55U+kJqU9k5EwEb44izp4Ks7b4TO6m5TfEhKBO9Pu/lm2Z6diUyYdtVUlnaX6NxW5upPb1yoj3+0pD/K21F/oAkwyJhWm3bc7x2Vkc8qkgzbVUE1FDyi0fYCgr0EPemIa8PlJBJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838788; c=relaxed/simple;
	bh=KfeAgFgLAZkZVNjs1jIcvJnHnyiQ+E1O1is/IrNkDQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nBynlfSW6Ucojq6F8GDki5xyKrk9Kp7NKnfvdaqnTLrqHeyeBMZMyqfB2OZ4UXfwdfn31Cme+6PoYql/7/tSSpaa/QIETICacn92ilknhvD5mOIpjKsxEgQtw8GdqKOPAJpB6IVLrxIT+kpL5AqTVyQC/e1QtmcrdxhNILavqY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WcmLz4nV; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i59B5Mp5a/cU6VWO/Hpc2SveIwxx1yp0CU90+Xrd72iqRb51Woq3jz4wCOAlaMrK0S67dWynTmfGSD73WZyqBtsZyfpBttLL6KQyiH3gt7TLkW34S1qKq8EvJMJiVRod8cJbs0b7H/bMoXuae9L/v4maLEOsIS7RubFSbIBxgRHMERqrzePozjifCVobjjjrsG8I5P2Tgv8KjJz4qMt1JK+UDNp7XpWtuKnNiXwEmSZkN7HojGQf0v4Bg07dAe022tnQzF8BoP5Hm3Yn0TYTW3LdYDaMc4uqrGqgHQmMy1gLU8PhaVJklM7bzJQeyvBdiTkNjjtfbRSVyKxw07TsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqA1LtmcrRaLi6TUex9RRK9NQlZd8Fux1I1JjhQk/zM=;
 b=fVvcqyVee2CjrUgj5izxrFK2kEDsggAnP2etJmO59sPjc/m5SHY59tw8X3JVy4coZ4Z71E0T9unMcSubu+NVDFtYm9mhETIoYBW5RRq4sI1XbxRQCkaQ2jjF4m5ibZNESf9/u8osiKUoHGHQsj7Y4bvAYaJXiux9nE1wgWD+jBTqseLlTrS8mfHbugWq6Bzn8GL3QdY5NelpGTEXQXTDo2INFBw94cIUwFEiTFl11VxWPU+6EoGE7X5i+R3KltnYZaERdvKXHxPB//PKx/gLu4OCCQEDBZYU6mC9PNvyfqhVOZVi/qK56iDO18cA5WKZTblK+6zFzJL8FtqYdvA6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqA1LtmcrRaLi6TUex9RRK9NQlZd8Fux1I1JjhQk/zM=;
 b=WcmLz4nVZ3EXhDhLC5BGfrOMhhikk2V7zM/7dQdX73WFKHeoJzQO+D/1Y1NpSOyQd/fVpB39ZYwZOcI+JTg4Sp/AWOPq9iDVHrfIWkDp629rUy7qXPVDo253s2L1MAwJjfcWLlL/NwuXGraVwvgF6xrMqWbqp/heQl5XV8yqhG4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10740.jpnprd01.prod.outlook.com (2603:1096:400:2a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 09:53:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 09:53:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Topic: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
Thread-Index: AQHa+S4N8exrBf+5L0Ks2gkmNjakEbI8bVcA
Date: Wed, 28 Aug 2024 09:53:00 +0000
Message-ID:
 <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10740:EE_
x-ms-office365-filtering-correlation-id: 3379c7d3-0c92-4dfc-f1d4-08dcc74733f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?nsho3DHNAZ8rH7jbFjWL2QbLOxX6SvHmULACgI/9GnEMFF/z9yGf9aOQB8FJ?=
 =?us-ascii?Q?gnc6H4Ba2tnU7/cE9pOUgnsVgll7aUDNrZodWHsGEL9Ar8YmVc5f0fgr+P5o?=
 =?us-ascii?Q?Kr+Faw6gHv9SlmSNt2GgvfM6GqyI1Bh2NmMy8SGBmt6strm/BCkpnF7+fZeA?=
 =?us-ascii?Q?0GTYSnWowZkAz0lro3xTIpq0I1NJja77OcwDJYZBoIXt2sYjHOafNKn0Dl+t?=
 =?us-ascii?Q?YGAP9PCQugdrsKsecZitcPchTe1An632rsglTN+Zel7ZaLkEVtw4cJvBRMsm?=
 =?us-ascii?Q?YWkYcF+5XZvZOvipR+oRKgelhABLAY4LhM6h7QPwRcEjvFYCqkIYVj0sRR2d?=
 =?us-ascii?Q?fqmmNDXFxvWTX2NQIBSLTfcOi+4VoN+MGmslk2GZtQkvBjQB0BwtsGXqZtmt?=
 =?us-ascii?Q?EeFWpYKim8MFmto2JobjfXxdHlqB1mGQNczubZviBcN+6ugEmkZQjnfNKfW0?=
 =?us-ascii?Q?uzyh0DCGWPQL82s7cFbHvoHXMAd1tlgOnOfXdBsx/IpAw/W3vz2jEYaYy7Do?=
 =?us-ascii?Q?sDcKWDO37gLRylFGEfWUIKFbACt2RfbaC94hdMnnyg1qJeYumQ1Ekl1S+hlM?=
 =?us-ascii?Q?YprKBjOilVopwfqmE5NYLz/Mmg5gwqFDypj2iECmbAFt1OR2dn4Hh735QhzY?=
 =?us-ascii?Q?g+hA8K0sp/F4HG5PaAAQVn/ClJpNg0tBhhgvJO4lG4nbk/zUKRBlsaykvrZi?=
 =?us-ascii?Q?a6WXBc+fVGT8wHDkwTz4YPjxK5j6MBjZK9LHNnQWcUimRF9hFRxBQcQMlESr?=
 =?us-ascii?Q?jrLzCVGEgz670Il5UHXGCgBQZ3XgQTUl2+A/NZHVfr/YKON6DB/4ouDhmG7l?=
 =?us-ascii?Q?kJv6pzFeXR4ca76qHdR1ycWI2jchZ+sWXvlmXiRNTURdxAr4LUogRVmWeeSE?=
 =?us-ascii?Q?Iuq1gKlijaTI5rUfs2C/DvhqyPQw+Y7KK43QMV++piCixe57eOUi6sbAQln2?=
 =?us-ascii?Q?4xkiFt6ag2L5mZD86AyqSGAaBkuvygpoJfxN8+2lqqca97K+8tfy6P/d3aKF?=
 =?us-ascii?Q?OjW6NA+Q91exV97QWbnK22NSSx0j1BShP7pQA5EufJ8ah5/iW12bOCrU1zu+?=
 =?us-ascii?Q?VKdDJy/eluPaJAT8qc8WWsjchXSuOY75KRh5+I3mDc8UqozwKjWobHj9VX3E?=
 =?us-ascii?Q?wGs0kQbeDKs9u7EOnmoyCRKzmTQS/fmVdf0mn/wc3GYwTljYvnXCoquJB8dr?=
 =?us-ascii?Q?rosU1J3Jp3xnZNjbcv2hM3C4U5TZyDkzWm3h7HGv1PPBhkpAWwMiOwUU9MIc?=
 =?us-ascii?Q?WFMf3MxIGWjd9O2ixqgwA7Y+UxDw/kl6psHp2DVlgkW6ZSbTeIfzVlI/4FlA?=
 =?us-ascii?Q?gN13ZB/BPwet/TsIPcosSqKaw8EvdNhfLM/ZJhUezotZismsi3Z7IRcccGXV?=
 =?us-ascii?Q?nEgd3lXMo0TxqeexZonp+foJ7fWfF46BDrSmH9oC+yw8sNRVIA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?06l/enY6FBQL/4p1OuNnnraVr7glL9j35t0qU9DbVm7kW8dDDXyeI9L2vhwp?=
 =?us-ascii?Q?KOtVSf342EVL4IWBpMzSxYLRNE656jByA6GD/1eOR9anr9cy9WnDevl501pX?=
 =?us-ascii?Q?dOTMFigB6BwkDrKPiBdSMTG7XRSu/0wAl3MsHHMd3XDILbEWozNXjgL3kcEG?=
 =?us-ascii?Q?KRHY0TPeOFJb3fNrwh4byuHybaat1TiU13YAmY0mvfv/TgS8+ZPuuU2cmpX/?=
 =?us-ascii?Q?xeO12gCOTPM6knqJJvK9BgZdjf/RZ6DgxhHBCTMSkq+p//k03VCmb4i++xZH?=
 =?us-ascii?Q?BkxEVzHdUbu4z7ON+7MkS1GS++nhtV7r4TlJULkjPQBY9smF2y3a3Ju/3Sh7?=
 =?us-ascii?Q?U2dnhSGB0Uke5agfXhYolc+Ql5KW1E0Hrb2Ty5YalNmiB+dQF4ahgAqPcOcB?=
 =?us-ascii?Q?ybStvmt2hULbPPCLmBS5FQSdQperfgN7+IcOw66tmMhzWR19COmElY2GucXK?=
 =?us-ascii?Q?48ur4Q8xL8x69flPma7NP2SGRxggETj+iFC6EAfE5kNbA4Rivk7c1r8EK0tb?=
 =?us-ascii?Q?DY/ro41mqDb5gOndt0BvvW/aTC72g13Y4PKSKAkufDgQmss02O+PdBklat20?=
 =?us-ascii?Q?Vj8i5sAlia75kHB1TfbPS4n/LfkV7BOchKWcn0qHYNOFUiorkcy2ptFDZQGk?=
 =?us-ascii?Q?ipQSTYct9dOrP7RksUcROVMqeKf/nUDPxgGeLPMczH/uWOBMMjtBWACPNNAV?=
 =?us-ascii?Q?46QF4nfK3tSSOfkoEZXeKL5YcGNWrJduuCiVIE/0TPxsyH1Y6HP1bHQgXsF5?=
 =?us-ascii?Q?5SA6/rpRQbWEK0guRR+FjkV1phRn8oosWmDVJIoKxhhtUccoK+wi0q3x8gl0?=
 =?us-ascii?Q?ttgxPBsTYbNPXI09xooFs+F6lwFZxP0d4vKlRjZLqMT6U8INlorYnlttMN04?=
 =?us-ascii?Q?pv6dYijnXvosRhekluB5KZ2kuvh8dk4qn6WvTBawcjajEy/YwLRYEuVQyEwp?=
 =?us-ascii?Q?Xht2npar+8icLHsC5FzfFvjbmzFDRHlZOdo2dZoUF70a9ckAQ3sPfRjns7Lw?=
 =?us-ascii?Q?Ut89k4Tjk2/OdiJ9N0j4pNp3bTjkmdOf0rcH1KlQTjovS0J1WxOWFpGo1WqN?=
 =?us-ascii?Q?zdff7waeB4O7mGgCVmKtMHXQ5LRiyCSN//r/TdZduZWWhGRN7r2b1Mg3WsFb?=
 =?us-ascii?Q?t+vZMfyS0OpMNMntX0/92HN5Uuwh0n1FgFHYuBzWo+0IaASUOVfUYRcYyWCN?=
 =?us-ascii?Q?2qwB9m7Fl6pI2x8O6g1U/VNLPBp+cTx3U05BYhWoIcUmoRo9F3bplxbm3Yzr?=
 =?us-ascii?Q?XmMQqu79YxDmb/TkbktG8y5GfYvgSEjdAxJVJhNiy4uWnm0hhSZx1s9Er0S8?=
 =?us-ascii?Q?833t5cE2MfvyfcYv+zF8jeqdIXktWGmksFrJcv3nQpGDT3Us7tPzmUcQe3wU?=
 =?us-ascii?Q?rOC2/Vxj8Z74D2x0gRyvNR7EWAEDm3D2z5kRjFYT4DVHinuxxvK0a3VAIGsW?=
 =?us-ascii?Q?akeXn5B6cN0SQwzFwXTojox//dhJ1qw9Yon5hddfGWXex9TkKnWhz9jqxJ5/?=
 =?us-ascii?Q?QbxGbpDFtCbxGz6fWmE8/q4X2nn/ZQg4RRK+LW2c1xPzTULdUcjAxEyve5fs?=
 =?us-ascii?Q?3bACWYUGsEJfNbP8L3m+Qdd+6LSUJYy++YvKl68rrGi/au87ZoBzRDrx+iUJ?=
 =?us-ascii?Q?wA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3379c7d3-0c92-4dfc-f1d4-08dcc74733f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 09:53:00.7288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yApGaz1uYUXx7SSs/uvEI3wRMYgaeS/QpMAxMMrp0hP4v5FSoHb9YjKIRm1GO/eK9jMYmEyHptIHRgwKHUmTaACtXraj59M23a4fVqJlxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10740

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Wednesday, August 28, 2024 10:38 AM
> Subject: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset =
entries for GTM/RIIC/SDHI/WDT
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Moved DDIV_PACK() macro to patch #1
>=20
> v1->v2
> - Updated DDIV_PACK macro to accommodate width
> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 84 +++++++++++++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h     |  4 ++
>  2 files changed, 88 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index 9722b810e027..3ee32db5c0af 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -25,16 +25,31 @@ enum clk_ids {
>=20
>  	/* PLL Clocks */
>  	CLK_PLLCM33,
> +	CLK_PLLCLN,
>  	CLK_PLLDTY,
>  	CLK_PLLCA55,
>=20
>  	/* Internal Core Clocks */
>  	CLK_PLLCM33_DIV16,
> +	CLK_PLLCLN_DIV2,
> +	CLK_PLLCLN_DIV8,
> +	CLK_PLLCLN_DIV16,
> +	CLK_PLLDTY_ACPU,
> +	CLK_PLLDTY_ACPU_DIV4,
>=20
>  	/* Module Clocks */
>  	MOD_CLK_BASE,
>  };
>=20
> +static const struct clk_div_table dtable_2_64[] =3D {
> +	{0, 2},
> +	{1, 4},
> +	{2, 8},
> +	{3, 16},
> +	{4, 64},
> +	{0, 0},

Is it ok to have {0, 2} first entry and {0, 0} last entry on the same table=
?

Cheers,
Biju

> +};
> +
>  static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D {
>  	/* External Clock Inputs */
>  	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL), @@ -43,23 +58,92 @@ static c=
onst struct cpg_core_clk
> r9a09g057_core_clks[] __initconst =3D {
>=20
>  	/* PLL Clocks */
>  	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
> +	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
>  	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
>  	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
>=20
>  	/* Internal Core Clocks */
>  	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>=20
> +	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> +	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
> +	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
> +
> +	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, d=
table_2_64),
> +	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU,
> +1, 4),
> +
>  	/* Core Clocks */
>  	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
>  	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, =
1, 1),  };
>=20
>  static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
> +	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3),
> +	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4),
> +	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5),
> +	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6),
> +	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7),
> +	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8),
> +	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9),
> +	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10),
> +	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11),
> +	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12),
> +	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13),
> +	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14),
> +	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15),
> +	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16),
> +	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17),
> +	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18),
>  	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
> +	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19),
> +	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20),
> +	DEF_MOD("riic_1_ckm",			CLK_PLLCLN_DIV16, 9, 5, 4, 21),
> +	DEF_MOD("riic_2_ckm",			CLK_PLLCLN_DIV16, 9, 6, 4, 22),
> +	DEF_MOD("riic_3_ckm",			CLK_PLLCLN_DIV16, 9, 7, 4, 23),
> +	DEF_MOD("riic_4_ckm",			CLK_PLLCLN_DIV16, 9, 8, 4, 24),
> +	DEF_MOD("riic_5_ckm",			CLK_PLLCLN_DIV16, 9, 9, 4, 25),
> +	DEF_MOD("riic_6_ckm",			CLK_PLLCLN_DIV16, 9, 10, 4, 26),
> +	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27),
> +	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3),
> +	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4),
> +	DEF_MOD("sdhi_0_clk_hs",		CLK_PLLCLN_DIV2, 10, 5, 5, 5),
> +	DEF_MOD("sdhi_0_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 6, 5, 6),
> +	DEF_MOD("sdhi_1_imclk",			CLK_PLLCLN_DIV8, 10, 7, 5, 7),
> +	DEF_MOD("sdhi_1_imclk2",		CLK_PLLCLN_DIV8, 10, 8, 5, 8),
> +	DEF_MOD("sdhi_1_clk_hs",		CLK_PLLCLN_DIV2, 10, 9, 5, 9),
> +	DEF_MOD("sdhi_1_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 10, 5, 10),
> +	DEF_MOD("sdhi_2_imclk",			CLK_PLLCLN_DIV8, 10, 11, 5, 11),
> +	DEF_MOD("sdhi_2_imclk2",		CLK_PLLCLN_DIV8, 10, 12, 5, 12),
> +	DEF_MOD("sdhi_2_clk_hs",		CLK_PLLCLN_DIV2, 10, 13, 5, 13),
> +	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14),
>  };
>=20
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {
> +	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
> +	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
> +	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
> +	DEF_RST(7, 0, 3, 1),		/* GTM_3_PRESETZ */
> +	DEF_RST(7, 1, 3, 2),		/* GTM_4_PRESETZ */
> +	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
> +	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
> +	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
> +	DEF_RST(7, 5, 3, 6),		/* WDT_0_RESET */
> +	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
> +	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
> +	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
>  	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
> +	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
> +	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
> +	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
> +	DEF_RST(9, 11, 4, 12),		/* RIIC_3_MRST */
> +	DEF_RST(9, 12, 4, 13),		/* RIIC_4_MRST */
> +	DEF_RST(9, 13, 4, 14),		/* RIIC_5_MRST */
> +	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
> +	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
> +	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
> +	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
> +	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
> +	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
>  };
>=20
>  const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst =3D { diff --=
git
> a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h index=
 1c7a979ab790..1bd406c69015
> 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -31,6 +31,10 @@ struct ddiv {
>  		.monbit =3D _monbit \
>  	})
>=20
> +#define CPG_CDDIV0		(0x400)
> +
> +#define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
> +
>  /**
>   * Definitions of CPG Core Clocks
>   *
> --
> 2.34.1


