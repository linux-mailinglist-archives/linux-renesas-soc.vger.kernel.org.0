Return-Path: <linux-renesas-soc+bounces-23564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 718D0C047DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3463719A44A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 06:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4CF26E716;
	Fri, 24 Oct 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aPYubVqm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB72737E0;
	Fri, 24 Oct 2025 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286936; cv=fail; b=eifNuIvcc5094dLdi4pkAxMlO/2kFzBse/43WW8QTheqbe1Sr/VDv2HmKgDSF0HxKHsm2BW9NmoDy8oiqN6HSjpmZgpG+38f75M44gefVMc06soYm/dqK4iVqdps7s7ZjsyGZv3Pe20Qlif0veSIRwdhNjt8/ucvA15peCKG7M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286936; c=relaxed/simple;
	bh=EZbs+q2tbfPcOx4CaNBo0ifeqVAEyucaSkfvqFU9jGg=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j6WsESrhjlB7dgCnOPwBz0FTPqlTZFgDQAqF6ozIJg0M8D6LuzpERtXGRQUPIkRZ9bvQMOy38EhOKaynPtg/4LwYd60gFv7iTRU8V8wlz5QvyzWT4+xJ4SCaDAJ1/kCd/Vg3xoDtaDn+gK5PTiQBTB67nrx15qMChUpA06+jCjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aPYubVqm; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpRxJWaABo5MJOdSdw1IinIniPTvKEZcOSCoUqD2h5TnNmsePde/nhkTmkm+LuvtF6pn3Suv89BqLPNrsPQGFuWWPin7yrmmUW+iBPmVs7lcnEeJkKPKY9oEiYg3RXh7Nw6zXJF69cIbNolpXbtjywINoYRqDCAYDjLb/mzvJEgq3yLz/cAeBcaXYkMKKgYP+CtUmIWg1DPvYebCZpTMXfbCUywcqgumBp7iXWGHvi1OiP8BN4LSBeZIjPCnwGxlZ9/lEAOwDm+n2hXm/2FS1qsQpqQunwsiHCAIZkgEEI8uB/D5G5v8IHiVS5E1e94/MegKJVA/d62tI6EVN9RAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U04NOxkuq+xYJFwp032r2rB/kCGIX5ssNLfzWXpcq3c=;
 b=ZtChiAl9EExlMpWME7VtbcxM5LIs984501xNmH5SCte1/T51TS1pm4sD0USuI3QwPi82tZkZ4kHFliMHJB9fy0VT55FMSkPBj7yZjp/8wx3K+Lq8WbMCiji0qos71pHB4C6LPyVGNKi2M/D5eSypDTy9DLL86LPJNwqVoyQPkMesAzfhbPMQYy2+hO8gaVlN86x5qzqd4uBX0C+K1ndgyhLnDikkKOOsJ1oldiKO0VvoQULR9ymkOSTMfG/rWFbh7ci19vwle6YHmKYT77SvsuOOPGCjF1H2kkgaWzptArJrTMnIeDAR9A8n+ppke09c1iqgtl7AfNENrIauLado4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U04NOxkuq+xYJFwp032r2rB/kCGIX5ssNLfzWXpcq3c=;
 b=aPYubVqmuCoYsf3QrCTABUd8dU04vAZ0mWD4XeJtFllc5NAvUyC8r9mKXs/DILnjv4QRCJcIDcztRLpl3YQFZwKH6GZlMcj50ypBDpFM4yAcF7Qxi42fMmnM8JJF5WLtja7fabuFISmsVtUm2oKAelUWGfFQlMf2gMW564FtPII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10774.jpnprd01.prod.outlook.com
 (2603:1096:400:2a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 06:22:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 06:22:11 +0000
Message-ID: <87cy6cn7jg.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] mailbox: renesas: Support MFIS mailbox driver
In-Reply-To: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 24 Oct 2025 06:22:11 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3c4ab3-48ba-48b0-90d8-08de12c5aab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?15TsgsZC/sKY/q/jdT99VK+G/rL3ijYlvwtM0A8SKdf/Fb6QmZNP3NOFeABx?=
 =?us-ascii?Q?cx1u7Od2uIliyBjTLFRuNMpsRmzB5MwI3p5IYtxYZnWNEgcSZazNFaaTA9AT?=
 =?us-ascii?Q?irVRjQ9nYkqCsWcTujRH0HXdMU6NjA+EVjw9qyP4sAp+I6p/4uoDhFJS/hFI?=
 =?us-ascii?Q?0/hvqM5ZFAuvZvacvllv/ogD4fW3cgM48Tfdk1LauV/fwNgVAUSOfu5ozsv9?=
 =?us-ascii?Q?t+49ZrETCjx8+I2xZ5xe/93peDryCsS+nX4g/Ca87KddpR1hc95TW0I9ttWB?=
 =?us-ascii?Q?gMkhAnk3rb/5qVzoYgQkyE+epmpQjSIhb0GnOuV9h0KSNOCZYrik+zSTZ+Pb?=
 =?us-ascii?Q?F9jAx6sWG/Z+64wWxqFWKbe/Mf8TRYXBO05dDTyEdaLy0sB7mtsWfEz6KznJ?=
 =?us-ascii?Q?89Nf3FfCtVO5tlptqNsN1Cz4yRjRoUSt78X+ZB49x2AEVjyq/8PcJ7wmBbdH?=
 =?us-ascii?Q?z/ZM949loQ+zOVk6GOjfXEppTMnWfcgCAmLMbEDkpG41LY6m0qHJeI9KkeWE?=
 =?us-ascii?Q?HZZza1kIVJih0Mr69/yqXKvOcia3pJAacrKtgoKXlj5byTLMKOld3cNz+b2j?=
 =?us-ascii?Q?puSjbQm0C/beplp3MgwmvNuSEplr5ZDMjRGM0g8N1UMSZ22t1wcRfSLM8mUl?=
 =?us-ascii?Q?JJyiDoygJRTJHVPVeh5GJRazvCXSZPOC+OMn0Ym0Ock93PAI9pyEN2hxn0Pm?=
 =?us-ascii?Q?Qz5g5EuZP3Xr7ELQlCWJXZzOPHFq6H9akghyaTtI08dfsUYi4kNcoT/mf61I?=
 =?us-ascii?Q?BDK/mporx4aQp07Y+F4LKPAVWYS9QOhgnBu3ooIMdnq10/GIfmZg4oV7Cy67?=
 =?us-ascii?Q?APk8aiS8ZXJ3bV7P601J7qO56/V72x4gtDIyuoKKLY8zRyiqUCpgBSfyBEyb?=
 =?us-ascii?Q?4I6s9sHhG6sDdIzjpEfoYHE201pKu07ZhCHiM8udJATHG2AD7hXhbFwu3Cs3?=
 =?us-ascii?Q?sxJgEcYVnPjJijQYIfBayqJDOYvCg6qENAzlz3FNtZnEb2FLIveKKzTgNK5l?=
 =?us-ascii?Q?T86m5q7Nx7Z2env0R5Zeyk0N04n1VLTG18LT6+Hi2kup7mPayz+REY2Gqn27?=
 =?us-ascii?Q?OtoLd/TbBM/+uB/KdWA2QfIgJCt0FkGX1H624S1/V2tN1rmibQCQpB2/6TAD?=
 =?us-ascii?Q?6XWgyzczybV/PB3QRek5jUsCVD99rY1PZCVt1QszeRic5jgDk2ECJFPJ1xVf?=
 =?us-ascii?Q?GfqSmSCZp0Cws597G64vcqfnfz70D2DM75kKHX2fQ7aNKMTSEr8ITsLp+cTO?=
 =?us-ascii?Q?bIMmfMKGD46gCT3IDOlsRn/xveHokmrW6INBMxDntlIRQmXCyFSysH7jcOQv?=
 =?us-ascii?Q?SK7pOsAKpg+0PJRQKbwvv1gllOwJCmFPqBqyq25drCu45tq5pL2Z3vpuosT2?=
 =?us-ascii?Q?YiFpn0Ne2G7X23NB9BZ2OITMIcNWofQeGPmq/G2cmK/e28rhEqcireHl8szn?=
 =?us-ascii?Q?uxsRmc5uOMQ7fkZN/ROGpP4al9SO1rsSgE7n6OoFg1NcW4GRSXezGXo86Yi2?=
 =?us-ascii?Q?T/vMYNdofwh4QZOy/N3SZGtKrybbiJ3R4svp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8PW4xLZkh16sJFejAl9knr61HLfriOBgH/BtwD8v6fikJaud9LkXpW6Y2wNu?=
 =?us-ascii?Q?JgSR86RuyanVniSwNgathULA550h+s+A1s7NeVSZ/baoYBUEPM0HZpVsOi4S?=
 =?us-ascii?Q?WPKHXVMUQwlc3e3U+gSV7JxMACN5Tfa7iRJHMJy0UAVPjz/B08eEdfYT/mD1?=
 =?us-ascii?Q?2MgpNZcAJgbDKku305rNZglpLF7XUm4YIhECmXF2fzvxoTA3UMqAJvVIV4+N?=
 =?us-ascii?Q?P8a3rYyR9Z1NUFMs5Sd5PZw6jeYIzmJB0+IVOdY7NrcFXQO1kUY+59w5QARd?=
 =?us-ascii?Q?gOKDN+F/BnPMZz0ZJZ6ZIIc1tgZonCN/7rXn+K39mmGfK80CiyFNXjzSu8XS?=
 =?us-ascii?Q?RLXHZmi1lZn5nM/okJXj9WbyS9XZZ1yYHU0jG8LSEmip8kGjL4YaNfQTQVO9?=
 =?us-ascii?Q?X8BPW6laYYoE3KEIK/I5xBwy3u4ydhc5jt2m27BuPLCwVEvS4C/2T1SwQNKg?=
 =?us-ascii?Q?TLH1HKW7xbH+SOF64wRPUuDygPi/Q/b3mbCXICHwz8Qm+xT7aSpytE9KKzuO?=
 =?us-ascii?Q?E8AR+wy0GXDsgyAwjDTOEH/rsmat5zVvkqq+QMinYqi/6unqcX2WYrh6PV5x?=
 =?us-ascii?Q?4C1T3aiukef73oIty4yzDBEAc7/6Ses/o5bPPIOkwkon+RqSgKiEFbUXhZdu?=
 =?us-ascii?Q?lUpPY50iRE7lvR5qJXbp7AVpsrD/E5iKODyxuqV3Xg9ju5+bn7rdls0M5nhU?=
 =?us-ascii?Q?Ux0ctaeRIvZu4xZ/UZQPSUGj+onprBHLy38osjVkzXyx1L1RXA7TxqdUs+Re?=
 =?us-ascii?Q?90QaNz3HR7rTMZpT6RccEn/D/LDiiYMhbtT/vzFBHEp+2OxrMay98RiXBivP?=
 =?us-ascii?Q?EHmYwX8AUmWXBFiQ8ovlaHfV6+ODK4JkYNOHGv0rhv+xyWzDQyoguANQJmUn?=
 =?us-ascii?Q?28ofSXkupgJOxKd2ppalYCF6GSyRA0TqmfajSygDB8/AIUFOGPhc5iVyQmAf?=
 =?us-ascii?Q?s75YX64iJPAj84n2qtcwkLgoYbJGBqaTkOGPmnwW11RBIX0ZpQGTayHhmWTx?=
 =?us-ascii?Q?1KdyNK40J2oNs/UdLCDFoHdD4RQOj/P+9u7qIdcmL0D9dP8HoSTjeBF0VAFg?=
 =?us-ascii?Q?+UVx3Afqri/XWqqLuvYLwbRH0Hrv3JveEF+ePuGJ7g3PSuNN5beWOOf4Tb3T?=
 =?us-ascii?Q?fw5S/kSwEqCsJYQ5tie+GSqRhFtrUqpDWVDnyZoI1s9IUmHalZL/pJaXWkFM?=
 =?us-ascii?Q?x+azyKEKyIveP+0ESvLyUuT14s/8wZv5AumyT7vuyruG4iuWkYmfQsCoD/ek?=
 =?us-ascii?Q?jnLuN2m/nhsSjmFZ7fiRJZu5mAho5TBCsLLKrUrwlFysp4SPpLFBBbpDXw8k?=
 =?us-ascii?Q?+KS7SXuzym/dUccV5c9JMvrlEXnTA9nAcOeFsjRQvi3OY2HknNlxJOyEjMRL?=
 =?us-ascii?Q?+Z1DGdriRqqCK+GnIvXUK9gvVjRAImtaE8tq7FCgR2T2sDt3tcDGGkF2fqey?=
 =?us-ascii?Q?epvQOIzhmILZhlMdo3+sU1RzC+fVQ5UUpOPJ7+lJCt6AEJEsNpBINM3bRsRa?=
 =?us-ascii?Q?+vZdZFK1ZDaddJVeWdxy986uQvaJpFa9QHBz2FYyzU/MmvVFLsF4jXCBlepg?=
 =?us-ascii?Q?lxbO59MDJNhMCiFy2ENrE7MLgEPHviOZHZbWgsRZP1GRyeInYqcCRO8MdSjf?=
 =?us-ascii?Q?kqzAekhcvX0BtZ2TF14RyKQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3c4ab3-48ba-48b0-90d8-08de12c5aab8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 06:22:11.7449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQ1KV4h7tKBEFgQ5LkGxEIvixYrBUNKYMgQLGLXlYkTzzac6HVtHaIB84pQVYLh2x7CA9rIX6XflC7mUetaVod8ZLLOAO6Ajqz4/Y5qsPJciMLDfvppOdntimEdz7iyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10774

From: Masashi Ozaki <masashi.ozaki.te@renesas.com>

Add Renesas MFIS mailbox driver for R8A78000 (X5H)

Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/mailbox/Kconfig             |  10 +-
 drivers/mailbox/Makefile            |   2 +
 drivers/mailbox/rcar-mfis-mailbox.c | 137 ++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index e47cb68989267..07e6bf06effe3 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -379,6 +379,15 @@ config BCM74110_MAILBOX
 	  processor and coprocessor that handles various power management task
 	  and more.
 
+config RCAR_MFIS_MBOX
+	bool "Renesas R-Car Multifunctional Interface Mailbox Support"
+	depends on ARM_SCMI_PROTOCOL && ARCH_RENESAS
+	help
+	  This driver provides support for SCMI interface transport with
+	  MFIS(Multifunctional Interface).
+	  It is used to send short message between CPU cores and
+	  SCP(System Control Processor).
+
 config RISCV_SBI_MPXY_MBOX
 	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
 	depends on RISCV_SBI
@@ -389,5 +398,4 @@ config RISCV_SBI_MPXY_MBOX
 	  remote processor through the SBI implementation (M-mode firmware
 	  or HS-mode hypervisor). Say Y here if you want to have this support.
 	  If unsure say N.
-
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 81820a4f55285..060a9c7f6727b 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -27,6 +27,8 @@ obj-$(CONFIG_PL320_MBOX)	+= pl320-ipc.o
 
 obj-$(CONFIG_OMAP2PLUS_MBOX)	+= omap-mailbox.o
 
+obj-$(CONFIG_RCAR_MFIS_MBOX)	+= rcar-mfis-mailbox.o
+
 obj-$(CONFIG_ROCKCHIP_MBOX)	+= rockchip-mailbox.o
 
 obj-$(CONFIG_PCC)		+= pcc.o
diff --git a/drivers/mailbox/rcar-mfis-mailbox.c b/drivers/mailbox/rcar-mfis-mailbox.c
new file mode 100644
index 0000000000000..54cabfa305eb4
--- /dev/null
+++ b/drivers/mailbox/rcar-mfis-mailbox.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas MFIS (Multifunctional Interface) Mailbox Driver
+ *
+ * Copyright (c) 2025, Renesas Electronics Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static int mfis_send_data(struct mbox_chan *link, void *data)
+{
+	void __iomem *reg = link->con_priv;
+
+	/*Trigger interrupt request to firmware(SCP)*/
+	iowrite32(0x1, reg);
+
+	return 0;
+}
+
+static irqreturn_t mfis_rx_interrupt(int irq, void *data)
+{
+	struct mbox_chan *link = data;
+	void __iomem *reg = link->con_priv;
+
+	mbox_chan_received_data(link, 0);
+
+	/* Clear interrupt register */
+	iowrite32(0x0, reg);
+
+	return IRQ_HANDLED;
+}
+
+static int mfis_startup(struct mbox_chan *link)
+{
+	struct mbox_controller *mbox = link->mbox;
+	struct device *dev = mbox->dev;
+	int irq;
+	int ret;
+
+	irq = of_irq_get(dev->of_node, 0);
+
+	ret = request_irq(irq, mfis_rx_interrupt,
+			  IRQF_SHARED, "mfis-mbox", link);
+	if (ret) {
+		dev_err(dev,
+			"Unable to acquire IRQ %d\n", irq);
+		return ret;
+	}
+	return 0;
+}
+
+static void mfis_shutdown(struct mbox_chan *link)
+{
+	struct mbox_controller *mbox = link->mbox;
+	struct device *dev = mbox->dev;
+	int irq;
+
+	irq = of_irq_get(dev->of_node, 0);
+
+	free_irq(irq, link);
+}
+
+static bool mfis_last_tx_done(struct mbox_chan *link)
+{
+	return true;
+}
+
+static const struct mbox_chan_ops mfis_chan_ops = {
+	.send_data	= mfis_send_data,
+	.startup	= mfis_startup,
+	.shutdown	= mfis_shutdown,
+	.last_tx_done	= mfis_last_tx_done
+};
+
+static int mfis_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_controller *mbox;
+	void __iomem *reg;
+	int ret, count = 2, i;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	mbox->chans = devm_kcalloc(dev, count, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	reg = devm_platform_ioremap_resource(pdev, i);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	for (i = 0; i < count; i++) {
+		mbox->chans[i].mbox	= mbox;
+		mbox->chans[i].con_priv	= reg + ((1 - i) * 4);
+	}
+
+	mbox->txdone_poll	= true;
+	mbox->txdone_irq	= false;
+	mbox->txpoll_period	= 1;
+	mbox->num_chans		= count;
+	mbox->ops		= &mfis_chan_ops;
+	mbox->dev		= dev;
+
+	ret = mbox_controller_register(mbox);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, mbox);
+	dev_info(dev, "MFIS mailbox is probed\n");
+
+	return 0;
+}
+
+static const struct of_device_id mfis_mbox_of_match[] = {
+	{ .compatible = "renesas,mfis-mbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mfis_mbox_of_match);
+
+static struct platform_driver mfis_mbox_driver = {
+	.driver = {
+		.name = "renesas-mfis-mbox",
+		.of_match_table = mfis_mbox_of_match,
+	},
+	.probe	= mfis_mbox_probe,
+};
+module_platform_driver(mfis_mbox_driver);
+MODULE_DESCRIPTION("Renesas MFIS mailbox driver");
+MODULE_LICENSE("GPL v2");
-- 
2.43.0


