Return-Path: <linux-renesas-soc+bounces-30698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H2VIME6zWnnawYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:33:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F206537D2F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A49983165FB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F234779B8;
	Wed,  1 Apr 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HZsscGbz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9B4779B0;
	Wed,  1 Apr 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056635; cv=fail; b=rbR4mZXZ7ss6q1cv77Lj5p1F6h2vQaLaoW3FGQPl9m+vWVzxLrSg35stpebKnJ9fvt/sTBeXBfxBBxAmCTaE9yAYSAkJ7Z/1hx4vmSjOCbav6I50QG57alc1PHh6h4wZVnNDW0T12D0xSAbYZWP0Wj1poxDar/4XBtPKqK3MV6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056635; c=relaxed/simple;
	bh=p6xKfsxHRhUCl4fpDZJzs8fnMDcQ9b5clTuP2ploz8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hRP5OAnyeCnPDt770Ga1iX4/yzEkRXIANOS71q2Kv5/UYETVQsx9W4oJp4WumGQPx8hc2/0ckSMcAgkp2ObyO0AeJgCoGqMM+nDTWGKMhsveokNGrmUw11A6vxjSCri8hwT7c5UKs0gAaYYkCf2oiSo10WULXKy0KFCWRUiyrMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HZsscGbz; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxMEZZp+7sb1dgpfqR6t6QZRHmZV5nxRk7rM94eAaEPUUjnDcioPiqA4fwGKbqQkZE5C3r+EK/INZmqhx0ZqOwCx9hWQm+hS+CiBz3ro18G6rcHBRs3EdSoQqGJR+jJfVi5WZ2sVkV0Ewlkck81yp17TVr+ytsh9M5h59GVhv0ajYKeVN1hEE9K2DeQTuh+avPir64eBLHG6nXUlRLnpYufbyvnInHQUKJQ8WP9b85LcQBrfILeaKB3PNgFpPDulJ5iOU3weAB/TRD6s84dB6OfR/Cm5cBXIxBDV1nX8IvH9rwCRuiNpNZ3qXfYjhuMOPqpO0EeJ8bcsY51klrcToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69n78nJJyFMUz1b15yMdmLqFhAtwmZRAXm7a7esNIbk=;
 b=uJCQKxOxdmTc9HUeoMjPFGwCL3WDurmNjIiFfLpkJCb4OHcSvFhvVQGoWX6g+xQahtMsdOe3PDaOxnHTiNig+nKJbNpkDvV6ITfJ0h0SPooMpf1h8OMbYDVcG7oc05owGLCFLmoyIA7zLSYR0VDRSsKOEyWkUYfNdfjcF7GDJT+l5pLep1P2MIWlYtPRk70DCjsPFmbCKNtT0KDM3P4W3y+WDLeGrfQSSvI2dbruRxdV7BnZglxmtJZDetebsSSRiPE6lezFRq+qZmc5klVNzO95XfqY0v9Z7DjQK9f/fgDBa8r7z/ohu3qO3TIpgeGUI8arUvkObxKtNaZzU7lbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69n78nJJyFMUz1b15yMdmLqFhAtwmZRAXm7a7esNIbk=;
 b=HZsscGbzGWmLk73nlIjovK3O/hJOjw6bgiftMwcgA24KwSUs9ORf7GXMC7JYD04gpkq5VDXxIeiv/SyYCJqNGDKLWUxpUjMuAB+dY8T3IeZ0fhfxWPGWs8LPjguwsOKZS/wBFVAMucMEgu8B5WqvwZqemkKz+XffU4xhB1VS1vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:17:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:17:11 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/5] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Wed,  1 Apr 2026 17:16:11 +0200
Message-ID: <46461d37dd5c8151a1e9a4fbf76c2a64fabd58dd.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0101fd-905c-4324-a1ed-08de9001bf5d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qasq7qRxS6v7XjuA7sFT12M1q08Asi4ioxUR/Rwksj2jRlPExXU6/F7onoY3iS79JyrGhBiePf+8ppSSGj7L0GQMAr1HuKFqHNwkKe3Nqqj3SvI6JIoe7Ty6BGHgFNjKCX3OD/4qEweE2heOct8WbN3l0JIuq3O24k7hGPqFBfQ00bhvaKaiQfZVuVy+MEpI5e3WQMheuWIZ/GsRE1q3+Vhb8K7q+UZu06e/bPYMw1QH6kAd0eoSFekNhldDRuxPTbcNZgD1qstje3sTnq2GU9+HsA8xjXP3+re7VvRgjCxhkhCWgpmbxY5R4AIsnxXdlLy6qaYLeR82IEx2AKFTHkKae4h3GYYPu50nSaF5AhuTtzduw7KpPrkBH+ysDsMj03P76ZNGMRnfBMc3lT+ibKSLaZQaud8uoSspzPL+E9dHb9vPrO6ypy8hSXhtO8Jc8sA2I1f95I4cvk3DYV+kco/ekwublCZD1esVGs0NEOealzubzVLBOGRjUSyUVWw8YYpFBqqNIW3Txpf2uQMWV9QtCuYsr3Y7btj/UI5d6YIaQQpQGJ/l1qbS2mL1sxTWZTGVGpmqO1hw52wTBIr1wG/qCWcqXbLlOIipfX/562nectWbrZRufPzsskbpHgFY2W1N0+wSf//g0jjPeqZhXeKJPPpw0ovcMaNlaP/BRU8ssdzX+j8X2I94VybVJIhYb6kdVrQ516v5R4LbrfmRW4DKIn1dPSVA0pJsD1LQbKkhpTjFHibjeQVWScRbKNTOMITU3jIcjCnn5s4DYoN1MBvSXzVCbwEpVWg1kr8VU6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XL7QrQ0845okgD+SaJ6xRG4wuCVq8ZoXMFP8h9C4zwGL+ougtp9uedD2Zrl4?=
 =?us-ascii?Q?9hgEqupGdEDjA+EtrGl6+CYSwk52HS4PI0eS4cAjPNSs5IcZz9/Nf3+uVU42?=
 =?us-ascii?Q?5PLH42+hZGC01sFPpFax/Hfqrp7jYV0T48mpqXTje+O0bobIWz4BWrVqHGiY?=
 =?us-ascii?Q?7EkgPdvh9azFM+iOOp5UoBUTZb0q0pvHzoI+lb0Dnzq7pdGuD68qTGW4QX6D?=
 =?us-ascii?Q?6HgcaUcIXTNcU1gWSbp1HEeJVWXziIZuo5jrO5MTFuehpyzdklUuArq6BRYK?=
 =?us-ascii?Q?eWLMKewAMBHRPUxNPI6Kr6vBc569lxL9C+YviHg3Zq0liz/5bNxm6y0PPAg4?=
 =?us-ascii?Q?vIs8+UIydk0e4WToBmbNZKvauAgScJ1Yz2idIfgtQNwJFktlay1pzlKSeg/+?=
 =?us-ascii?Q?d8NHPqPIuAXMHq/dZYmT8cWBrjdLyG8XqxCKeo77cM3T1Gup2pTrNHxhKHud?=
 =?us-ascii?Q?q7NpfRI71RVXV+03nCyq2bdUqs/oTGa6ybmIPlmXBfs8WF0pJ+fpjz8LJu1q?=
 =?us-ascii?Q?+9G1bZYkwt1rcV8e640OcoCseO8n7XfnuwgcHzZe9d9Ibst6SO5dFaJYKFtE?=
 =?us-ascii?Q?bSpu5SMg53EK+ybT+t6Mhmx9lK9jpOsT7tBLElHa8enC5KpPuMU+VbQNdxns?=
 =?us-ascii?Q?IdGj1As2JpEm7vpuXfZWHcXK9xmi2DGnHnHyPkHwH15r5fQZqRtg3/CgifNX?=
 =?us-ascii?Q?RkuCmrBNJkIc7ndr3Z6SxaHM9DjkyXtWuSuavTVzlURcR5jmTFIEoCmPhiV4?=
 =?us-ascii?Q?Xspl9TLFNrDv/vInPlpAn5u+KKIMg2vXBDTwKk2ckhYjhFsdrcF7DzGvAyCa?=
 =?us-ascii?Q?0TFnQ1/gABx8q9vlVuBETs9TtYGrsqLzi8jvFRK6QxoccVkTv5Cjb1ergyRh?=
 =?us-ascii?Q?MPugUW2ANcG1rr4oRLFMyV+14xt/lSw+uLowt+MOPpuj3JIzWq0pMj2insTo?=
 =?us-ascii?Q?w56Kno+ihSR2SXeJ4huIohvX9pgXNZIIBPyfrmR4BZAQKaDAMVgdTVnhzKNO?=
 =?us-ascii?Q?0iWt/o3CMWj+4ojmUqrt1YKd4zjpamSA/yFHzG4O2qyEA12/FFu7sAcHEgRJ?=
 =?us-ascii?Q?KUP4l3XWAExr6i1BULM38Rg7t0fwbfuNTzlBE6cB/IrnPHW01BKSiOvRkrt6?=
 =?us-ascii?Q?wLVOugb4GbK3xyW01dINEagvoqeFH5lzse8fxaClzwkZUfcq0Nw3K1+vrm5Z?=
 =?us-ascii?Q?hZsVvy/uN7ghNQz71GUP14zH2EjozE+Ayvi6v0IAX0i9wkHStK5f0EGXW9yH?=
 =?us-ascii?Q?1hDq17R3MhW5AfzqDqRuRMxeiFxXOpxuyhux57+Q3LnA+FL/2X8kXz6MOHIP?=
 =?us-ascii?Q?GRh6Zpmy83DgvkaGrMYZ5GosKyoJkVpx4LPFBpOJ1TE8obkmmg0bIXABfMQe?=
 =?us-ascii?Q?3MlWDinYARwzeWq+eBFTaeOCKVWo0PLU8Z/I9q4qy53cQV8f8yxRXoZs1DrB?=
 =?us-ascii?Q?QzPHnZqnASOqNcL9a3vJ2Y7abVfr13/mv9qVFfdvT7vHsCxIDZef8p7Z4Qwg?=
 =?us-ascii?Q?vJ7W4gDwJwpReXvjutkRsTjyr5Vm9ABYVNsXAc18O/oA3pFUQx0bpyaNnnBO?=
 =?us-ascii?Q?nHRvQOb7iMTkXZ09cdr3AdEkb5IXzuBFN1ZQzjJLTejZK8vlDdzxr4wILdDD?=
 =?us-ascii?Q?p787p4znmMGvHFaURAhQI/jajfQ/EOmIHTNyamqC3NWwYuuEazmEO+lPJZie?=
 =?us-ascii?Q?rgOcUup10XhwXAA5FvC4irVYfam1fYYGKLGERLxZ+sam1VL8yDHeIEN0++8V?=
 =?us-ascii?Q?mGsh0Uh7hvXS0d4tGaLMOQEDeQNi0SgvBlJvvvXAxtGvRGYFcuy6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0101fd-905c-4324-a1ed-08de9001bf5d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:17:11.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgCJcX/XSe4dZ4+IpU+10xhdRY8RJk4Y3wKQKvYWuioZlorSVB0NeuvO2rkeLiqiqeT0BJrl7OodJyZmAn6JNUWXo2+j3IulXQY+dDaAA7SRdaatiCSimj1KhP4/6JaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30698-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: F206537D2F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v9->v10:
 - No changes.

v8->v9:
 - Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the driver
   is now based on regmap and does not need the reset driver's
   private header, update driver accordingly.
 - Collected PZabel tag.

v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 35 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index c539ca88518f..62b2c3919613 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	select REGMAP_MMIO
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index c79bf72602e8..d96042e28cd5 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,7 +5,9 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -15,6 +17,8 @@
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 
+static DEFINE_IDA(auxiliary_ids);
+
 struct rzv2h_usb2phy_reset_of_data {
 	const struct reg_sequence *init_seq;
 	unsigned int init_nseq;
@@ -84,6 +88,33 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    const char *mux_name)
+{
+	struct auxiliary_device *adev;
+	int id;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, NULL, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static const struct regmap_config rzv2h_usb2phy_reset_regconf = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -153,6 +184,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


