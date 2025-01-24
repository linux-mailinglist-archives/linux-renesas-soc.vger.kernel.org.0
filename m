Return-Path: <linux-renesas-soc+bounces-12450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CFA1B291
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 10:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FD71887B98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 09:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C4221A449;
	Fri, 24 Jan 2025 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FP7IFcFV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C51219A89
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jan 2025 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710682; cv=fail; b=EbCoxKfp3wy7Ato8W3TRsCus86VAQazJ5RvOoGokcESSYhYuDZfrrdr4jBMjUu9tzuGgdMpi5u05DIL2DkOJFRRNq3SBLoY1xX6h6sQP15GDtNV9BGMnkvgrArCHMOsxXjLT37cTlsJ0EwbHLN+KN5xD4010Upptus5yyc5Ced0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710682; c=relaxed/simple;
	bh=JlsAWLOy8AJHBNQ9XnlDo2+18uMoWBXgBVzFeHuOIa8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=myem7ivA8YeWox5v8rN/5m4825npzAb6KDU177kxc8ZzMye8bDNex8v6CLdpSrQAqCfjur9/89G5VdadCinykma+LJ6hcrvC9GgrZKyFGtkC27WZESpGJdHp0BLWkx7A3BEmtRx1OX02KgF6cDBXmTOB0nSUzfkqhcB888JLTbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FP7IFcFV; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7d3NNcHS4huJ+EHvalEVPzlqHRPG0yu4h9hrjHOOtisMMNAK5rYWbE2xSV+I7BTMYAmM0526QmU8DzDD+yfrQVOKTv7mBht+RRazb9SE2WUxneGs9Dhctl0OtqvfgH8D1JblSleZU73o+99uWzjPNXKJAN2veH3syfiSIc5bO12qgvGqsImmxKQ9jQ8HkWGhtLtHxHgLzmzage8EnuOcV4nf/KIAsUMFIHCyk9SZ+R8s5hy6+z4k89nTPA2gmQeSi8jnpHi33CgFLi4EaEav+zB67+1nk3ZFrHjiPeNsbt0APyP+6yscZlQdaL0ho22d/wopAOq6h/o4cJjUbaZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oye50k2EepqOGqzfbIg+3KKNEFi5w9SYTenEik4gNjQ=;
 b=TEN4+4NL/FlOVZNz0KzRlgnzkO8kc2yWEnukucKpJrbd2zspfK2Kp2Ncv4/1e0wtmLwGvWShWtyJcJ8nu8iEEsoxds4r1L10jrXubF9bU3gSLNaDmaA4ZYFyqpUfzJrOcViDdm4QSUKSwqG8+oYhVL+JrNYXItyNFhjNvJszKwnDi2+hTuIQxyGsfS+EENSnTlXVxH+fiwOZMY20g1qxDnAhjei3T/6kmLaCh86+SewhiDMdfB4rPJU48PhsVtFE8WOJBnhvhTsCIhLmBWiE6K8I7gY2iMGSvLaXq2OzmgTBo5q+IADXviraeeRwfocdteXJMNPPHp1Oc/GXlL39OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oye50k2EepqOGqzfbIg+3KKNEFi5w9SYTenEik4gNjQ=;
 b=FP7IFcFVGI7xU9tHZba93Y8ViQTfrg0Ve0OG5OLS3U7+sZajb1WG9WkxdDQ7MqRXYnUNQgN5yEOYtcdhhnb1xBMmzap/nY2AL+no4LpeC2W1Egv6CWotTOK3szFbsKWbVr8LCYYbUYLR9N0m/IpAb9FKpgeAovffpXk5DXmgEXw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13773.jpnprd01.prod.outlook.com (2603:1096:604:368::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 09:24:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 09:24:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/LOCAL] arm64: renesas: defconfig: Disable
 CONFIG_PROVE_LOCKING
Thread-Topic: [PATCH/LOCAL] arm64: renesas: defconfig: Disable
 CONFIG_PROVE_LOCKING
Thread-Index: AQHba1mtPU5TOtScMkGu8HX/jk87FrMlq/qw
Date: Fri, 24 Jan 2025 09:24:31 +0000
Message-ID:
 <TY3PR01MB11346684AD4A3CD03BA0F189D86E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <c8439b6b731cd44c0d2442f437d4ceef336125b0.1737390987.git.geert+renesas@glider.be>
In-Reply-To:
 <c8439b6b731cd44c0d2442f437d4ceef336125b0.1737390987.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13773:EE_
x-ms-office365-filtering-correlation-id: 688d82a3-90b9-41cf-6b43-08dd3c58e8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1OZe5Go4TMuNxGY6Ghopyz3W8ro4nzuUNMiS/95NRjqN4BdtXx+VFMWjD9kX?=
 =?us-ascii?Q?0ckrppIqIEI/PZ8PzZV/QTdWRWa0BCkchsOyi3VnDoCDRCwfJagueKmroweh?=
 =?us-ascii?Q?1fxQQeTta/usbWZy9uBOgc0y7xSP0yjFp9fRAhdUmiZLVH9lirNvQFpVoPNR?=
 =?us-ascii?Q?e/+JBVUMYoZ/avLYa+kNd8evc/gH6/PjNVLJ4hIHyBurh73yThmDkvjq69FD?=
 =?us-ascii?Q?rYgM02vVJg1z+H0sBLD2Sii+GAbqBvI6wVV6cxdM90fC0kWXZkKleAP667pG?=
 =?us-ascii?Q?q/cisP1GufS+0YFSq8ybeR6YpzVPjaqVs/GnQB3F8c3q0YAUUDxmBkLnth64?=
 =?us-ascii?Q?F2xpqmopSvkSJcdOGHhveAsKYVMKMh0D1cF6UHiVY2lAFpvKd+yt0BRHJN8/?=
 =?us-ascii?Q?hqlOizq9byjkq0Uh89PvkDNFHjZoOV6mwgqsib4btMA1a1Po4O8/w19aLbhm?=
 =?us-ascii?Q?JU6xVTmLww/piQr5D3z3by+hzRmSgE0A1ZfUfJQUtbIrBeg9yb3JB23gg7ZE?=
 =?us-ascii?Q?oqjHFyHiGw3cJUmyxf4+X44XBmj4wftw/ZdXUSCWwKnbHiafwYzVgGNqiq5s?=
 =?us-ascii?Q?UFmsLX/wiBoeg7wY3jJD9VvVfkZDhpDKkit96AUZXl+K7RB3nNq3WbolTEc6?=
 =?us-ascii?Q?NNrte6VM1qf0+gWO+sOPFTtaXp/8CI6gCRwF2FpobEpRcLIxyditBw6P/Ut9?=
 =?us-ascii?Q?jFOKD915SBdQndRjl6CdR93geqklyzBko7DIcmS8i5VcG0Q0tWJrsu/ypV9s?=
 =?us-ascii?Q?r9N03jWvQpPDDroCl0iaaC5dw99MCN4/Xqzk8dCeVZkJIp67T432uPxI1MWz?=
 =?us-ascii?Q?A3sXQ0vqisPZJ+5MQYvgYTTyRLcpwsiQ5uPzc8GBUQrI6OuVkYTEQkTVE3EE?=
 =?us-ascii?Q?PrKaQabnbnGnMtll9F6K2a3lZOXRQU+Gus/66Fq6txQX+OGcgzyo85jP7apr?=
 =?us-ascii?Q?f9fCIDbZkvcciVW7W7j9zvyG7Ndat/uUkMq5/9UUwoP4+gOEpdZXKEKUO86j?=
 =?us-ascii?Q?XoxwrcLgnDl/UU2y/SlvuyL5BkL88hCWNmphHjqz3iHxIErcLDI/CeY+upwL?=
 =?us-ascii?Q?5rGI1cUJEewy3/2G19fQBFMWLW3zWP8wS8ifbbsMvii6yWvinBLKIXkuEqGe?=
 =?us-ascii?Q?QAxY8UkmRPhFpAl5LPGct9Y1swhWzvYBtmwPMRyuRWrdEP564avy57QOigo8?=
 =?us-ascii?Q?nhs6W+G87FukEnsdKe35tX/iy6sgiRhIhXDdLLtTPZy1hL11wC+7+Vp+fAmy?=
 =?us-ascii?Q?VZfyU2dVpx/E8kcfw4WbmyfyhFddr16X2qGVQoOp9g8EXJ4iTkQjKuDEGrIN?=
 =?us-ascii?Q?mUxNbYgx0qRZcvE5Dyg0Rn626mdLxvN2xTLCc0muEnkOU07X9SoeIoM3tmpO?=
 =?us-ascii?Q?QvXxBkyCimViIkNC3/ngNA7reB6otzLYoQ5h1fzZjHcX7rSQJ6P7g7eoBkCH?=
 =?us-ascii?Q?ukAg9lGBhzQ2ol51JEcr4sEns2jSaBdE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dwZ8kffWF6IPlIHZl/UDuOhHPG/D5DEx7kxbIsLl7Lb3D12yqEuSVXVNsSbx?=
 =?us-ascii?Q?rOiVvFDbFm6VrV3tSCOoADQmcFG2dahKB7X0M9Q3zHiOE8XdPTl1P5DGc1uP?=
 =?us-ascii?Q?bGi8jFOOmrGFqQz7xVwepB5B5PWlFNCOxLWl+IXbd5cmX4lhvzO8g5dvs9D2?=
 =?us-ascii?Q?xdjuh2FVGGFgJ77b92T667F0hhkeaQ03geR+WDzrYc3xn+le6Q0YhhJ8KLP6?=
 =?us-ascii?Q?As7Ao7ZGZ/hgNLuafjq51KYb2CW0ZhhYwxLkIab54ISsdMKUXHf+oYb1Qd6j?=
 =?us-ascii?Q?5G2S8vvYGuJ/w23YifIorH5wAaVYGNEkXdwQkhVdohyGkAw6W2cQUpLTAGxe?=
 =?us-ascii?Q?0yLcBJZMW9lYYjVlJQNabcr6u0ShSEwdTEuV51jdCHDkP6WA31swgGqRjs5f?=
 =?us-ascii?Q?JGMZ9iNG4Ya2ELPT3jqNaW/Q0w8ycbn70SvMIl9cs5tebXFHdvywvyGHqrKx?=
 =?us-ascii?Q?BePSwFhradpe8WMpUnC0ZwCCDhXYE/uhvwpj0FuzQc4hUtsd4QzHqlbTL/VM?=
 =?us-ascii?Q?tnzZMB8MOrBu7+ArubrTBFwlS4LVHXRtYtdmtxy8DNu2vOkKQosQn6ePLb7v?=
 =?us-ascii?Q?Q/dPjVsMdxsU2M/YxYoh6ka154+t8KZk9sGVN3hGEzyDozkXxGHAOnzK8JQM?=
 =?us-ascii?Q?l7yP3errLiWJaCTdkcMMCQ+t8jquQ3/losIEgSf/ozpl/x0mMlKuo9gyYbgb?=
 =?us-ascii?Q?jfdeZB/9qOYG4S899sDkwMKB31qu87BdDeBG4C9zzTAwao165NZrTt8JXVDp?=
 =?us-ascii?Q?MSmExF5k6VMeGRJ8MKrE7BTZBQA8Zwf5j6Rx9uyupgGPaQTSXTWS/jEt3qZF?=
 =?us-ascii?Q?mm5+xps+LDmOxvnHQfXhTph/AyN4MQXw0PKOlkYLr9Zg9atsQU4aY4EbE2AQ?=
 =?us-ascii?Q?yN39QSQH3875RlJipoC/Pv9I5MHT0N1y0buYjEqw6rBYnTcamBCwSoGsrj7U?=
 =?us-ascii?Q?zZe1QxW21Uwqm3NtS9l/7tv/dseaVp0Q/hW3tvDdfk+Cwwm8tY4sDbcUwTnx?=
 =?us-ascii?Q?Zj9eGP78xz9f6luzeLkEGHYeVAWMlBdXCdv0CmxRKHbo5/2eKg6lcjN1Qzda?=
 =?us-ascii?Q?GM2kbdYm/fr5+iEMVtTiI+vhWO8fJx3917/LSvAQuDH/2rtIF6Nj9z+TrMtP?=
 =?us-ascii?Q?1/bt5Ti1WUY9lRW0p9I33r/ozGob/TmDjcjd1EL0Ud8WT/GRW7BxhEa3tMsm?=
 =?us-ascii?Q?FXaQ64DR+ymeFAiis/HD2v3Av8NZFYOalJL0ySTr4DKZzKFhs5Wy27Ur9Tji?=
 =?us-ascii?Q?0LGrk9bD2lFkPejPvL6PJPZUqRWiPnG9mu1xm83LjVOPELB82RteaSoCgkl2?=
 =?us-ascii?Q?FPrdHiA9UEpqafjDvTrUtnzr8i/72mSdx0bHFjFa1iwEL9EduKcbF7vHvSAQ?=
 =?us-ascii?Q?rmIkk8VgmKukqnM1kckII4lEaDLiWwloz3al9+yizfvTONK15gyBr5fD/ESl?=
 =?us-ascii?Q?xmYCGih6BhoMp9Qc6TmeNmOiUexAXLNFo4YcyuqF0/V968Q80syl8dMRYyIZ?=
 =?us-ascii?Q?BkhYxX6TbbRGORu9muolDYxzgOWOLMFT0/OzsKrSHDIP83/w6LkOBwtY/EE1?=
 =?us-ascii?Q?JmvVLH5F0ZIivNDvqgsEuLzw8zFTyfMY/Li7HN2bppG4pfpd28JBPHM2PlIj?=
 =?us-ascii?Q?hw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 688d82a3-90b9-41cf-6b43-08dd3c58e8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 09:24:31.8263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThDPqFOc1EOJCzM2XkAdnq8bUx7t9TH3nJbqncrZ5WWCPCeZ/jnM8vXPKTlYCgR9kbBAv3OLtCRxcQ2GeNsOWvtRrB02PMvmJjv49e/EFmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13773

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 20 January 2025 16:38
> Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Disable CONFIG_PROVE_LO=
CKING
>=20
> Proving that all locking that occurs in the kernel runtime is mathematica=
lly correct has an impact on
> performance.  Hence it is disabled in most defconfigs.
>=20
> Suggested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/arm64/configs/renesas_defconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/re=
nesas_defconfig
> index 30a865507d6e5ad4..a3a324ae9e3867ad 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -455,5 +472,4 @@ CONFIG_DEBUG_KERNEL=3Dy  CONFIG_MAGIC_SYSRQ=3Dy  CONF=
IG_DEBUG_FS=3Dy  #
> CONFIG_SCHED_DEBUG is not set -CONFIG_PROVE_LOCKING=3Dy  # CONFIG_FTRACE =
is not set


This config used to catch lot of bugs during development. Now we need to ap=
ply
It manually. But on the positive side, CIP uses renesas_defconfig for testi=
ng
and that will have performance improvement with this change.

So,

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju



