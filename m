Return-Path: <linux-renesas-soc+bounces-24966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10FC7A807
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CEDB367673
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2BA34EEF7;
	Fri, 21 Nov 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v+IJ1UTv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA234C9A6;
	Fri, 21 Nov 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738057; cv=fail; b=ILV+r1COn8FOyH45FBuXY8h36opLHguKHi9xgmlMKClmdTLh2rLdJ6lUEUmcCbq+xhgJOvXt9nw23ese2NaK9L/CURbwf6HiguWJlb57nyqFy5eebz0Ob1AOHlQljStq2tOpz3L6lVfWh7bLr7W/YT51z2SwKXLAvUrIGr5KIvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738057; c=relaxed/simple;
	bh=O0f8DQLVowleaAJy2PC9Y3u8WpZ6qEo1nWGutBY8NP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSDmZ8Toye1NzP5SesPl4DXOqixHNwVR6FhjfBkRI+dP6xfaD5QX6mN7cLvB3tqmqXeI6oyj3IIZ0fb2yLQt+uXSdoYt/j1y4bGE0xRDHQc1PSpdRNrOjz0dwKomt/D37FcJbRPcMye1Q2bJPjn8RrnsFL3dCvpGkbRpLGTe3hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v+IJ1UTv; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PA0HwpAMjpalBu1xT2cEm83xaBgCIuP/sUyKQ3vrjXtL/ejZwNE1M+2zK8JrTvKwry5IYEwFsy8ChVeTwiFSvE4znbNQAp7gDwoDUmFGTOywaaBElGcxhV5r3s8kqW35lg1fANqujF8NhwPCYgPzrGrrlkBtnAop4xDQ7tKh1swXWKynp/FR4uhzsTAFc5J0wFM7HHC8SNjXJkH4qulhr7kM4me6Ez+pBXWLvUaWM2E652Z/ONBX72k1RpH/3TGkHsvY/KADd9ifSPwLU+yCe+vNfmPkr2N4MRLysGWmPmltyYiSm/w96dJylZcta0tAFduMStRwLMhH277fFEWVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV9w6efwT3kyBARfsWGALCKnc0QR3vylWyiUOGBpBp4=;
 b=GdlecyvDiXPg779cYqH5oc/YDZ++KAdg1DAAraj74asYS6urvXpi2leUnsiksMrZD4zYqJ6sNHMN6iakhMKJQL5bZtyzIzKPekYA2zL91TRpmZBGqYezqBRN8PRI+1ndNUuGu3ka7rrdNPKJU4oLvndMVdcsS0TFxQGvj+j8/eBoPhBi004am8IaPoYYgmzDVuuyh8Cad1/cymXM0k2fX/rJ7QWdw7HwZX5GfL35LDdxJaEK6wBaGB6eBE9lMvNNXzD8vXLQv2MN6doyY49GociXyVYOaR17eDMDyTvUeESdxWo8EnbMHi1rBxtAqY4hch9OMBP9Ryghe9ZthW56hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV9w6efwT3kyBARfsWGALCKnc0QR3vylWyiUOGBpBp4=;
 b=v+IJ1UTvSe09L3ZsEi241txCv89gl/tMtvzJ/JkmjSNfAyWd7/n1zLXdLAdsmtftvwn2V1OJGgL7u6re6EYENxWF931lUrmg5AWpTVcDR4TZve7FfOO+f2D3SzQqUgg9w+GaVughT0ngzmyk2w6fH3LbM8ecHvY1jv6zrIb87hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 10/22] phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
Date: Fri, 21 Nov 2025 16:11:59 +0100
Message-ID: <204afb07e506d6eaf25e39e419e861b7840e7ec2.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d26d73a-21e2-4428-402c-08de2910a0d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OOpd2O3Sp2L78AslOk7GTZ+/SLySGK4jF06cjJwZkQgEAorxdZUaD843p5Er?=
 =?us-ascii?Q?+EjjGLiULm3Ri20cMobTvjwMLa9e0/YRMxnVdwT1x9Td9eJn6P5eEGVehRwH?=
 =?us-ascii?Q?HbBA6IAJgpFe8IzPdmfTraGUSiwfw3O9FzLzMMNgNJAFHOm/Ephv24ytPAGF?=
 =?us-ascii?Q?5qRbp2pYlwYUZHxCjC4iCbm4/4230aXqiVxTub7BJMSJNJgl3cB8JlzVQ+/Y?=
 =?us-ascii?Q?RxvdRsuF+5Nc2RIQEEOCb6/XI3prdovMjbVf7XTp/uotQHjWP8X+LtCl2p3/?=
 =?us-ascii?Q?2Fy+C193Fs7BiQ9YxyWlgUxcaeFMwTkIZbHer3SRq5jKcC0a+ATL93iyAeXg?=
 =?us-ascii?Q?3TZGtdK+SyIY5QxLjxkeNnpPVmcJ6VEzAvfT5ukXph5zA2cTuFzyyIApJTY0?=
 =?us-ascii?Q?suCTjJN+J+uwg+IiuSGanQfj3oNZ2uDqbDRoxTgLkOelVBvoA1QwV5Mdrntv?=
 =?us-ascii?Q?3XPZgKI/Q0dlPcaNq3xA6q/XLttz+NYF080bX/M/HDyKb5nlDx1jBBaNSSxB?=
 =?us-ascii?Q?Ita05Mk/Ys+MLlxJg5g5DDhr2yulT4l3fnDN9X/pK8C/sEzBvi2Oe05HsyNj?=
 =?us-ascii?Q?3RBVG4EpYdaaSM7BfrX6cATHoWOV8iE1WrKjgKhZZskJGZnBu74UDtnepE2J?=
 =?us-ascii?Q?3RQlTzOSUoA1c/ga0Jz0aeRjE2O4bneqrj3mwDsEQWu+/+i0pqnCmjLN9yLY?=
 =?us-ascii?Q?jlly3A+Hf1QHybRE4PbzMhyreeP7FXbpf3PbGUkSMYHYMk/UCgSMYSRsWidY?=
 =?us-ascii?Q?yeyKhlBlov0eXx3oTgZ/qKaoxy9YSOjoZp1ap7S0eEvhR5S/mZTaYg8YHHFN?=
 =?us-ascii?Q?Mtl+wTx82tPgcDhecl+uqhXflA0NndYnN56LRHasIgS30Xd4E28k8xJ9x+yP?=
 =?us-ascii?Q?Tat0w29fLwOMq0iD4PskZBml9wFPylvWf4hqNaJYDjsmApU0LAY5o2H9JmWz?=
 =?us-ascii?Q?LyxRHFlnymZQQmMib3EgwMDw0L4IPfT1dNfYQ25/ew2+Gj/Y5vatoAqzKwjM?=
 =?us-ascii?Q?XNTn+lUg7oXt1OJ93wi2pHHsNPrVK/rxcIDVa+JTZTjjbIYGCPr0T95BBd9c?=
 =?us-ascii?Q?EW5xlB9ee5A8lt7/fP7laljcjZGvR275fWwxr4tJG9Tvfd78MrZ++3Y6JPx+?=
 =?us-ascii?Q?qETxDN0YPd7YjOwgBMy6Jhi6dy7M5Q/+kF6H53XMCVg6tIL0dGg3xeWnkesa?=
 =?us-ascii?Q?mI0wXYw971jYK1Se9X9O7uvlGPqeRNVS3oDJbr2dOTBt76/EWX8cSQaBcHjH?=
 =?us-ascii?Q?K8JGWnamej6480hzOkp48noXV32z6M/RTyjT6TFPXBgLTbBZtNlUXmKKi1pR?=
 =?us-ascii?Q?fg3qS4PQgL/V+R67h2rdFvW8P/zolw/LFHE0gFO++ZMYoIxexTrDJ1G+fBlI?=
 =?us-ascii?Q?cGXc/JcjFgcnbtl83cnCIHJvGP2bSBIWShEZbr4+n3CTAoHRGxRTkg1EAlu8?=
 =?us-ascii?Q?P3X6YjG3g9+4oT6ADZ83m3eaIsJWyq6eXryAlJdTOODsdIdjdeAbaB1Z5EPB?=
 =?us-ascii?Q?X8jRkEexsFCBfagoK1RpR4eWK/ysOM7OZGJr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcAds+EsIdddTlGz3yDRgZafNnQ+N25NrmRbeLMM8uDOIUNv5KbpqpVF6oEN?=
 =?us-ascii?Q?88H72rNZX3/FpDM/ZU7mdE3JvoAZvjCcBVSuPPggvAWUq1tPVgaZ49AKdQVV?=
 =?us-ascii?Q?27cqDdm9Dju3LdM+Nq+wuj5mr2Whpy1BPPGIjLSp3NMNimkpXn/0EWgs46zT?=
 =?us-ascii?Q?u+fwxQmMkBjSkeLJMgPB6Vbx1jWXjT17z9v6NDd9jqJAC0tVmnO4d0bBlx4m?=
 =?us-ascii?Q?60jzoEGSgKaQbCxHbdOCU3k1czU2Iha7pOAvy+N74HP+mG2gI0dxppyOo636?=
 =?us-ascii?Q?wYgCNI44+gPy7llK9gLjuE+EjM/nAZFG5bFOAh69rHpLBiidCqBn5zC9Mmoi?=
 =?us-ascii?Q?k4tDEp8FZ10SbGWx7Bzw4/KxVdHdmXcjgHfYDpIhqNpfK+4aKUbvaggBgeth?=
 =?us-ascii?Q?VBaGA9KzbDRu0kICnOtQnGlr1R5BjbPv90me8/jC/YzsqwzIVdYsf1A9tVbr?=
 =?us-ascii?Q?laRQB0tIa/SkTkKD6cGE87jyrzbBrz9p8paJXkdMiDXqWkQJ9p+Skchcwaq2?=
 =?us-ascii?Q?Dd5YI4IVeFY1FC9oQaFq4RzqarJJ32Xp7nB7jNr/h7nbpGVR92P5LXwLqE87?=
 =?us-ascii?Q?dnriIMY1o3kD5LChulBEUUiuUSwm60z0JW/7hK7fURhYE6RABaTrrm7T/GvF?=
 =?us-ascii?Q?5+pLf+olyOd3ANbXQ2ZW2XmL0xItQcfkIhvJWkcTz8Ce0+iKpNsREFCqQsDZ?=
 =?us-ascii?Q?bqbAYhpu+8wBxOOLrOgWTJf5ZEJwy1YkZJ6XMdPHXGZSbG/jFqi42AR33z1l?=
 =?us-ascii?Q?5+QDHitFF4duoAYWj1SEwLtsYfoypdyrLWqJxyTGj0Xt94PIe2EkU7AAdt4g?=
 =?us-ascii?Q?i+jy9FLaMJ1X+p88O/FZb/O7hCHPCF7KKuDM3fD5hQPB7Tuaw1WKyr8Q0V/c?=
 =?us-ascii?Q?7mKAWskkhr4wMDpjsjRfM6pzRvgzZB1RSepiSdoMOmA7lVhZJKbXNnGPOhVM?=
 =?us-ascii?Q?BV8PozaA7/mzDb5UyaeW4kpVJrJTfkiIQOnEfXPwp6t0dASodXZpQ2jVxtEG?=
 =?us-ascii?Q?khfHlfKBBqx+c46MsURaW5XeMZWBiuZ0jgYEfwXJ3pQXCvXe7B07O3YVF3E4?=
 =?us-ascii?Q?1Jd6ZmmBjsJ5HaRln9LFd2jYHbUAiY6M4AeVNTHnP6/6XOBc5WgCGR3oPrEH?=
 =?us-ascii?Q?sWISyspEnwYJw839zlor8r8tLOeym2iZYkWmkZrX+qpoRdYfFVM2b0Ff4Tw3?=
 =?us-ascii?Q?WziCe85KyRFnExai17kBYE8ElxM/wx8aZb0I4c99TCQajZc0v74yuJm1cYyD?=
 =?us-ascii?Q?lmemU8uXHQzRPbvcj8YxLkUzqCBrb7WYYSN7q8xG31L6hhVP8f7n25FEuUaT?=
 =?us-ascii?Q?XvRCHh/IVs2jCiJYBMH399YYSq1FOKkNWG9tv9+uhMsdSS6qapxrwRbofeu3?=
 =?us-ascii?Q?D76Zy0DO00AcJ27aIgHZPfT2OdSnEHO9dHgrxQnLjbgZUnUWpSOgroF9DRFs?=
 =?us-ascii?Q?/EuYt2nqYbMfQo78W0jsH1wWCs0Nkr62o+hVflSWGkGWkEp17Pnzcl27hZpp?=
 =?us-ascii?Q?W6YbM4rVo/W6eiEBtpy6+pdPYM8ZOyDh6tiDtPsiVG9Q+sMXnxzQJdJOOd2q?=
 =?us-ascii?Q?H5HHKM01pfpxyRfZQAwwQUi2epIlSFFYjMEGVwLheTAiJZXGb6nmv038HF0f?=
 =?us-ascii?Q?q4VXVS89p0R61O8hFrYqTKA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d26d73a-21e2-4428-402c-08de2910a0d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:13.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMPMjK5M3JKT/mFStYZWg6Yq0dNfAvKYdWvx+0Re6RqrYyanBZXLrtXTr7QBs4v6pJM45HKuAUL6gAw0GcubvK37TJy5xCgGn1YhL9uykb67UMTEesak99fd7tVtffdm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Enable OTG VBUS control on R-Car Gen3 USB2 PHY by registering a regulator
driver that manages the VBOUT line. This change allows the controller to
handle VBUS output for OTG ports using the regulator framework when the
platform requires hardware-based VBUS control.

Without this, some platforms cannot properly manage VBUS power on OTG-
capable ports, leading to potential USB functionality issues.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 142 ++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 94a4521d7187..d2c03a846b58 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -141,6 +142,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool otg_internal_reg;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -225,6 +227,11 @@ static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
+	if (ch->otg_internal_reg) {
+		regulator_hardware_enable(ch->vbus, vbus);
+		return;
+	}
+
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -593,7 +600,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 	u32 val;
 	int ret = 0;
 
-	if (channel->vbus) {
+	if (channel->vbus && !channel->otg_internal_reg) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
@@ -634,7 +641,7 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 		}
 	}
 
-	if (channel->vbus)
+	if (channel->vbus && !channel->otg_internal_reg)
 		ret = regulator_disable(channel->vbus);
 
 	return ret;
@@ -809,6 +816,128 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return 0;
 }
 
+static int rcar_gen3_phy_usb2_regulator_endisable(struct regulator_dev *rdev,
+						  bool enable)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	struct device *dev = channel->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	rcar_gen3_phy_usb2_set_vbus(channel, USB2_VBCTRL,
+				    USB2_VBCTRL_VBOUT, enable);
+	pm_runtime_put_noidle(dev);
+
+	return ret;
+}
+
+static int rcar_gen3_phy_usb2_regulator_enable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, true);
+}
+
+static int rcar_gen3_phy_usb2_regulator_disable(struct regulator_dev *rdev)
+{
+	return rcar_gen3_phy_usb2_regulator_endisable(rdev, false);
+}
+
+static int rcar_gen3_phy_usb2_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct rcar_gen3_chan *channel = rdev_get_drvdata(rdev);
+	void __iomem *usb2_base = channel->base;
+	struct device *dev = channel->dev;
+	u32 vbus_ctrl_reg = USB2_VBCTRL;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "pm_runtime_get failed: %i\n", ret);
+		return ret;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
+
+	pm_runtime_put_noidle(dev);
+	dev_dbg(channel->dev, "%s: %08x\n", __func__, val);
+
+	return (val & USB2_VBCTRL_VBOUT) ? 1 : 0;
+}
+
+static const struct regulator_ops rcar_gen3_phy_usb2_regulator_ops = {
+	.enable = rcar_gen3_phy_usb2_regulator_enable,
+	.disable = rcar_gen3_phy_usb2_regulator_disable,
+	.is_enabled = rcar_gen3_phy_usb2_regulator_is_enabled,
+};
+
+static const struct regulator_desc rcar_gen3_phy_usb2_regulator = {
+	.name = "otg-vbus-regulator",
+	.of_match = of_match_ptr("vbus-regulator"),
+	.ops = &rcar_gen3_phy_usb2_regulator_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.fixed_uV = 5000000,
+	.n_voltages = 1,
+};
+
+static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
+{
+	struct regulator *vbus = data;
+
+	regulator_disable(vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
+								  bool enable)
+{
+	struct device *dev = channel->dev;
+	int ret;
+
+	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
+	if (IS_ERR(channel->vbus))
+		return PTR_ERR(channel->vbus);
+
+	if (!enable)
+		return 0;
+
+	ret = regulator_enable(channel->vbus);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+					channel->vbus);
+}
+
+static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct regulator_config rcfg = { .dev = dev, };
+	struct regulator_dev *rdev;
+	bool enable = false;
+
+	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
+						      "vbus-regulator");
+	if (rcfg.of_node) {
+		rcfg.driver_data = channel;
+		rdev = devm_regulator_register(dev, &rcar_gen3_phy_usb2_regulator,
+					       &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to create vbus-regulator\n");
+
+		channel->otg_internal_reg = true;
+		enable = true;
+	}
+
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,10 +1019,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
-		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	else
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
+		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
+		if (ret)
+			return ret;
+	} else {
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	}
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER)
 			return PTR_ERR(channel->vbus);
-- 
2.43.0


