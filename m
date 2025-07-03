Return-Path: <linux-renesas-soc+bounces-19106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B003AF774B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 16:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8C1172D0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 14:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2068B2EA14E;
	Thu,  3 Jul 2025 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jmyi78Jj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C3D2E9729;
	Thu,  3 Jul 2025 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552671; cv=fail; b=qdK3Pt8YS4+nJ+1GAg91GsnISarddB2maThFjD7+NizNIm+A2KKO+ld/trJvgoXc2oxMtlEAl27mqgx1nYZuOEmv9/eEoxkjb6Ap3t9bSj3q11by3KvZ15NXefIm7Fw/IuwSZ9YPMtZ13b2balIMuFk/xc6s11DqFo9dLy6QVdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552671; c=relaxed/simple;
	bh=JhExvqKUAR488218vOxXjVGz5PJguMQG/PBkM8hT+RI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OfWO6SIGCO5damAqGAp7RpA0B3egcfLg0H/EEUKMb8m7Q3FTYFees2HnLIY6xPn3bAyK9CSq0Qb0C+efxqc8H4L30XwlpDmvpRIK/ZmNgQ6GSn9z//r3wyiujr5f7D0eohpOjft4G1z7FVTAVIuZXKzsiVFMKm/kfv2lgi0HIr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jmyi78Jj; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTHeyULm2wMOVfgtF0QKhPInUO3zLw9ENnjoc4HtoWgTTbw7UTrwRS97mnaoxa88wHApEjI6+C1wLUvhFkm6gdJHUWdyf7W7Xl0ZUFGhtPuOtgSBMNILaGmg2pELf134TwjunddpKNNXeU/USOzYXkejhGB2KG5zeWPjA9SIzpeQZU+2oW/tEWKGTkPtnMZORpn51frScuTHcXhUnLkO/WCFOa86fV7UIqRFr/RrAM80zOjcmY9PAwf4YDYyX52JgKEoc/QZCjwVBd87v/5vZJPpXPCw1TAuAKq2mfemIMC26jLkITJfm3RieLdKftM1b/QS0cC1E2R963fW8ZxnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UGVTPUQLe0JX2CTBuj+4RII83JYaX89JgGg6Etf0sU=;
 b=ysMMKEEEI59Gc64r7cyw3EyAjJgPe5DIjPcgrzU4BpoRYogRYW1FrWZoQnHGjR22x+slvxz5MQUmvZ/5qg9Y4ruHGcvP/nVH6/XKZbTN7p3E1Ty5oP2Z9JGZvYSBVh2OZTwhearDCFD7VEdd/5ikkM+LeHQyZ8nSTFTsIdOuB/xTxRn/wfWWXr0tPSd828lWuSoTCl1+98NTJNqlw66+Lbyhe4X9QAMuJ2ZKm+Hq7cJQHHHRrqXowBKtcgyk+bGwbkLwOvGDbR4jFxbFiEeV7whzxQ8ovqTv91DU72SXgGaJ9Dz9QY6B7qSzXue/mhi1ZBg/cfdTOEBYimHSp1WkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UGVTPUQLe0JX2CTBuj+4RII83JYaX89JgGg6Etf0sU=;
 b=jmyi78JjXl5yXvyjEt33a3UDLhW3osB/hsRovtB1juJE7hfOTdJCmZ/9TXzMu78ylYX0g9jPB3r/z3ptEHYO62+dvlL74EpRKRqsFCaXC2JcVFec19R9YZB3A42GpwOreFBRRCbpRQGaUkG7HiB0++UzA9TepLML+guhao1JlVc=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12936.jpnprd01.prod.outlook.com (2603:1096:405:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 14:24:25 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 14:24:25 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
	<tglx@linutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzv2h: Remove unneeded includes
Thread-Topic: [PATCH] irqchip/renesas-rzv2h: Remove unneeded includes
Thread-Index: AQHb6y7el9+2AsVxx0uLrVhnLaqq67QgdeEA
Date: Thu, 3 Jul 2025 14:24:25 +0000
Message-ID:
 <TYCPR01MB12093B69906E31BF3F7726E6CC243A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References:
 <d4fbffc39af2eaa7bc50a0a97ffb3a22e3c4cb6a.1751446168.git.geert+renesas@glider.be>
In-Reply-To:
 <d4fbffc39af2eaa7bc50a0a97ffb3a22e3c4cb6a.1751446168.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12936:EE_
x-ms-office365-filtering-correlation-id: d2c20f18-8b83-44fd-67fa-08ddba3d5005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SBASJGAMWKVJEXaKWQoyyhQeuvAVFWeV9cQb3nX59FD/KobNVlyAsAcBasEs?=
 =?us-ascii?Q?7FBUSxji0dbsA2IwBt/nwEWYoObovrdpfRfzo+kHQrKtucTiSz92MnCWrtcD?=
 =?us-ascii?Q?Rc6nP1/j38vinf8I7+roTa2/EY7oD6kcJmZLJP9R6o7j96rzRi2EENMSHKcI?=
 =?us-ascii?Q?LwqoKW23DaOcbXp4kwgckJerUD3qLoOekYdQtBWlPFc1N8Yusx6SCg/a4z3a?=
 =?us-ascii?Q?Wo2WdKIvF/vKODSFQlV2DxsVreoub5jwQ8VN7Gy/RT4oC3bN6EmXCQtwrPTj?=
 =?us-ascii?Q?fGXQvGWzcIsdh+KGZtmAtJrRlgSvBKmIGkZaN0021GY0hP/Oowop0934uh1/?=
 =?us-ascii?Q?NbDQEt/ULfXxmRFR/AIdOs8ZdlVWD8wlKfxR9uE42j1kgnrArvlhgLYOiT1Z?=
 =?us-ascii?Q?fxCP+LybRz2zlaQlCJOZaYDud6WHceDRmSstCnY0d5xsH2cnuHJebhuAW2Vu?=
 =?us-ascii?Q?agVp9UZus3qOdc4Halg2/wSLmkJvpiMcsE3ZO5fKxsT6ISEi3D4VStid4MYT?=
 =?us-ascii?Q?POeSVRmXh4bzGJfTbk5SCk3DefBVEoHxe3BVu9QChvjWUX/1X7AgJk3WEoC/?=
 =?us-ascii?Q?Iygtf1dTfOc5WvBUjMRFxqKC2qYuHxWhNCl7fe7+p4dATvOrCYoxm1zYKlyn?=
 =?us-ascii?Q?23vdrPbE9z0rlvfm+3/MLb20/pSxLyi/VFWaOno6R1425a0EqqLfCau9oBbS?=
 =?us-ascii?Q?2NmUefANIQIJTefVloK3Z7uyg2Jcx/j+Nv9AY9caFLdyqyRKN+t87eRmRDMz?=
 =?us-ascii?Q?uRVU5iZya7Ecno30i61zE68n5SVoYpTkItUBFMJ+WVi/5m1H5J8HX9Z0eIZj?=
 =?us-ascii?Q?WH5kWuFUdItFB1n3Z2DnrkdWSTDlXQ4B8Je+YLRYct44eo3SyAFun0LHS5/J?=
 =?us-ascii?Q?wW3CqU3EHsC1rMrbtLoPXuQlH+LlJM34pTZu9P9xrcRLBWK1Ae8AJ33MvBH7?=
 =?us-ascii?Q?S75OWha21osDCoeCh29QPekUsSDUIwFAmEpERHZGQnw2CBvt7VPCZUAIfLzy?=
 =?us-ascii?Q?SdSMNTGiVFlft4AXo/CUfMXbYshjLCr30IHNVxYgVNpa2oVxAGerZR2ig0/Y?=
 =?us-ascii?Q?UwvdyeXtsLdX5/6Fhocf1pVbv0fOzpEVgdgkG0uv6SZZPI31XUGb75PuxMZg?=
 =?us-ascii?Q?C7t0BhmHMwG8L15GqC2xLhGmuWnKGuS0BAVej2sqD+axFLY4Lm5+b0UHdWIk?=
 =?us-ascii?Q?u0OqYfehzbDKzsvlKCZDUl4nMw2tGM00FgCGv8imkar5AEm/peIWY7q2HQpj?=
 =?us-ascii?Q?qJf1jTUao1zx6ZpiHuK3JdqYLAYZnerwTPhj8Z34KgBcfhB/AH8d4/59HoWT?=
 =?us-ascii?Q?eCW75ZH1F2O2Ta94zOIzNADw1zlupxZ5fErgCs+5NNp5tHGsAut5u/JyHjL3?=
 =?us-ascii?Q?bJxb/bY1fHqFmtyfJvytAo5Wq3efiJtneRcyEw1JGHhQoT9q+oVrSqir5U/P?=
 =?us-ascii?Q?Rj6HujKfOOVboLquVEEM09H3BS6ldL4ciSNsh42Yxrx8LpVjLYqqTA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3XsfRfZoTDTc/iJbItSKZXl29cD0AhZRISauaqk+uPhBx1nYLPvfxbmlCSSO?=
 =?us-ascii?Q?2MIRcfYhqcA/U2OyJMOtI/sS4cCwp0iqYcUz6mS7HyhSZwOqUvRoMd7CNCjY?=
 =?us-ascii?Q?Zf3ce51iwJEy9+yqVEdHWoURqMb26vYuMfnfdsixmjrYS9WKuPzSW/jv5M0y?=
 =?us-ascii?Q?awT1EDHXQMOiOiicTVc7whkNo8RbZK/4KklqRNMOLAhQ2VWsriybTwM9KoHf?=
 =?us-ascii?Q?rx9xNfdOd/fxrr5FKOqvBHHRxutLrh7pRE4eMbaxsUlxhl4v7FvyDwwO/uDt?=
 =?us-ascii?Q?L9B3FPVndmTz/LVvL0i4XUS2v2aNEOqZsSJO3mDKrR3LfESfbP/5jW8K23Ag?=
 =?us-ascii?Q?m//j9p30XAiK5Xxquys3c1wV4jDW1cjujlRa9FusoZSHbKfONjkCM8nHJAm8?=
 =?us-ascii?Q?lgXVX/NXYwCqUg8KNpk3ppbmRkp5LExP7ml+JFxzmfnj7WR3i0pedMGhcHBm?=
 =?us-ascii?Q?nlLIEY/1A5yvIxLrf4m62kP95JeOZS8JNw7R/IXMdTY+BmEKiroXU7hAI3u+?=
 =?us-ascii?Q?sk+9H13lq5cLufXOjCqHYtJCyArst09MPvX83RIbMW/sQ003grVLziLtzetd?=
 =?us-ascii?Q?wNf9UAjPXUuBeQrnKr6ISWkBOQD9j9ZDfvQSLxDVm3Oq2aFDBqMfWrbKCiOP?=
 =?us-ascii?Q?bAweg5Rw2Nz/wnCX6Y/GodBjlXFGpNaNQLP/9Fq9Cz1caoOVqg++svPrtkiz?=
 =?us-ascii?Q?nXIGqAuVGFjgIVRw5kSGxULJ17h+WwkY2tqt6CDjbnuMDFmMvxNlzYspEHUr?=
 =?us-ascii?Q?CX3lCw2Z/ooIgCeJpZ0U4AEL96+86FxVv7cE3k1+hU7oTi31sX06UUQ4r0bO?=
 =?us-ascii?Q?cuNn5yrjCMea9DsPBf5n06uC1S1VuhMpw1qUnPtVGF8kZRrI/z9qgcsDU1rz?=
 =?us-ascii?Q?w7KjT2/LpV0mXFGxVApyn85Cc570t3xPUkBaExQSM0WbDhJVwUuT9tIb4oEi?=
 =?us-ascii?Q?jlQOhSDXUt7l5JWH6KdCt0TE2OIQK+axj36pWYe+6BhaNneOdffmw4X9pZEO?=
 =?us-ascii?Q?ARwYX7eIvjPHMAicZAbb3nS/ZEN3iNiMCUOEdViJbqwgk/uzZPP/1YJ2GPW4?=
 =?us-ascii?Q?wkLTy6KzqJeGofNaOA5z61siuX/tShmnMH4kBVd5SwrBSgDALAQd27jF+Ezh?=
 =?us-ascii?Q?Ufugc8kpm0A2pjsp7+dlJoT6mqVAOb1ZI4nOCZCnFgq+k9j3BJ7V3wFGQMEj?=
 =?us-ascii?Q?yc37Ce0Y3iK9n6APcIxY98YuDcQdxlN2tEwN8l0/ukLWG485lgOQP3PCLyZA?=
 =?us-ascii?Q?p8oHhF8eCDSy2hxgkXJI0rMP8qzaQJVi9jdw+tXrWximUvkIP8fNVqGuO4le?=
 =?us-ascii?Q?6ZnmCsQYBKFrrq4m+w0YePJhTxOKV6Jl/JeL36q8q12ffcwz+9CaOwZ8WIJO?=
 =?us-ascii?Q?vaTAcGRYE7ufEiOt9bICHBmiEQGJiqq225drluwXajw2tk5jtxe4TEqcMAzr?=
 =?us-ascii?Q?FOhobbDeMcNEpEQOD6OoTAjSVFQNhXs9bqwgwT7nbm5lZej7go2NwnEQ5qcd?=
 =?us-ascii?Q?u8kbIkT/MDK1+/63XbLUD2/g/D+TgvVRTMvSH6EVu3xp5QYL5J1ixUhJN1G+?=
 =?us-ascii?Q?jnAJQUYhlW+iIZE0gg8MhzEhrwv719PbIsL0/9eNQ1fxZVhe9+zs+DZ0/9jN?=
 =?us-ascii?Q?pA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c20f18-8b83-44fd-67fa-08ddba3d5005
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 14:24:25.4272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cFwJhzJ3aYU2Pghy1+l6oIrqzkTSYnX8xHm8setXeqOti4rer5hvDd7TOilWioEDXt+NXXbWpuBA3Prt64uvVhAJluPosiOSMtxfTjLI+Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12936

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 02 July 2025 09:54
> To: Thomas Gleixner <tglx@linutronix.de>; Fabrizio Castro <fabrizio.castr=
o.jz@renesas.com>; Biju Das
> <biju.das.jz@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Geer=
t Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH] irqchip/renesas-rzv2h: Remove unneeded includes
>=20
> The RZ/V2H ICU driver does not use clocks, of_address, or syscore.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 57c5a3c008c91efd..e58ac9eedc821e50 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -11,18 +11,15 @@
>=20
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
> -#include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/irq-renesas-rzv2h.h>
>  #include <linux/irqdomain.h>
> -#include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
> -#include <linux/syscore_ops.h>
>=20
>  /* DT "interrupts" indexes */
>  #define ICU_IRQ_START				1
> --
> 2.43.0


