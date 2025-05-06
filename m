Return-Path: <linux-renesas-soc+bounces-16722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81CAAC636
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 15:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C54F5189589E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7D0283FDB;
	Tue,  6 May 2025 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SRQq76zC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62384281346;
	Tue,  6 May 2025 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538003; cv=fail; b=pf2zSFIPrWjskiR/kH47WvJBU62h99jHCRz29UaPWc8iBMzjWynYVma5QMptYPkxPA+H1TixTwRYL2rfcWIgL5lGY8ZzlKtlOcRY5Gu2jvmTVx3YkpX+mTS/g7PkuTEAqYzcel8BsSDIe7z3rq8wIL66O+4NwrjY7fwdMsiFSv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538003; c=relaxed/simple;
	bh=0xM53IJE4azU52YbC1MrtiXkyY/7yFMiYYnEHRQAtiM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JcwkL1olRK9BNqWjUUHW2lV8ieXSs/C0v3vtr07f7UCVV7EkkAU8v1Ro11tFNtH6+BTwnk7l+f8XMO7rDzj9bDLZZwLZRd9z6OVGRmApmU3RcOmv0sRiT03+HN8nm6zm9HdLmSY5o7q/ew51e7CcQv17JC5DYVS5/NDnyFLcZoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SRQq76zC; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELfiyEnmRUbVGFsPY5A8L0YIfVU8Pk03aebn+KgXkywkwIJBcb/ySvDeGBBCVui2qWaM01eilEbDrw+Uv+ij7F77NK3cBe22+GxWrTeTMqcUPV3mAowoXPbDxxGdLPn5zeNkNI1CPKhWSMOjQopTqFjbedMS1UvypgcdHW5BpsZD9AsaVj/UYcG9eHiJ8I0rPKAQ/cWa7TPx68bPen/KeQuJHiOU8aHeapOXQvLA6DivoAWItbmb19wQUPytP7RtZs/j2O8XmhUIGoK2/kJaBQMTU1eeR7F310G4J/sBJx/hbWcqtec7b9bRu44QND6r/2vN8CkeecvB9XgewMqxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWoK0yN0KiG+xzahfZab+TLaEQjJ+3BLLoZjJAg0oao=;
 b=Sa5m2rcgCLw97OcboCTEp4c4Vy/BbAHGx0X3AwTEFtrjEAVl8CBLg7WzakQRpibPO44YSPxadwi5xISL7zYnmJmcoMvCkPaWH4bNbbcztR6h38Bc7+Kpck4BUUoOgUY1MejPJfqazrFkCBgFGtjlO/BogwZjNC2sGZiGOIcuQGwMP4AfwOyA7Wnpxx59R5MPYKBw0GBJH7cGz4dJF6dpT7jjmcPjAwgLBtf7OD2CtRFe4iOBdi39koaT56HSu77cRWyORsY4VjiDk8WoU1A/eUj4sJdvNM8q6eIrj3SYnZJeRxdZBVFCtGX6UKSWBDdN9xvQfKWpvLrfc+5IiWXc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWoK0yN0KiG+xzahfZab+TLaEQjJ+3BLLoZjJAg0oao=;
 b=SRQq76zCd3m8DjslwKzwyaz3i95H1IXa4/JV+7xKhtTx7BZf3Hbxv0GpwMt849r/g1jEjkNwKHqyU4aNXFSzln966ZnzIZmIY13wnd5DCwwREDfL3tuOlUJR6k5raGxjRnH6eFy1KYF94wIfxKOD5A+i24IUS547Crs0PLlDjy4=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYCPR01MB8533.jpnprd01.prod.outlook.com (2603:1096:400:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Tue, 6 May
 2025 13:26:38 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 13:26:38 +0000
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
Subject: RE: [PATCH 4/4] clk: renesas: r9a09g057-cpg: Add reset definitions
 for RZ/V2H ISP
Thread-Topic: [PATCH 4/4] clk: renesas: r9a09g057-cpg: Add reset definitions
 for RZ/V2H ISP
Thread-Index: AQHbvoBUFKjJ6OzxBku2ua5XvqXHMrPFl4Gw
Date: Tue, 6 May 2025 13:26:38 +0000
Message-ID:
 <TY3PR01MB1208913AA506585FF622DD7D3C289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-5-dan.scally@ideasonboard.com>
In-Reply-To: <20250506121252.557170-5-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYCPR01MB8533:EE_
x-ms-office365-filtering-correlation-id: a2026c6e-e18a-48bb-7568-08dd8ca1a1c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UOwV/DSGaIlvLpVXyHH2wH3d4cKg+htfo/B2mb55fAEcXEodsLtwlFb2PZ+d?=
 =?us-ascii?Q?rJh84ZiJN4+Oz+epaKHU6Zd+tZwHgDT0VXtFJgP+XXwIAWeyxqegUC5/OkOZ?=
 =?us-ascii?Q?G9vtBjjJXa/sezhWWZ4B8YfTgZZupIdWybUkvKat5oOzUQ97Rs6PJel3VvzD?=
 =?us-ascii?Q?v+NfV9TAwD48wkyMpO5QyufU5BQ7ZOovZbDMYc//nQgXjAeIpyLteZmGRggW?=
 =?us-ascii?Q?X8KkeFYQNnDH+TXg5ZGNofeMuinlc5ovPHWaPsphHSpptbr5MFjF3dG5IPJ/?=
 =?us-ascii?Q?8vVUajLZ174kPjFMZhKRGpSFNkNcjd71R4p5mO9nCJAPK7G34nMEf4xlIIKK?=
 =?us-ascii?Q?9ohJNNb3K9sRCJDieQ8iKVCY1Iq3U33J51zr6FjVxuurdR8RYKOW+uuO0iI+?=
 =?us-ascii?Q?zPRbTqd+rFItjiUoy0GvRgy/rsEO8TkB/kzsX7jS2B+OOiFRxJGnY8wReQk+?=
 =?us-ascii?Q?oCexPgPmdZiwLS3Xie7Zhdcq1BDZuQ/i7d2HxgskVp3kpseDIs5LF83txgfM?=
 =?us-ascii?Q?DVj/JyvGZAQ+6J82nlUuGLrcfnigz7ArIk5PDosQqEBfAmoKqCrYudDz4w38?=
 =?us-ascii?Q?DZPiAbaz6eKswDHzP/xO8TAd0D4ILRbVWJiZQOQFWt1D9GzXogn4H6SPRd6P?=
 =?us-ascii?Q?URDLdz0NW2TthZ68whalT1lWX+bzN2bEFVJe81s9Q36agU/gTrBcPbVt9OOg?=
 =?us-ascii?Q?AmFvAsZKJdMEWlPp17MuYOKElIhnwNdu2thEBMqJcxnsXPYNSxnsPMpMoeAo?=
 =?us-ascii?Q?NozlYlBQ1KGOvTMB5vviKwIYdPimDeZy2DPMW8NrBr7rVSOJbhQHt2VGwVQL?=
 =?us-ascii?Q?7mh+DlnIqL6pcPdnqB0bsEUtXMLyLLHvG/SgImYzBqHAkSnq9hdq+KDItfQB?=
 =?us-ascii?Q?4XLJKWJsSefPcVBrSDahX8DFb9uYrY5GN5hYtiyjZf80GWuiSjTjmrnxsmaI?=
 =?us-ascii?Q?6Ri7gKa0sMPszaorETKbV67ds9rxN/CJBtUnirLeVdFWqjpasYY53hAiClEH?=
 =?us-ascii?Q?A7OYdgDrEfdbAE3OZ2O3Lw0nY6dlI36YXFrdkOPOURQF2rBDngnaR+fMIXkL?=
 =?us-ascii?Q?NT3pGWAHc4e72FZnqBgTU8zxeXleAatzN9HCk3qVZ0Zr65LYNCN9FJHi/X26?=
 =?us-ascii?Q?nuQFV4UeOV/XM4w7L/zMVvnVu3hMUaDz+JDBDjNs1bIhrYi2ovN90mcfOljK?=
 =?us-ascii?Q?HSVXGSu4HBSL/4x9nO9cq8WDsegCm0hQtdNFH7POW5f2arpG2B53DAc/Ul/E?=
 =?us-ascii?Q?J+80NBV51xeZHyTQzi6XGzt1QrvyPSvi6X8WIu6SfDVNJCQQuhco0xDRwNmq?=
 =?us-ascii?Q?ozolTIKgAF6/aZRme0ePog3RAZPh6mNsaAS79wUPPpUTYd2KUxiy8Pru5fhY?=
 =?us-ascii?Q?7jxMcxrHSPVH64RJPhTo+R3QQ2e5DgfMRSE+3pycJ/y9QNF5OVinJXRdjJ3u?=
 =?us-ascii?Q?twZkEjTtj7ae4aPPQPdCLgcsQ0J+8qQ6F9XzPqUwnQWcb09PhH3WLElKe+1z?=
 =?us-ascii?Q?WkWEFHRCJE8zAIo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IVQBDvmNOOu47Bj12uoAGwAsXvWKtmU/mn6jkP6RRnUbP1jT3/pFVAWSq9hl?=
 =?us-ascii?Q?7fAfrX/6fWFNYLmJu1htSFJGbLJLB9ekTpsKOscr7SYx+DEuQ0aGp/XBDaEV?=
 =?us-ascii?Q?CSQkPgq4uXjJbVxrPidS6AvizqvnH4klgakUT+DbAnkdAcybh3qdqKyHHysj?=
 =?us-ascii?Q?UiOryvXcPTsSsMoTABusAzeePtWmVfNuZAXW32xzDHK7DBdT1+efD8+0EuGB?=
 =?us-ascii?Q?UreDFXDmnyisF8YGUVv/dRWoYhud81lw6uHsnidTfahnn5M5UfHpfU1gjo94?=
 =?us-ascii?Q?smYXy7Iv4L9nn08fkRvGufRS45V7rzSUFgivUDUptbd3Uw84kTOSbl+auGSj?=
 =?us-ascii?Q?d12TARAG/N1yKxw/ps9iv4/LfX3RHsBysG+Dw4yUVaA/Bk8nEu4UjXsb2J+3?=
 =?us-ascii?Q?6GIB8dMyZGnhIcRiZPar37SwzhPLqjwj2R3WERfOyKORX4Pum9pel4LlZK7o?=
 =?us-ascii?Q?XB7Jn/PaXUUn1eVhCPOdPIlAFLnhSr10Lq0rmP/WaY2oL6eBrR2uwd1pvMHx?=
 =?us-ascii?Q?hQQV5mohMROX6fOi7BFgsO4TFhdAem9pXEGtFcXBw0lIQD1N6cJZmYG5HgRA?=
 =?us-ascii?Q?gUt6eFdPTAV2DB2Ryx8X4FqUJB1omMPLqbOQmj4YS9cHndJLaM5gQ19qadaA?=
 =?us-ascii?Q?k7I/Dp/4wo6KribTvF8fW60JRID8GCl0/9X7cm6a+s5olmLCMK5wPUhcJyU2?=
 =?us-ascii?Q?9ri6HMLdt6De+DybXlFKCD2/M/1fecB3Nf+9oES5Kj5RI9mdSRy0QRI7lCWw?=
 =?us-ascii?Q?Vq1gCKyDVzjTMUkZg5NYFkaehAL1mEL/fzXPuXq2hM7mqF/SnE+lwsOtMryi?=
 =?us-ascii?Q?f88p5El5SgdXZEtQAL46Bus3YSx+PRMmQlFeeVadGyuSC6EOPqchC64F7eD9?=
 =?us-ascii?Q?h8IF/LftxrRC1Y4NcnBwZ2PPEV34/JP9p67k171stRJxAcluZ0NeslKGdwoY?=
 =?us-ascii?Q?gJOdCRzLU3N546PBgwWwAwuttYZHLiz6MXhRKsIQJ+KICFbLHXkENUetytkp?=
 =?us-ascii?Q?ZTiP32cQCrD9N1u4l7jTwG1Qd1/vjEPv1L6qxkVrMj+HdYYOTSBtoFr1aj5d?=
 =?us-ascii?Q?N9tOz+9K/hXRaD5iYiniSx5dNpanEGFaxV8ZbEQt4rlznFnTwEJcD5uZIBFF?=
 =?us-ascii?Q?ydWhTq6tsk18Fua8xiw1GaZBmb29S5kL0azJezMH9rZWLJJ/33gdg/oQeisv?=
 =?us-ascii?Q?qIjGAt9Car7F05OK4S5SBPLaf3KbkZtFZ1alsj2Vqes1Ovc1djkrpqSUTDRc?=
 =?us-ascii?Q?o1eAC5r2eGWZvr+369PL/+Tvp9b0+zr+Or0CrAubWLY3Imh+ueSV9CH0K+0d?=
 =?us-ascii?Q?QecOImv93GYWaa7YkhEG3F6q3UdTlad4pZ+c8JbaqEqjYjX6eX1W1jIlvTvX?=
 =?us-ascii?Q?7/Y0MvMXBhpRvuWAW8jJNzsY1loaH0HUKryrMpwrV1EvyujhHxiV5+12CCwX?=
 =?us-ascii?Q?5w5HvT+F5O7BsWVNtOQ+DdOyi/Khtqerv8LR3LUaaiM7dSZ5Zy0dtHhsbBk8?=
 =?us-ascii?Q?99ZxzShoiLwEYDEE0/cUcQbgyqnbwARvEb+4qMPqzZSYRnV0LHnAHBcRp6bw?=
 =?us-ascii?Q?xFqgRPEKe3ZyzIB+Q6a88sGohXCPb5GZ+a9cmq9KS3/pkJAxE83mL5WchX+b?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2026c6e-e18a-48bb-7568-08dd8ca1a1c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:26:38.7458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqTaAEK1ZFsg5wlj/w+SOcOHjXxIz+4CWoad2FzitgI7dA16vQzReP+ainXx80SHC8xxLKj1Uzxnco+0eEupfBcz3g15aDkXCfih3D82ivs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8533

Hi Daniel,

Thanks for your patch!

> From: Daniel Scally <dan.scally@ideasonboard.com>
> Sent: 06 May 2025 13:13
> Subject: [PATCH 4/4] clk: renesas: r9a09g057-cpg: Add reset definitions f=
or RZ/V2H ISP
>=20
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Add reset line definitions for the ISP of the RZ/V2H SoC
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index cb001ae5f98b..6537654bbdfb 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -298,6 +298,10 @@ static const struct rzv2h_reset r9a09g057_resets[] _=
_initconst =3D {
>  	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
>  	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
>  	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
> +	DEF_RST(13, 1, 6, 2),		/* ISP_0_VIN_ARESETN */
> +	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
> +	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
> +	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */

The numbers LGTM, but I think these changes belong with patch number 2.

Cheers,
Fab

>  };
>=20
>  const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst =3D {
> --
> 2.34.1
>=20


