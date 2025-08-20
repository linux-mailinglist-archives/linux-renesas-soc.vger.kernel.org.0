Return-Path: <linux-renesas-soc+bounces-20739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F491B2D3BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 07:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079CE1BC76EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 05:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815382F4A;
	Wed, 20 Aug 2025 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RrAuIVlm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928EA21CC5A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 05:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668714; cv=fail; b=KjMZm4ibnThAPfrp6ZGffVmLuspvvWDEQD1Ltrm81ou/bObwwFqcaaTp3mowS2EmnqtcfEWhyPwXeqHknp8un3PDZapmWUOF3QKMV0syyjEe7LnsH/d9QZCKPE5dh4W/2+ai1MqTZ8MJYWHL1nM5ozyXWUrvKr1SEI8fviRpSTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668714; c=relaxed/simple;
	bh=X1TncONbzgJlpzkVGkGQz2vW6nAxSlf17CLn6T/4T1Q=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=cLHrt6BgvSX3XbGpzI/xJxuri8lPh02w42czFvzrq8+yvsNbFecU6uEj40b6Oraub1wuI1w5Kv/+/O80uubsq3x8MhyQZjiSBr+9WZbQnCTtbIng68XDwbUaPMEQ6tNZ+DNSGujhOtZsKqJd2G2ghTGMIhXmr5I4DePmJznITPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RrAuIVlm; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0w6WAm5r1f4WwJT8DkP2pIWZkyCHrV68dkvO9znV1AQlYbkxf3ZQPZa2J0O/nCNWbzNW7bqd9QDcmQF3LhIYb/4SpAwcuLpf1Nc+MBwNEwHVCuzqLMN2der/zDrC1U7AB//0llVzTa3RqEGhYvNe0Xl33vDPwqun6eQI3dBcJpEVW8dHQ+kN6cMB2VcfHh6M0pd2tjArEi6UCSjbDi43LuLje2y9QL6tdbH2JTI+GogTnLR49VBTbhlGC8+Faxnd7gLoeJEDaiedKZRswETVHf6+QrT43nbl9Dqvck8eoYklquHuTzsOjxdVbQ5+iJiarIYkH9QS0u1XXffWthDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtNf47PDxiNSB7GMxKaojMmiWBNc6nG3GFk0JEcHTDg=;
 b=ek47xgq+Y7kGJ+gZ6KEN7L9u3xloJK8vpqz2H8WXjCwvy7IA5oFxW/OTLMQfacM3fik/FjomWrfJ2m4tzcvNMntJVWUyV6SQL8OCW+p2QHmaCYvOTiaimKH+uWxLKIt6rkf2hxbHCNdlADwCL+Ehn9RusOqfUri4jk4yai2/vtSRa5z+gZKVa1I/Nq6Cm8gBmOegCCiqfG5hCrgtpfHL7QRBldOnnDFYGHtIS+c8ydB7HEJwl1oG2IGmwWA7S8302W8k1vylqUmTZ6bHWS6CJn5/jIYSomfKkF6J5Od0nGtL71dT93lq2tUEX3/OSFk/JXI3Yg3R5A7hPKsx/RXNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtNf47PDxiNSB7GMxKaojMmiWBNc6nG3GFk0JEcHTDg=;
 b=RrAuIVlm6I69mKQhVkY/7f42+gE0GPO2HbFxAprl2HEEsZa4VQtDLTDSREKNLuO2nSETPNmylvcd0fPSXbu9+qb4YkEYnkK4flpqw6OCrPwS/YFh2EUPaYHarDOcVSBs73+09Q3sOGMCL9NBw4zLkfm/LHBplcPv+WnFkkk3+5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12) by TYYPR01MB16084.jpnprd01.prod.outlook.com
 (2603:1096:405:2e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 05:45:09 +0000
Received: from TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1]) by TYWPR01MB10910.jpnprd01.prod.outlook.com
 ([fe80::d5a3:373f:dbec:4ec1%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 05:45:08 +0000
Message-ID: <875xeizguz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
Subject: [RESEND][PATCH v2] soc: renesas: Identify R-Car X5H
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 20 Aug 2025 05:45:08 +0000
X-ClientProxiedBy: TYCP286CA0228.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::7) To TYWPR01MB10910.jpnprd01.prod.outlook.com
 (2603:1096:400:391::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB10910:EE_|TYYPR01MB16084:EE_
X-MS-Office365-Filtering-Correlation-Id: b469e076-57ff-4b66-c1c7-08dddfacb8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VsNRe6cC+4aQsaEjG8CpHS8t16LHKjkxohf+bnNaxmxR5IC1AudxDBK7aHE0?=
 =?us-ascii?Q?f2gzb/Ys0qreL3obk1LHIa1/L8jDgGWv8ufljNMI6BoP5F4yQmrQf8Gc54/8?=
 =?us-ascii?Q?VARqdN+20M2p7kD0Z4MKrPNZ6Vhl67NpOAxBuIlLUMV+qYpvbJ/ouH1D7U1U?=
 =?us-ascii?Q?wRQ5VR8/a0WJ9AlQiyMyEtBx3huYLLXMb4+2G0gjqWfo6oAffIFMC4yRd5yW?=
 =?us-ascii?Q?SgxkaNfLg1TvqzVHKcT4YZ384olF7KgRkhSyB9FDhO+dA7PPi4ClmOhYVYsu?=
 =?us-ascii?Q?4MV2mxMTeFpYViyu4IxYu2HlxOeGhmkvJKkyA2/Hiehg+nJRrPm1k4mV8nVE?=
 =?us-ascii?Q?8vPF1czXBeNA4F9JLvb12By89iJ2G3CEz2SptRVOsLk5D7yzaNu5EBUcB7rC?=
 =?us-ascii?Q?Yi//tPOXcBLElrV79MDYgucpNh4ksaUkMo5cFxZfsk+b8jSaMXWbBCxl7Tu5?=
 =?us-ascii?Q?fDJoXO5UqogC2u8NH+RDoXpYSUZdyF0M6XAHZOu6yzfxK2j0ULZO2JowUc4W?=
 =?us-ascii?Q?5hy22SSsMZRNaLuq+3HKOwUilZ8xKywPNK/fQ5VzzRlbcnmzZSFqaUw4KDse?=
 =?us-ascii?Q?K8K6+A+bADs0f/v97LN+C8w+7WMb38raX4R3eQfPpZ61Eq3pWukasuG9xNW4?=
 =?us-ascii?Q?m5LzrbVkvuo2caCiDDsXFn9umnOkNXsODeiJCa7ZboaiSkbT87+T5cjWyjMA?=
 =?us-ascii?Q?jiw/Y8MYbJQqPiSLDlkl/EoRw/PpoUThOUdu6t36c5bOy2kRY1NNeNtmtar9?=
 =?us-ascii?Q?nKD3cMct0aye47N+NEyG0PpEOv6hrnHijipiz+SLkKxChAvn/uQnajMui9jG?=
 =?us-ascii?Q?q/SXCWWMlwsjyqHiCmxWcUYYCb76gEFgGYo5ppt1i1Y490A/OP9xLANr14Q8?=
 =?us-ascii?Q?mZQPJvNBzZbDu3NLjQOkiyoeAJMmuPflt7zdxtZ9Oq1HVOZwj/6ZG8XPU0iG?=
 =?us-ascii?Q?W4YkN3X7Oz6gU05G6il+kW8XadbmI1TRiIKdJgmboV0RPv+wOkr96vapG+D9?=
 =?us-ascii?Q?7ECaReKrGd/Uk6KUh8QzpwRSVM57bAkjLcm32k6rHhaFhXRbhGeYQi2RYn/Q?=
 =?us-ascii?Q?wQh92+FNsNxj5pCejbZbjlQ2maXHm8qlmvvKNvC8xfaNiTo90O4zl6qqWAhq?=
 =?us-ascii?Q?oOB1cWX8OWnnBxDXe6/dnREOdjC1b8i2hLDB/0RJms6gFWdwmiuCl2dlrSx1?=
 =?us-ascii?Q?njr1khMWHRtQKfMueDEf1gE0V6wuCFsdVK1aTdbjUr/rd1kyAqB716LR2fyN?=
 =?us-ascii?Q?wfnln5WoTrkhq1uok4D/HVzRgTR8arNLghZ2iUw3Unb8BddsWoiVU2yD72QW?=
 =?us-ascii?Q?ZBOx0G4bhe6NnOa+9zTj4AHCAO5eGhCKFMOps/yJhU8LAv1ve6NZ06RrTDxx?=
 =?us-ascii?Q?/WwIz8qO3RBuzkd7Z1sXKioFQ/T7qpfpC2SbOIoE32qNZNltYyD8+gb9PTeC?=
 =?us-ascii?Q?J0sg1hLkpK0HZTJOerY9iD0fLWthmn1lgzZI6hDEoWIW/g7Oqw0AwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB10910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QX6qZb5W/Ctk86rUQOFNbfk1IybHbsOYAAWeXFdV4SPi+Vjn31Ev6KsXgjB?=
 =?us-ascii?Q?W/es0KFVgBQVF6tJinGNEwFKMtKKgcOPBahrk7oFxBIC7hFW9mdZnILf7VKf?=
 =?us-ascii?Q?5nb5r1/yXx38ky7JezpyNCESP3bO+5yciiBlH3MnCk9vJoYwGKLGE70hN5vd?=
 =?us-ascii?Q?8OQiZbrK5iuOZcWJY5fmLCyD9IOEXTVuDOk/EMM20hs4DGZpAAGplr3RENwD?=
 =?us-ascii?Q?pp3tpnhxevc6mYuz4MbKQauKsiXJzXUmiEkrXyVhtfBMdPAjQ1GqjPOuSG8i?=
 =?us-ascii?Q?c1Pcfn0pGZpaQNwwgtfo8Kw2SDU9x+oHlTCViXgMgLJCoEnzaV3z8gKcP1PX?=
 =?us-ascii?Q?ZIHysdIKeanIHPY27bzlP9LSJJz8z0hCvJZUodIBlZni5CiNmpQx1M1xbzb+?=
 =?us-ascii?Q?ajvBzE6kAPhf2cGvWEOvwWpTVn3qDDBQS9Z/7/09oVilcGNqnj8G+2hOh6dV?=
 =?us-ascii?Q?bm2/xDBnxX6QlWr+OLX8reCXRqSfhDZqE3uajw5loWO8qB9OaQrupL+pciL3?=
 =?us-ascii?Q?dTrkRFARaMce3ph2TbhEKdxguOPkcwaeneUxtNw41zNakn5vqTfdwQvwlefC?=
 =?us-ascii?Q?gtwBBoTzvWZ6FJKEPVWF/j5/4iduKi1UOLxffj1aWRvj/oVkMzP0urueOR35?=
 =?us-ascii?Q?j8jgaaRd9NH9q78GT+tpovPx0iVq76tVFlhGjq5wAh9MMTZ5a1BD6S83+W9G?=
 =?us-ascii?Q?Y/uLN75MFSFCf+Bz2MPSEakRw+3CJOw0cx6dv8axtsy+esSm6iPg1OFmZ/tU?=
 =?us-ascii?Q?Qd7V8HlGoEDDJ0rMXE/BTylV+DeWq4hyTbMIt4eDrEq+iNFIJXWR/RqfdXUf?=
 =?us-ascii?Q?hBrCIbDi9+lzP91Ypbahl2Dg9YbLaz8W+KhYPfX2yYqZkXZYjbqAlGFVyoa2?=
 =?us-ascii?Q?8Z5V7omDrNIq4aHWtQowQ1/Xu/AfIakl3gbhzF5+o0MFbZQW5hqe1/LNpX1Z?=
 =?us-ascii?Q?W4Cqfx/XmazP8HwUbBHCSCPN0ps5nEHyG1zEWwro+7rPT/eZUhvITZOEYcie?=
 =?us-ascii?Q?J6cI179+XvJ+AEriTrNI20jOqL3Sr0VtbINvfqa69JB8stB/Li7hk2feYMZG?=
 =?us-ascii?Q?PL2pAaLcOBCprU3mDCr51SPwQMdaYSs0vQdKneESKFQ0BvlFDpwFC2enrRfM?=
 =?us-ascii?Q?13O+RsAk6rgWvzBz+yR5odo57I2xhQsQZSuCAYXXDyBzAAUJw8skD8xooIo+?=
 =?us-ascii?Q?ZdVqZrLn7G+AQaY4NK6i7kISajFLJbdMHOsMregcGNBTRnn3sTNmoWG+Rduz?=
 =?us-ascii?Q?SdJRHgNTThRKSqgaaP9OVJk8nAnxh4XI0aNtXcTQqHiDPo9T0ki7Bw2apl91?=
 =?us-ascii?Q?IyQX7R1nqaOKUmtPzwQqqBKivM+dKWjGbrWskZu91DQNPEuJsm54y1ySPY8f?=
 =?us-ascii?Q?lRDKonxE+YbUQgSZOPT8TvhDHvqrZUw6XYZnmrlSxw40KmuNCNyi9y7azNID?=
 =?us-ascii?Q?nOCU1LxfbJgSkPjo4O5L+bS1pzjHuxSxcnS+V6K4gERHjT7RwiNaRtfdVYDf?=
 =?us-ascii?Q?Y+dIzigfN+TGbUcu4sAPsk0dTNoLBPbtv0gfeotWnk/KLhBMvb4zd1GZklt0?=
 =?us-ascii?Q?CkZ2yGkxaMLUImNLWYkQFrgtiSv8TpqE84GRvRDBYtpZphZomy2AI/Xyp2kT?=
 =?us-ascii?Q?bWqPAHJZ1wzfLLjc/B1x2dQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b469e076-57ff-4b66-c1c7-08dddfacb8ed
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 05:45:08.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6Ty8J0BPOBm3u+ExWHxKkr705rgp4f+T7er2IVor6izHJcYCS9V/heoBU+0a7ADju/maBVKq22E7myLbaS4XgmcHNHf/p0GH71ca+IUy6ZWZbiBvEh9JIhLEgeuHqme
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16084

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add support for identifying the R-Car X5H SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2

	- Based on latest linux-next/master

 drivers/soc/renesas/Kconfig       | 11 +++++++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

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
index df2b38417b80..5b78388bafcf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -36,6 +36,11 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
 	.name	= "R-Car Gen4",
 };
 
+static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
+	.name   = "R-Car Gen5",
+	.reg    = 0xfff00044,		/* PRR (Product Register) */
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -266,6 +271,11 @@ static const struct renesas_soc soc_rcar_v4m __initconst __maybe_unused = {
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
@@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
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


