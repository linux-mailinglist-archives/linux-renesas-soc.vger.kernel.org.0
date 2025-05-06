Return-Path: <linux-renesas-soc+bounces-16723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA8AAC637
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A399189FCB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2822281508;
	Tue,  6 May 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eD6sdVv3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B061FCE;
	Tue,  6 May 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538060; cv=fail; b=ARYtyNLt0kq3vu4zHxdyCVuypmP9QdlGj+1ap58sojtRSRZuIPJhahRRYBvltaZ6L2CBVD/t/9YHzLzROqRZnmJa7OwrhMcV6TGCtdJnf8H/hXKusjjdfov27Yv5jPasDyUK8W1MCJoKN+mn+Q+Pj7fE9gFgIkeyAgf25D8uDCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538060; c=relaxed/simple;
	bh=uDtOq38za3LHR9qeZcm7yhUAqqcbO8kusWdt6OZNJDE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s14qeNCQbo0b3dnelwEOFrtJgK9as6/dUcwdhXQ/vE9Ar9ivSxCUN6vk+RgRIfGxKwCcXOU7hWRFlMBWBhk2omfnDFl0H1CENEmlufdgCXZPofvqYdtvV/OaOpL/Jeoa5qzJvimpoup95dFku+XThT0Vxl7TlpI7xl5d3xZbE90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eD6sdVv3; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKSlyQwWMCpqOgZloJ+PTCKoTYl/aoNjVm+ke4xjnSIbRJ2ykvGj9rywX7DY/qeklNtuNCt7K+npv4yhsh6sLsZjig2zSi8EX4lUYmJ4+Ggw+0bKBKpvR5JQFK84dkEljNE2UYtvuHwZUhOaV6o1D33jGaUAJ8DRanvhTMCTOgGvgseHRJ+pwxa13Vfm7l0hztIHg0Z7IoNFKXqieoG5iYv5ohczjJnljIlwCErhkO1ToGwH984Xh//2Fqj+N0wL/bAJRPssmh9JtfMk1Eveb6n5XfyZvbIT3HsEy8Z1+xpWnM20/pezRAdSZGPlRP+EEvhRnaVKIt6ezpO7UGwb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAb2xRHAR+t0fsrBEXHvVXJ6d1Pwq9jbyTKL+5h8XV8=;
 b=h2j+RSvnFYtIlnUnagWsDW2e5f2UGJd/dRviskeSLAO1gLbwKqasKIRktxVSFO7kZf/d/OQbJDnQn75MayVlN8hOXjIsqDQMtVVzaHi2yr2Pw9fuLBLFdSYyOGhRbW9chX+R8SiSbzntMgUYgxjU0IJQYUlquIZLJc/kumpNLdnrugOm9vKQlQ0+/1oRK4nqRaQFd1zxpAdNhLWyhNiNsj/8M+JtTNTdtb1lqoxknDbI3bMSeCZrzWHJvNkEBEjHeNVLXrBKKmATnUqfAIvKLOJlDQsfftouxf8qKafEnVWAc4iytc66NGa2GtfzpjKNP2V8IKcpf0XYzmI57ofteg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAb2xRHAR+t0fsrBEXHvVXJ6d1Pwq9jbyTKL+5h8XV8=;
 b=eD6sdVv3ixOL6pdW8ldU5S3CTRsAlupE9tOLB6Fm1EntaWxqYxWMQxe61yCdkj108bJ9rEAAIgvUIXnOjOcXLDlAnCZ+xQdPmJzpQcJDJCYQbr71sijmRNDXVY8CIx/veej6R+anyHfyFnu9IhCVoM2Z3nKgk6mY4tykvfNNMLw=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYCPR01MB8533.jpnprd01.prod.outlook.com (2603:1096:400:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.32; Tue, 6 May
 2025 13:27:35 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%4]) with mapi id 15.20.8699.024; Tue, 6 May 2025
 13:27:35 +0000
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
Subject: RE: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
Thread-Topic: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
Thread-Index: AQHbvoBEWH6FWyn/hU+j8+GHquSvf7PFmATw
Date: Tue, 6 May 2025 13:27:35 +0000
Message-ID:
 <TY3PR01MB12089DADE623A195D184FD5BAC289A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
 <20250506121252.557170-2-dan.scally@ideasonboard.com>
In-Reply-To: <20250506121252.557170-2-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYCPR01MB8533:EE_
x-ms-office365-filtering-correlation-id: 6cb08316-24c2-4ed2-b708-08dd8ca1c385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?osVs7bWVbaWBa5dyVRXFyJoun6fgFBdPL+CtHRy4RcjMiN0dQxcwAbDu7tvR?=
 =?us-ascii?Q?+qVMw2seA74/cyzpM2EcRJGY0mNC64DiLsP4zXMgw3CHu3MIsP27jX78bRsu?=
 =?us-ascii?Q?3TqE6ETl0kLjtZtNcdNs2daHMilUK7tcgdoPxfpsNF2UHTbPqgjH45vt/n/T?=
 =?us-ascii?Q?+Vn6oo3ZCyTIGrXulNqCGscm2z1wQEJ0bf458UYjvnGuQe0A0R8PBFS8YVRb?=
 =?us-ascii?Q?An99dPODmLklVWRMNyWRu1YUaTd7c2DNpjBrUI3HzVJzoMAl9faJDGmn78WO?=
 =?us-ascii?Q?imPBa5bfrbU4iBTBpbHFqfHnVk2T5g9ubZsYoEFt6fCQTYjlEGR2aWQ06i0M?=
 =?us-ascii?Q?pvG4Qeef6LSQEOmwt2ZLN4O8lngalnagnYeH7Ra4SSK5sLcvoM6CvQAKlP+g?=
 =?us-ascii?Q?b5dCqeV8Cs8T+50IXYeTsrOqexwK1NZviLKcTj8KdNF4EKtfe9tJ4qXp9S3u?=
 =?us-ascii?Q?brNhgPeCiD/xfVEqtKA2AqWr6dqVp4UbW74hcyW7yBFN/+YD8U9fnhrcrfw+?=
 =?us-ascii?Q?nG48yHThdDt46fR9QFiKSvkWvkplh37wuandLZwwQGvMayamBpV7xX8vs4EQ?=
 =?us-ascii?Q?t2/JhT6IbEvQwXs9J/xxkR6SAMJKsOTuDtgZ+RcPL6zQZ5z/ax/lvBQ6VGhu?=
 =?us-ascii?Q?kZC+0H+nYbKOugttSJhcwGwISFP1ZwGi57WkcGc24v9qxjIx+0zdDQxISGQ2?=
 =?us-ascii?Q?Bj3oam7KP0F4FEf+BX6bZ7RDgsmMvNGslF4puP01Sh/roUjISpyzkyR2Gz3R?=
 =?us-ascii?Q?EM2jbWgxzu2s3QJfvdbmWMtVzeQUE/N12KfanLU5VkgIeYVbXGll9Q4w16QC?=
 =?us-ascii?Q?RshAs4C1j1aBP5cI+nOdXArQCKVb+d1MAU+Bi66UrBwnN2yhHC50o4XA7xRw?=
 =?us-ascii?Q?SASyFTlnoA2fHpPJrqJ4ZQHtu1mNP71Tp/Tm5MZlS6XnUU4d/L07DYHX+G++?=
 =?us-ascii?Q?DBwsiG+TKmZKFbCamEXkbsLVCfRRoj4mBWArkynr4KxsnzQIulozz/7VVo67?=
 =?us-ascii?Q?cOtdBdFOoa3+4P1h+zwN94/A/abCQjMwEdB/2Uh1bBd9xwUUrmA5EZUNJhDW?=
 =?us-ascii?Q?9bRZqsN3GioO1/TNeJobu/51ZhJ/FA0g9dwl57cIi6KzflfmdcG2ggezYUbU?=
 =?us-ascii?Q?23prFxL5PEWp8sZDkQM0S3pfcXB/WP6AAmW73AVkI47HqHfblLTDH8FwtnMc?=
 =?us-ascii?Q?pdDsvxuQ7zg8Az6GShrRndgiKhni95gZzgjoHLZqMIV82rrtqmkbzwTtjkvs?=
 =?us-ascii?Q?QBNOQQeItpjUBgQdKCrv6HOLzrgF0t3bQU6U72drkbA61dZzCStPGIRexk7G?=
 =?us-ascii?Q?73fkNiF9CKRPoRbrlPhBIGNgWh9BJFdRuoA7N+jcLMjcbp0mOcMC2+vFqcBz?=
 =?us-ascii?Q?Wk4KFcIO0MVXiuvmCR2Ju7Y4cnule0sqa2eV5wtpfjIwEKy84srG0dXgtlHK?=
 =?us-ascii?Q?McgN27f4VwIIEmL3vTk5DxENLe/oPnBjtx1RCgH/hyE+bvuWM+kDgCDI1RX9?=
 =?us-ascii?Q?61t50jG6JS2KXxk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dj1ik5/JuA7VeeU4ZuyoB5wcLTcubsV3I0EE7gNG9LJACJC5DpEpFFHT3Oyj?=
 =?us-ascii?Q?6Bt7IQ8U1QV5bPhJrhAMr4n6uY3OvoOgQtK4z0L+Rj36IzL9iwM3Qeoob7qt?=
 =?us-ascii?Q?QAJjGUDPzl0ZyK5TkQNSWK6kfQjQIDc84EJ5bLgrpsxfs5trt2Ei+cL5P21a?=
 =?us-ascii?Q?JNQN0Mz2RXexPJQ+R9e0mNE/AkDGyiF0qoYE4yzt4VJxLvvK0ubvUjrzSqKs?=
 =?us-ascii?Q?zsVuV5fbC8DzFX2rKv1kUWp4ySWf1DSODtAS67DCim8KonoPv/7gpgaldoZC?=
 =?us-ascii?Q?XcsTjI9BLWDS/LF3ANsYa1p4OmTMYn/CdwVhCvmr7N3sS0bFalRLEO4LAxpX?=
 =?us-ascii?Q?XuMJiExhw/YOCd53l01eahFM0WO5gYEhtGTk1VPtb0XdPrScZX4nAerV9z1d?=
 =?us-ascii?Q?bPh9UJo08p9RUoYCv9UaISiDdk6FcKXECmh3tNMOW4+A9QMu49sAm/W5rMBk?=
 =?us-ascii?Q?D/uel8wMQAcBHK/30qmhIaC32fmEDL+7GP45WGSguiaN5QwqGc/y3MhqRu4r?=
 =?us-ascii?Q?TABoJ1x/mjeYuywnfRk3g4+qLC/jv7SNuMwgWyQNLNiWQwfwAMsKVV3c8ZJo?=
 =?us-ascii?Q?V03jVqhc/KOhk+v8Dn1SxaUAlYUoxaOCy6v3Uww4muHV+MkXebsUoyUWIA2/?=
 =?us-ascii?Q?lzZW1qodlrcp5B6CS/HW5xl8tI6bGPPyc23vQJosA0vTW6Bl/KH8b3guyUgg?=
 =?us-ascii?Q?EqjM1amn67lKu0x4qizkTK2h3TTfx9kCIR8GR54HQSW5AWXluxPKaV2ZyQlk?=
 =?us-ascii?Q?ZBdmGF9/Pveni7MWX2K/+699k2KpI+lJpQQ+ct+//lzyh7PO0tgb/FvjJ8ma?=
 =?us-ascii?Q?I6euZ6I2Ypia+Pkq4rYC0B5SFClv41HQ46EiJkvx+YgleGJ+4BUnTzZYMxBU?=
 =?us-ascii?Q?mQBHl8/tEsPfvsi6fQg/Pzh8RatTf8JMkg59HcWFVUL6AK4qZdoY37y5i5e+?=
 =?us-ascii?Q?ACTbT1n2PC3ssFwDdKyni48r5+3ejbzNRcAZU5Yy2SLvRobnVGaGtJ5Mh5Um?=
 =?us-ascii?Q?8L1JEHnKtOLZBSUwOwSTk9DQQxHTi67p2LIzPNrSLc3y1BPexe/sz8ilZ8/r?=
 =?us-ascii?Q?HQ/43fFnzmz7Ma7OAwZHk9tvDj+Oi2KOajwqqSRhaQl1XSC8Je/BfuSNsQ+q?=
 =?us-ascii?Q?4KJyDht+4jQBWAU0eIleWXN9/0ondDvWgX6NqMBGlvAUfGaY6MAVYqdYBNCd?=
 =?us-ascii?Q?duGK28sI2L0UFZemT96xnNAlMGvXMF9cMSzz9+z5Le2klapFvu79Xhz97xMU?=
 =?us-ascii?Q?m0MTpiO95kk6L9Yp5jigmV18LFAAd1lVopDsCojazLdSgTk4ChoJ5rbdVNVo?=
 =?us-ascii?Q?OjfOHrR9sXbwboXsz2W36GDCDeiltV+6kBlXsf2dUPE68pgHWXJkHKznywQU?=
 =?us-ascii?Q?sQOP9nCl0Jd7qd0N3dTgGlLKS9BL2wsYenAg448LtbyjVJ9UBZdEIEKO5edU?=
 =?us-ascii?Q?wc9kVyNfLc+W2qbjr1bczn7L82dexw53/zsgap4sqOCFwtoR7bbmSxhi2FUF?=
 =?us-ascii?Q?9AEgz43JJJ3/9m0DlfBN7K9ts8cMfTwTgbtcPSjmo3AvM7CgMJ1nDxEMq40k?=
 =?us-ascii?Q?Juy52Icga7kWlD7OU8pfc8k0MCteWXpS/EqPQCDLJ7tyetFZ8dDe8/lRlfa9?=
 =?us-ascii?Q?Lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb08316-24c2-4ed2-b708-08dd8ca1c385
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 13:27:35.4283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4obQRIDKYIqcisGuQj2WikaFFzweKlrn6dTY346jAfvcMl+Sao79PMrYzy7Yr4U0AuYihiZUSTnCZKA6Iql3UpjAobN+2FYmhQOAFPszxFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8533

Hi Daniel,

Thanks for your patch!

> From: Daniel Scally <dan.scally@ideasonboard.com>
> Sent: 06 May 2025 13:13
> Subject: [PATCH 1/4] dt-bindings: clock: Add macros for RZ/V2H ISP clocks
>=20
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Add macros for the RZ/V2H ISP clocks so that they can be referred to
> descriptively in the drivers.

I don't think this patch is needed.

Cheers,
Fab

>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/=
dt-
> bindings/clock/renesas,r9a09g057-cpg.h
> index 541e6d719bd6..cb2ccd9068db 100644
> --- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> @@ -17,5 +17,9 @@
>  #define R9A09G057_CM33_CLK0			6
>  #define R9A09G057_CST_0_SWCLKTCK		7
>  #define R9A09G057_IOTOP_0_SHCLK			8
> +#define R9A09G057_ISP0_ACLK			226
> +#define R9A09G057_ISP0_PCLK			227
> +#define R9A09G057_ISP0_VIN_ACLK			228
> +#define R9A09G057_ISP0_SCLK			229
>=20
>  #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
> --
> 2.34.1
>=20


