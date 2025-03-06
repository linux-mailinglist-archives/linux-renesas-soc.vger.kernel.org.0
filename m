Return-Path: <linux-renesas-soc+bounces-14057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58523A54918
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006161736C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B1320A5C3;
	Thu,  6 Mar 2025 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eM6MbsnH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2036134CF;
	Thu,  6 Mar 2025 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259851; cv=fail; b=aw3luVjM0O3NCsyWjKjZS6gwyKROWw2mMQvrZ/NqdeyhQVzJSfvu6+Em3a7C3l0fHH5z9zgSwUFxDZGjZJmL3ccIo4vAkF9UtvEwA7BlkOfxxBEz1+S7KKLLy+8oqa8zMxyx/MJo3Um64yHaYOfkg5hERieQVELYG9/V2tRaq08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259851; c=relaxed/simple;
	bh=hWU7V0Vxm7YPCGhHWgQ5QsVa+cgNj+aPrEPnUMbpG1M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VKi47QVpWyu0WGxllL9XS7F3eoujbp9bo7j6wpikiEnJ/I/u1t7J8VmbacWVJi2hQcPjaWJOzR7PMzjtIvk3L1hbSWAQlJkCDYc38ilIBBvmx/qiibPEtFWVu0BwRCPBpsJliwAvA2sv4oheT5+TiUzKcIy5c5YY1NI0TDSwR0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eM6MbsnH; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFUxAYJ/WTMVrAs2ktvtjr2VST5eXHk6V6hXq1/ZrTdsBBcrlmKSjQG1yJXJ0Pe8kg1YW7r3FfBU+XqCFgxR7vdJ69epJNe/s+FYt7tpuEgLQUBhNsByNZnOULwHJ87jja6+/iDlVl49olLBGbnUk8yNDJJ/2v6d8gB/yI4hEy+H9v4116f/NniQGwK/Lh2MFB7i0zFgZsHfwYqCRabprezP6tYnAnb4Lpc/k4c35kv2A03k7zx4rbJToKzYK50bXtGuJOGMfEmwOGQXp6du6/zYoLtuyM8squqvej93xcUKMoZkQbuHvgNsFjJFOw6Vn1nvPcy3RtCjDQrq4LiArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnhQEf+ATi/IqgDOTz2XvqWcKLgQYZbcCBKMBKUy0sI=;
 b=Qi8bKGbgGS1CPQJVO4lZ3OHW5B3Phlcy0vWAqUhrcNrP6KwUJc2+GkCB4wevCy4O/MGbwx8pfUDmnTH28BHB+0YDDhZ3krIsHr78WnGX4+m7kRaeJKkqYPmI9YIBTmPRPK97GiNIzp6DA/CXccZkawayBfQKLHSAfg4RZV6T4NCFFVcllWMIj3/xkQDWdMjTzkipflfl2NGjdJNWC2ZPpOkW26hZee1ofRyf/HmUj40P/TGRxXtKD1+OKjayZHGnjX7a/o9PF9qk17YBTnhfDBzeeZQOWpcdmh39SlmSQKMOKoga5KctM5QwsPTmoi6tDAAUpDUEgWEfh+X0T5rX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnhQEf+ATi/IqgDOTz2XvqWcKLgQYZbcCBKMBKUy0sI=;
 b=eM6MbsnH6Z+poPR6JWUriOB2BgXulOhyIfxgSKDabhnkF3OA1yo2XnnHDdzap+py+Kbv/mA5MugyXj7nQ5pMHAOW+VTN2nEXp1QAnlVT2WEQy5sRf7eDF/qQfLB18PpU1Hv8mSYXdtKcDPTTQCAcLpTSbz+9J1lrZhLdAECKosA=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS9PR01MB15621.jpnprd01.prod.outlook.com (2603:1096:604:3bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 11:17:26 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:17:26 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbjcumAKkaq95VEEiIxX0Tw+LMrrNl9vZg
Date: Thu, 6 Mar 2025 11:17:26 +0000
Message-ID:
 <TYCPR01MB1209369446D719022AC81D4D4C2CA2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS9PR01MB15621:EE_
x-ms-office365-filtering-correlation-id: 453598d2-a946-4cbb-99d0-08dd5ca0799e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dM+pnvSoljRkk2feBIGbLEp8rYDVeeBBWp5BsWfcgFEHEQFtMB0I+nltF6ck?=
 =?us-ascii?Q?ZUyIXADXFWKdJZbFl7nnEzktnvg5AYL8L5FXNc1z0MAze0FfrgFdjla2J1k2?=
 =?us-ascii?Q?x9OG/c+74c18ypxbGY1bmYG0RwqNG1rh5j+wngfSrJX9ves5b7KC0dyxdkac?=
 =?us-ascii?Q?q5ECzalrTeaFa2hz5EY6Ev5TEo1ABbTq3ICgZ3/9Nq/kqjHsMKkxLywimPIP?=
 =?us-ascii?Q?QwZxAr4lYu3++EQjYGTIKE0lJqtjKBKzHIeFo/H07NBajb575H39kqlV7WYM?=
 =?us-ascii?Q?VckCNNPOTqmiviMsW0x7oYHvd6Fl1w55IbPaCiPrccSCTmg1HwLi9+CaHrCM?=
 =?us-ascii?Q?tKH/pNALk+Md86lP9k7h3+EzHYyeBUAxhTccDlIVZLzTIPsd6YgHD5+8qOkN?=
 =?us-ascii?Q?a5rbcoMe58AN+OBF2iKEQPet/Qflus56OJ1V0Jbah9JefzcHtOrpE7PJ6NUk?=
 =?us-ascii?Q?iGikVPgpXXCR+ccx1i9KVBPHM7TwtrunlIYIgszP1dLu7LmrQG7ugGqP4+cx?=
 =?us-ascii?Q?QaZtgj8AMqVM3c9endXuLSLQ1blIq5w32e7U2gKrP4lRztoWZC4K72Bf1pnE?=
 =?us-ascii?Q?Y/Rel1ND/RBT+vNhz4YzKHiLTzZskcBTG4Z5SNbfZhH/NgNz9amYnrENXIjr?=
 =?us-ascii?Q?P/NjEnfJclcxYwBKfbfU7l0Qq7JhtdMy7yRy+Dth7tBvlUBE9UaNsSYGbXoP?=
 =?us-ascii?Q?WvxTYp6IU499D0mZbhckU5z81E7DFt8DSUJi1/p5FCTyKlR6Y6wtBX+NqYv5?=
 =?us-ascii?Q?OWQm3coZP4LUADx84m95gfvcsoynPuuu9+l1ndnpbFG61i247pTmqsjif9f9?=
 =?us-ascii?Q?EaJK4tWHMjNkvSBITCXbhSR7/LOEA4qgn9oLqKMaRMNDrG7T3akBnyZenbWB?=
 =?us-ascii?Q?pweDlXEB3JuzVB+kV2RYXcBk0X0kpM67ZnL7uWPRP4iRRtWUXLD5ag1ih1Iu?=
 =?us-ascii?Q?w/Po5/u8cAqkVpmB+z2FerYgS+WPUEfqB0lLRzlVHMs2lNTJOxh0OURhR+7s?=
 =?us-ascii?Q?pUJtY+Cg8+Ln9smolJXO1PaOjy0qrdB3qeGcVqqHSJ/qpwl0Myfg+sA6TR/O?=
 =?us-ascii?Q?heETlZJefONltGE9eTJgOrdGw+ih4ZmXQIcBxrFcQabWy+GaP+NIVpazJ/SP?=
 =?us-ascii?Q?2ZJlJpVpkjt/TxHbVLmpvD6e910WQ79j3yW97pxuOCaUleOUMMTlWRpY6YDW?=
 =?us-ascii?Q?4BcBvmmrI0EefZR29T+mK66yjUxaI1BZYm5HZaEl52ETXJpJnmsAmDI1QeKK?=
 =?us-ascii?Q?LOpcwZiRwZ7VBnCZIxTCZEIhftZnQQMtM+sUp0SaQXieFMLIOxYyq5PA5KfH?=
 =?us-ascii?Q?KssZmsxRmodWkvV/0t4JsuLU2vnD0LpxX36DAdyVJJQOpNRi9IpBCjeHKWbH?=
 =?us-ascii?Q?eqmWnox0WPLJuuvfvCrGHrGJl4z/3+mT5MYpQesB5HdbGvlVmwYep8Fz/u7u?=
 =?us-ascii?Q?K8g0iNMDevmrVCFDJWwSlem0elbvQmv8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fgKXr7gQy/GYL06mXus+ogj2HM4kjHG/PeHIaKzQOp7IU3NJ8iZq3D+TPwwe?=
 =?us-ascii?Q?G5qkJhk02gLhlANbG8/GY2ssbJ+oSwV8q7KjKZ9BBPYh/GDZS985Sjnt5RP0?=
 =?us-ascii?Q?lpKo02Ye1xXPSHmSBapGRNeIzgGixhgbnT60XDJchTbPGK4TH8jBGAfRnUDl?=
 =?us-ascii?Q?ErRLyUq3yvrPVdpuPzy8EOydYdt8xGWZnbN6LqHxJwX8VfKkWC/KGfkmb1lK?=
 =?us-ascii?Q?XscFVNf5gQdRBsex65en7/xK2PDuHhBsJuR4AI9q4oHSiTxomkgYXGA+0f6Q?=
 =?us-ascii?Q?IyQtNwsbN4qR0elbEVQK74jVCBvTFxFhpA+kDSJH5IY1mEkMigl4szl7DQwF?=
 =?us-ascii?Q?6Pv1hX4UmN1rmdZ6t8XYTA9eM0ENT12++khTCvXm7c04oajx13MaCsKIN9To?=
 =?us-ascii?Q?9XnGQvVEyn9losgHZr+JNtWsNVcnpYssocxKcM0MbKwaLXLn7Gm3MOJMc0cB?=
 =?us-ascii?Q?VEhfoUYLxLiVAIWVeJdDxjTexh+XwnJMSmjsGyImLZXduKC46lwAprePiMDn?=
 =?us-ascii?Q?5BPa1xmOi1Po4LLOycXp8YIl8jnl8dit+Js6DNuGE8t+9ENbbfnVN5EcSr0C?=
 =?us-ascii?Q?jlWVdSd7EIDP5jMNHeGUyTrakZ2PFdVd1UVrvJL7VhgyPC19HIs8xL9/f7Y+?=
 =?us-ascii?Q?6XHvLagt9/EqazVixPUPxkEvDedQfbADD3B38rSuJvk5Bf+ezddNU/ql+5Ps?=
 =?us-ascii?Q?UzPJg9V9UeEUcMPC+EFrIgOi9czU8gDPITOBitQ+o7mZXKCsNlsUffzu6p+/?=
 =?us-ascii?Q?iJa6XlJLhRqoAZ0Y2TPSUkAHUri7UvozjjO+cOPYH/WyS+nMixjJWl7njf/f?=
 =?us-ascii?Q?vqDoGScwOmaANx7GZCUUzh3F0QhuuHgVKS3Z+8VfDPOUWEhztSS+OdEqwM5m?=
 =?us-ascii?Q?OCHZUqsvRuSGimy0fsH49iajnDjmp3u0dlpvZZ8DqvgaCZnYpPlQq6DBIUxH?=
 =?us-ascii?Q?k9nRXapW++HIR9Xh2Mi69x7+agieBFljXB08Efnfg0DmDalLpV2b3/JhQCaU?=
 =?us-ascii?Q?lhFTGQRSJRIHOvRnSNQPl/Hu2KKfpZZH0ryNrw6Zle6AkZLu961vfvCr8+N5?=
 =?us-ascii?Q?owdvjGGHLwU6p6FZqc4+7Oy2pm1zgD4lfp7V3eR4RVksYK9Vs6scaMmzD7oA?=
 =?us-ascii?Q?n1fhx338G4SvRMPnkSnchEZZeWXQoGDJGuz/NzBzpm7f6axNobMiqnlrtLY1?=
 =?us-ascii?Q?NtkOa3FOiE8VJUW4wa1RPHkNSR50fWMg2dYsDiP97mkIPhW8B7TENobTB+mp?=
 =?us-ascii?Q?uSyf8vLdDGAEirXKSlmkG2X6alhAVSC7PEr91jBbTcpYc5CfyFgBnYnSJYCG?=
 =?us-ascii?Q?JWP5e90QnCMrW8FztW5zNCaVqoBubbjzn2LCGRHJBW37eQ+aKFRlphTPlvEu?=
 =?us-ascii?Q?YDjLq9S4TVU98wTGPEKtnvHOSLqEnddtjmC0OTHj7VktQAc86w97YlrcjuCp?=
 =?us-ascii?Q?AbBXQ/ILUW1bNbKd9pCWoSHyPUguuvleF1Az+pF18mLIzgoGRN14VF03tzDi?=
 =?us-ascii?Q?/axZwyEXvSDvXBcjCqq0n4hsn0BDSRuk47tbRvg5ENfceVsvP5fHFx2oxOJR?=
 =?us-ascii?Q?ldcm18jlJGE1QL7/Mey2OMM3o15QU80C1AUg7Z1zEO+ugnYWCWLZV9sngr58?=
 =?us-ascii?Q?kQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 453598d2-a946-4cbb-99d0-08dd5ca0799e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:17:26.1366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ez740i5TQ03DshiGyqAOaGREASt/DDa2CfidO9fOiqbjQxsBt61JRXkGW8/33adaDfdGHIpm7nqPD9qsNOxl2z9IapLOvH/G7ryAiMF7+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15621

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 05 March 2025 12:39
> Subject: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas RZ/=
V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for the USB2PHY control driver on the Renesas RZ/V2H(P) SoC.
> Make the driver handle reset and power-down operations for the USB2PHY.
>=20
> Pass OF data to support future SoCs with similar USB2PHY hardware but
> different register configurations. Define device-specific initialization
> values and control register settings in OF data to ensure flexibility
> for upcoming SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/reset/Kconfig                    |   7 +
>  drivers/reset/Makefile                   |   1 +
>  drivers/reset/reset-rzv2h-usb2phy-ctrl.c | 223 +++++++++++++++++++++++
>  3 files changed, 231 insertions(+)
>  create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5b3abb6db248..bac08dae8905 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -218,6 +218,13 @@ config RESET_RZG2L_USBPHY_CTRL
>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>  	  controls reset and power down of the USB/PHY.
>=20
> +config RESET_RZV2H_USB2PHY_CTRL
> +	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY control driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Support for USB2PHY Control found on the RZ/V2H(P) SoC (and similar S=
oCs).
> +	  It mainly controls reset and power down of the USB2 PHY.
> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 677c4d1e2632..3cb3df018cf8 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
>  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> +obj-$(CONFIG_RESET_RZV2H_USB2PHY_CTRL) +=3D reset-rzv2h-usb2phy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> diff --git a/drivers/reset/reset-rzv2h-usb2phy-ctrl.c b/drivers/reset/res=
et-rzv2h-usb2phy-ctrl.c
> new file mode 100644
> index 000000000000..a6daeaf37e1c
> --- /dev/null
> +++ b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB2PHY control driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +struct rzv2h_usb2phy_regval {
> +	u16 reg;
> +	u16 val;
> +};
> +
> +struct rzv2h_usb2phy_data {
> +	const struct rzv2h_usb2phy_regval *init_vals;
> +	unsigned int init_val_count;
> +
> +	u16 ctrl_reg;
> +	u16 ctrl_assert_val;
> +	u16 ctrl_deassert_val;
> +	u16 ctrl_status_bits;
> +	u16 ctrl_release_val;
> +
> +	u16 ctrl2_reg;
> +	u16 ctrl2_acquire_val;
> +	u16 ctrl2_release_val;
> +};
> +
> +struct rzv2h_usb2phy_ctrl_priv {
> +	const struct rzv2h_usb2phy_data *data;
> +	void __iomem *base;
> +	struct device *dev;
> +	struct reset_controller_dev rcdev;
> +	spinlock_t lock;
> +};
> +
> +#define rcdev_to_priv(x) container_of(x, struct rzv2h_usb2phy_ctrl_priv,=
 rcdev)
> +
> +static int rzv2h_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	const struct rzv2h_usb2phy_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->ctrl2_acquire_val, priv->base + data->ctrl2_reg);
> +		writel(data->ctrl_assert_val, priv->base + data->ctrl_reg);
> +	}
> +
> +	/* The reset line needs to be asserted for more than 10 microseconds. *=
/
> +	udelay(11);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	const struct rzv2h_usb2phy_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->ctrl_deassert_val, priv->base + data->ctrl_reg);
> +		writel(data->ctrl2_release_val, priv->base + data->ctrl2_reg);
> +		writel(data->ctrl_release_val, priv->base + data->ctrl_reg);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock)
> +		reg =3D readl(priv->base + priv->data->ctrl_reg);
> +
> +	pm_runtime_put(dev);
> +
> +	return (reg & priv->data->ctrl_status_bits) =3D=3D priv->data->ctrl_sta=
tus_bits;
> +}
> +
> +static const struct reset_control_ops rzv2h_usbphy_ctrl_reset_ops =3D {
> +	.assert =3D rzv2h_usbphy_ctrl_assert,
> +	.deassert =3D rzv2h_usbphy_ctrl_deassert,
> +	.status =3D rzv2h_usbphy_ctrl_status,
> +};
> +
> +static int rzv2h_reset_of_xlate(struct reset_controller_dev *rcdev,
> +				const struct of_phandle_args *reset_spec)
> +{
> +	/* No special handling needed, we have only one reset line per device *=
/
> +	return 0;
> +}
> +
> +static int rzv2h_usb2phy_ctrl_probe(struct platform_device *pdev)
> +{
> +	const struct rzv2h_usb2phy_data *data;
> +	struct rzv2h_usb2phy_ctrl_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rstc;
> +	int error;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to match device\n");
> +
> +	priv->data =3D data;
> +	priv->dev =3D dev;
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get deasserted reset\n");
> +
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	error =3D devm_pm_runtime_enable(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
> +
> +	error =3D pm_runtime_resume_and_get(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n")=
;
> +
> +	for (unsigned int i =3D 0; i < data->init_val_count; i++)
> +		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +
> +	pm_runtime_put(dev);
> +
> +	priv->rcdev.ops =3D &rzv2h_usbphy_ctrl_reset_ops;
> +	priv->rcdev.of_reset_n_cells =3D 0;
> +	priv->rcdev.nr_resets =3D 1;
> +	priv->rcdev.of_xlate =3D rzv2h_reset_of_xlate;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.dev =3D dev;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
> +	{ .reg =3D 0xc10, .val =3D 0x67c },
> +	{ .reg =3D 0xc14, .val =3D 0x1f },
> +	{ .reg =3D 0x600, .val =3D 0x909 },
> +};
> +
> +static const struct rzv2h_usb2phy_data rzv2h_of_data =3D {
> +	.init_vals =3D rzv2h_init_vals,
> +	.init_val_count =3D ARRAY_SIZE(rzv2h_init_vals),
> +	.ctrl_reg =3D 0,
> +	.ctrl_assert_val =3D 0x206,
> +	.ctrl_status_bits =3D BIT(2),
> +	.ctrl_deassert_val =3D 0x200,
> +	.ctrl_release_val =3D 0x0,
> +	.ctrl2_reg =3D 0xb04,
> +	.ctrl2_acquire_val =3D 0x303,
> +	.ctrl2_release_val =3D 0x3,
> +};
> +
> +static const struct of_device_id rzv2h_usb2phy_ctrl_match_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-usb2phy-ctrl", .data =3D &rzv2h_of=
_data },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_ctrl_match_table);
> +
> +static struct platform_driver rzv2h_usb2phy_ctrl_driver =3D {
> +	.driver =3D {
> +		.name		=3D "rzv2h_usb2phy_ctrl",
> +		.of_match_table	=3D rzv2h_usb2phy_ctrl_match_table,
> +	},
> +	.probe =3D rzv2h_usb2phy_ctrl_probe,
> +};
> +module_platform_driver(rzv2h_usb2phy_ctrl_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>")=
;
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");
> --
> 2.43.0


