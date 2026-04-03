Return-Path: <linux-renesas-soc+bounces-30829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MPfIqWEz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:13:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E9392A5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDE4E300D639
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA7037F8D5;
	Fri,  3 Apr 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gPIW1mDa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0337AA72;
	Fri,  3 Apr 2026 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207437; cv=fail; b=toqvRuqkq7gkoHjF/tHlZG7z+IMib3d/qiZC7e/gDtO9CBi81e5IN9qnCwDH5u0ao54Grr2vmit7p/DoFYDAaxdjfaW+oBSsP8Fnz5+leQ1WAdsJZeOnwPBEbgAjdSImiHmTdYWLO2M1CG3XfPIBdJ+FrDLja5PpW/pGsOf6YTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207437; c=relaxed/simple;
	bh=mgLLJ4bV5GcLVjfRrzXOVm/friQw4UhBcny1Bcouxtc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YNV9W6sdicESXNxJCWmn8HFl1Mmdr3AUi1iP0JQxRzdfPfiGI+0nbHSUwA0g2oS3rPF+o/P/4R2MYfcgaQ1TRrXVA8D9Eh1JZKIN6yuBd5z0Hh5881912swXZeCFMESCTedlwnXLUx70g82wLXjoEMj51sBVXLGPoIlBjRcrhto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gPIW1mDa; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp7/ZSfzLpKe/P7O3bG0YxBXDdvdLxTTvaP7Wptigkx5D8gKrWl+5a6zVz3E5H3aBUWxv2erYYi8RkXMgwUuWqzJ5pV0+L6uROMRDa6P6oNf5O0KrAG8lWugG3YBCILVPUIZqJ6EDQG6NauM+hWd7IPFZKjQtrpeeST7Ywpttvk3hefXGC5vw8PVtXJrIWDPYSc6WSGvBDxgUAH60fLPwWMYYWjjIFxxVTLCwbXLuHqqJZjRyPiIxwA8254bbJB91XAct0RJ9DH2f7b7A/z1psQLa4pyttX0uyxYR+4sqr/wCbsL/MHY7F4h97wT34XW4vyt3z7YrJGU1YmJiEg6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzLAnuq7mOEoxUCCtCydZsfDjllV6F3AnxPZL5D2wDQ=;
 b=vrgpJJ27Xq+IHNHKYwYfE214JgmWUhFxEtDsgLe0wFDMiDtO0rA3G9wR4taYwVrU4tg2LglINGWb55GBJg9x+ilWzRGssNZt3EpkoFTSHX1x4SbDkwgD4zigavjL/OJfw8DxbopP/veiAM2CpGEMqZtqfm/JawxmQzJGrgi2gZw3VSL4PY098YUdC77klztqPZ5DApkZz5yR2jkwNAKz7a4CHb10//AElWCTTubHYcMtXOuJyQYFqb4WeCRxlRzyFhgAhyXBWJvIVxNb813kxEog3Ij+WmMpp0b1rAv2WSyOjXF1ANRmL/jT5e6aILhDuOVGnH4Macz8j17nNKkqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzLAnuq7mOEoxUCCtCydZsfDjllV6F3AnxPZL5D2wDQ=;
 b=gPIW1mDab7+yhQvOeuRfFe+TjBmBfSpoQp4915leqNXvDdlcJyDoF53UdEkVG9X4xHfk25b98ng7H/tYJftAn9Jd/OWBHNBYPzDx88ERIyS8XxEAukMWFzK0Aqq2sUT6S18uXbVHCplDbzAfyt9iGm04CCKEb8qz5IuJphN2q88=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYRPR01MB15091.jpnprd01.prod.outlook.com (2603:1096:405:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 09:10:29 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 09:10:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner
	<tglx@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] irqchip/renesas-rzv2h: Kill swint_idx[]
Thread-Topic: [PATCH 1/3] irqchip/renesas-rzv2h: Kill swint_idx[]
Thread-Index: AQHcw0apSpxXoFmqvUSGnON5CCaMtLXNDJAw
Date: Fri, 3 Apr 2026 09:10:29 +0000
Message-ID:
 <TYCPR01MB11332F61504B7C0A18AAF80B6865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <cover.1775205874.git.geert+renesas@glider.be>
 <0f32ba2a4701311710d02ff4fa2fd472b56745c4.1775205874.git.geert+renesas@glider.be>
In-Reply-To:
 <0f32ba2a4701311710d02ff4fa2fd472b56745c4.1775205874.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYRPR01MB15091:EE_
x-ms-office365-filtering-correlation-id: ec0a2a19-5adf-4ce3-5130-08de9160d9e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 G4gnlqOOeA5D2DImdEAFybD0mb7bMVJwXZSSmfh2KCzLapVIHeheJqJbVQIJzGQU1z1tHj2kfpBpLxncweQW/kPK46gAKyl2EBUu6qk6+Y8cn0HvzazfG17ATUXIgvvULqWIH2MQZ90MF4rRKX37/CHYeYx6KSSs3g8R/hxFjdA9joEvvRT1f4Kc8emwVIzfVMG7xVEZ/6FkOGBRhOhNUsxb3LQADMjTYHXfTT6mmrLbOPxbOSHxiKpaAvrplgIwnPBCD2H+A6xFXQ9jKTOcyldXJo2nnNZbWf0Fx/zUCQfN9s0tfY8VpSdoRE3TKnTdPlqceGTWSK8Nigj+HCaPkc4ZrZ3x2ZGsUae7oDXPQtauzXoWhKQ8+E/XtIFAl3FmK/nIh2tdY7xH1OI+BrPs2pvk7P/XsSL9ZksqtbTnXsJf4WirPKzovYF+siyHoxR5HamQJWZiJ8p81WkDHFPdGa7Xpi3qiiF93K+nSlsuaQS+maJMH3GPF6QC1u8JJ6ZhRqfFFLeo+BEXqN9T1NVSClJ3GWqmKPXOB5kre81a6IKnbKrxbKC3ovNIsv2DaKuVnZj8vj7JjWaIP9a6EPuU7vJ6DwGFXUn7e8sdXa0d+RwKjxd+5c9hDv0FoFnXTUUHoMB+vx2Pw+xi0QKRqvl+7/rSpOrgELPO87irNdAR0yLUnIywxAVsh/tbPhQ9hh65NHqsfjry5EA1uD9C9wJlTpcNmLZjL0dx8pvJ960agGt7mNnlLygsd5lx0cfJEUggpOz7I9phMjqTSnVgp+tXw9C81SsXGDufk/pKsI2/m4U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cjTS4JoN7mZ2QyKOz8IfmQOtwHYtSfFYsnK+UY16Qg8O/VJ9M3IBPnWePeAZ?=
 =?us-ascii?Q?DHnL/fi+omfrXytuQbuKyIx4fqjGM8pNWSx0Si/UBKlD550CP4xCNdjsLLp+?=
 =?us-ascii?Q?6+73+bxeKEugKsKpu0reUARpWsLWdpKkPCco1u5mCwTKDHktmax7Sfa5CEgl?=
 =?us-ascii?Q?N/obIjt0ZxQtR13cyT5Mqn9Wz+n0oflRXfeUhjnjw5MUwsssGKnYDFvbamT9?=
 =?us-ascii?Q?w54g1RUwW2we+KP4UlPlTz4YexbRLk/FpYMx3/g5y7hr8q/slSmjaL4kBi8C?=
 =?us-ascii?Q?gLEKwOZvlfVMHYmnoghkAe+nn1f2OjbvLMzThfEwtvDurxb3OoeNCdZIQ7pe?=
 =?us-ascii?Q?iLzMf24J98hmnuptgMDTas3m1h/xyT8rmKFRpP7VGCMAkA+ufwkLLgLpl1AX?=
 =?us-ascii?Q?dsYLqEBka+HLCQu6vtj0qL5je0URPXqslkI5q2+5+n5wpnJ2eO0EWje3QCpl?=
 =?us-ascii?Q?txlAV91aKGvyJs/11aBc+osXYMbjTNK0g9w/ptx9jNiUDTa9o4Ri7O05z9pJ?=
 =?us-ascii?Q?gl4NBDBnbuWIkBr6E9hR0Mpoav2gVkrKE/lbDO1zL/FvtH62mNeHHfupvQyj?=
 =?us-ascii?Q?aemfLQwl2ivN5fUHLeaqQuMEhOBjblKReiosAONIideUaH/G4zrroyIratj2?=
 =?us-ascii?Q?q4P/7j4bDmMSaeys62/p9Ja+PdQ51DPWITIsTyyzBk4vxZwPEw2jJFC8jMj+?=
 =?us-ascii?Q?wMjW/PooMjyXEaOQwjQ6affhW3i9RFklQMF01D6pGfMsdSyA8YExYj+YPiPU?=
 =?us-ascii?Q?/kOp+gI2kmlD2P769f4Dl6CuaPN4fVUbIV5DoZT6V50uiHZE+5xIAIRZ47/0?=
 =?us-ascii?Q?X70eO40zaAT/7SKNMCmuqqRAWyOEZCScyfVH0LSx27KOfV/49UonGE6ucYK1?=
 =?us-ascii?Q?0d5jMu9nS6VpP3PmgmQ/Lf5riFgPEikD04l6lKpkXf+2S9kbssAVmE8RO9rb?=
 =?us-ascii?Q?roGTFdYsXneuDWB4UZrsi5ckT6b88IxEJd3a2qSIAVGaDSe8Mj5pLlOmA9Uw?=
 =?us-ascii?Q?BVVHL6kKOAVZuA4pVtyKqLJ6xNdeNv8s4oNQhO7otLT0Jsn7X8C73ve/a8GB?=
 =?us-ascii?Q?UX6ABd+5ugXb0Y4JPrQvxmgxhb7WE2kCXurlZX9wGvh0b0+fDm68+ebJQo1Q?=
 =?us-ascii?Q?ltJknh8nFA9zJDTbkY7tT2P2Ew59SFVDrnFMqIqtZ3bj/6GXjcQKFvg2dXkB?=
 =?us-ascii?Q?j59DBUihMsPCLXxpI3KuJmMnZThY6iNU+67iWbj0sNfYrwGQMOBSHmva20KQ?=
 =?us-ascii?Q?xXaILa/sPr41zxw/WIr6DigWcDsnX4Xg7OF/rCzI4s49pcVAC09rUPOnS5+e?=
 =?us-ascii?Q?ZhIxNymGk8xFnTH1Ga8fbaZdydkO2wf6A8OJaZWDAJOxnSvwA2Ytsk9zRskM?=
 =?us-ascii?Q?fVU25idsL2mSvS/8fYJS2pxhvNkgcyat8Fd+Fj3AmJlm72PdrBunoY/48TJD?=
 =?us-ascii?Q?TeQs8qrYFCKWLaLLu0gSqnMXD69tk2nKV6O6iMXnhD9W12aDUAbstkf5TcHj?=
 =?us-ascii?Q?sWxj9gjIDOE7eynA3z3B62MaSll5Ih0U/2IOx5s1E+DDKe1N37U0oe8TZnfK?=
 =?us-ascii?Q?rBiphcSiOYwE+PmbuBBblQXV8wR8GkozqdthB2B+U1mKdc8abqjk6CeZemnt?=
 =?us-ascii?Q?AoSyWq1kWXvuaAp6C3dKcK42Hy3MCLKlzAZ6nYLW2IoHjU8PZ2XKy0VtbeOi?=
 =?us-ascii?Q?aL84AHEcXc/PeaKqpleWBIBWYbnjWdPNvi3n1tjrgXQ1xoLOV3WeomWOcsvZ?=
 =?us-ascii?Q?2YzMQJ5Ujw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0a2a19-5adf-4ce3-5130-08de9160d9e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 09:10:29.1199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Igse+fqaPiw9dnLaqj4DzuuH248KzhL6MW/E2YUKwjaT0EixIAHcbKbzbiVHufvN+Qjao1dLVy/FlphIehAZWNd7hcC+9s7a69I1Dv/xfLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15091
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30829-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: AF2E9392A5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 03 April 2026 09:48
> Subject: [PATCH 1/3] irqchip/renesas-rzv2h: Kill swint_idx[]
>=20
> The array swint_idx[] just contains an identity mapping.
> Replace it by using the index directly, to simplify the code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index ce790590f7ca9932..6fa8141adcaa59f2 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -745,7 +745,7 @@ static irqreturn_t rzv2h_icu_error_irq(int irq, void =
*data)
>=20
>  static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)  {
> -	u8 cpu =3D *(u8 *)data;
> +	unsigned int cpu =3D (uintptr_t)data;
>=20
>  	pr_info("SWINT interrupt for CA55 core %u\n", cpu);
>  	return IRQ_HANDLED;
> @@ -760,7 +760,6 @@ static int rzv2h_icu_setup_irqs(struct platform_devic=
e *pdev, struct irq_domain
>  		"int-ca55-2", "int-ca55-3",
>  	};
>  	static const char *icu_err =3D "icu-error-ca55";
> -	static const u8 swint_idx[] =3D { 0, 1, 2, 3 };
>  	void __iomem *base =3D rzv2h_icu_data->base;
>  	struct device *dev =3D &pdev->dev;
>  	struct irq_fwspec fwspec;
> @@ -780,7 +779,7 @@ static int rzv2h_icu_setup_irqs(struct platform_devic=
e *pdev, struct irq_domain
>  		}
>=20
>  		ret =3D devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(d=
ev),
> -				       (void *)&swint_idx[i]);
> +				       (void *)(uintptr_t)i);
>  		if (ret) {
>  			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
>  					     rzv2h_swint_names[i]);
> --
> 2.43.0


