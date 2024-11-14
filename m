Return-Path: <linux-renesas-soc+bounces-10514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71E9C7FC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 02:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D330A1F21F74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 01:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B691CCEE7;
	Thu, 14 Nov 2024 01:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pMExs0NQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420218D64C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Nov 2024 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731546732; cv=fail; b=mwNqMFgOcwmRhdnMZnr3APKDaNJGs/pPlIQHmcCJsZEEiYUwGRjmhuDgsF5XRpOjiy3WtWkNXZybif+GGTI+/HEHCN0cJZ76ovB2jtel8/fHxbnHKSSpP4gOsPlTjSjTHqlff2z2+qRkahdKZDI16Djuwdlv4wr2zoU/KRqqGx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731546732; c=relaxed/simple;
	bh=hQ1iFtvkLJOqrgvs5qy63St0l9HiCC+iECUQqmz/V84=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=C/WjtAnxE0pFgGq2NZsafCHKIVpDGIjmRj/ZjPSWMgBqsabEDjzgcPUmcfcy2rN2N3PSFpHXS86uqAVAGsF3Dvb/AKsc6Y5m776t7R8ip1Td1UiMx/j7f2vVtaAsj5YanDXcg4ewQfai8jwF0+v/t0yXDtjJXeh7V9iawQahbSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pMExs0NQ; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXCL45nl+UeMmLEwo8uUzRjhE2E6Px3wdAOSs70xy2wb4cUWaoqvfiwAwlfP+lvKU+WSecYKtgS0h4glZ09mx6CaBF2X3vQh7/+s8+BmZcYmhr1P+IM0j1ik1VV4NJxih11iSoEalIHD4WYXVBMP/5vtrr21weCIFvk/cnLOhkrNRwT//jqi2rmyC2n6eDpzVjTOPQj5ptfpSSiV2JmglYLsj33IP81j9zq2/lis8isa5WyCVSm97V7MHVuNzaN52MLvkbFFhAKs6g6RKGsR7pFfoSPh46e+gRx071iBhf6qwMeJYkBajHB3eq+zx4HJvt8UCf9XnOaXMKxR4sBjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5aQAXT1KbrWTSD3Na2luqNM+ZcU5MKNiIZ8KEsZkPM=;
 b=s2mSvtlkdL/7LC/xv2q9YR1Wf0p9teYJEhRUxedKp5mTcBwZsXC7a0aciEUX/HWk85TWSovvTYyrsXqf+OTpajNSaXU9fF+Z4bCe31QMxPNhKfVESEpZEKYpEaWlXHwAohqJqYu+U07yTUfcr8YjUdSI9WyHYKrnzK4LRH+RofTrRS6Plq1ed99Cx4LD9SqGj9PuKtnNKnhWQXkFd5Wvzhzt6n06SMWkiPDqKqhhAx24l+96N9EOIsMpVjNr0aJxubg4/AXcdLyqMY7ELB8/ObIsvAfODFgb4zrh0f3Wdd9vRKKAf5kcbM+Fgbl7V91cRGKes4gcfpTav9Ne8gClPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5aQAXT1KbrWTSD3Na2luqNM+ZcU5MKNiIZ8KEsZkPM=;
 b=pMExs0NQYJ9NnvHxWIGORuwnsdW/h9a3/9/fQIN6eL8VKodvWitmqEeBT/7iGidhdBcxj9Zz8Xknv4Ghs2d8T2CbV33nJxJJexQ6k/5bWInsmlppCEP+fVTs52rYguDY++ipO9v1fIg7UNMutW33+WU+2g7YWl3btuvdQiMwLvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11731.jpnprd01.prod.outlook.com
 (2603:1096:604:248::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 01:12:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 01:12:05 +0000
Message-ID: <87wmh6pqje.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: renesas: ulcb: add Sample Audio Codec settings
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 14 Nov 2024 01:12:05 +0000
X-ClientProxiedBy: TY2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:404:a6::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3990f446-78ae-4aca-0864-08dd04495aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7HbfWcYv005t54kWzessmT2ZBOAgQ7RMzcBISI5f7dRJlQPHDEgzqzavQ/K?=
 =?us-ascii?Q?aJfxmHIX1YIA7+m3g5z68aeyBDvUkyh2s2Svyc4o+aTajYnTO6V6bpZaClVo?=
 =?us-ascii?Q?xQ+uRvbq2bW/tmZw8xK8z2de9FBwTCBH/67xMGBFfkkzT6ltkhOkAI0RY/np?=
 =?us-ascii?Q?vP9w4/p62q54ukDwzrgnOnj/Za6TlioqtQbNVoy7wCmqons9Rh+dX2gHKuKd?=
 =?us-ascii?Q?QdekTJCq//aaOueFUWKI33PgKSYO0t/GMGvE5xSGF90fOMJaipQZoNSWM76X?=
 =?us-ascii?Q?fd1+NYKqDdMrlLjtOWvutbPK0lF+GQemq8uP3f8MZh7ajky/VKn5NPq2+Tyu?=
 =?us-ascii?Q?D/fBdd+ESVQxhL8VC+0GqgvnQmzD1Tt2lO395ISA2XJifG229KEvDRTnb1AN?=
 =?us-ascii?Q?t+XrEvulJ5l0O/KaP8n9mD4exuK0C4KqlI3gLc8T0wqF1+VHZyMD8ii84Fph?=
 =?us-ascii?Q?Ex0pT2rDzcwM2431aW15S6ouPZvkxc9tdokYeyz8AR5qo5yVl2jHe1Wey7h/?=
 =?us-ascii?Q?6KxxXSt4Z5vfvqHM1Asqkkbu/EujGPSWUhgASk6PX4U3Gi/264Ho5Br31vqa?=
 =?us-ascii?Q?E0vM3t7FALSnFhYrOaPZFwfC7PBNDjpklQLCc6BKLL3gbat5M9Ywq5/jEAr7?=
 =?us-ascii?Q?278Cq02CyRRw8+RmKt+jqWz1vAZdN6WWtHns2zTsHkHGHCTrDjoATXJjRSiX?=
 =?us-ascii?Q?d+FngxMLAsSSS1r5+UsknIuN8WJrHSq+ZEh1ngIf40GBMtDv2Bs51gEunTiT?=
 =?us-ascii?Q?aPyh4l0SqoFYfsppvIZaZLvqsb/qQt9x7YQRIVquglKoqG2dFLkr1aRvDjEe?=
 =?us-ascii?Q?Z0eomkR2xpuRgtmyw9FNnhrlx6XJqjZJe965QzZ56+CTyzZHg5kPUV4P1XP3?=
 =?us-ascii?Q?jvbGhwXxS/v1rd/CBUhNL+5p74QMY6WdMVIFpq7hS95NHw42qkHaw1eFcLQV?=
 =?us-ascii?Q?xIqchkKCTOa2+EksnqBOnXcdzdUNmsyKoZai16vVsyl2VS6eCBSFDn88N860?=
 =?us-ascii?Q?QVz8mtv3r128m0qKjENxWI8kv2VuHOjNB+9x/gmVibzeF3dB97f3T2i0qw23?=
 =?us-ascii?Q?GUZ2CFvgOQXNSdHFKgBOCtb0BLn5uqjteZxNk07kKw/Az+sU6dol8n1GZ9V1?=
 =?us-ascii?Q?t43opZR8RZybmmKfXPYMy513aAwpYGAfUTWQr3FYSL6b5/gf4PnNsD4lmI1Z?=
 =?us-ascii?Q?yUmS7OTHPYGpOvfwtRt2hHI8Fj6lLj1U+wnS6XDQWsvkf0ifMJ4E/Qt2heEb?=
 =?us-ascii?Q?ZziXVohMuF4LhtuxtR0l1i/HyAkFm9iwOn0dSb2lNBXY4s7FtbukXV8Yb3q7?=
 =?us-ascii?Q?e4yyMFX8Mlj8Gj+Fhv48XWcwGM88dL9e9dJcQKvjCPcwBWDTJosj6GVVQ4VR?=
 =?us-ascii?Q?S4oWrdk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fAoqvgLZf6t2Nvz9FtocATcffP8ionUtV1KKPqpT01tSyCNLCCQcspg0Bzg6?=
 =?us-ascii?Q?7k0tXLgOh1Y7pzaYaTa2bkOhqWDGd6t9jvvxN+KIDPmrQPOBjvswMxRIROED?=
 =?us-ascii?Q?CQRqLQUWGocS5dGr9ZzpbD9ayBKhdtQNRY55TMVGG/JASXJDfCFtetXWX/kT?=
 =?us-ascii?Q?qYwxr0ZBHPSVqc4FCHWSdT+S/EcLFXPtxXutuehCIC79VSQ7fEj+di2QMYAt?=
 =?us-ascii?Q?20B/7/ifoPJspz/MibTKkA3qOehHZq226tzjV/HmZvbS8XlcjN8x220je8Dy?=
 =?us-ascii?Q?20ttBQzkkfPc8cx78Rl0narse5aewIEas6grKt4QpuTGgqug24vBSzO7jtyf?=
 =?us-ascii?Q?ye1bHaZib0gju3Ir/K9kUcIn+c6g2lzLPJbwYV7XpsthKCO8OUY3RKNTu5Gw?=
 =?us-ascii?Q?WYb1qXnAP41h6PUy7ebVnWqfetaEsa1qQ5LzstN1fXJknYkmNrQFa3+nA+/3?=
 =?us-ascii?Q?jv56TZDIjx9RJ8DNGTuGQTH1DWi1XePeqkxN9Ws4ebuglbAmywUkgVirFmTd?=
 =?us-ascii?Q?3mK2Uhjjj+z9fzHXOIdDElY24c6Tw2UHp6tXNyswTuKvC8hhXU3TYSoW8avR?=
 =?us-ascii?Q?zgkx+Wu2k7Z9QpxfCgym4YbmLSDROV1gGeb0EqIMdMSjHF87F8g+by9spVlP?=
 =?us-ascii?Q?bPwSc31N/Wp9na+6qn8r817ntOV7hlQ5eTzp1FeZLQujJxrchKhUm4ULTDbZ?=
 =?us-ascii?Q?yJFBLM3NOq0vP6dMWy9D1EhTTk9JBW7i4Ykcwxnn3pjFFI22af/HNi/dOxOA?=
 =?us-ascii?Q?1Jh+54i2bY640jeFzZwwt6tKCaLsmEiun+LuzM2J0z39XMxJe/81B7uJGVjo?=
 =?us-ascii?Q?CSNeIcZ6RTLrDkPZW1uXH7ObISvKNUSordACFyP2QxiwTVKrA7Khl7g8itdh?=
 =?us-ascii?Q?r7Vm8bD0c/RKEGAbSn+bgQRRGKqcWkBR9ulFuyPrk14Nem9ygmB4FnvRRVBV?=
 =?us-ascii?Q?iuhYhpBWXYFY7Bl5cmcO2c9sBLtMmP3JypEsEavyme7rXHULcU5CLpNK31/g?=
 =?us-ascii?Q?63Y0PpOjFZmpRmi0Mop87GsZyCmhiq/wTRDAu5E2X7mCT1HbjCV/aAxmiPFB?=
 =?us-ascii?Q?YPiNkVJed55hu+P0cI3W2clykAJio1Q7+xPAdQstTS0kyW1//IJbCWSvQVi9?=
 =?us-ascii?Q?xLi4zPSjA2pIYbAJ9m5qOKsMEAbxXv1wGxcKcdkVCamZ2oyto31zxVaNQHlf?=
 =?us-ascii?Q?v/HGszP00iNnMtBY9YwXOCItbX/T9ER8psW3o+U1TaqabDgeE4I4S3ps7KAc?=
 =?us-ascii?Q?3hsEQ6M8Ve6ptY3Y/BvMh0+cIQHVlXshyaIboz28SbDM/i9WSSIq0BV/VKa/?=
 =?us-ascii?Q?rMRacG+jTvrRK5iOPueyhbaTmz4Usmr9LlyjefrVtbnNHHrK7PN9ZE7v2qPj?=
 =?us-ascii?Q?WDdudhxR3gFtGYKRs7GDfwrqnbk4z6JRrGxFDsw7OuMDo6Vg1c1RZqiOnRpV?=
 =?us-ascii?Q?86zU3vVOfmSmVuYFDhNY5Ana6DmnRPvU3djz9qZfXZIb3GiddNdRHXaRL5y3?=
 =?us-ascii?Q?FHcDguVNlwo3xopTPihIV1aOOIJ/p0jjXuVlSrrvciJPLo7UXPxEOOs+CvmW?=
 =?us-ascii?Q?6HLWpLpX6wDoDMw7juHfD8OnRJTyS0A3NCorCdGxkQb8sYS21Qz5qvTbrg1l?=
 =?us-ascii?Q?maPfg917nfuxS27F4KfIW3U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3990f446-78ae-4aca-0864-08dd04495aa4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 01:12:05.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bt9CXSsbxbIbsiYHoXIqYqDVvEf5GRisIVPwl0maj45+bbIk97MuKB+Z/RfXr6rxEam2Oa70rQK99znnJPlPSWU+cmw1oKdCNAdJ7B2ni7DRYOCnoggwW921l+gK2Boa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11731

ulcb{-kf} needs amixer settings to use Audio. This patch adds Sample
settings for it, for not to forget.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi    |  6 ++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 431b37bf56619..9c4a5571ad7fa 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -5,7 +5,24 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
-
+/*
+ * Sample Audio settings
+ *
+ *	> amixer set "DVC Out" 1%
+ *	> amixer set "DVC In"  20%
+ *
+ *	// if you use xxxx-mix+split.dtsi
+ *	> amixer -D hw:1 set "pcm3168a DAC1" 50%
+ *	> amixer -D hw:1 set "pcm3168a DAC2" 50%
+ *	> amixer -D hw:1 set "pcm3168a DAC3" 50%
+ *	> amixer -D hw:1 set "pcm3168a DAC4" 50%
+ *
+ *	// else
+ *	> amixer -D hw:1 set "DAC1" 50%
+ *	> amixer -D hw:1 set "DAC2" 50%
+ *	> amixer -D hw:1 set "DAC3" 50%
+ *	> amixer -D hw:1 set "DAC4" 50%
+ */
 / {
 	aliases {
 		serial1 = &hscif0;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a2f66f9160484..8b8b5d9a19bb9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -5,6 +5,12 @@
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
  */
+/*
+ * Sample Audio settings
+ *
+ *	> amixer set "DVC Out" 1%
+ *	> amixer set "DVC In"  20%
+ */
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
-- 
2.43.0


