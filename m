Return-Path: <linux-renesas-soc+bounces-18820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46AAEAE07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 06:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2FA51BC5BDB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 04:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6401C5F10;
	Fri, 27 Jun 2025 04:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CF5G6zvK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517F194098
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999289; cv=fail; b=ee5OAzq4Loqze4ZTFf3Jxr+3iLKD16r/wnoFnxbcvbfLogdn2jdS88/yeDhVlKgQOK0qjGb7wp1MevEvFSa14YaPstuWMIiw0nSwmp3nn1FtFeM9kRRHsLM2f7z7EYii/3SAk4EdQpyztJqAh330+LK69Umq8j7SB1KxUE0ZsIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999289; c=relaxed/simple;
	bh=1UqfmYPnT0F4IKczolV0VwPWZholl8X2u/SoXTFelhM=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=SJf/WaRoKEaDzJ54hnptf0Jwti6JhsWfdYEtkkryNtPOZVUErj3umZDCuhNLWCautSrRUBgPeUCK/J86MVX/b5KHu63RMixf0GI9tddeRMppJxluwN3xmQ3QVeJCgzT1i9hZr8muHDDcfUmjUGcyjhxJ5K774XoCuBw92pu6djg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CF5G6zvK; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV1GbF4/m+ICiIkGIwvyEFwAr6bPX05q87PLv3ePn8Mcb0Agn05gvNy6UKeKJDRIJkrc53jDrkoHmRuhSyTGxY+qOjTvWk5+9BBuwD6uvpR988wm4Z2HqQwpW+Z5kcAHPxkpTVctzHZKexDyA76o3qtrtdCp1VhqJuUWuczKb1DueV8VQ+szmwDfwOi6Mxsf/GqyXjVDq+wsSnsfd5P1QuiR9EnC5uS12llx06Orqi+i96+/e/kdoNs37H85Oxwi+kADoncYwAVdE7fDUlD7QDXxCiYHvHhrvY4RgvgUtnEIIJPIzb4w9f22e8nFGDPf7ZZwC0r6IMV7dyZHdAXNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWnV7quxot3k86KTt0p3Qq+knPYMxg/Voe0x8DvYO8I=;
 b=Ip+UzCCSaqDnxJTbOQcuBwpE8KNmutl9tnQJJqahZ4OP6WKjwZoFJdHQSeg26kF0wrSBofFxgtex0EbBblYJtemZT42Y/Rv/Hf9g5i7xpnTzMsFY16Cp8DBq/rZTFMuOTqa2K2pS/HlXyovj2FZPkLi8Zu1uo4XjlvkhZvjkjA5v3DCkPOh3uK+PXxe59/y3Y0/SX6AREyXcScINZrxc1jjRxoatB7Z0z4L0sDk5DLH2FBniq5+U7yAkNGI9k/6RFd1n52Qi4n2MHU5z8KA+6H6CFJlAMUFiqqr7IFn0dwgmdXlQcCSLz5dANWAh3BoTYTCjzegtMOtlD+ogc5WyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWnV7quxot3k86KTt0p3Qq+knPYMxg/Voe0x8DvYO8I=;
 b=CF5G6zvKXUmP8YoW6uARSimjQn4A52Ic2kk8KRacr597xuBzP0aOrL9rdXJ23RKMicSZtUp+r6vCC8tOVqShLU5sNuf5rJeY6G1B6jlPHG9wj6T446f3V1XZF+W2RWePL/1uLeIGgiHi9z2UFSqsydI54zpQeKS+yPbSXPxE0RI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6790.jpnprd01.prod.outlook.com
 (2603:1096:604:115::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 04:41:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 04:41:21 +0000
Message-ID: <877c0xhk3z.wl-kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] soc: renesas: sort Renesas Kconfig configs
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Jun 2025 04:41:20 +0000
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2d4b17-adda-4d7b-7674-08ddb534dd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BXPpqthy7Bl8s7MzOnT2F5q8qcgL9UlbhiVJPEIyOXesGHlleupt0i8BbNZy?=
 =?us-ascii?Q?a6Sy5+tWFI+c7oOpHbgCTCmC7UOGeBAiZCjKOkPzlxEa0hUnGUE8D22S5HH1?=
 =?us-ascii?Q?+mUYCcUDaAsq1ZbB0c6xGA02zejsyTxFkUTfaJDgykrphpC+HlW4/w5/ckXl?=
 =?us-ascii?Q?/l38MlqiJ3oMNvLV2AfDLIauoI6xe/ZFFUBf5mhGDXFB2JyM47rTatUFNUIA?=
 =?us-ascii?Q?WZPeDsBlRg/LnZd7ssAcJSZAHj0HXSQB6bA/fAFY0gw7sxSLDdU7sgZohnzR?=
 =?us-ascii?Q?p9y+HtFu+AjoRhqszCGv6gJTOLdW5vH36s8pE+R0Ca1ESrqkRWV7gHrhQHEx?=
 =?us-ascii?Q?4AJMeaQRnmPUvY5BHuhM3MHJ59LGZsVYGhBQKeJQ9HhBHt0rwnWusMUrDKd9?=
 =?us-ascii?Q?whw0o6ne6LGoLzCjYccyaCuOh4EW4JOcCQo6Xizsxwbh1qNge6oYd+hrzMVk?=
 =?us-ascii?Q?0IsdlM1/bs9RBbLGQUGNQMW6flynnH43m9LSZoCOz7aqC0R8TlOLYDNkQRus?=
 =?us-ascii?Q?6QZSVdsPCilhsmcx6xnDIiUzSdIX+qgmHoXCmJsIsn+OXGaw+uau9BwIHp3F?=
 =?us-ascii?Q?tpkgr/UKF9uAe9WLOhiHQXLxi8/joFozdQL6VX2fQHREdL2/W/n7aOGbckJe?=
 =?us-ascii?Q?kD+lQEzBJR8JubQ/o++2wEO+KU26ESZTLtW66FtG5BMSHztzLnNhSLaLch/v?=
 =?us-ascii?Q?+nPfjm8xiKjPHnnfrSzW9PoZ7ZGfeuZrX8Z1slVweN60S7uO5aJTatGJJ/OQ?=
 =?us-ascii?Q?g/gcYr5qs7gxayVcGT2YRCggJ3xfO5ckwlW4FyJ+TBMxNYTB6CtxM2vpYuM9?=
 =?us-ascii?Q?8/MpO+eRCa6Fb3pZuXEzjdgklhB66yWX3flyy4GxJeiheW9RELXgsMqkFiDV?=
 =?us-ascii?Q?TrZbtVuaefYqCnCezkmbm+q2pWNI0Izp4fyW3Tnd7JfRPmEtA7/W03T1iS6T?=
 =?us-ascii?Q?zU94Tnte8csM7rhVdQEMs+SdloFK3MRJOeV6vTwHLWGI4+sFxfwGMNBXG8mq?=
 =?us-ascii?Q?PFktOBy/xEc9yGS0ph7zH2cHCR0VduRcEpNMrYzaN32B0vhYLLk1xEHSgh51?=
 =?us-ascii?Q?IHuHIZRhTRSxv+PiWNOikzAZJbO6lkGIESln2Xwdu3sfU88dyFaMg1ciwf9i?=
 =?us-ascii?Q?p2tPxDFlxEvCMRYiBOBcmjsKrG4RYfDtn9F5OWCvfJkT69a1Mkrd0w6Y0b45?=
 =?us-ascii?Q?jwJWMQVw/VNhQcVtVS+awj4XtN01ycbNkt5+eGM8pZ/W4Fh458wVVp8JTL0v?=
 =?us-ascii?Q?1P99LDG/1ysTkOqLx85sKhPyRU3ZQF5g0Fj2NYGT9TuzhACn0ylDJPGxT4co?=
 =?us-ascii?Q?gQ23bp1imX4aaseCL/cxw7bPJwnLCpBJAlzVaQ+LfCfuyqcIpnHSN2b4ThKT?=
 =?us-ascii?Q?xvTTEK7Eo3Gglabq9Gx7yEjxk9VN+rvB1Tlq9s4LwGyCaL3KpLk0csE/ZR7+?=
 =?us-ascii?Q?+wSOLpUsAqYxdpO8RgZ2qFaiQXUSh/gx0wyq8MazuVg3Skk0vb3Vjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5+Y3FMShNrcnnfbi4RBsEWY6Ib8wiMKpZ9qzZ7iWEMHh/C/iKSMAwrmJdjA5?=
 =?us-ascii?Q?e0QTMqkUQYzjYI9z+3nJVWifFDZDI1upz/pDh8iCv4emIXOvSjqSq13z7Mb0?=
 =?us-ascii?Q?vhMU1fflTE/ONCxrrmRQahjKT0EGzD3fxPv7S3cbo644twbC54ZHDc0FcEgM?=
 =?us-ascii?Q?9lN/4AKV3fotmnfdUubAnF1BZvIX4CoL3d7qEwtyqi9w6StRWHteHI/n5Fjk?=
 =?us-ascii?Q?VguLysxV7Q7xiQ3oWsF7KOTNtvTPtEUVEhoSlfHdBK/Spho0zH4HNdk1yWR8?=
 =?us-ascii?Q?V1t/S4ZzUVw+X5EHX/oi6AT93hm6LUmF3Rca4ZJ7WEM5KxY3Mu3PMPE46u3D?=
 =?us-ascii?Q?NFighMmKjKjJdm6sRBguvGiZtC+wuPvaNHgis3f87I8IhKiBU8kAYxYexq6I?=
 =?us-ascii?Q?j6fk07xfs11OQLZpWqifcCmmxdX9NWcP2eij5KnfhKmfLGKdk8CpPqTZgHPL?=
 =?us-ascii?Q?PPTrCE2TufXuVmhxTezwN4UhO4LD89yvDyvBKk24+podvMhZVyJHFUmHlVs3?=
 =?us-ascii?Q?AXjkK4z22C75z38DmsgUgLiOsOSa5IaYgyDE5X20zuRBsQYMu5Gzl0OdlXri?=
 =?us-ascii?Q?2FHmcC+xr59bC+TBWOY+J8/NICsxrmSEWbT0Ve9o4M7IQpkMAXMOKN+MITXu?=
 =?us-ascii?Q?HAjOPR5qudInItwDlExILbmDrfnGoYDNMac5Cw3H+Ph8iUz26gUy6WbNWak8?=
 =?us-ascii?Q?OAx4+qIaAJDwnGCwg+Zq9khw5LZkLki0jDXQjEjczHS0WX6nKRV6+lMS5p7V?=
 =?us-ascii?Q?xK/dAH3gXeufprjfUist3QPiYtnuQrXnPPcL7bgfy6XNdDaSa0PtHDZf5H8J?=
 =?us-ascii?Q?IH3Z990ONa5tBs4oB8Mq772Zi4zO9ukXaA/Bn1mvRZEHEno2rBkrrok1fHuM?=
 =?us-ascii?Q?9znaX8kuX4xA7Ycu3548v+mPfAGEHA6uB+tUcg5JUxbZ8ZbKp91VHnQlYGEJ?=
 =?us-ascii?Q?ZxDHXhsSJ0uVGgeinl8m02K6YkaAB7lq+922lmyrZIqyp0fj1L9+Xoz4th5o?=
 =?us-ascii?Q?dQNgF5W5ndZoSzGsUg/PiAwBKY4hrggcBpbe3JbfOwkBr/j0dDP6BVk+G9+P?=
 =?us-ascii?Q?JcY+TPsETDZvFJEQ/FTGdHj2WNAbDfiS+HtT2lpUaETlZvux9lvrEtP0F4Ek?=
 =?us-ascii?Q?jGP17wrwSUy92aRod89T+eEgNoi4iGaK22neFMifrA7tIRKroEw4LTq8kMK3?=
 =?us-ascii?Q?9q3eLApNveuLMSc7W0gzuwps5DaH68lbctxJF2Ai3fx5rGFkdUHDFBIGFlsI?=
 =?us-ascii?Q?Q2LUMb4gYhLVKMQwH+TGFcvOJX00+pGnBhlQAUOmD3ZfCP1w1vs2r73xVq93?=
 =?us-ascii?Q?blzmtHHOJpCcqyljEYv5LmDUF22iHkHBu48jWLRGV245aXE8dqo8GLkVn3Yv?=
 =?us-ascii?Q?+w2Qg1aOv/yXo+SOpvTlR635sEjuR5zlIOSNPe15QhTLhMuIMZzUPvWpx6CK?=
 =?us-ascii?Q?JqwGEu6JCXW84sNbSDFf4o9RD/gLDsiu9tzT51JYNMwI0amArJBaZunu18oz?=
 =?us-ascii?Q?XcresOwdtoRKk7qU9CLdD5P80epzxJCTK7ZfHEXj4iUAB35F7Btt15yybiV+?=
 =?us-ascii?Q?4tqplL4gc1ke1ZQBWZAWNZky1Tw0Uz7tMu0M2jNYz19xl5b5MsjBdIitCouQ?=
 =?us-ascii?Q?WVd+TkBIDzVY7csFnsVrQzQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2d4b17-adda-4d7b-7674-08ddb534dd07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 04:41:20.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhWLWeK9xFr3r/+jyHrTuzeheqL06gwnN8L1ASYYjmuFgITSKNKTEscGDTan4OjsnpUF7eXhXobQBMghtlXD8fpGCInNCtTbqpOyznxAoWl+mOAuVPtgZ7UjDJcoVcPb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6790

Renesas Kconfig is using "SoC serial number" for CONFIG symbol, but is
using "SoC chip name" for menu description. Because of it, it looks
random order when we run "make menuconfig".

commit 6d5aded8d57fc ("soc: renesas: Sort driver description title")
sorted Renesas Kconfig by menu description title order, but it makes
confusable to add new config.

Let's unify "ARMxx Platform support for ${CHIP_NUMBER} (${CHIP_NAME}),
and sort it again.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soc/renesas/Kconfig | 315 ++++++++++++++++++------------------
 1 file changed, 159 insertions(+), 156 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..5213eb485a05 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -69,139 +69,142 @@ config ARCH_EMEV2
 	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
-config ARCH_R8A7794
-	bool "ARM32 Platform support for R-Car E2"
+config ARCH_R7S72100
+	bool "ARM32 Platform support for R7S72100 (RZ/A1H)"
 	default ARCH_RENESAS
-	select ARCH_RCAR_GEN2
-	select ARM_ERRATA_814220
-	select SYSC_R8A7794
+	select ARM_ERRATA_754322
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
+	select SYS_SUPPORTS_SH_MTU2
 
-config ARCH_R8A7779
-	bool "ARM32 Platform support for R-Car H1"
+config ARCH_R7S9210
+	bool "ARM32 Platform support for R7S9210 (RZ/A2)"
 	default ARCH_RENESAS
-	select ARCH_RCAR_GEN1
-	select ARM_ERRATA_754322
-	select ARM_GLOBAL_TIMER
-	select HAVE_ARM_SCU if SMP
-	select HAVE_ARM_TWD if SMP
-	select SYSC_R8A7779
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
 
-config ARCH_R8A7790
-	bool "ARM32 Platform support for R-Car H2"
+
+
+
+config ARCH_R8A73A4
+	bool "ARM32 Platform support for R8A73A4 (R-Mobile APE6)"
 	default ARCH_RENESAS
-	select ARCH_RCAR_GEN2
+	select ARCH_RMOBILE
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
-	select I2C
-	select SYSC_R8A7790
+	select HAVE_ARM_ARCH_TIMER
+	select RENESAS_IRQC
 
-config ARCH_R8A7778
-	bool "ARM32 Platform support for R-Car M1A"
+config ARCH_R8A7740
+	bool "ARM32 Platform support for R8A7740 (R-Mobile A1)"
 	default ARCH_RENESAS
-	select ARCH_RCAR_GEN1
+	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
+	select RENESAS_INTC_IRQPIN
 
-config ARCH_R8A7793
-	bool "ARM32 Platform support for R-Car M2-N"
+config ARCH_R8A7742
+	bool "ARM32 Platform support for R8A7742 (RZ/G1H)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
-	select I2C
-	select SYSC_R8A7791
+	select ARM_ERRATA_814220
+	select SYSC_R8A7742
 
-config ARCH_R8A7791
-	bool "ARM32 Platform support for R-Car M2-W"
+config ARCH_R8A7743
+	bool "ARM32 Platform support for R8A7743 (RZ/G1M)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
-	select I2C
-	select SYSC_R8A7791
+	select SYSC_R8A7743
 
-config ARCH_R8A7792
-	bool "ARM32 Platform support for R-Car V2H"
+config ARCH_R8A7744
+	bool "ARM32 Platform support for R8A7744 (RZ/G1N)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
-	select SYSC_R8A7792
+	select SYSC_R8A7743
 
-config ARCH_R8A7740
-	bool "ARM32 Platform support for R-Mobile A1"
+config ARCH_R8A7745
+	bool "ARM32 Platform support for R8A7745 (RZ/G1E)"
 	default ARCH_RENESAS
-	select ARCH_RMOBILE
-	select ARM_ERRATA_754322
-	select RENESAS_INTC_IRQPIN
+	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_814220
+	select SYSC_R8A7745
 
-config ARCH_R8A73A4
-	bool "ARM32 Platform support for R-Mobile APE6"
+config ARCH_R8A77470
+	bool "ARM32 Platform support for R8A77470 (RZ/G1C)"
 	default ARCH_RENESAS
-	select ARCH_RMOBILE
-	select ARM_ERRATA_798181 if SMP
+	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
-	select HAVE_ARM_ARCH_TIMER
-	select RENESAS_IRQC
+	select SYSC_R8A77470
 
-config ARCH_R7S72100
-	bool "ARM32 Platform support for RZ/A1H"
+config ARCH_R8A7778
+	bool "ARM32 Platform support for R8A7778 (R-Car M1A)"
 	default ARCH_RENESAS
+	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
-	select PM
-	select PM_GENERIC_DOMAINS
-	select RENESAS_OSTM
-	select RENESAS_RZA1_IRQC
-	select SYS_SUPPORTS_SH_MTU2
 
-config ARCH_R7S9210
-	bool "ARM32 Platform support for RZ/A2"
+config ARCH_R8A7779
+	bool "ARM32 Platform support for R8A7779 (R-Car H1)"
 	default ARCH_RENESAS
-	select PM
-	select PM_GENERIC_DOMAINS
-	select RENESAS_OSTM
-	select RENESAS_RZA1_IRQC
+	select ARCH_RCAR_GEN1
+	select ARM_ERRATA_754322
+	select ARM_GLOBAL_TIMER
+	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
+	select SYSC_R8A7779
 
-config ARCH_R8A77470
-	bool "ARM32 Platform support for RZ/G1C"
+config ARCH_R8A7790
+	bool "ARM32 Platform support for R8A7790 (R-Car H2)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
-	select SYSC_R8A77470
+	select I2C
+	select SYSC_R8A7790
 
-config ARCH_R8A7745
-	bool "ARM32 Platform support for RZ/G1E"
+config ARCH_R8A7791
+	bool "ARM32 Platform support for R8A7791 (R-Car M2-W)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
-	select ARM_ERRATA_814220
-	select SYSC_R8A7745
+	select ARM_ERRATA_798181 if SMP
+	select I2C
+	select SYSC_R8A7791
 
-config ARCH_R8A7742
-	bool "ARM32 Platform support for RZ/G1H"
+config ARCH_R8A7792
+	bool "ARM32 Platform support for R8A7792 (R-Car V2H)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
-	select ARM_ERRATA_814220
-	select SYSC_R8A7742
+	select SYSC_R8A7792
 
-config ARCH_R8A7743
-	bool "ARM32 Platform support for RZ/G1M"
+config ARCH_R8A7793
+	bool "ARM32 Platform support for R8A7793 (R-Car M2-N)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
-	select SYSC_R8A7743
+	select I2C
+	select SYSC_R8A7791
 
-config ARCH_R8A7744
-	bool "ARM32 Platform support for RZ/G1N"
+config ARCH_R8A7794
+	bool "ARM32 Platform support for R8A7794 (R-Car E2)"
 	default ARCH_RENESAS
 	select ARCH_RCAR_GEN2
-	select ARM_ERRATA_798181 if SMP
-	select SYSC_R8A7743
+	select ARM_ERRATA_814220
+	select SYSC_R8A7794
 
 config ARCH_R9A06G032
-	bool "ARM32 Platform support for RZ/N1D"
+	bool "ARM32 Platform support for R9A06G032 (RZ/N1D)"
 	default ARCH_RENESAS
 	select ARCH_RZN1
 	select ARM_ERRATA_814220
 
 config ARCH_SH73A0
-	bool "ARM32 Platform support for SH-Mobile AG5"
+	bool "ARM32 Platform support for SH73A0 (SH-Mobile AG5)"
 	default ARCH_RENESAS
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
@@ -214,26 +217,40 @@ endif # ARM
 
 if ARM64
 
-config ARCH_R8A77995
-	bool "ARM64 Platform support for R-Car D3"
+config ARCH_R8A774A1
+	bool "ARM64 Platform support for R8A774A1 (RZ/G2M)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
-	select SYSC_R8A77995
+	select SYSC_R8A774A1
 	help
-	  This enables support for the Renesas R-Car D3 SoC.
-	  This includes different gradings like R-Car D3e.
+	  This enables support for the Renesas RZ/G2M SoC.
 
-config ARCH_R8A77990
-	bool "ARM64 Platform support for R-Car E3"
+config ARCH_R8A774B1
+	bool "ARM64 Platform support for R8A774B1 (RZ/G2N)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
-	select SYSC_R8A77990
+	select SYSC_R8A774B1
 	help
-	  This enables support for the Renesas R-Car E3 SoC.
-	  This includes different gradings like R-Car E3e.
+	  This enables support for the Renesas RZ/G2N SoC.
+
+config ARCH_R8A774C0
+	bool "ARM64 Platform support for R8A774C0 (RZ/G2E)"
+	default y if ARCH_RENESAS
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A774C0
+	help
+	  This enables support for the Renesas RZ/G2E SoC.
+
+config ARCH_R8A774E1
+	bool "ARM64 Platform support for R8A774E1 (RZ/G2H)"
+	default y if ARCH_RENESAS
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A774E1
+	help
+	  This enables support for the Renesas RZ/G2H SoC.
 
 config ARCH_R8A77951
-	bool "ARM64 Platform support for R-Car H3 ES2.0+"
+	bool "ARM64 Platform support for R8A77951 (R-Car H3 ES2.0+)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A7795
@@ -242,17 +259,8 @@ config ARCH_R8A77951
 	  later).
 	  This includes different gradings like R-Car H3e, H3e-2G, and H3Ne.
 
-config ARCH_R8A77965
-	bool "ARM64 Platform support for R-Car M3-N"
-	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN3
-	select SYSC_R8A77965
-	help
-	  This enables support for the Renesas R-Car M3-N SoC.
-	  This includes different gradings like R-Car M3Ne and M3Ne-2G.
-
 config ARCH_R8A77960
-	bool "ARM64 Platform support for R-Car M3-W"
+	bool "ARM64 Platform support for R8A77960 (R-Car M3-W)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77960
@@ -260,7 +268,7 @@ config ARCH_R8A77960
 	  This enables support for the Renesas R-Car M3-W SoC.
 
 config ARCH_R8A77961
-	bool "ARM64 Platform support for R-Car M3-W+"
+	bool "ARM64 Platform support for R8A77961 (R-Car M3-W+)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77961
@@ -268,40 +276,67 @@ config ARCH_R8A77961
 	  This enables support for the Renesas R-Car M3-W+ SoC.
 	  This includes different gradings like R-Car M3e and M3e-2G.
 
-config ARCH_R8A779F0
-	bool "ARM64 Platform support for R-Car S4-8"
+config ARCH_R8A77965
+	bool "ARM64 Platform support for R8A77965 (R-Car M3-N)"
 	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN4
-	select SYSC_R8A779F0
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77965
 	help
-	  This enables support for the Renesas R-Car S4-8 SoC.
+	  This enables support for the Renesas R-Car M3-N SoC.
+	  This includes different gradings like R-Car M3Ne and M3Ne-2G.
+
+config ARCH_R8A77970
+	bool "ARM64 Platform support for R8A77970 (R-Car V3M)"
+	default y if ARCH_RENESAS
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77970
+	help
+	  This enables support for the Renesas R-Car V3M SoC.
 
 config ARCH_R8A77980
-	bool "ARM64 Platform support for R-Car V3H"
+	bool "ARM64 Platform support for R8A77980 (R-Car V3H)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77980
 	help
 	  This enables support for the Renesas R-Car V3H SoC.
 
-config ARCH_R8A77970
-	bool "ARM64 Platform support for R-Car V3M"
+config ARCH_R8A77990
+	bool "ARM64 Platform support for R8A77990 (R-Car E3)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN3
-	select SYSC_R8A77970
+	select SYSC_R8A77990
 	help
-	  This enables support for the Renesas R-Car V3M SoC.
+	  This enables support for the Renesas R-Car E3 SoC.
+	  This includes different gradings like R-Car E3e.
+
+config ARCH_R8A77995
+	bool "ARM64 Platform support for R8A77995 (R-Car D3)"
+	default y if ARCH_RENESAS
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A77995
+	help
+	  This enables support for the Renesas R-Car D3 SoC.
+	  This includes different gradings like R-Car D3e.
 
 config ARCH_R8A779A0
-	bool "ARM64 Platform support for R-Car V3U"
+	bool "ARM64 Platform support for R8A779A0 (R-Car V3U)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779A0
 	help
 	  This enables support for the Renesas R-Car V3U SoC.
 
+config ARCH_R8A779F0
+	bool "ARM64 Platform support for R8A779F0 (R-Car S4-8)"
+	default y if ARCH_RENESAS
+	select ARCH_RCAR_GEN4
+	select SYSC_R8A779F0
+	help
+	  This enables support for the Renesas R-Car S4-8 SoC.
+
 config ARCH_R8A779G0
-	bool "ARM64 Platform support for R-Car V4H"
+	bool "ARM64 Platform support for R8A779G0 (R-Car V4H)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779G0
@@ -309,68 +344,36 @@ config ARCH_R8A779G0
 	  This enables support for the Renesas R-Car V4H SoC.
 
 config ARCH_R8A779H0
-	bool "ARM64 Platform support for R-Car V4M"
+	bool "ARM64 Platform support for R8A779H0 (R-Car V4M)"
 	default y if ARCH_RENESAS
 	select ARCH_RCAR_GEN4
 	select SYSC_R8A779H0
 	help
 	  This enables support for the Renesas R-Car V4M SoC.
 
-config ARCH_R8A774C0
-	bool "ARM64 Platform support for RZ/G2E"
-	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN3
-	select SYSC_R8A774C0
-	help
-	  This enables support for the Renesas RZ/G2E SoC.
-
-config ARCH_R8A774E1
-	bool "ARM64 Platform support for RZ/G2H"
-	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN3
-	select SYSC_R8A774E1
-	help
-	  This enables support for the Renesas RZ/G2H SoC.
-
-config ARCH_R8A774A1
-	bool "ARM64 Platform support for RZ/G2M"
-	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN3
-	select SYSC_R8A774A1
-	help
-	  This enables support for the Renesas RZ/G2M SoC.
-
-config ARCH_R8A774B1
-	bool "ARM64 Platform support for RZ/G2N"
-	default y if ARCH_RENESAS
-	select ARCH_RCAR_GEN3
-	select SYSC_R8A774B1
-	help
-	  This enables support for the Renesas RZ/G2N SoC.
-
 config ARCH_R9A07G043
-	bool "ARM64 Platform support for RZ/G2UL"
+	bool "ARM64 Platform support for R9A07G043 (RZ/G2UL)"
 	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2UL SoC variants.
 
 config ARCH_R9A07G044
-	bool "ARM64 Platform support for RZ/G2L"
+	bool "ARM64 Platform support for R9A07G044 (RZ/G2L)"
 	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/G2L SoC variants.
 
 config ARCH_R9A07G054
-	bool "ARM64 Platform support for RZ/V2L"
+	bool "ARM64 Platform support for R9A07G054 (RZ/V2L)"
 	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	help
 	  This enables support for the Renesas RZ/V2L SoC variants.
 
 config ARCH_R9A08G045
-	bool "ARM64 Platform support for RZ/G3S"
+	bool "ARM64 Platform support for R9A08G045 (RZ/G3S)"
 	default y if ARCH_RENESAS
 	select ARCH_RZG2L
 	select SYSC_R9A08G045
@@ -378,7 +381,7 @@ config ARCH_R9A08G045
 	  This enables support for the Renesas RZ/G3S SoC variants.
 
 config ARCH_R9A09G011
-	bool "ARM64 Platform support for RZ/V2M"
+	bool "ARM64 Platform support for R9A09G011 (RZ/V2M)"
 	default y if ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
@@ -387,21 +390,21 @@ config ARCH_R9A09G011
 	  This enables support for the Renesas RZ/V2M SoC.
 
 config ARCH_R9A09G047
-	bool "ARM64 Platform support for RZ/G3E"
+	bool "ARM64 Platform support for R9A09G047 (RZ/G3E)"
 	default y if ARCH_RENESAS
 	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
 config ARCH_R9A09G056
-	bool "ARM64 Platform support for RZ/V2N"
+	bool "ARM64 Platform support for R9A09G056 (RZ/V2N)"
 	default y if ARCH_RENESAS
 	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
 
 config ARCH_R9A09G057
-	bool "ARM64 Platform support for RZ/V2H(P)"
+	bool "ARM64 Platform support for R9A09G057 (RZ/V2H(P))"
 	default y if ARCH_RENESAS
 	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G057
@@ -413,7 +416,7 @@ endif # ARM64
 if RISCV
 
 config ARCH_R9A07G043
-	bool "RISC-V Platform support for RZ/Five"
+	bool "RISC-V Platform support for R9A07G043 (RZ/Five)"
 	depends on NONPORTABLE
 	depends on !DMA_DIRECT_REMAP
 	depends on RISCV_ALTERNATIVE
@@ -439,19 +442,19 @@ config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 
 config SYSC_R9A08G045
-	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
+	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
 	select SYSC_RZ
 
 config SYS_R9A09G047
-	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
+	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
 	select SYSC_RZ
 
 config SYS_R9A09G056
-	bool "Renesas RZ/V2N System controller support" if COMPILE_TEST
+	bool "Renesas System controller support for R9A09G056 (RZ/V2N)" if COMPILE_TEST
 	select SYSC_RZ
 
 config SYS_R9A09G057
-	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
+	bool "Renesas System controller support for R9A09G057 (RZ/V2H)" if COMPILE_TEST
 	select SYSC_RZ
 
 endif # SOC_RENESAS
-- 
2.43.0


