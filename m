Return-Path: <linux-renesas-soc+bounces-20744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD8B2D44F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C86B16E214
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 06:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6729D267;
	Wed, 20 Aug 2025 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QzWUH/ep"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282F21B9FD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755672665; cv=fail; b=QhyuGUOSvYMg1VOznmdJX4Z76E54xTBfy3+/eJG+t4N/45K/Hk3hC9ZYo4aAspRj3H5O+Xhly+BmQRYoLO+x0eBDfXREk6E/WSKnhFf2sXHAybULtxCiY5CXtevBGt/Vynmz8u5iVJlD2yU77BjxWDX5GW1oHX+Af1RwOz/PY0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755672665; c=relaxed/simple;
	bh=H9f7hpqFZ4HEm2r0RQTzrI9ICfm0FfSqRRbuOZcpQa0=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=dEVxQ/QOaVHDt723jB0xsCb80zwR8YB19aOAAAr8qPbBkmohKXssopBqbuasnA3OWSJrKEeO24LD4AUFBOCYQvaBGcSMGlh8R1kRDc7Cxg1oWsyjFL1aP6et7Feoedtqjdte8cUaVsDPrYIoj9kmo0Esd4DS67oToZc2htP4ddU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QzWUH/ep; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0FL8ugXO5ZTIABXK7QjqRPd2Eef+VlhMAlfAGBD+FDAmINqAzr0b1LONFjGhICmq5L2kaq7jmVFmDmTOTrS+oTlPH4/kg2vBDeExNRrMMESqWm8LkwZq21Z5qpQPmg7DiWz8/HL0lm9h+vD2BQ1ydqyPJLxUTruTcr00RtEJx7sZzsMxYvGrek8ruvsF3QCaQpYNIrGti+VVqW80DacvBOaVx9HwZ7XwnF1kAvPXAt/AtVqI9wOXdcsFLmmMvSLpwnLVhKn8XeQ/7anS2GDs4Tdh02a6yYzGEtnHpiH8XJSBXS4v2ml718c0UUOYwZJ+iTJnC541mIBAjS27V5J+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9SSvu2OPp8ZyrsaxKhbTRSzMXKg3CDn4Hne4tN8o3s=;
 b=l3xfY28Dj/7GwRd6ZBNqlRuES0x0Sj2aJE8OYl40M34iY/Qiy8JjfyUHp9U1HRPDgUf5i2ZPbgC2oHLVJIZWpe/v6qyKilodFfRoDApT9TYouwMmxNmJ8/nUAtmtLgZ9UO3+LjO654J0CdJ+tD5aRyRzanXJbfnTEsNuEM0R2ToSDQbK03fU3NATp4xRlNr+Be9qJoOhVcnvZ0nBWNwWxUmi7m1LJBHVzDz5wxss983ExK7mZUYcmuPoiKERAgvKM5eXCInfUuAClmH29G0mp/i4hYzYQVEvv2T17W34vlliKTYsxeuRPj8k+V+1s1EOhX1dXh3eXpdHigxU0xlCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9SSvu2OPp8ZyrsaxKhbTRSzMXKg3CDn4Hne4tN8o3s=;
 b=QzWUH/epVD0SZP5K9OGbYA5DUSyhR5NTrLXtNxwf7i53llaaAnN4HnbXKUHbYBw6yJ2bBT4u1mSKFmsC8FplOCFNxgo3DlcERFIxrkwtXEiyF6neBWEremlwVy11P2jutki5I1lkePFTEyQOyBpyCWgiVqclZOtQMHVIRXgtADQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12) by OSCPR01MB14948.jpnprd01.prod.outlook.com
 (2603:1096:604:3ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 06:51:00 +0000
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1]) by TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 06:51:00 +0000
Message-ID: <87349mzdt8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] soc: renesas: Identify R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 20 Aug 2025 06:51:00 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB10910:EE_|OSCPR01MB14948:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7537c8-8a83-4ab5-f09f-08dddfb5ec2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wR77cNolyhXGFpRLKT+XXMw9ChouIX2gOZ3m5MzcAqB1bWAB6GnIDBVt7S/y?=
 =?us-ascii?Q?zujMLf1sKLJpZU0+VQaje+dCp3N6ZrlhqEE9WsWPpNHzfYsv4mMGDdSNdbtB?=
 =?us-ascii?Q?JueIqWom1UpmzBE+AUUckwjBcTq5xfmfNE7fvA1myN5M2AM9/Secnd/1T49Q?=
 =?us-ascii?Q?mZAgUFQ+1ZV7fnsVWS/pODCq42NaS9+G/4DpupPpIVLIglFuAJ8ZsrAql+jb?=
 =?us-ascii?Q?qyJn401ZBx08nn1VzzbnE1gJ839+tj1r6+eDtB5xl9rfpo31uwh66SHCIFfc?=
 =?us-ascii?Q?UNcUzdqqnorQRrQ1uabxwm8XJ0nsNtXtLODIHxoRJh33xdqccF9FBENwnrd1?=
 =?us-ascii?Q?I4p3C/sYGOVnX2e8vwMmLtK+QxSjd0P+I/hAXtP37kXxc4XVl/8C7iozBHeB?=
 =?us-ascii?Q?kqgQaDEoBnS+qVTauNtB2An1BX3HhliDpZtTI1C+zRTZRm8XDbLiY+jK9rv/?=
 =?us-ascii?Q?twAB35VIu46bTkJqpi/GqtBgG6v6djPi6TCHdsPGy7HKTeN4kD+6Quj7M6eR?=
 =?us-ascii?Q?/3lxKkb/5nffTOAIxGiqrEPdyQJ4EfVELNPpqsQIKbeOasj6k3DQxCgjFECT?=
 =?us-ascii?Q?u0voK0qoZpFFoq6E7ShuCEjySaO0ukQ4IyeaD9aMYRGt6HX38ZuCUOLmHXOd?=
 =?us-ascii?Q?Loq1wnH6+1Nz7cVhZHkwd1EDAtP54gejqkkev1bEQ1h6WUcvKTHXzmCiH455?=
 =?us-ascii?Q?PSe5MQs0Tj7jxAgEHpz+DJzHEedSDTXq70y7D9fWEoKJsWCbQQNiNxsdyvRQ?=
 =?us-ascii?Q?Lc+bXqse0HXpHpVuGVJSsp0V6BlXyQ7K5d01rB/f8AR5KeMbPS5RPGapGaoZ?=
 =?us-ascii?Q?NY6xG2CSg+CwvXRihvBhh6nmFi6nnbecA3OGDF/sfyoVlLicuOjeDtN1smDE?=
 =?us-ascii?Q?svaN7WEc8rOnfhi8kwi/M7WFLqMY4HtK83l0xNGHno6WErbiISw7dd8aNb14?=
 =?us-ascii?Q?YagklzHvQPt/GH6WU1c9vPcO2SZhnqsQJqN54OeE98byEBdfr2nSayPs+Nf+?=
 =?us-ascii?Q?dLZFxJzGYdKzm7iSrK3styakQN0dfs0CUgqZn/aQSGWfpkhi74xwV+t76n/u?=
 =?us-ascii?Q?Xxs0fmoKANyYxlqhUP6b3SM8I4OucHtjfqm6d+npD0Zi6YSraECsZhbOfa5r?=
 =?us-ascii?Q?poSY19oiGH+mvfsA9RwU1UV+KwJWJSZLU9yHbXEKpecfEfxUGhxaqizSPHVA?=
 =?us-ascii?Q?axXiouwQp97+WGMm0vsArvKamDx7w/VRGg9TUDB/Ruikh34NduqSe7aN4MEW?=
 =?us-ascii?Q?6YSRgNYl7lD19wuLd6YCDNoVNCdhAKjMqCcLP+hPp2/39Byek6mvgw1VQ85a?=
 =?us-ascii?Q?OCirPLiU5ckJXsA4UJoHA/aH1qjN2qDUozUtNNlLXXE0JVQ8GjplCOzlfzru?=
 =?us-ascii?Q?2gzemPTnqCa6FAnyHR4e0KXBaJvIKIboROniDNRdCIkLGTlsI3PfsrU4GkUE?=
 =?us-ascii?Q?3yNqMksBMUSZ2qLIufVOa1otrIac1NuJBIKgmnf0AH1D31LqfB4ciQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB10910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnytfWoYyFrkNmecqSFRWpT3cGbK/c2tzOU7lbcn9tvm3Tn8am4C2ULW9MTH?=
 =?us-ascii?Q?vNnWcLafUvff8Yav6CwbzOwdGfvkJyfkMmQaN0v8YJJ693FrKTw8PqK9+0ZW?=
 =?us-ascii?Q?bJA/C18/blkO+wr/22ZnX1VYR9iBTJpSHAdKzMQtHS6rwdp65kD7ThoSUSeZ?=
 =?us-ascii?Q?mZDmjdjlhUEA8d04vGNbzQjYsCEO0VDbc1o2zIXATQrUIX02RzzN7VC9wtQr?=
 =?us-ascii?Q?lrwbkBsyLser7dAismTfI2Ih2Fo5+/1ibrw7wfVs7YCXH/Zix0tlVqD80ANK?=
 =?us-ascii?Q?gCqYRcVND41v3P/c/aZzjfu9c7XR7PVPcSsY98MH380MIK83Wr1IqRLBMk2c?=
 =?us-ascii?Q?CEKg/kGzDkJo2h9shQihaCM2q7NlPbIJXPgpWrj8Cn/P4s3lLFTEfSgMSUsz?=
 =?us-ascii?Q?K1GyIil6hVhkvVFxgt6/I8uoZjLK0GskPWPpat7MvIGajiM20EE7HgQy52db?=
 =?us-ascii?Q?Mg7LHN8TnRxrWGdlvaXlHQBGdNMfHWAvudbJ064vs4fsvPc3cLeWF4bgtjVs?=
 =?us-ascii?Q?UXh2lze3Q1OO3JMin1ooCNkgpPxY7CMXp7hKQvSqcH7+75JBFy44SQaTGIM6?=
 =?us-ascii?Q?S3dYeRxgd7KFc9BExJAnP8VYfntzJsSapwpaepE1ts3EEH0nsEdIso6qbCYe?=
 =?us-ascii?Q?tKrnI58bFx9AKhoCPdlspM/fwyALmqjQ3azZU9vaOOJpwdPNvI4+aBDyuqcb?=
 =?us-ascii?Q?Av02NXWl0cTTTSqgLAo7B6tgPD3VIQ7vWA0f40rDKvdoflri/TqUZuLFnnVH?=
 =?us-ascii?Q?jaBOFD4xDe41F3gAuLAPdWp2DTXablrE6QBNc3albL2Z0Hlct1NXtRHVvWKq?=
 =?us-ascii?Q?/P/BFJ5xQqp4/jvr5b9COf76hTFo6Jlx1VECrKf4hOgANEc7Q7dtUx4PXIfT?=
 =?us-ascii?Q?vuHHw9QKqvto7E4W6UH76gMQvU76g0ZjOrOH3sHZCPG4pPvBQ6uU42GYB7Zp?=
 =?us-ascii?Q?GHr5UC6NnpyZawFyi1tBkLIsSU7mRpEhI3xtvLm3DhhDTUgZwJNZIozG/qUB?=
 =?us-ascii?Q?LUfo3vSvBIC+nZ/c34gExnUZlQZzYhDvx6VU05MLGyrwX016LRhcOIboNBzz?=
 =?us-ascii?Q?gLmPfm1mmanh1IfgRtiGQEHrKgb6dSuA9qg9QinSqhTgAYEK0y5S2J/g4iTS?=
 =?us-ascii?Q?93+6bZgEynwXaLlFfZRLB4tlzeFSMYFOQ1rFDbkVMAD8RnVXzwyqrMKSoSvc?=
 =?us-ascii?Q?QA1AYbudqVPMI7/Bztq6IAE9CvXVVWY0uvd61k20frOgHk5UACn57sPRqOar?=
 =?us-ascii?Q?LxuCXmdOBgVjYEfqAIUakxgHUt5ZnA0PXjpzKZGR8bRVEVeb/Ahfq4ft7Qms?=
 =?us-ascii?Q?i/+LvZwOnaNql9FJV53QEsF1ftjX8oXZWXmnI7uYbfgOZ47bmAqZIqGnnV9Y?=
 =?us-ascii?Q?qkqXdR487fpR2a6eRfiEZaK+o4A9vCWz0/KH1wvIxODk/D1O2BRszzthSbvM?=
 =?us-ascii?Q?KwQ1LMSOt7ZLIfCV3MZ0dbqIh4A7BWzxRmeh8KoAEZVLyvRhFKJohHt/oqni?=
 =?us-ascii?Q?t72D9EzB6SSH/+iwJot2eG5TIVrWQhjMow1HkwzwpRAmmLUcU1C9iSCB2qPf?=
 =?us-ascii?Q?U76cZPwrXpjEqm8WmqgcDzbjJgGaRNxxDSMS9bayYlkh6CIe+kyNTkIzHGmb?=
 =?us-ascii?Q?fvaD2YeEXKZSAyKayBmF9as=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7537c8-8a83-4ab5-f09f-08dddfb5ec2c
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 06:51:00.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfgSNVhZ49+4m3Omh5hc5EPJTkBDWD0S90nXXGH9ObbwhwsczhhK55bLz511DFLYeqNtERbSxCIaT9iubU89008zifZOQCwrdKsK3jhyWR+6GUK18mRPOjdNIbWF1KTK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14948

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2 -> v3
	- remove .reg from fam_rcar_gen5
	- add Reviewed-by from Geert

v1 -> v2
	- Based on latest linux-next/master


 drivers/soc/renesas/Kconfig       | 11 +++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..96d1d342f0b0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
 	bool
 	select ARCH_RCAR_GEN3
 
+config ARCH_RCAR_GEN5
+	bool
+	select ARCH_RCAR_GEN4
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -348,6 +352,13 @@ config ARCH_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
+config ARCH_R8A78000
+	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
+	default ARCH_RENESAS
+	select ARCH_RCAR_GEN5
+	help
+	  This enables support for the Renesas R-Car X5H SoC.
+
 config ARCH_R9A07G043
 	bool "ARM64 Platform support for R9A07G043U (RZ/G2UL)"
 	default y if ARCH_RENESAS
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index df2b38417b80..1eb52356b996 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,10 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +270,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
 	.id     = 0x5d,
 };
 
+static const struct renesas_soc soc_rcar_x5h __initconst __maybe_unused = {
+	.family = &fam_rcar_gen5,
+	.id     = 0x60,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -378,6 +387,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R8A779H0
 	{ .compatible = "renesas,r8a779h0",	.data = &soc_rcar_v4m },
 #endif
+#ifdef CONFIG_ARCH_R8A78000
+	{ .compatible = "renesas,r8a78000",	.data = &soc_rcar_x5h },
+#endif
 #ifdef CONFIG_ARCH_R9A07G043
 #ifdef CONFIG_RISCV
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_five },
-- 
2.43.0


