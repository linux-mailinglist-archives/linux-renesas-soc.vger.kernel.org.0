Return-Path: <linux-renesas-soc+bounces-12372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACC2A1A104
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62BB03A38E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0EA20C48D;
	Thu, 23 Jan 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pnQIdpA9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511DA20C028
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625419; cv=fail; b=pAIW9OD461r9wca+9AYJ62cmLUeEXkWd9OTCEssYNa+LgckWq58mgohkIi/vIHPa0Tj9OO7/7rWzC09grH1u+pkwJgUf1alfgpXGqi82yjEA9tN52CIFwfNw791yBUryaYIR0zW04LfrJmC3Il2wxe9FO1DQjQeR38BbY7u1OTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625419; c=relaxed/simple;
	bh=sxJfHpG8AZZIS06WPqL/0WhSD/GNVU6IMMn1NNfwuP4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KeuwQUsoCsXsszL2No5mBjh9bKNAAHZgvywS+KB2Bjp69jM9EfUkwnIE515GAxK+ZzMC2s0I64OcSrOBNzaIRxhw6grzoCWtkgnG7ADqSFcDC2YH4XKaADmdEQQVn1sZj+W2/jMZMxPm5gReElZTlRGW67sKUheUOh2ubQ/GamU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pnQIdpA9; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXFpvhELW+kWhk/z1ZhwKvGtK9hOyKNV7EanOpCvwoBdbEBx9kkRd8swO/68mbO0wwzjyZ95Ge1YM+dIqVkMWAaYdbMoflpRxexdognn+K8ZUq00IPzBVL+7KM4HFguc7S//ZdjZDh9xlgxU7XzxJ/ZRrdLtvNaA0e+CbnRNXyIboTKgdjE2V7Gq0pIvq0KlMGe0a8jWlPR8U3SlXDrZ4fuZisKQss3/KZApSNGFOKtTcyHEWrNc/1qRWiCPy9y4zOEAhEw9KXqtYmXz0v4cVOT6n1EKMdp7qHP1e5ORF8q5PirVug54YHhbhbgr6pAPh/uVEZTlpP12GREOxgUfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbED4ure95QFSc8OYuptSzNpZoieoBodX3DmPeo3i1I=;
 b=E24fhAV2SeTkukGANJ/SIdXOn1qmWc4rN+vfekdiel8AtCov/GmyF1IGFmDgR7wwskTqMaS4qywF5DfhamObCRVtdRDjqaI0gczgigVNEhPUh7mNcNRsKhqoNx4XvNDx9YqR16uk7nAzTIsfdtYHxK6xukKhKZfCeFXLo4CO9VUV3Kmzn59z63F8vM3wG4ZRDIEV8DzWwTEMzyMOFpPRBDNKHS03TnjfSge04cZvHe0iPRpl9lzZnAHpZApk2AOU93eTCvCa5hNIHh68NVIXXco4lscjDbE1HDpYghnYgSrYAyMx5NlP2bu0DCtDllswp1i5Vo5q6t0zgaQdsr8lFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbED4ure95QFSc8OYuptSzNpZoieoBodX3DmPeo3i1I=;
 b=pnQIdpA9oO5BuElW/96MJqTHuAnh+0lTebQj/ETf2G+55d7MPZggiK2bYpl3J6v43b0jS9ceK6GYKM9vOBmoIqm28b+bMEtDpG6F8RuRjbZdO9v4K9d25D/xAXeI2FjJ0b4nD6Uqmsg98748pIXujAAgKTIaVOc6WvOGm1YZyXg=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB13964.jpnprd01.prod.outlook.com (2603:1096:405:21e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:43:31 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:43:31 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 08/11] irqchip/renesas-rzv2h: Add tssel_mask and
 tssel_shift variables to struct rzv2h_hw_info
Thread-Topic: [PATCH 08/11] irqchip/renesas-rzv2h: Add tssel_mask and
 tssel_shift variables to struct rzv2h_hw_info
Thread-Index: AQHbayBnosgoRGGUhEm8dryFbeAgqbMkH+YA
Date: Thu, 23 Jan 2025 09:43:31 +0000
Message-ID:
 <TYCPR01MB120939B548ED8463A50FBE830C2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-9-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB13964:EE_
x-ms-office365-filtering-correlation-id: 24e02cf2-bbd4-4969-5ecf-08dd3b9265d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?e0rp2ZpPT5ox7CfuWjl8EJXIQbvHuFIHsJGfiCkpXEFY7im+9Ozn9pFpplGM?=
 =?us-ascii?Q?sZmmkEOXyX9wZYm0nFTl/yJ2EyZY1rfupaDzX5Wv8wsj4m33wfjyvxmwqezK?=
 =?us-ascii?Q?4Gy640f2ASirJYAteujPFwOVOhZK5vs7TS5XbXGYHiAV9UVbOfwrvcakcVT8?=
 =?us-ascii?Q?3vLuGDfIT2AwMCwBGokxA02jPKdoE7tnppmErI3b8lq8BxOuSfAiPVvaRGwe?=
 =?us-ascii?Q?aHTkowfijL4puWUoZuqrttlaReC4lBkWpp1eiocqulcOSNSCOGO6JxlvYi81?=
 =?us-ascii?Q?Ei3O59KFIKyF16M9o+ez+vWWmmUEpHOtmvhK62QCIMwRwXOiCna2oeaX+zIf?=
 =?us-ascii?Q?WmUpjCb4CDvMuo0kIkDD/xQUgL9jo2Ug1/3mS4Rq+hx+KyeLg9brkAe82/SU?=
 =?us-ascii?Q?rd/vVoSbZ/7z2MH5bl2GhCabkPF+yjZ6TS8Uu9L4CsyEtrZFerm2MamTtJyg?=
 =?us-ascii?Q?fdwU6wwrvy3OCVHimqF/AUlXJQP5vroRxWK2Gcc3MDLD8YssiJbZtiF30OVH?=
 =?us-ascii?Q?avfCxzLOdgAZ8KL1SUJJATzdmH+x3uU+FcjnOaRelyNrGe4YvATybJaFILb7?=
 =?us-ascii?Q?55sluBgKUWywZGp/QdeuqWSI0Th5Ct0wOU1Sa2K8CI5ua86fMZAJH9qc+wAb?=
 =?us-ascii?Q?OXbBNvUp5JUxp3+uVXSLiNM7NYWd/fAcLUGV1KpXGz7MoUCkCWfYSN1/fBnK?=
 =?us-ascii?Q?kh6AAg6f1my/Z4Afggj8HjLrpumRRcFaJ6PcTbytI3gZ+voDINFoUv50AS/S?=
 =?us-ascii?Q?UqWWojH6ysZ64U6FboXxolGgK9r4oPAc/2Ol5NY1bqIXsBXuk//uWL+3KtkD?=
 =?us-ascii?Q?kImsa2xsdQsXhsrfOc3Tl7Ququ/CBbioFD9iTfhQfDq2R0VfqcJmjRIwe+fl?=
 =?us-ascii?Q?3G+oTKldRayRXiBOWmH9IOspK5ujqhipkCVBPe0Eevl1yFQxp3lwwSeX4wmf?=
 =?us-ascii?Q?uGObstV8uQ8G9DH7S5CNd/W4EVkqIgyJvtNhbP+mh+bloqQFeOL3FM/n3ibk?=
 =?us-ascii?Q?zTf58Ytuziz/WulX0F74gtvXCPPpcEsS8aklii+/Nh7ZtED2x4rh+Eq0K7lI?=
 =?us-ascii?Q?mJoF5cT6uxlsrcDcjXlBuvLKaBtdxUQXZIJnGuS4WwBsKGdcu4AipfkZMx2S?=
 =?us-ascii?Q?UPBk0XK4NJSLUU/nZTNYtWU18Q19e3Irq/XBVL7K6Hg4lRi75w5Ig/hnmO+5?=
 =?us-ascii?Q?b27Uw6/RbTcPn/WGMHWEkLhm40j4fyCT/VKogQwIKPocUj+nDhDrJNtww6Sn?=
 =?us-ascii?Q?3x3jCs/B9cHOAe/lUq1EefVN0NDF6OL2GGU1oOjEpmzfZWPJRMihfQQkbo0j?=
 =?us-ascii?Q?4vJlgr5PgX8n/QFOcQ2Lo71Hxbmvs/z9Zs2RGv8j7xaphH5pir3TZwc/4PCu?=
 =?us-ascii?Q?UO1Ohh4VDn0xlQIe+cMLli2l8GTIWSlkMbNEKo1MDvPLYs6sZKjAJEu2r3Vg?=
 =?us-ascii?Q?xLeutqexwu5BGEsy1amS8QzAtFg43LBy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Q87KQSo/QigZ6hCkMSDz5Yf0JDg5WqGFieWpDV25rUrjL7Psext0xc9nLgVy?=
 =?us-ascii?Q?MZZGh9EyqNEggskg+eJ8vgiGz14ub/cEHt/Mm1Mo77JDZfa/4g9pqHAT2VC+?=
 =?us-ascii?Q?0UdDQxK0HeeIz+m+XBZUPGLjsT3eRsCzcQcWXoQII7DobYlgr6C6mOd48AcL?=
 =?us-ascii?Q?IMGitutbELD4GeROjCVQ0ISoFspVKSdZD4+Z+kJgyGFsN09MrJMMfeDJxx50?=
 =?us-ascii?Q?ZQUaPA+6XewvPPHkETKobveeggbSovKI4X6/MYsMqAJOtMBb+E9jbtagrXLS?=
 =?us-ascii?Q?W2J5FIA6DlD+sq+KNlBYkNF3UdjL3/NUawzvYYdwaODFilyZedHyjfbVsHJI?=
 =?us-ascii?Q?YzzacS8ZrJtaaRnJ3qnp2DKtnA0dBcbw1JvQChFeMNwc21YjGnBKdnRBkWx7?=
 =?us-ascii?Q?LiRNIbh/QsRDBchmPpsK8i5/shzNldID9KV8Cg3++25TjJLpUwZDWIKYsREA?=
 =?us-ascii?Q?BKKTuw18jv9FAE40+fIk3vFlsHsEs160+8PraY5M73vfoahEoOWZJsUEzCxr?=
 =?us-ascii?Q?pSL7tvT1hAAuOXV0WZED4sa52LFy8S5vvShzw+IvmtGDVeFPS140fQg1uE3i?=
 =?us-ascii?Q?MzKrkZTFWN1lgyfMzpbaSRRm4y7g0j/41UhekGHTBwrMyLNobBqLTuV7an0e?=
 =?us-ascii?Q?350xgaUXUoLWe9jmQrPMpsjrRDQ9WBKT5A9as+kTY75lrWRLwlZVl7dXvzMP?=
 =?us-ascii?Q?5JCn7ZeI5xTKt6Z5rJRhQRR6ynocuQuvpq2gtX/bJIG3kHDd5F0o3+Ag5jfI?=
 =?us-ascii?Q?RaaDuhx6mb1Er+mayPgnoCzegfzMP0NG+nZtD5k4XcbST09DP2xhVQdxuUH4?=
 =?us-ascii?Q?r2LXqgnBfJYLEQwvHri/+5T+6cA4FRaFNK5sXp2uPnvBZUOy2/LpRpkkBr1E?=
 =?us-ascii?Q?QHE4zQc61zJp1c3WsSpdTrN0/cK2UJdhE/dzGPLEQGpZ3s0KMuddwDo3lO8k?=
 =?us-ascii?Q?bk9fuIu9N/qFVojd9GglSNsU2n6lvY7SyPp+879R+BTmX1BqLbTykgLQkMA+?=
 =?us-ascii?Q?1rN6/0WwpdpVVswITIKHj04vUZZYoe2c63TfPDKNf44l+bIYwM3DVwEtXoRu?=
 =?us-ascii?Q?js53tGc+thapR2lHN2lVsY1/OVgDBTe1LPnYIHad7PCCx/5JB06a5nUPws0l?=
 =?us-ascii?Q?esO++We5GIoESrwRXBaPlrUUuA8us7IR8wtMeKhhb6Q//aNEHAVQ4zdfVFj2?=
 =?us-ascii?Q?em/5G0ZdlbiiLnxzfuQa1zcpyEk9IwQEcooULt7msq1K35I1qMXbyVR9qL14?=
 =?us-ascii?Q?NjEsTUYA+29grUAStGrjztdUs2yeFN9JzpBBnqUdWEppFO66jIvT3BK0sar7?=
 =?us-ascii?Q?XaSWhtvifganRgUw6aOna9Pg69Nm02of0x/hrfFlnB2xNSFtdVsPhwFT31V+?=
 =?us-ascii?Q?as15RdsgqQsmbDYput1IJmfvsqrO1e+QNRG6O5xUvgk8PvNGYnHzmQCbbaw0?=
 =?us-ascii?Q?oezU+UwGHbAb/e3GFQsbmJYz3yIYnQTNH2CbGRokXwCvGCdd/TwyWzXQ3zVU?=
 =?us-ascii?Q?Y2nUU0qogTFq4PapMMpa2zPKGU7qYP7aOZi8Ee2QLn4X/lsn73fjHI47A175?=
 =?us-ascii?Q?4QGaONZlywmu2P3pY5tO4uybTSBRVxIId9g0hWkkSux+6blCE46b1XvoQN4b?=
 =?us-ascii?Q?Tw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e02cf2-bbd4-4969-5ecf-08dd3b9265d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:43:31.6051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQnEaJ1VpPdtgQ764pwQxPUTIJXiqbYgHp/T4zQVF+5Z4KvBKcETjqnnAgmheJ0SmbGJCnzhpmARaAigX6X+ubizWTgyuVA6Auw46wHKHj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13964

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 08/11] irqchip/renesas-rzv2h: Add tssel_mask and tssel_sh=
ift variables to struct
> rzv2h_hw_info
>=20
> On RZ/G3E each TSSR register can program 2 TINTs compared to 4 TINTs on
> RZ/V2H. Add tssel_mask and tssel_shift variables to struct rzv2h_hw_info
> to simplify the calculations when we add support for RZ/G3E and drop the
> macros ICU_TSSR_TSSEL_PREP and ICU_TSSR_TSSEL_MASK.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index a9a9723ff4bb..5990dcf72ef0 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -64,8 +64,6 @@
>  #define ICU_TINT_LEVEL_HIGH			2
>  #define ICU_TINT_LEVEL_LOW			3
>=20
> -#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
> -#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
>  #define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
>=20
>  #define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
> @@ -80,11 +78,15 @@
>  /**
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
>   * @t_offs: TINT offset
> + * @tssel_mask: TSSEL mask
> + * @tssel_shift: TSSEL shift
>   * @max_tssel: TSSEL max value
>   * @tssr_k: TSSR index k
>   */
>  struct rzv2h_hw_info {
>  	u16 t_offs;
> +	u16 tssel_mask;
> +	u8 tssel_shift;
>  	u8 max_tssel;
>  	u8 tssr_k;
>  };
> @@ -317,8 +319,8 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>  	guard(raw_spinlock)(&priv->lock);
>=20
>  	tssr =3D readl_relaxed(priv->base + priv->info->t_offs + ICU_TSSR(tssr_=
k));
> -	tssr &=3D ~(ICU_TSSR_TSSEL_MASK(tssel_n) | tien);
> -	tssr |=3D ICU_TSSR_TSSEL_PREP(tint, tssel_n);
> +	tssr &=3D ~((priv->info->tssel_mask << (tssel_n * priv->info->tssel_shi=
ft)) | tien);
> +	tssr |=3D (tint << (tssel_n * priv->info->tssel_shift));
>=20
>  	writel_relaxed(tssr, priv->base + priv->info->t_offs + ICU_TSSR(tssr_k)=
);
>=20
> @@ -515,6 +517,8 @@ static int rzv2h_icu_init_common(struct device_node *=
node, struct device_node *p
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs =3D 0,
>  	.max_tssel =3D 0x55,
> +	.tssel_mask =3D GENMASK(6, 0),
> +	.tssel_shift =3D 8,
>  	.tssr_k =3D 4,
>  };
>=20
> --
> 2.43.0
>=20


