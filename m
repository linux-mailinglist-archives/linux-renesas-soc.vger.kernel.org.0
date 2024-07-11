Return-Path: <linux-renesas-soc+bounces-7245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B492E21A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 10:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329CE1F2126E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 08:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A05150992;
	Thu, 11 Jul 2024 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Y1O5naVj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F6BE6F;
	Thu, 11 Jul 2024 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686359; cv=fail; b=d0hjcDCuBbKwduIoTgaFn31H745w9bwaCBPu0zrJJkYon4MW9uFLkOb5v9F1d/Dbl/dpaYWDhtRmEzzJ3LGdO+MZihGd6YPfAdhS8tUTRlBsLoLvKSasUHk/z4x5AwbPJXaOL9skfD0oWj5PLiej9F888y5+CL+d295ysn/r3p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686359; c=relaxed/simple;
	bh=g3fH+9i1ak5daR0h08NvxvI5xnzTEz5x9QaX+pxFlKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=owSCNLrsKlbft2bzxrcsz0sPfSMVTu66ZhJEMRzL51QiYrjNFszK5rZqqJ6x6X9kf6QmHaQVXF+o4/i4atJ9ggc4y91ByQBgWeNJmWyB6QLwtj1oQZKyw5qbtIhdVODXamte9v/GGhAs07cahdRNq9ElpAur4M+Tw5kj4TcfdS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Y1O5naVj; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPERuTRL8CBlW0GBKjLjZhnVNeoS5ZcRxpkvW7GqpQjHCeNYF3/lHllG2R6JieoQlmeNJAFdLM93SzdDo6QyTW6XAIVBofaeLEBfIQoXl8kEWxNUVidizA7/6BrgxtpN1JTe1pO3OLdxnQxA/N9sNzzSUZvmRWWlZ9BrN0//sr+M6cJCJQW1TxPotPcwjFc6j1qqJYTA9WAwfnZDoiOfS7360Wdscqt5JxN8CPq9BklJM42KXb1OM3gX+eyY3MnZHTVywcbOUj1RQmooaGgKZyEYPnUUz2lgefo11XNtDcfdZCSruyny28t0l8F70dP/vSieXhmYAV/yV9Nhulzbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2KZ+4dqzyX/nEj5k6RUp1GqWwQDPnGC5iiCLE9qDwE=;
 b=l723FbHEJXIE++7L+EZ/QLZ7wOkw1fEQZz6o0ZVOCls5YhbvNjCPUYHwYtSYUP+ywAigKeHOqW9/SFlj+iiFusw/kssREia3s/mygHzkJdMUCZQHliSKcqPnj37wJAvJiAoZobsHdhSOxj/e4Ua1IGd0BfP+jhnXMtWR77SwenPd6R3lrJeJ6Yq0yGWukVDLmrQiMtpP0MvKbKIqYouHX7QQcEjuorIsARAiKE6VlMExUksvuv5saFB92u21i25VATY8p8xT7M5mjbP3cO2T1RlP7P5l1cY9U7QXdNZ3rlfVzjR4bZ/JKRQ25GdksszRQ0c1h5Hot7nW3VecPdJTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2KZ+4dqzyX/nEj5k6RUp1GqWwQDPnGC5iiCLE9qDwE=;
 b=Y1O5naVj2sEiN//9sQsxwix0cFcVNPRrRj0PlmBMF/jDu4NYE90h07au0i+vZWSY4sbxLNtgukC7YYjScZOkVJCK2vfmDW016AIdvRMNN6rIqjwdPlChLJ2o6FHpLbfbd99MBLAmm+Ja0TgXmGpFeTPkbSDzY4j5wravW6EkZq8=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB12041.jpnprd01.prod.outlook.com (2603:1096:400:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 08:25:48 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 08:25:48 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 04/14] clk: renesas: rcar-gen4: Use defines for common CPG
 registers
Thread-Topic: [PATCH 04/14] clk: renesas: rcar-gen4: Use defines for common
 CPG registers
Thread-Index: AQHa0sqZphVkbIr1sEayWPadbtuVArHxMVNg
Date: Thu, 11 Jul 2024 08:25:48 +0000
Message-ID:
 <TYCPR01MB1104090F8DF7E2C272954033ED8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <cover.1720616233.git.geert+renesas@glider.be>
 <915cc5c8d84469e5401cb2ae71da6aa8eb524dd4.1720616233.git.geert+renesas@glider.be>
In-Reply-To:
 <915cc5c8d84469e5401cb2ae71da6aa8eb524dd4.1720616233.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB12041:EE_
x-ms-office365-filtering-correlation-id: 47b4edbd-3553-4fa5-b675-08dca18311a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?diSqpfGWOHXMxSsWOS2crnuoegnfWLbYhKgaTi16Xk53MHj9PWyqQF3D4V71?=
 =?us-ascii?Q?VvBlnUG6JU6MBagcMl4ZEEdqOD7wheAz5/s+Y1E3Q6wJjDh5qFICqqEOCJbQ?=
 =?us-ascii?Q?/+eqg3jBjwcGsh6qgeZ5G4RdvClTKmRVvac4W1p1VnXDFIK4HxkxYtej3TeI?=
 =?us-ascii?Q?F6o2NrHQT/gJLDr1WMu+rJAAmZZMxJPvtndq5zzJej/Nss/CFBZpSZ2B6ClM?=
 =?us-ascii?Q?+0SVr79NcIbTaBZ8S/POnEN0hZnavkevqwlOIUSYhxUiBGhkj6pPezgh4bzq?=
 =?us-ascii?Q?HF94czPiTWDuKM+qCOdTrPpU5xos5MqnGgLMzs9HyOfjqp5HyPzlvnEEW/hz?=
 =?us-ascii?Q?FeXh22TOkLRjmFMjPBe6bF18LOLPjwzw9QKJijLPsNGWqUlQclf2Do4oY0yQ?=
 =?us-ascii?Q?zahk0yaHeXJGgr9RjXynW8WF6Lesbg9KfCmKeWitpKeSB4aVSEH5LkbQalik?=
 =?us-ascii?Q?rLJh+Q1y5zlRVZVatQVbdIUVTZ6+hHH0Sy88J41jTygDv2yXBH+du3p0upqx?=
 =?us-ascii?Q?YhCQURB0tM4dTK9GcJ3nlASgIfON5Kf945ylOQNSNWtUuxfYlKO2SeEenyGG?=
 =?us-ascii?Q?kl+YZKY5+t0+B6/MqwMwyefQGW0GxEbMlVP1CyhIAFmCScixbGSo5opV+pr6?=
 =?us-ascii?Q?0QK0eBZm5+Vz3Z2eaHY0SZcd0X4hSJDbZgfkX3MVosjgfGWteLVqjwj7xewy?=
 =?us-ascii?Q?yoP45Enp/9IObz966GjedVOmiQHDbC+JQABFTmLdwd0FxEIC8Hk8/MSIuxND?=
 =?us-ascii?Q?kQLLO1PZ+iYzAd0hGLzCT5QzgpYDaxbVI4IFNoeujw2BTEIWtBXKQiZpbm+m?=
 =?us-ascii?Q?KubHVLrKl81KVTru9btrEDG8XJp/v6d36nGftAK7H9PU9HEz9/aa0Rq268EI?=
 =?us-ascii?Q?0be+h2tjqHCSLt+OHHkE7hQ5RKc/eWC70FLnu7Hfcjruz7je34Evmh3BaTcr?=
 =?us-ascii?Q?P85jYafKiGiko8K+ffbEZfPERkGQmZKfiTs0HVDExZE51ZRp1vl41zmBu8hD?=
 =?us-ascii?Q?5cLwI0+9ANVSfa77PfgZTBSSLAkMHm32EwC7D09SIwtHp/ezah4c6ONHA7CH?=
 =?us-ascii?Q?Pba1C3yo3Q3GtbEDd06LLj4cQRsnEM+yoSnq3ma9Vg7rWzKBqBQ3rgaO7FfL?=
 =?us-ascii?Q?N34uhA0oHr1opGZCYOvokn3/rypWxpCRWqUfSmNMR2K0u3LCRDQqxbiAv2rt?=
 =?us-ascii?Q?+1GToHer6Kii833xjj+Q+W8knRvOk+a6m5VlslX06wqjF7z4Wljex/ejmnbe?=
 =?us-ascii?Q?V1pD3GkIMso6NCpPbonGbL+0vyBUpHZ7E9A4lSj2Rs7c0eBkrxoOP6vBGfVN?=
 =?us-ascii?Q?oG8RzU5Tfx2hnQg1SZkgnZ3yyWA4rbTWjeWmEdXCNKiTDXHGp5o2T4DvODPX?=
 =?us-ascii?Q?leiCWCf1Owfx86SJownkVbgZHWpfaj6I4OGv5JbXw7hzCr8ufw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YFG/I9mHlyc/wd7aFpYgPqHXviMq3GP73UAaP9L7+gpkHlAEPpmWHCa0ytF6?=
 =?us-ascii?Q?vtBp2eo4vDMQntRMQnSr/o/HyqLUdupHtV5vK2aPkP2B0Xxe1xbhFqxTMQpP?=
 =?us-ascii?Q?LIayaDnTEqQsd4Keydk63ULIjyGkOknerHrG69sqqaOftsOeXpDjzVWchrkB?=
 =?us-ascii?Q?NzY6u996TzMhzksuINa0cU+qHTBmU8UMxqBFJbM51pTdL8VcAIwArfLtMfFU?=
 =?us-ascii?Q?MdhPcZp5pId579SsovsN7k5LqvGbKkWBx4vAeA5ixtM1uDLmvoUgyuLTwrmB?=
 =?us-ascii?Q?bza/V7HPIpsH+Ds4NUxfJh1P0i6e/BHNBKyShS2py1K6W3ioqNeZrZoUZJj8?=
 =?us-ascii?Q?26pLtO9mRda6EEcHyXMCfKyCQvAJbTMrZ+J1OBG2bOadu+qRcdTzVIilznpS?=
 =?us-ascii?Q?VDwHy75T1692haAZsiHbhINxEcSCZlvcp4AlTC2KhHoE+H0aQcFuQdExjL1Y?=
 =?us-ascii?Q?8qQgX+P5uilslCfvqvqpj4bDTwxoJetdi/b2K1EgkwsCiKBt1ir7DKlK1L3t?=
 =?us-ascii?Q?p8qWlgzwu4RcbLi071LlWdqyr2Uzx1p/4Wc9p9YuqJ3AZTXseF2/C3xKbL8c?=
 =?us-ascii?Q?zm/oiGYv6uI7hH0mtldBvF1aU92njLnI/vC6hSjtQILm7QoJKf61swX9aaw6?=
 =?us-ascii?Q?EHvwZCRdhj+PMMZL2eZgL3DD9aN5oNtmMWKOiolgOyn7t4tdmTyP/KFD/Dnq?=
 =?us-ascii?Q?PRcCTq2TUFFAVTAOK9YLsWoqy7mYwaNdF82JR5Cy0D82Jn1uHlKqe4sv5kZy?=
 =?us-ascii?Q?UmzRkfaMuLHv6pWNGONKQuOxYTUYfRwynSPQyuYbNBAl36aQpxBa+Ohob68a?=
 =?us-ascii?Q?qP7G0H0XV6nf2eVIQIY2v3U8+i361/njKjuGQUSIhKpBL9FqD+czZhZXItOL?=
 =?us-ascii?Q?rCE7QROp/RGfegUZ5MxHo6WqhpFXFzeonnWLz5G18ZMZE8q7QmTB/tOYZZY2?=
 =?us-ascii?Q?8z1dsjJFtw9VRf+CoeGuam385+gljsS+jTaSd9+znwTMiFof4Wor8WF/8ZVe?=
 =?us-ascii?Q?TXsQz94cUfNij3XPs+FEc3nVnpx+2tTWB0awV5++JP0zEHHZLbc5n7LHOzi8?=
 =?us-ascii?Q?fWDCvzm6XfnEpC0+HkrEZrY6NQuvaurDIfXA7iq5n4egbUn+esinGJaIYK7v?=
 =?us-ascii?Q?ynYmwKOCBWoj0zocgrx8eRSMB/1ZAkdOdqEGPUERhkrqZZ6q5atLTTeKlTqD?=
 =?us-ascii?Q?dRkZJEr/nH2Y9P+HTuiHIXPIDnCPD2SFq8ckaMSZs8wppjn4fTBMTri3oWVE?=
 =?us-ascii?Q?UQ9v1iC/HcWfz9vzwzo8f7XyCwZqU24mlyq5kgQCy0WCKkA7oHX7YbLrRuAP?=
 =?us-ascii?Q?BCwTGVZd9DWPmxlqvbsR7ZwfDmXTencXDCs+GAybhnL1splEpaAcxOMcrzi/?=
 =?us-ascii?Q?N5r1xc8tuI0n+Jj/c0T6Lse40O9CbmU8Lm7y1RudYQzQBuQv6ahcHX/ir3HK?=
 =?us-ascii?Q?fNJw7KqBx5FbPoubGkUXQg5fC+FyH3tz+c8HeY8uRc7sCdvNZlimfJ1w6atX?=
 =?us-ascii?Q?hX7V0UvEu8QjqjZPW7Jq6uDKM8X9IwGV9sq0q+KL4bgJRO5AEqz9XtQfeKxH?=
 =?us-ascii?Q?KHpV9V37hyzaK2tKm8nYMVaz7alRVqOwsbuNcTqExcmN+RFXOO3dd/N5u1jq?=
 =?us-ascii?Q?IQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4edbd-3553-4fa5-b675-08dca18311a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 08:25:48.8776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1KsuBm25wCtZjNfZhABlXhLxaA7BMGA6uSw/MqRdO7AykJhB6f7bO4p8Qcsttm2+NPn4b8Ppvv/IBGj00A4GeH+jD2glSTB0uTfm1xJwDpabJpvM6DNZhYXLg9nsUht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12041

Hello Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, July 10, 2024 10:11 PM
>=20
> Add symbolic definitions for common CPG registers.
> Replace hardcoded register offsets by the new definitions.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 12 ++++++------
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c |  6 +++---
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 12 ++++++------
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 12 ++++++------
>  drivers/clk/renesas/rcar-gen4-cpg.h     |  6 ++++++
>  5 files changed, 27 insertions(+), 21 deletions(-)
<snip>
> diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rc=
ar-gen4-cpg.h
> index d0329ac84730d681..748c69240dae755f 100644
> --- a/drivers/clk/renesas/rcar-gen4-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.h
> @@ -67,6 +67,12 @@ struct rcar_gen4_cpg_pll_config {
>  	u8 osc_prediv;
>  };
>=20
> +#define CPG_SD0CKCR	0x870	/* SD-IF0 Clock Frequency Control Register */
> +#define CPG_MSOCKCR	0x87c	/* MSIOF Clock Frequency Control Register */
> +#define CPG_CANFDCKCR	0x878	/* CAN-FD Clock Frequency Control Register *=
/

nit:
Perhaps, the definitions should be ordered by the registers' offsets like b=
elow:

+#define CPG_SD0CKCR	0x870	/* SD-IF0 Clock Frequency Control Register */
+#define CPG_CANFDCKCR	0x878	/* CAN-FD Clock Frequency Control Register */
+#define CPG_MSOCKCR	0x87c	/* MSIOF Clock Frequency Control Register */

Best regards,
Yoshihiro Shimoda

> +#define CPG_CSICKCR	0x880	/* CSI Clock Frequency Control Register */
> +#define CPG_DSIEXTCKCR	0x884	/* DSI Clock Frequency Control Register */
> +
>  struct clk *rcar_gen4_cpg_clk_register(struct device *dev,
>  	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
>  	struct clk **clks, void __iomem *base,
> --
> 2.34.1


