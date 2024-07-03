Return-Path: <linux-renesas-soc+bounces-7013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56B924CA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 02:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52CFCB20C83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 00:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C63376;
	Wed,  3 Jul 2024 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WqwzTqp0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E775C621
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719965627; cv=fail; b=CeFSVvlLDLNGtHGDEgu4bufIDToW9g/76c2vkJ29XUhEjnQ/10p6mCalfExHOM3O8/CrfnqntsaA8MVXrgj1miXB0iRjEziGFja2IlJNXqdSshEIorCIPOq+IF+06oq5dDTLAsKNQz5aiNfnzbuesG+wbmB3M6N1aQ2rXSEKfXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719965627; c=relaxed/simple;
	bh=09A1hF6v9Lc23XX2M9n7AgugTrMF4CEqbaBrCjQ1yTo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=quIiCiMZSzwneQMORJCTwfAvvQYKDSeRmIRCZW2pvCXMu6Wr0ZuRRMI/P4RiTfBt8PdX2KN2L4hzIT3xizpbFxW6eVwkosimbZ0xCMoz/7GVF7Yz8FE99U1texrG5NctMaPurlecVNHARYceoCQL7qhMF+bofJwsNN43kDaUNoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WqwzTqp0; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBDY0WsrIqBdJgDry4y1kGSfTayWKfq68Tz+s7xtzDfwUu7x9e8VKzlH8zAoPZI+0zA3s3OCSWTpHS+ch0KKn/8LzPgGJs502lnhSOhNjMkb8fbPVdSsBPMWgkt361fQIicZ0X+J+bNuTt+9NMeZYa33QASZqMBZcmoA05T4lSd0FxsW8vDBCihndxXAzXDdGd+Sj8OqN7a72xR8CxIwhKRFXDjBciDPnhnScXImvqqV7pXRtzWGc/ZiJc6P2zB4VIWfJRX+4Q6nwc88fp2AU6qErgrE8C2bRF5gGpsIuVK1pXvnTNO/XHj4b4RnFEVhv7Y0sorxJgK78ITfkDn59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyzhQb9MpmEucTznh/ISImUMJHQ+7lgwhJuuBteqmrU=;
 b=kq8xlArDXYB0aYALG85lHx8X3XbYk9Or9tr9rfr8co8W7TdP1lkld00tV/6yaEONa5mev9irwi7vk4X+ke2/bR8/qpHOER6AaIhN0G4mEKYFJlU5zBgQ+i+5uxKnW6u2EJKEiI4Ffl8FHJafGlSPT77n5u147H8+h5QVo3N9Mk9SBM1h4zl4epPVWK4UnLzVfSmSD+nEhtVWcaCPtE2qFF08Qxnlday9O8JAYwLYGSSO64qUAQHj99D7hwgz1ptSQPv0NsYW/8jflzzBli1tqOvO9MsJyJ8rjAvDkDYjEBw8yZEmmbTn/EZSLhU4+mgiAFMnWNK3m6J7vx2A7tubrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyzhQb9MpmEucTznh/ISImUMJHQ+7lgwhJuuBteqmrU=;
 b=WqwzTqp0U5+zA1sCfmP7eHbho5/sNvXLQ0Q5zquYmSIvN1Ci06w5V/4CeETG0W/CHNzHsj/oJnifiwE16R4YqO14M+2NMBF+mKMbydCNAdXLsHkDtb8SueYyNdumeXSkJ0CFcubNq50vbcSPQeCXFXTgN7X6BYO7xvQSiQXjot0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6179.jpnprd01.prod.outlook.com
 (2603:1096:604:ce::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 00:13:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:13:42 +0000
Message-ID: <87cynvbadm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: gray-hawk-single: Add Sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
References: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jul 2024 00:13:42 +0000
X-ClientProxiedBy: TYCP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: ef60f9c0-1090-412a-fd2c-08dc9af4ff14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cfrp7a6Zkqlmy+5Ng7sLFzdcJEW6YkVy8GvcGLgpDgj1tAPvekby6pCjZhya?=
 =?us-ascii?Q?ggL7GMbztdBfV2Ml52cCdtk812GlPhsf7HInIDtigdetDbxhhiMTnezLWIFC?=
 =?us-ascii?Q?IRHgsVSqQKzFMJ2ICDBggI8bpA5XPnd+A3tFf/4urJZTr6CtGIAIxgLHNo6z?=
 =?us-ascii?Q?QM3WurNDk097wf5yy9bhHEPCQSTExUuGlPXQ+TWBZ7UJeCimtM8fxVsg0rJF?=
 =?us-ascii?Q?0ZPLpIm3wvyBR3El6WQLh3yxdDUmGRXnYPc33pb51RxAc0uND3oyEVECrkxz?=
 =?us-ascii?Q?jjXsIgbyLodTQTClh53thnzfgIL0BlJcU/+bvF1yI/ZFLQ5Ng85Lg1RqHRkP?=
 =?us-ascii?Q?9iBGwt9ecxMkxbHjfVdWaEPBz0BDyyOacYYW99wiH/NuYHkLcqC7daSkWiWJ?=
 =?us-ascii?Q?3S2KR+9NrFf0LCedGLKnPQPMoJw9va5rcYvsdCDHlxfHJJBiI0kHfoKBkf3V?=
 =?us-ascii?Q?q8yqT2YikcRD7p5Bg+TybS9yjxL4CR35cgs2hPcM+WXpj8Fqs10sKhOwzcWF?=
 =?us-ascii?Q?L7Dw0WuZK4ESnDmd2GBRa4ya8QzIVdtyk4M8z+Dd7LFkw3sTYpRXH7uQ9oLL?=
 =?us-ascii?Q?KS2mHPFSgu4IsAf0o6k3wGBaEGMNteu2jbBOQr2n8wSJTgOnuxdEdsPpNbcx?=
 =?us-ascii?Q?/TAr4Fd8Yss8oE6doxxIipYLCOryaHDDRW9Ez0yV4S+kngvcAQv4QCAQSAtB?=
 =?us-ascii?Q?3LeKxPPB9HEMM8smlN5/xzDc0OPbjsSrxY3ppFZd4Vxl8+VfFApqCGiCmcuG?=
 =?us-ascii?Q?lqkvTtHgqqXO/3B4+T0dW3YA/l5M35HRsSDuHK6T3rtJP0y9ogeMaBuR9qxg?=
 =?us-ascii?Q?eDMgWerjwdlVSCxVhnZgpQBWx9nsiAu1QVfb2T4RzFQ01VLvj4EfQVLooAZA?=
 =?us-ascii?Q?UKwQjfjnbTKiRpTceJ/6C4kDG9G6Bm5Rvldep9LYTBMcbvi4WASbn+hLE0S3?=
 =?us-ascii?Q?mVVbcP2WYEDh3nFmbo2X/p5SIZ/mLCdhRATVZSuR+liYzBIj8PTJgjyuHwwF?=
 =?us-ascii?Q?h+0Wk2dnuSjcWOCd+vcYGq0Ekt4P33KA5btoou3G4rriSjqhfRo8jCF36jIY?=
 =?us-ascii?Q?QpovgZjJap9l0dPk5t15lti9wZABc6gNNdrWcB/1Bv/JJZrfSGJBByRWlIYW?=
 =?us-ascii?Q?qokvbg2fUk093be+HcIhCEwi2lwZDxrIdmPr9aMl1JBgU8PG+Om/DzumXfJ9?=
 =?us-ascii?Q?jzj9UYK8fotuPvKF5v0liALtitR6mmQoQHY43+1S0Ny2DeWX4fNpcvSBNvRS?=
 =?us-ascii?Q?TFikXhfn58pwK0RAfz5Y3W9Lp6Fgh6Dwrgmav2eUi4Vzb59MSB8WmMGLZc0T?=
 =?us-ascii?Q?5fAlJ2b0M8Ho1eX1oEfyUtlM5FIxKKZ6TGGAOVsdj6FAUG56GVNT4I8A2oG6?=
 =?us-ascii?Q?4qG9WBvdDjVra+yay9J1rPvpE/VI3bvr+DR/027oMOL3p9capg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mtwK851mZLi8uSnht3UuPpKeU7QNWUhBGgiC0evSBS9v2+wmZZShYY3j5Xss?=
 =?us-ascii?Q?fctypJksb37E0pKWArtA/NVwWAeEb4FZMFaD8Ek2Ixp2/EmxCPLAUJm8nFvO?=
 =?us-ascii?Q?LYw3nJj0eKqSL0dOhexHKD+T4sR92rZvOFfunqexu8bc8vcMc5iR7Hhh1dPW?=
 =?us-ascii?Q?QrUh+P9JaVYX0vNtOt4VZ7jpnwNh00TXU7eBVHnaUpbmnNEhs8wQ1fJIAx97?=
 =?us-ascii?Q?nsHiv42vprtYWMF/619MaTL3lp3/i6FLwS8l+abGQ60aRbRe13XplS2BaVRg?=
 =?us-ascii?Q?sOH4P3P4bCis4uOuV9RuX44qDZWdh9qY4BXde5qkMJ5kxf1GXf2KMyZOQRje?=
 =?us-ascii?Q?dxsE0nvA97ZWfaY4x8gLGicnA+YCGlGgTDuFHa1J3IJvbMxR0QEvZjPkd2tb?=
 =?us-ascii?Q?MKuxO/8QiBV3bWHFpX2WSsKy/6CO9mAwIkQ2/Ks7OAfZ1J4iWaR6CmEnz6qr?=
 =?us-ascii?Q?82WKITBs0gaU8zw5eUyixJ3xvcB/xX6H3Zg1Qb7Dd4qboBckVMFIISAmbGQ5?=
 =?us-ascii?Q?fEb1fMNca7pj39TSufcREQhi8y4ssUVN0O0zz7PsgBLMfkXvgQxCIU9oXsu8?=
 =?us-ascii?Q?STfcL7QQbUOzUTZR8Qh/Oi2HpeE6ZyBvZ6A+ZCCjYVcrkHNeTww21mTSlmNx?=
 =?us-ascii?Q?8LVl8hMok86mJiNRCuIL7ODeMjd0mhA+iZMoJQytnXo4sieX2vLc6iBVFv7d?=
 =?us-ascii?Q?HmFCK8T4bz6qQYhNTrtShhMO3189AkHYBlDv3lvYSVeOq/12IY5BoL+VZqI6?=
 =?us-ascii?Q?vlcEDEFlpWiRAfJbdmAB0ui1hLUYsQumVN4bGIBfXZOWn3elN0gtZAqD7GSO?=
 =?us-ascii?Q?jCqpBOmZc4AHe0I82va6Nkc7xvjZmsfQNnJvbBdjQEWfqoKCjMal8WY38hJ4?=
 =?us-ascii?Q?81K7DTSZJBG5zGFeigh8tTVl00ZRgI4+1HfmCR9FHluiEubps6SeCjS9j2I9?=
 =?us-ascii?Q?A2B0NEvEoMJGIgFZbBspFQ6th5+T3b9h1zKBohhsA6/8TuOH8lkM4sOWJqz2?=
 =?us-ascii?Q?apWoYMoKwAx18yHNOXUiw2D6vBEQfaoehYcrPK6C1PLnsna5DKCeU6j7gc/N?=
 =?us-ascii?Q?o8HoRrLpIcdP5kx4DqXwBfsTuXSkUdSPjS+Uh4HRdoAvqH6WbdP02ldeqhWH?=
 =?us-ascii?Q?p2a/0MSMPuCfU6v3yOtX2GzJj+hAqq8H012RBtiFgPyqatdFBgODZAEaFXRg?=
 =?us-ascii?Q?kbJjvdyZ3FR7b4Qr2zLrJZvav/fa+iRl3c3tjwO9EY+3EtvqLPVaO+2+vVP3?=
 =?us-ascii?Q?zTYxs94LrwUiw1xnGpbngRfsK+a3J0LAWYqI8rnFUBH9TGot0KHBB1WDVIA8?=
 =?us-ascii?Q?ACtxUp6gFfSdbqRRUHsWoDN47hAA4bKmXza+/5Si9pzCn5TrG1SWQXJw6QUn?=
 =?us-ascii?Q?ciawYR2vy34f2bBq9iXop6G50gAMvNoFLG0DISZOOAHG+PjC2UDcaMWgO3YC?=
 =?us-ascii?Q?tZQP9W9mRzQFkgC/RvyW6zntNxXl/sv03p5Ax/tezLhyKCVDCcns2+AKS3sr?=
 =?us-ascii?Q?LDL/W2A1lV9NW910Nmj2MwHapttQyPlIcYatssBGnHVSDe4ID2BpQ1yrE7jz?=
 =?us-ascii?Q?7vOeK1ivNjTWlV+6QQXsroSB5njsnXN6e4VQglKl1g/A/EpD3bmLfbkAs4LU?=
 =?us-ascii?Q?rjwezHWoIQQ0fErzGAD52z8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef60f9c0-1090-412a-fd2c-08dc9af4ff14
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:13:42.2890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WyHrfvvOMCdwWLUi1FZr0gxlP/IRBQpntLg6aE1VELljKDLyn7MWvMGAE3gRac3Y6JIEZf+0rkK6lwsCrbknpXIM4kftjXDD3lmzcYLHzyltxu9VzeMCqxVLR3Nlpnd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6179

Because V4M supports only 1 SSI, it can't use Playback/Capture
in the same time. It select Playback as default.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 2b9a19bb1c5d..ecd0a67bb8dc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -5,6 +5,25 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  * Copyright (C) 2024 Glider bv
  */
+/*
+ * [How to use Sound]
+ *
+ * Because R-Car V4M has only 1 SSI, it can't handle both Playback/Capture
+ * in the same time. You need to switch the direction which is controlled
+ * by GP0_01 pin via amixer.
+ *
+ * Playback (CN9500)
+ *	> amixer set "MUX" "Playback"	// for GP0_01
+ *	> amixer set "DAC 1" 85%
+ *	> aplay xxx.wav
+ *
+ * Capture (CN9501)
+ *	> amixer set "MUX" "Capture"	// for GP0_01
+ *	> amixer set "Mic 1" 80%
+ *	> amixer set "ADC 1" on
+ *	> amixer set 'ADC 1' 80%
+ *	> arecord xxx hoge.wav
+ */
 
 /dts-v1/;
 
@@ -59,6 +78,24 @@ reg_3p3v: regulator-3p3v {
 			regulator-boot-on;
 			regulator-always-on;
 	};
+
+	sound_mux: mux {
+		compatible = "simple-audio-mux";
+		mux-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+		state-labels = "Playback", "Capture";
+	};
+
+	sound_card: sound {
+		compatible = "audio-graph-card2";
+		label = "rcar-sound";
+		aux-devs = <&sound_mux>; // for GP0_01
+
+		links = <&rsnd_port>; /* AK4619 Audio Codec */
+	};
+};
+
+&audio_clkin {
+	clock-frequency = <24576000>;
 };
 
 &avb0 {
@@ -87,6 +124,15 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&gpio1 {
+	audio-power-hog {
+		gpio-hog;
+		gpios = <8 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "Audio-Power";
+	};
+};
+
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
@@ -139,6 +185,29 @@ eeprom@53 {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ak4619@10 {
+		compatible = "asahi-kasei,ak4619";
+		reg = <0x10>;
+
+		clocks = <&rcar_sound>;
+		clock-names = "mclk";
+
+		#sound-dai-cells = <0>;
+		port {
+			ak4619_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint>;
+			};
+		};
+	};
+};
+
 &mmc0 {
 	pinctrl-0 = <&mmc_pins>;
 	pinctrl-1 = <&mmc_pins>;
@@ -193,6 +262,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
 	mmc_pins: mmc {
 		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
 		function = "mmc";
@@ -213,6 +287,40 @@ scif_clk2_pins: scif-clk2 {
 		groups = "scif_clk2";
 		function = "scif_clk2";
 	};
+
+	 sound_pins: sound {
+		groups = "ssi_ctrl", "ssi_data";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clkin", "audio_clkout";
+		function = "audio_clk";
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>, <&sound_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* audio_clkout */
+	clock-frequency = <12288000>;
+
+	ports {
+		rsnd_port: port {
+			rsnd_endpoint: endpoint {
+				remote-endpoint = <&ak4619_endpoint>;
+				bitclock-master;
+				frame-master;
+
+				/* see above [How to use Sound] */
+				playback = <&ssi0>;
+				capture  = <&ssi0>;
+			};
+		};
+	};
 };
 
 &rpc {
-- 
2.43.0


