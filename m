Return-Path: <linux-renesas-soc+bounces-12319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B800A18F92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C299C1669AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6CE18CBFE;
	Wed, 22 Jan 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AxU4+uNd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE77145FE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737541241; cv=fail; b=gpcTV+FE+uvY37xkb82kmtxBHny708F0YNJYPbAVZW9vtDHU49TpBkIueCnYZl7ma6cIXjC96aTuclNIQsr56r588R9ZCreLR0XafLIq2HQ/6BfQoE9xlIpiIN0JS7tmPR+tkCNCS8QOdUMoqKHFqQy+79yJ/heLzpUCkf2+bB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737541241; c=relaxed/simple;
	bh=5o0yBrG9EQzO+DWYtQ1h7bMmmosvuKe6i+AE1XNa6TY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cCvepEgFN65L6OJoM47udvvuJpx+zdkBECHdQFIQficFAPdXoMAo+vJuFoz005UuphgO0tHaG/UYC+zu4C3zirhLhVYEbqJpyIrTSh9ZvF6u0HlkdFg1/Zze1UBgUDJMBvwi3sw6RQ++huBYzFq9PygfCyfIqZpOOaOzSllVfvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AxU4+uNd; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8BaFfiRJrwve2HkXjT7taTZjYvOM9daTcvQAoxc3TEvLygGkm57lhz1jX/bOVDSFOFjFgxXqTU3JfJuL/DJsBfi+Er6qiuPM4XrQAp5zFa3twcREATblYXZ9TyPZ46+PicE58OkMrLPkG1STop+rpv1MnhSt3NHE8f9L+l+pmBLW0QmSLccwe7oZbLt+ddNyFw3SaYu2cp21I2tIfiQgeBlAFavFGbSFoJGd1a4I/SDLOVzX6ahlSA6apXf61CMn+xx2wiLcmk+nVK9Fbg8zA3XuN3prvBy/4BpI/MIOqmm4hN+qFpVal+WlDj5aPp7RfFTRuSNJZYXOUqHrF0PJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJsibHf75Fqz0ZZLME0RZV4Hlvr9pS9lv+OLklGch1I=;
 b=LyTh/y/50aPJqsQA9qnwOlH+nJOax2SjyO1rk3oifvFQqtaG/Hp8SMWJwHkAeGuI6ttMCV8EkUa1yb2elFp+lFwgGbdqxSzw0ZCml0a8+mVlvvnai1nu1D0WMPs9I5eAgzib7EXZAZxGf54uCInpH/XHxxKNzNfKX3ikYnuRZs4kRsyg01bqDLoPHBk0MsvP1MQXjpGmCWaTwxzt7Ev2x5gMw2tSGvAdAELcY1jdZsA2zTJBhI8ps5ErlIryg8CKo1Du9bLMsqkIdWUq90iJjf8XlJBxYkUvaJXJu6FVdBRY65srhFUzf+tKkwMM8CuNjwqEIUyofihBiTlKxVSR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJsibHf75Fqz0ZZLME0RZV4Hlvr9pS9lv+OLklGch1I=;
 b=AxU4+uNdhQcAgfXN6xgnTXfic1IDdstzmXFl+tKrgXZiTD2YRNvfiKbjNap9+PLBgRblwX3HcW6fpuYHgU4rtdCaPfzxZyzpCTEjk5oK7NV4pTjkdsiuszPvG8AUNAYMsHDiZuK4GwZ0mElgFBVA4VifzSE4QNozZPCxcWe2JnY=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS3PR01MB6533.jpnprd01.prod.outlook.com (2603:1096:604:100::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:20:36 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 10:20:36 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 07/11] irqchip/renesas-rzv2h: Add tssr_k variable to
 struct rzv2h_hw_info
Thread-Topic: [PATCH 07/11] irqchip/renesas-rzv2h: Add tssr_k variable to
 struct rzv2h_hw_info
Thread-Index: AQHbayBn7duBxBsuUEaaUN4CMl04AbMimCBw
Date: Wed, 22 Jan 2025 10:20:36 +0000
Message-ID:
 <TYCPR01MB1209347B2C9CC729634E62834C2E12@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-8-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS3PR01MB6533:EE_
x-ms-office365-filtering-correlation-id: a68e1acc-670c-4771-dedf-08dd3ace69bb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pzPrKGieG83ggpaxb68DH49raHuKceTxdFHvXZAvcW0cCD5jItzVvFy1Ucoe?=
 =?us-ascii?Q?/1wZrdgMkvL5MJrxRq8QqfTWFD9Cjj9mV6FeN3fpeWlwpGFPgaz9aUM+bRcE?=
 =?us-ascii?Q?EabYbTID3u4UAZ9aaSc5IEWnQPI8ERINTyufbAYGYYj+bSQHSxvCYp0akE2v?=
 =?us-ascii?Q?P8bEbsWJZnRSPCjyuHsSc79bV1yCiVTtrw/8Uoy+0rp3oVxp581r8lhvBVcH?=
 =?us-ascii?Q?DEyIUqdXFkhLnxaiKt9XS5ND5SeVsVChUVh+HJ5oralpWkIODRR7Rh6k6C2i?=
 =?us-ascii?Q?lFT+sB1GB9YV/eeYAAzCEpzRd21xayA34xXkhXso0EUkemwmPVjkJHpP+YHp?=
 =?us-ascii?Q?pkduPjJ9p49p65mpAOf+Yk6ndzbXrtVX6cy0jjiJDmrpvtA4QUwfKOj2GBtv?=
 =?us-ascii?Q?jqDIJcemOP7zSVQdm07AMMZGo2l17ef+PlY8Bg3c4bwbmzt76NtFSF1J0TfC?=
 =?us-ascii?Q?TvpGyJd7XOJ5ishLJRrFJ3gL+twlBnFjQajlrMVOEuz5UeOkWBW4EHD+Y+E1?=
 =?us-ascii?Q?IYb+WjLZWBu4gCmIx/JdhC4ttZVr4sQj+s0V2h09TqJz0+cqW3t1OlpHzyRs?=
 =?us-ascii?Q?RDv6W7gSl3nexx1OS4QeAsw4tavFB1wpic4UAyuQ5JQgpovZkGmPMhCbVLwB?=
 =?us-ascii?Q?b0OhDVd6DV9fcuhmmT6OEV7MVaHXIEq5wKj2xF42hKq2lH3cJkk7BImh3pMx?=
 =?us-ascii?Q?ws+rClwnljNXuAroZu78brTB/Tyho6iM7J0lIkhAC/ZzjsQV/EF77PZvufCc?=
 =?us-ascii?Q?Sdhg/V2cttlIa1M0PDydTvhdTN0z4aaY5v2NTbK3vEKZqYJrf04fjIFhSGeI?=
 =?us-ascii?Q?kMhQX6opCEsXwuEiWe1suOTn+BgmYbv4dyHelUwHAMJN/rWDpi/UM6y8QqnQ?=
 =?us-ascii?Q?TrAgL11ebC0j/Grig2k39cxb3tBOOGO+us+LpGFnjyeOvaTPikfXSFugzavV?=
 =?us-ascii?Q?3ZFGtR3+V03tNafMhsxEQ7juO/6SUcWx2GG60qZCG0kki7Lx3IW5GhE8rAhQ?=
 =?us-ascii?Q?BwUzEvVRskhI2uFjdhzFG/lPzI3FzdbvWQlyR1o/+QHdZiTw5diDbUJcMHA0?=
 =?us-ascii?Q?zEXL0wevqmImSX6+woOJfhGoOiIPL2VEw3EifEYXH5Nix3W+LxU8W5YCy1Dd?=
 =?us-ascii?Q?QO8bfEblT1MSLYaCeCKRR7s/EEdBND2Rd3LDJWMLDRc08akanzxU68ho7dgW?=
 =?us-ascii?Q?nersrsLuqyZpy7ZluU1grt20bDTbVLY22E4MA26hnRzhGzGNVNr7nyuw08kr?=
 =?us-ascii?Q?9jiaolUVMX1ZUoZ1TaJ0JUN73un6CN1I8S+cOs1POmj8Rbk2PQ2q99a5waU0?=
 =?us-ascii?Q?APvWjOAH7l/TVoEC4gWUOX6wUhguR/awXGmz5eTWHcVsn8fjDCSWQsiupFb1?=
 =?us-ascii?Q?kc1fu05zhZaaVhl+fxQGUUs5XGPEDsUx/HXMnG+f0JmXx1ip3LZoINVUysNd?=
 =?us-ascii?Q?dsWOZvnr83nxIVZqvRqnOczqp5hqxzaT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GsGblkD5kfDOv8b8QKFa2G0HsbjDcWp3wG4XF+U+7Dj3mur/vxT/vCO5OBDg?=
 =?us-ascii?Q?VIRsuvbG99UAHBfgY+NuPb9RHTjc+xN83D9rF2Z9fDimYml31dRo1GXpwbBv?=
 =?us-ascii?Q?DYyIO75RqJYQrpzDSSnYikzJQ3/eXZBpDvlxlNj04QslZfLq5D49VOOQJtpP?=
 =?us-ascii?Q?rlSy5gGXC1+qOxGCIcTVMPqXwLZSSqbwzX7e4Tnq2Xc9KO9ed9j0vXSP+Vkl?=
 =?us-ascii?Q?aVPpHmS0fXlZwh24XX1TEzEjg8LeKbDZQ5tkgEJ7v6iybnvyZahSwSssW624?=
 =?us-ascii?Q?nHFBgjGiYw9L/3Mof0g6fp0C4N0UkiLn0GhRbH0x2nU2+V8qf2H/vhPU/9EN?=
 =?us-ascii?Q?3f5SSYGU+fTkJ4bZ1ZdA23+M+EkPzw9tiv9rx2YSy89V5jyTtbL6Y5Y7+kmY?=
 =?us-ascii?Q?U+fXdch9EMwOQs53OxutnUJMdcMtLGpQRWCgbhJv7yRZB+eRLBZJEh4m/bJn?=
 =?us-ascii?Q?HzqGsrqyiCleAjptRDp3DiFuDq242sClEhytvRSVmJppTDtZVuwiRrUQwqjr?=
 =?us-ascii?Q?91ryfB/5PUNKKbTikLB6qdfVBKQVScTeqZbOJ/1WHk588wXvu8QkS3EdWZUT?=
 =?us-ascii?Q?BNcA01gS2z+7kqJA4vGXk53yJzM+S3qMmjyjeOZpTzGgTlW0GV7e3Nvbk76p?=
 =?us-ascii?Q?pdootr93H6lNCnfbVuUciHLgmYf5mKtL7HYofAChRSSIjR9ObGR41OW1d1U7?=
 =?us-ascii?Q?tfmiyqz6kceaiHf7jRRoVZ99sx4ukNLUYEWs3ZYEeqjrvIGnd1xfy/izkoiJ?=
 =?us-ascii?Q?I8+Va645Djf4+iYR8JYh2IUDV3WniN7mGC6ruxrI6YI96q4er+LYJyaYrn08?=
 =?us-ascii?Q?Qc0GeTVaMidtEWRYrVC9D7ZpnWyXG9rEwxC7SFDrjRX966QzJy55l2NeLcTz?=
 =?us-ascii?Q?kG3d3U5L8wNy4CohOZ530usXSPy/4qT1s2q92eHAZbHWZa5v8U/H5jX86Lmd?=
 =?us-ascii?Q?94KfzufC/q0tGJwcjGU9RYG0CB6SI2cmtn9ltQDgkAIsNDcnnTFswoQv+5cx?=
 =?us-ascii?Q?7mtXnmMfu/R/mQlbKHeVy7pxesRh5zUWxHZ6vdpSrn5ycX3Q9dAkbwM2xPEY?=
 =?us-ascii?Q?pThVOt0rRtazS/stXbdmIt8m+VcH5b5+HFU/78pwihNLtI7ibSWL8VINg8zR?=
 =?us-ascii?Q?pVC+uQ5aQE1iZPUMRlrx2YZOJ4mqaKMa3gD304/dJl2rRpLfDCm2vtnOHw3/?=
 =?us-ascii?Q?7hXYcsN/7fgBqtyiAdMCPUAQ/9C57ffb8J6XKyG+alATwHGCGd/SiU0ijRLr?=
 =?us-ascii?Q?fjkO4llrgS23MFbaIEhUQhVixn/cd2Fy0YS+weC7ZAgpI4mzQ5jdk8MbEIse?=
 =?us-ascii?Q?itnC9ruFSDYYrbV1LHfcQ1xCT4wxRGQKcADcRyWQZs15XNYYhPVROjhBYawl?=
 =?us-ascii?Q?rivre9+UclvLQM6MgunpM74MwKvJQ3BjUvUwWhYiDwdf4wC1tOawIV0O+XuP?=
 =?us-ascii?Q?eP+CFqaWVfiO8et6DfokkjMXGzvegL1fAAnRyK4W1eEtIjI8VzbC8YmnpFIc?=
 =?us-ascii?Q?oja0xkeDjtk7UuVnIwjtNIPoS3qRQbnMjSXUfJ2GbZr3LpsHSfJSSfsunBA1?=
 =?us-ascii?Q?lJDyph7ZHZbYmdc6GaOX5pt6AJSo+j2Amx1xT0iNKXmYbV+Kpxem6hsbSnu4?=
 =?us-ascii?Q?xg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68e1acc-670c-4771-dedf-08dd3ace69bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:20:36.7840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fv6PJm4UTa31tPuBSgDM/6zXOa3I37AuG9uPBumOCoIDoIYJQJ/Z3jpoZ4bSWeGRN7HmFqVg3Kb9Ym4qzvmZoUXf+2neixqUB93J07+NOpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6533

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 07/11] irqchip/renesas-rzv2h: Add tssr_k variable to stru=
ct rzv2h_hw_info
>=20
> On RZ/G3E the number of TSSR registers is 15 compared to 8 on RZ/V2H and
> each TSSR register can program 2 TINTs compared to 4 on RZ/V2H.
>=20
> Add tssr_k variable to struct rzv2h_hw_info to handle this difference and
> drop the macros ICU_TSSR_K and ICU_TSSR_TSSEL_N.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index b244cd61cba4..a9a9723ff4bb 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -64,8 +64,6 @@
>  #define ICU_TINT_LEVEL_HIGH			2
>  #define ICU_TINT_LEVEL_LOW			3
>=20
> -#define ICU_TSSR_K(tint_nr)			((tint_nr) / 4)
> -#define ICU_TSSR_TSSEL_N(tint_nr)		((tint_nr) % 4)
>  #define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
>  #define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
>  #define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
> @@ -83,10 +81,12 @@
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
>   * @t_offs: TINT offset
>   * @max_tssel: TSSEL max value
> + * @tssr_k: TSSR index k
>   */
>  struct rzv2h_hw_info {
>  	u16 t_offs;
>  	u8 max_tssel;
> +	u8 tssr_k;
>  };
>=20
>  /**
> @@ -144,8 +144,8 @@ static void rzv2h_tint_irq_endisable(struct irq_data =
*d, bool enable)
>  		return;
>=20
>  	tint_nr =3D hw_irq - ICU_TINT_START;
> -	k =3D ICU_TSSR_K(tint_nr);
> -	tssel_n =3D ICU_TSSR_TSSEL_N(tint_nr);
> +	k =3D tint_nr / priv->info->tssr_k;
> +	tssel_n =3D tint_nr % priv->info->tssr_k;
>=20
>  	guard(raw_spinlock)(&priv->lock);
>  	tssr =3D readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(k));
> @@ -307,8 +307,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>  	hwirq =3D irqd_to_hwirq(d);
>  	tint_nr =3D hwirq - ICU_TINT_START;
>=20
> -	tssr_k =3D ICU_TSSR_K(tint_nr);
> -	tssel_n =3D ICU_TSSR_TSSEL_N(tint_nr);
> +	tssr_k =3D tint_nr / priv->info->tssr_k;
> +	tssel_n =3D tint_nr % priv->info->tssr_k;
>=20
>  	titsr_k =3D ICU_TITSR_K(tint_nr);
>  	titsel_n =3D ICU_TITSR_TITSEL_N(tint_nr);
> @@ -515,6 +515,7 @@ static int rzv2h_icu_init_common(struct device_node *=
node, struct device_node *p
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs =3D 0,
>  	.max_tssel =3D 0x55,
> +	.tssr_k =3D 4,
>  };
>=20
>  static int rzv2h_icu_init(struct device_node *node, struct device_node *=
parent)
> --
> 2.43.0
>=20


