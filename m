Return-Path: <linux-renesas-soc+bounces-6668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFF0913F80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B054D1C21173
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383547FD;
	Mon, 24 Jun 2024 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mYYlejv+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2067.outbound.protection.outlook.com [40.107.114.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7E621
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188201; cv=fail; b=k9EK26za5uCKJCqum+EpGMEvBniMd7owMfrsblJjmd5qOgZwhcaCxqlh7mg9rsAcag5VNGsyVXKSAgtLtpVgwCfr3YXh2ZJGTir1SL46WzgdInCTeN16a3htikmMfmdVga6wU4XCKXDC6Y+O6CBrZoi2ozNC3A3tq1PamKbufJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188201; c=relaxed/simple;
	bh=wuWddwEy3cPIIOu3OsUjhG/Tvw6swL1AXG1job19SdY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FiT/1Fmhz1J4BbwisQmhrNNe2jjz6bTMJA3PGjMsx/dlp3x+fCtrTHCchwLv4SI5fFGKRcSBzu+HdBGyI7DKlUZMy1s9KKAtkw0vygk1rcx0m0TTICx45ncVbtrIFlDBk8sSoVZfzNaT4ita/gCrjB+LqWnVKyRxNKnRBSNp2Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mYYlejv+; arc=fail smtp.client-ip=40.107.114.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcyC38zJDHno6HjmnBiUD5OVDc61hqqBrT3ZKIHIPAF/v+zsiBsBPTg4BMwgWHfDdHjKJx7B7wpVPP2lGi98gKX91em/DOq/899SVCLOR+JxTcO09HsKGMkW6Ks4E7VEPAs2ekKVVIeIYN86NrC+BBbdQtDOTXmNCUDhAAjRaTH+thadcdZDNp1+5DHQnXWw3Iiq5KtmRZPEbd0fGSNT6fWwZsHMAKkK6Hy7GkU8tQJzXWDA4y6mxOaQqrSGjW35qaz6Sxbg51oCYeQ2NHL+e8kSqzUimk1NZMwWMB34pFAnP6/7RaI1PVejmgiff/4+Km+IErZXDMZz4Bo3ozLDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX4cqayjqk2V41NXbaBSg27IBVMBiN/Q279yibIuse8=;
 b=JNjrq3XgWhndUfJTo+k0WUoWVbTcFDFSA766q/3qkisPokG62pVRQfyOo29z9p+3njWsHA+8YRtzoq+vY6qWlZbQ9xUGleiVAgfUHTlBBlTC39zlwfky/I5/y0ySR5d9g5nHKKirm7oNw3Mmr1AKvmT1H9yY00Mb7prUwVSYNmaiiz0dZuBp0hHaGhnnYIl/gyxXVXNxi/Hp074BqpALCKAHEbv4l4tcqreq8kUZOBTZLJc6zmzPoMYmVPDlkF5A9T3bHAX3L61DO65v7cued3A/SukvOPLVwOVdgbx4qJ1g1VbV0XZzsZMA+eVoFfQLxv7k65Ad2xbWera6ymD+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX4cqayjqk2V41NXbaBSg27IBVMBiN/Q279yibIuse8=;
 b=mYYlejv+43ZIa5tLWvb7GF88oBbobS3F7OlDLRbj/0KYJeyB33ss3BQszb+KjTKU6OgpdP6/2swehwGGjKraji1ad94Cpds9hCWs2Rk3K7ruGUazey7PMyR9uWFXcUjbCBaYolI9KeK7eoTHFk/XtnHDtm6JM2PeX4yAyb2+uN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12050.jpnprd01.prod.outlook.com
 (2603:1096:400:405::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:35 +0000
Message-ID: <87cyo7kxek.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] arm64: dts: renesas: gray-hawk-single: Add Sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:35 +0000
X-ClientProxiedBy: TY2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:404:a6::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bed33b-a9c5-412f-865c-08dc93e2e8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5mLHgVbRcWsiGfjasOM+EZDvMo+Pr1lu5LF+V3aujVe+W6yH8vKp0RwA5Co?=
 =?us-ascii?Q?g28PwxVojnLzy+wybLdxQ4GUeT49G6yRxvpyKMsBHL0D7h7G6AFNRtPVDpxO?=
 =?us-ascii?Q?St+zWFUPcKN/hY5vMtHljyse2R1A3xMKIvE398jQZ/uZ51Kpsv3/gnvHMaJY?=
 =?us-ascii?Q?u1tGsydwClEOA7qSb3eTUZMiYlfg01WwJP2frfllzC5Y5jcw/4mVZ6JD/ixw?=
 =?us-ascii?Q?91cI/WJ3yCzm9gDkitz0bESzCBg/E0wTYtkAbQr27L0CsJaQwLDPPjpr7M9F?=
 =?us-ascii?Q?fCe0PEJMQInfjvIgEfKjhJ0GkfjcDcUgypAfmM1d/ciAYsTz2t0phW7XhAR7?=
 =?us-ascii?Q?ya6V958MTQ1RngGHGJ6kpwEbTGbScvYRBs8J/qwHp/oQUPezkzMOHN+kaVLC?=
 =?us-ascii?Q?Sl0tq1DQ7fizlsB3zTTtiqXEQ3RJxUOFQwtDRBQYjne7CCB5iz+gOyXsZZSm?=
 =?us-ascii?Q?8aChXJA+4qiLV2K86iUwWQ0Nm89T9LaQtC0wO+E2BrhWIudY9keNEvEt7Wja?=
 =?us-ascii?Q?fyPAK0rF9Ys3TPGrTu/idOw68S18Rpg/04lSlZsMgfObeFGW0nl/1HZ+r2qo?=
 =?us-ascii?Q?gXjxZAQVqP1VLrOEvn2fyTRjQo4941qVamNkjwsS5ZAjXYx1YO6sCcfMKEcL?=
 =?us-ascii?Q?TcZgWkJ+8dk28slc0B0wZV7mETvlSQCW0YIAT9Yo3TD6r2cQJ0hBgmU53d/k?=
 =?us-ascii?Q?aHbGB6IF9hzrNME/f7barOM+fS6BAMPwkcDkVMa9aGgg5AjtXrOJfrjaqtp0?=
 =?us-ascii?Q?kwnTRjpVchCrkzpIJTR4aZGkY18g01jLcQ17OUkz72oALDsYurajCmKRtcZl?=
 =?us-ascii?Q?IdJ5oBRh9GS9yipe/dscH9n8SLPsmo5iKyWLPOj32S/H9VIrHGbH6H+HEeAn?=
 =?us-ascii?Q?Vvft8EPzDzfLu9pIGWPZQudxwoba0APVBsdK8AwKoA5NAzYSh7E+7od7a9N1?=
 =?us-ascii?Q?qZImG2KEGB4WZYuPqze8I+sGl5B6qtGrR+LzGp0E6xBCWh9zKHc4nlDlV9LB?=
 =?us-ascii?Q?tG10vZuOkFFi04hBXdQj1J4rF+0t02+HYs+SlmZeE+fX+4uAmkQkahi5cy6/?=
 =?us-ascii?Q?UpcBoNY5/ajnYMUTMbrkrOxddgj5sma9Mjq1h1oY5SGmSrlbsG9VGrUbs+u8?=
 =?us-ascii?Q?s4bnsiYM4Wv4DTGpld21BHmCTspu9X7pZtOQZRc5L5ryBYZHvgBUnbrcpTg5?=
 =?us-ascii?Q?gGB8CmC8fEFvFVWrSs4n2Ko0g5LSd4XVOGzfPnqjnEmUn3/wVbSUITpGR7LB?=
 =?us-ascii?Q?C8epF7AtvWOsoKKiKJebeTdaNIpQPhsBCpoHN2RaB8uxMhtTxR0a6VZ/kQlW?=
 =?us-ascii?Q?SUsl2LmLHWyfUx+srxDs7PWg3qj3cHloYGYKVa1dvlKhZEEXpmQl/z7vgkOc?=
 =?us-ascii?Q?lv4FAT8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEB3xie3JevZo2iuBUbJdVgFu+DUOBAxbRZ1wZXYneaOJJAEIe0M/WB6EcTU?=
 =?us-ascii?Q?kW8U07HKzWBCf5WIBz81OmA344y/i9pgF2T955RNyeiL807O/vuEkgn6ao2/?=
 =?us-ascii?Q?of6wZ3RQlmkCmI4+JxqIU4bldKESDALRwJT5mpR1+vFKQ6zKwI89O0aVztut?=
 =?us-ascii?Q?9xzse1t1Hf3Ro+Dv4pIr+1hz0dqiEuCEMjvVyS3v4YwHmnG7kYrfgeLRMEXt?=
 =?us-ascii?Q?d9jEF/VtiM3+AF0dNWo6lyjKIw1Co4AV1JwBi/lOu0Owia84YT+04+ViI1FW?=
 =?us-ascii?Q?0XMeVVClmY6NPSvtb2dsKcFZr0IfvQExKGLOdvm9bcJarN0Lxf3TmxSWaTcy?=
 =?us-ascii?Q?25YhuZk/GhO8y0JdEsWwrGmf69lyvHoh3EGrozKqyePvaRSkpeorgykdjtmP?=
 =?us-ascii?Q?zob0vG0R/v1f32yDAt9sAWOydlKorSsKP5tdlD8ZLa/bgyPsPB3IaCwM0Uxp?=
 =?us-ascii?Q?pgaDT1NPuRZ4qXYzrr+JXvAiLwL11KJZEdSGDSeVUBXC2Bi4Vm9CQx3yappP?=
 =?us-ascii?Q?wcp5LVa/dnfUBF3rmBdYdX6trlOiY3PK5Otr3gbC04k7oOJo/qu1qz3syTnP?=
 =?us-ascii?Q?5OUd99Ev1fxziAULG2thzIWsKDIQQHAWwKMyK8BADnJOcYoHfK3JBbbwyaC8?=
 =?us-ascii?Q?ix7jjSGCq4ysV+wkzeV5oITQf4+893fMiK/W+uPuwIC7ULVEiUNolkVGj+h3?=
 =?us-ascii?Q?t1Lg+4JgKFiP/V3jFnmE6hANRv961CbR8T2KZ6uFEQAK/KF6k+QCianIGkIV?=
 =?us-ascii?Q?oSszJfUKHL1CMujs5esgbF0BxcJp04EZTfv+hQxn+IVyEoduHm58lhV50wuS?=
 =?us-ascii?Q?/zfoRolRKQ/7hnGzED0OmTzAph7UFFwrCERIaVyUCIl3vfd98gD91Dnu+bSa?=
 =?us-ascii?Q?4lNl2k8Mc3URMggyLbNaweVtrpO2Yngcy4jmg8xPybI4wWm8pLabkIu3YXUk?=
 =?us-ascii?Q?8TOuKlEwQDWZD6Yq7XFGkEu6Rkxi3KCo1aaCLhx8p2E7UQMYmXstGuifXrBc?=
 =?us-ascii?Q?IhEjuurt6+oezP+5YD0KkHVp5cgRRnQC8dpfgPr+o8mjIeyX4kt6apstLFaK?=
 =?us-ascii?Q?itweZPeuDxEoMatVIxDsTsR4y+53YHgP0QpbyXE1kWNNUmLZHtZN/7OYoI8b?=
 =?us-ascii?Q?be4zJ50d//IADGGLoXXOxCD65ljr8/yUZ6+diP5suPHdJigNhXxMjfUxt6Ej?=
 =?us-ascii?Q?3lk1Q6KYwL240n5pd88jIa02ntuGQKVCugvX36uGatxkL2rsD7HVMrYse+T+?=
 =?us-ascii?Q?CjLvsTFQioihhCZhp8Gzd5OGKbXL4mkUgKFUu3T8aCFeGVFGrKyorWBiRO+U?=
 =?us-ascii?Q?dWWIJeZox4Wtyb5eIobkGl652K3CsLj/ULlKLbndPKjDWgSXV5Ggy7E5M2K3?=
 =?us-ascii?Q?Pj6/2stsVQWtMgRauEilzY7iFn2JKCY4NhZm//WSmdZhGoypv8PqqhEBIbXP?=
 =?us-ascii?Q?LSdYcwKMxDkYiIpcM7UkOt5Xs/YThQ3C/wkcusvmJWfKGM7Hk9xGEz2TrDpU?=
 =?us-ascii?Q?lf2IhV5FHP2upOlf1Sp1QxhtVk2AKfUnRhl5RjoPU8QBFrvr6yo8286gCRWo?=
 =?us-ascii?Q?Ju8UWkRhTrUa/NE3BxQCmHw3mTaFfGu3eJrb8VjpSHZL+6gA+cl9OrCQZEod?=
 =?us-ascii?Q?LJhVwhdhvG8k1y1HOiuXGCY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bed33b-a9c5-412f-865c-08dc93e2e8c5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:35.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQWJdJs1bGzBd79b9CkL4heGVnvDv2iprU3MjmsyYyY01S5jXRmhhH94NEdmFjYgJjjvYHEu4764pOsumJjeXjlfLmCCKExP9AYksrZrhxX8Dg7kCFfg+Syjy+gLqSJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050

Because V4M supports only 1 SSI, it can't use Playback/Capture
in the same time. It select Playback as default.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 2b9a19bb1c5d3..717251124a744 100644
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
+ *	> amixer set "MUX" "Input 1"	// for GP0_01
+ *	> amixer set "DAC 1" 85%
+ *	> aplay xxx.wav
+ *
+ * Capture (CN9501)
+ *	> amixer set "MUX" "Input 2"	// for GP0_01
+ *	> amixer set "Mic 1" 80%
+ *	> amixer set "ADC 1" on
+ *	> amixer set 'ADC 1' 80%
+ *	> arecord xxx hoge.wav
+ */
 
 /dts-v1/;
 
@@ -59,6 +78,23 @@ reg_3p3v: regulator-3p3v {
 			regulator-boot-on;
 			regulator-always-on;
 	};
+
+	sound_mux: mux {
+		compatible = "simple-audio-mux";
+		mux-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
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
@@ -87,6 +123,15 @@ &extalr_clk {
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
@@ -139,6 +184,29 @@ eeprom@53 {
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
@@ -193,6 +261,11 @@ i2c0_pins: i2c0 {
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
@@ -213,6 +286,40 @@ scif_clk2_pins: scif-clk2 {
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


