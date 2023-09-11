Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDF479A103
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Sep 2023 03:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjIKBoi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Sep 2023 21:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjIKBoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Sep 2023 21:44:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B1C122
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Sep 2023 18:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru9O8IfP9qww9RH7f+TJx9MOp7i7OP7EJjQirzrgcqwM1/SFMWdMfZkVjqXYx6ZgofvVLrEW/jU/p3zPjC//uraMEK/s4q/dwKL/NvFU73g2Ms+wB3/z9COnDiMvdgcUNGLfU82Mj2DXsRtQYCTs3f73v5jIyLcPDDvq1cJzWlCSkWxXB6jKh1A2L6v/J7FndiDFnvcUVPIQzdt4H/5INvI/6Q4ipiSpayHvd+ZLKbQ0av6+BVdeayjKJzlsEnNE9kkzhCRUJEzVz/eMlXQYfzT9k5dTgUB+i87pqUG+wBgn0H1Mru9eWoo8FPKM6hKFL7N7yHHayDd+wmMEqhPlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R864of0RUmVQYHq0EFkBdK39E5MvytlC1TXmwG8b42U=;
 b=Z9IacaTldE1A1yRys6LOwhsuJwXlG2JqAMHtOiGqHwQDFAh23zvcqeKyCdTX5pvFG2wibXrZHJ3ks5hn/ikOedOoC595UUSAqZEhyclAuaUYFb647yRLWnEjCPnTaJEPN8RguJeOUR41DL5091i4Y4Cfo+BY+Rm4+rjG50tY4KuZ6W6vnF6xyPc1sDL4jT2WS/SYLpiGzOKKa/RFYIwW1l9Q1THUqaB/bzps+SWYgiTTIJTCmnA/LtcJOAfNH9uCfCk1Kz7MoehmaztWlgE8k4pDLgSZX/3CahQELPjWaoL8dg2ePS2eLe2cAzQ3C9d80YTxkFlsxyUsBRDf2cMc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R864of0RUmVQYHq0EFkBdK39E5MvytlC1TXmwG8b42U=;
 b=IKLrgn79LuMzhNFPR1CceNu+EFuNbxKs30RBfX28oO5VJzvNbiD9v8ojTdInGh2f+Lopj/4kRzikrXMMHfonR267zc+d4k559a0A+GOUZ5qXiWqHi+0TX23JyHo4UmUN/jmaXMNQMKG/qmKtcxo9sa/7q8XeDi/prs+gb6Tg30Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8487.jpnprd01.prod.outlook.com (2603:1096:400:15d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 01:44:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 01:44:25 +0000
Message-ID: <87wmwxh4av.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: use multi Component for ULCB/KF
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 11 Sep 2023 01:44:25 +0000
X-ClientProxiedBy: TYCP286CA0267.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 9241ae57-194e-4e5d-4a47-08dbb268a135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PZtpDJdmXAvVfOUJrm/A/edODySOI0fPsYn6Zzt0PxBHlYVAF9etQOU17xxkGFRlbmlJIrKGeg39NcovzT9I1izEdosuN1/fRCh2bNQYen2Ie5vI10Yg8vaEyXBWGOYajuLVcx6xrgqtHPEDMkQ4SVmEX20Auc6BQm7ipHlk8O7fFt4VOVoVutmtw7uIt1Z0RZ/ExaXYfN5ena3AsTK2y7gYT3ev8EXnnOkZHdOVbo4M+XS8xX0WmxzTxb62J6htAQct9LjXZoU3iTjcQAbim2gA8Y6jgV1CQmkxf2+oEY4siCDs+8WLFUFF6OfLdkjKBx7JGgj2P+Gw8bV7eowMhhXq1RnrulN0Xjqoo6odh82VyNGgIMItFNeoalTn+EPTas0jVGRPNWbHeQScmjG/kbIlDRWdx9UHbQ1+yaxgEecuNKjXNZjB4i0FK/iKoritTUyKIORhleFhxbO3y/fXf3BjNAlWJrUdeLjtya/ByDmIuOxPU8bcF2Ic/Vq14EbqO3zaB+ZfrDZ7dfPuyc4VRA25eQjCNIkxhBglLEENw3lODGmSw/XbykQHeaLOHPXtmaDXQ62AGtbC7Rr3o4t3nlGd+MIMCd/BVwXBzS8WjVzwmqAZd3HKCoEfeRdbil2eXAmRhyYdi+uSLm/Bn+aRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(52116002)(6506007)(6486002)(36756003)(86362001)(38350700002)(38100700002)(26005)(2616005)(30864003)(2906002)(6512007)(83380400001)(478600001)(41300700001)(316002)(5660300002)(4326008)(8936002)(8676002)(66476007)(66556008)(66946007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfPR6SP1pAASkerzEmN5nHl4mfJgkraDiRRlcEoGCOz9JeYUIiTYvFOjLEBU?=
 =?us-ascii?Q?zoCX0v1qZDJthWhy8SIbPk6AkiTzRIzOpoVFn/t5AupgRz10a6XeWwcPX5O6?=
 =?us-ascii?Q?aiFBtsUIXUbH83IJhdLOZDKnbi9lTNMAumAUd84MyO9vPtJPSQaKLLKXxoHt?=
 =?us-ascii?Q?WHMwrOkg3d5yXanumtEpLrjmIpkl04dgm1mDzJCcTRcDGu+ueBCcpiEejDmr?=
 =?us-ascii?Q?6ngejTNN8bI/k3/7F6iCTIKDcpyskwcJjfsm2rGzEWm18EepMusDLSULz25E?=
 =?us-ascii?Q?L7J+nzMOKJZzmen3DEFxkRAaVQCSdftnOMj7ZRssThdv0gBPNBMBiQi38Hys?=
 =?us-ascii?Q?+eRPeOD0G2VvzuDRtmtJC/LPSbm/GZQWEXUuCSHki4RSFub6qi0UO/ZsGsVR?=
 =?us-ascii?Q?kenXaT0o0kbOqjLLG2tKSnXmEhY/hSSE8IHIH/+QCy1y41yo1qkATneOLAk1?=
 =?us-ascii?Q?q2O2PlHVb8V9rohySC8lIc5lXPJIy+OHIg561WnSux+C0F8XL9OORVNam6r3?=
 =?us-ascii?Q?QlojQI5QAQchGTbTOMV08bnKkZhF3WTDq60p6C9xKLVHbmWq5Dpx74UM+5MF?=
 =?us-ascii?Q?YYw8wa7fjtEWNGYCc+C/CCuKeWQsxnd8Fw6wy5Bf+nMtoWzITAhzOixM7+xP?=
 =?us-ascii?Q?PhsNH3jrNoxa55a0hchUBhAYQd9mFO/B2BtoFre8spLKXeIbhQ/nRiBAC6Ho?=
 =?us-ascii?Q?s+JLy4tFpCaAIGR/77/qfx4FvlipA+eVQmv584UTksP1Ml6j1KNvqqha1Cee?=
 =?us-ascii?Q?xLGzHsCibHaXhY0Ske9NLvvD5U6h2w60ctwhv8jdb9DhB2g0wml0rkfnVZS/?=
 =?us-ascii?Q?lrgpm2e6fhKFF4JV4QGFGDLDPgIxVUbxcXtZ8YSTjlSkNuAKp+qQFPYqUQjp?=
 =?us-ascii?Q?BTi0dVa5BD9/YDRZjoyDqy0vcCoDeHpvEj7xeJ8ryd1m409PzQLDdEgfIvAT?=
 =?us-ascii?Q?b1Pqlzue/TTzzoMk6bYUbIFtOImJgVxcOfCAnZdYgP0GTR1/amU78SRhgvGw?=
 =?us-ascii?Q?laNVZbZacn1xPS7f+JuDEjrJLoIe9h3UtVLlhMyP3mgRttfIEz8QxdKwWnQ3?=
 =?us-ascii?Q?u8nvIqhUG0LEXWbQUu6k2oRfZhRpqqCWiTsO7+TOq84v8gGGWiQdJ5GbO2sX?=
 =?us-ascii?Q?Z+ymxl5kjB44VWRyPGoEFi06ejcY48/drH293lfz3800INXaOzJtlqDdx2wV?=
 =?us-ascii?Q?KJ54OdP3G//IluJCnrjtCoFCU2JSK8Ai9aXgOjtW2FXHfNMeRYxNzQaC3Us0?=
 =?us-ascii?Q?HA668d0qTdEdP4UrBtVYEs3IPj39JT/IEiVCT3d2pCZ1MfVooJTxsjFnXUGQ?=
 =?us-ascii?Q?05n7JFmQsgqs4GlwYgqz8/X6Ebnaw/NATQQ9oxlbs9iHJnqXSgoyBJIlMZUq?=
 =?us-ascii?Q?a3Vsk+HvpbHDiEKxEueYkktR7UNywEFn/dAsSRDYYoZuxsbWNaOoEGvA9Usy?=
 =?us-ascii?Q?tN6sn1/yqf0u3EPe+RB4Asu06E+9nsS8J83Uk3C0mjsyrcCF+vmq8BLoCHej?=
 =?us-ascii?Q?dFeskLKZJloXp6LLhIMIVGLye5FrGAX6sq19mYXDWeIyV0JPytFqO/45KohN?=
 =?us-ascii?Q?H5Bf40Z5km7QxTmw9YWfl08wUssYgHNJNwfl35j4pcuat38danAZNwn3l/z2?=
 =?us-ascii?Q?kfW1CtEb73xWW1HztN2vrIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9241ae57-194e-4e5d-4a47-08dbb268a135
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:44:25.5751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y336T36i/YwKjzotWvMsoG7V6IVRCxNECyqq/3UN4SDvWhR3yNes+p5ulBpYbkYEwj7dNXlr5xv6PKQRoN/Yy1ebuTRzXguROSLBV7QwDdZKSkhm21f0sgWliFkMaBuf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8487
X-Spam-Status: No, score=-2.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	+-- ULCB -------------------+
	|+--------+       +--------+|
	||    SSI0| <---> |ak4613  ||
	||    SSI1| <---> |        ||
	||        |       +--------+|
	||        |       +--------+|
	||    SSI2| <---> |HDMI    ||
	||        |       +--------+|
	||    SSI3| <--+            |
	||    SSI4| <-+|            |
	|+--------+   ||            |
	+-------------||------------+
	+-- Kingfisher -------------+
	|             ||  +--------+|
	|             |+->|pcm3168a||
	|             +-->|        ||
	|                 +--------+|
	+---------------------------+

On UCLB/KF, we intuitively think we want to handle these
as "2 Sound Cards".

	card0,0: 1st sound of ULCB (SSI0 - ak4613)
	card0,1: 2nd sound of ULCB (SSI2 - HDMI)
	card1,0: 1st sound of KF   (SSI3 - pcm3168a)
	    ^ ^

But, we needed to handle it as "1 big Sound Card",
because of ASoC Component vs Card framwork limitation.

	card0,0: 1st sound of ULCB/KF (SSI0 - ak4613)
	card0,1: 2nd sound of ULCB/KF (SSI2 - HDMI)
	card0,2: 3rd sound of ULCB/KF (SSI3 - pcm3168a)
	    ^ ^

Now ASoC support multi Component which allow us to handle "2 Sound Cards"
such as "ULCB Sound Card" and "Kingfisher Sound Card".

This patch updates all ULCB/KF Audio dtsi.
One note is that Sound Card specification method from userland will be
changed, especially for Kingfisher Sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-audio-graph-card-mix+split.dtsi      |  10 +-
 .../dts/renesas/ulcb-audio-graph-card.dtsi    |  10 +-
 .../ulcb-audio-graph-card2-mix+split.dtsi     |   3 +-
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   |   4 +-
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   |  56 +++----
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  30 ++--
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 111 +++++++------
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  14 +-
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 155 +++++++++---------
 .../renesas/ulcb-kf-simple-audio-card.dtsi    |  78 +++++----
 .../ulcb-simple-audio-card-mix+split.dtsi     |   2 +-
 .../dts/renesas/ulcb-simple-audio-card.dtsi   |   2 +-
 12 files changed, 253 insertions(+), 222 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
index 672b0a224ef96..7f1758f893177 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
@@ -21,14 +21,14 @@
 / {
 	sound_card: sound {
 		compatible = "audio-graph-scu-card";
-		label = "rcar-sound";
+		label = "snd-ulcb-mix";
 
 		routing = "ak4613 Playback", "DAI0 Playback",
 			  "ak4613 Playback", "DAI1 Playback",
 			  "DAI0 Capture",    "ak4613 Capture";
 
-		dais = <&rsnd_port0 /* (A) CPU0 */
-			&rsnd_port1 /* (B) CPU1 */
+		dais = <&snd_ulcb1 /* (A) CPU0 */
+			&snd_ulcb2 /* (B) CPU1 */
 		>;
 	};
 };
@@ -65,7 +65,7 @@ ports {
 		/*
 		 * (A) CPU0
 		 */
-		rsnd_port0: port@0 {
+		snd_ulcb1: port@0 {
 			reg = <0>;
 			rsnd_for_ak4613_1: endpoint {
 				remote-endpoint = <&ak4613_ep1>;
@@ -78,7 +78,7 @@ rsnd_for_ak4613_1: endpoint {
 		/*
 		 * (B) CPU1
 		 */
-		rsnd_port1: port@1 {
+		snd_ulcb2: port@1 {
 			reg = <1>;
 			rsnd_for_ak4613_2: endpoint {
 				remote-endpoint = <&ak4613_ep2>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
index 3be54df645e6c..967db5f79eb45 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
@@ -18,10 +18,10 @@
 / {
 	sound_card: sound {
 		compatible = "audio-graph-card";
-		label = "rcar-sound";
+		label = "snd-ulcb";
 
-		dais = <&rsnd_port0 /* (A) CPU0 <-> ak4613 */
-			&rsnd_port1 /* (B) CPU1  -> HDMI   */
+		dais = <&snd_ulcb1 /* (A) CPU0 <-> ak4613 */
+			&snd_ulcb2 /* (B) CPU1  -> HDMI   */
 		>;
 	};
 };
@@ -56,7 +56,7 @@ &rcar_sound {
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		rsnd_port0: port@0 {
+		snd_ulcb1: port@0 {
 			/*
 			 * (A) CPU0 <-> ak4613
 			 */
@@ -69,7 +69,7 @@ rsnd_for_ak4613: endpoint {
 				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
-		rsnd_port1: port@1 {
+		snd_ulcb2: port@1 {
 			/*
 			 * (B) CPU1 -> HDMI
 			 */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
index 75b024e3fef13..77fff167070ba 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
@@ -20,13 +20,12 @@
 / {
 	sound_card: sound {
 		compatible = "audio-graph-card2";
-		label = "rcar-sound";
+		label = "snd-ulcb-mix";
 
 		routing = "ak4613 Playback", "DAI0 Playback",
 			  "ak4613 Playback", "DAI1 Playback",
 			  "DAI0 Capture",    "ak4613 Capture";
 
-		/delete-property/ dais;
 		links = <&fe_a		/* (A) CPU0   */
 			 &fe_b		/* (B) CPU1   */
 			 &be_x		/* (X) ak4613 */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
index 5ebec12358436..19fa6e1029955 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
@@ -20,7 +20,7 @@ &sound_card {
 	compatible = "audio-graph-card2";
 
 	/delete-property/ dais;
-	links = <&rsnd_port0	/* (A) CPU0 <-> ak4613 */
-		 &rsnd_port1	/* (B) CPU1  -> HDMI   */
+	links = <&snd_ulcb1	/* (A) CPU0 <-> ak4613 */
+		 &snd_ulcb2	/* (B) CPU1  -> HDMI   */
 		>;
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
index 9b01354940fdf..aa403a511497b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
@@ -19,32 +19,31 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
- *	(C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
- *	(D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
- *	(E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
- *	(F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
+ *	(C) aplay   -D plughw:1,0 xxx.wav (TDM-0)
+ *	(D) aplay   -D plughw:1,1 xxx.wav (TDM-1)
+ *	(E) aplay   -D plughw:1,2 xxx.wav (TDM-2)
+ *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:0,6 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav
  */
+/ {
+	sound_card_kf: expand_sound {
+		compatible = "audio-graph-scu-card";
+		label = "snd-kf-split";
 
-&sound_card {
-	routing = "ak4613 Playback",   "DAI0 Playback",
-		  "ak4613 Playback",   "DAI1 Playback",
-		  "DAI0 Capture",      "ak4613 Capture",
-		  "pcm3168a Playback", "DAI2 Playback",
-		  "pcm3168a Playback", "DAI3 Playback",
-		  "pcm3168a Playback", "DAI4 Playback",
-		  "pcm3168a Playback", "DAI5 Playback";
+		routing = "pcm3168a Playback", "DAI2 Playback",
+			  "pcm3168a Playback", "DAI3 Playback",
+			  "pcm3168a Playback", "DAI4 Playback",
+			  "pcm3168a Playback", "DAI5 Playback";
 
-	dais = <&rsnd_port0 /* (A) CPU0 */
-		&rsnd_port1 /* (B) CPU1 */
-		&rsnd_port2 /* (C) CPU2 */
-		&rsnd_port3 /* (D) CPU3 */
-		&rsnd_port4 /* (E) CPU4 */
-		&rsnd_port5 /* (F) CPU5 */
-		&rsnd_port6 /* (G) GPU6 */
-	>;
+		dais = <&snd_kf1 /* (C) CPU2 */
+			&snd_kf2 /* (D) CPU3 */
+			&snd_kf3 /* (E) CPU4 */
+			&snd_kf4 /* (F) CPU5 */
+			&snd_kf5 /* (G) GPU6 */
+		>;
+	};
 };
 
 &pcm3168a {
@@ -103,13 +102,14 @@ pcm3168a_endpoint_c: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* rsnd_port0-1 are defined in ulcb.dtsi */
+	ports@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		/*
 		 * (C) CPU2
 		 */
-		rsnd_port2: port@2 {
+		snd_kf1: port@2 {
 			reg = <2>;
 			rsnd_for_pcm3168a_play1: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p1>;
@@ -121,7 +121,7 @@ rsnd_for_pcm3168a_play1: endpoint {
 		/*
 		 * (D) CPU3
 		 */
-		rsnd_port3: port@3 {
+		snd_kf2: port@3 {
 			reg = <3>;
 			rsnd_for_pcm3168a_play2: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p2>;
@@ -133,7 +133,7 @@ rsnd_for_pcm3168a_play2: endpoint {
 		/*
 		 * (E) CPU4
 		 */
-		rsnd_port4: port@4 {
+		snd_kf3: port@4 {
 			reg = <4>;
 			rsnd_for_pcm3168a_play3: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p3>;
@@ -145,7 +145,7 @@ rsnd_for_pcm3168a_play3: endpoint {
 		/*
 		 * (F) CPU5
 		 */
-		rsnd_port5: port@5 {
+		snd_kf4: port@5 {
 			reg = <5>;
 			rsnd_for_pcm3168a_play4: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p4>;
@@ -157,7 +157,7 @@ rsnd_for_pcm3168a_play4: endpoint {
 		/*
 		 * (G) CPU6
 		 */
-		rsnd_port6: port@6 {
+		snd_kf5: port@6 {
 			reg = <6>;
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
index 1db99b7608f01..6fd6f7c652aff 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
@@ -13,18 +13,20 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav
  *	(B) aplay   -D plughw:0,1 xxx.wav
- *	(C) aplay   -D plughw:0,2 xxx.wav
+ *	(C) aplay   -D plughw:1,0 xxx.wav
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(D) arecord -D plughw:0,3 xxx.wav
+ *	(D) arecord -D plughw:1,1 xxx.wav
  */
+/ {
+	sound_card_kf: expand_sound {
+		compatible = "audio-graph-card";
+		label = "snd-kf";
 
-&sound_card {
-	dais = <&rsnd_port0 /* (A) CPU0 <-> ak4613 */
-		&rsnd_port1 /* (B) CPU1  -> HDMI   */
-		&rsnd_port2 /* (C) CPU2  -> PCM3168A-p */
-		&rsnd_port3 /* (D) CPU3 <-  PCM3168A-c */
+		dais = <&snd_kf1 /* (C) CPU2  -> PCM3168A-p */
+			&snd_kf2 /* (D) CPU3 <-  PCM3168A-c */
 		>;
+	};
 };
 
 &pcm3168a {
@@ -56,12 +58,18 @@ pcm3168a_endpoint_c: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* rsnd_port0/1 are defined in ulcb.dtsi */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
 		/*
 		 * (C) CPU2 -> PCM3168A-p
 		 */
-		rsnd_port2: port@2 {
+		snd_kf1: port@2 {
 			reg = <2>;
 			rsnd_for_pcm3168a_play: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p>;
@@ -74,7 +82,7 @@ rsnd_for_pcm3168a_play: endpoint {
 		/*
 		 * (D) CPU3 <- PCM3168A-c
 		 */
-		rsnd_port3: port@3 {
+		snd_kf2: port@3 {
 			reg = <3>;
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index da644128a9aed..944fc092e0c27 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -19,61 +19,65 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
- *	(C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
- *	(D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
- *	(E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
- *	(F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
+ *	(C) aplay   -D plughw:1,0 xxx.wav (TDM-0)
+ *	(D) aplay   -D plughw:1,1 xxx.wav (TDM-1)
+ *	(E) aplay   -D plughw:1,2 xxx.wav (TDM-2)
+ *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:0,6 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav
  */
-&sound_card {
-	routing = "ak4613 Playback",   "DAI0 Playback",
-		  "ak4613 Playback",   "DAI1 Playback",
-		  "DAI0 Capture",      "ak4613 Capture",
-		  "pcm3168a Playback", "DAI2 Playback",
-		  "pcm3168a Playback", "DAI3 Playback",
-		  "pcm3168a Playback", "DAI4 Playback",
-		  "pcm3168a Playback", "DAI5 Playback",
-		  "DAI6 Capture",      "pcm3168a Capture";
+/ {
+	sound_card_kf: expand_sound {
+		compatible = "audio-graph-card2";
+		label = "snd-kf-split";
 
-	/delete-property/ dais;
-	links = <&fe_a		/* (A) CPU0	  */
-		 &fe_b		/* (B) CPU1	  */
-		 &fe_c		/* (C) CPU2	  */
-		 &fe_d		/* (D) CPU3	  */
-		 &fe_e		/* (E) CPU4	  */
-		 &fe_f		/* (F) CPU5	  */
-		 &rsnd_g	/* (G) CPU6	  */
-		 &be_x		/* (X) ak4613	  */
-		 &be_y		/* (Y) PCM3168A-p */
-	>;
+		routing = "pcm3168a Playback", "DAI2 Playback",
+			  "pcm3168a Playback", "DAI3 Playback",
+			  "pcm3168a Playback", "DAI4 Playback",
+			  "pcm3168a Playback", "DAI5 Playback",
+			  "DAI6 Capture",      "pcm3168a Capture";
 
-	dpcm {
-		ports@0 {
-		/*
-		 * FE
-		 *
-		 * (A)/(B) are defined on ulcb
-		 * (C) CPU2
-		 * (D) CPU3
-		 * (E) CPU4
-		 * (F) CPU5
-		 */
-		fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
-		fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
-		fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
-		fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
-		};
+		links = <&fe_c		/* (C) CPU2	  */
+			 &fe_d		/* (D) CPU3	  */
+			 &fe_e		/* (E) CPU4	  */
+			 &fe_f		/* (F) CPU5	  */
+			 &rsnd_g	/* (G) CPU6	  */
+			 &be_y		/* (Y) PCM3168A-p */
+		>;
 
-		ports@1 {
-		/*
-		 * BE
-		 *
-		 * (X) is defined on ulcb
-		 * (Y) PCM3168A-p
-		 */
-		be_y:	port@1 { reg = <1>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				/*
+				* FE
+				*
+				* (C) CPU2
+				* (D) CPU3
+				* (E) CPU4
+				* (F) CPU5
+				*/
+			fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
+			fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
+			fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
+			fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
+			};
+
+			ports@1 {
+				reg = <1>;
+				/*
+				* BE
+				*
+				* (Y) PCM3168A-p
+				*/
+			be_y:	port { be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+			};
 		};
 	};
 };
@@ -111,8 +115,13 @@ pcm3168a_z_ep: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* (A)/(B) are defined in ulcb.dtsi */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
 
 		/*
 		 * (C) CPU2
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
index c30e056538e46..4fc229418dd77 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
@@ -13,18 +13,18 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav
  *	(B) aplay   -D plughw:0,1 xxx.wav
- *	(C) aplay   -D plughw:0,2 xxx.wav
+ *	(C) aplay   -D plughw:1,0 xxx.wav
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(D) arecord -D plughw:0,3 xxx.wav
+ *	(D) arecord -D plughw:1,1 xxx.wav
  */
 #include "ulcb-kf-audio-graph-card.dtsi"
 
-&sound_card {
+&sound_card_kf {
+	compatible = "audio-graph-card2";
+
 	/delete-property/ dais;
-	links = <&rsnd_port0	/* (A) CPU0 <-> ak4613 */
-		 &rsnd_port1	/* (B) CPU1  -> HDMI   */
-		 &rsnd_port2	/* (C) CPU2  -> PCM3168A-p */
-		 &rsnd_port3	/* (D) CPU3 <-  PCM3168A-c */
+	links = <&snd_kf1 /* (C) CPU2  -> PCM3168A-p */
+		 &snd_kf2 /* (D) CPU3 <-  PCM3168A-c */
 		>;
 };
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
index bc221f9944731..bd5b4063f2373 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
@@ -19,89 +19,92 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
  *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
- *	(C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
- *	(D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
- *	(E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
- *	(F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
+ *	(C) aplay   -D plughw:1,0 xxx.wav (TDM-0)
+ *	(D) aplay   -D plughw:1,1 xxx.wav (TDM-1)
+ *	(E) aplay   -D plughw:1,2 xxx.wav (TDM-2)
+ *	(F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(G) arecord -D plughw:0,6 xxx.wav
+ *	(G) arecord -D plughw:1,4 xxx.wav
  */
 
-&sound_card {
-
-	simple-audio-card,routing = "ak4613 Playback",   "DAI0 Playback",
-				    "ak4613 Playback",   "DAI1 Playback",
-				    "DAI0 Capture",      "ak4613 Capture",
-				    "pcm3168a Playback", "DAI2 Playback",
-				    "pcm3168a Playback", "DAI3 Playback",
-				    "pcm3168a Playback", "DAI4 Playback",
-				    "pcm3168a Playback", "DAI5 Playback";
-
-	/* dai-link@0 is defined in ulcb.dtsi */
-
-	simple-audio-card,dai-link@1 {
+/ {
+	sound_card_kf: expand_sound {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		reg = <1>;
-		convert-channels = <8>; /* to 8ch TDM */
 
-		/*
-		 * (C) CPU2
-		 */
-		cpu@0 {
+		compatible = "simple-scu-audio-card";
+		label = "snd-kf-split";
+
+		simple-audio-card,routing = "pcm3168a Playback", "DAI2 Playback",
+					    "pcm3168a Playback", "DAI3 Playback",
+					    "pcm3168a Playback", "DAI4 Playback",
+					    "pcm3168a Playback", "DAI5 Playback";
+
+		simple-audio-card,dai-link@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			reg = <0>;
-			bitclock-master;
-			frame-master;
-			sound-dai = <&rcar_sound 2>;
+			convert-channels = <8>; /* to 8ch TDM */
+
+			/*
+			* (C) CPU2
+			*/
+			cpu@0 {
+				reg = <0>;
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 2>;
+			};
+			/*
+			* (D) CPU3
+			*/
+			cpu@1 {
+				reg = <1>;
+				sound-dai = <&rcar_sound 3>;
+			};
+			/*
+			* (E) CPU4
+			*/
+			cpu@2 {
+				reg = <2>;
+				sound-dai = <&rcar_sound 4>;
+			};
+			/*
+			* (F) CPU5
+			*/
+			cpu@3 {
+				reg = <3>;
+				sound-dai = <&rcar_sound 5>;
+			};
+			/*
+			* (Y) PCM3168A-p
+			*/
+			codec {
+				prefix = "pcm3168a";
+				mclk-fs = <512>;
+				sound-dai = <&pcm3168a 0>;
+			};
 		};
-		/*
-		 * (D) CPU3
-		 */
-		cpu@1 {
+
+		simple-audio-card,dai-link@1 {
 			reg = <1>;
-			sound-dai = <&rcar_sound 3>;
-		};
-		/*
-		 * (E) CPU4
-		 */
-		cpu@2 {
-			reg = <2>;
-			sound-dai = <&rcar_sound 4>;
-		};
-		/*
-		 * (F) CPU5
-		 */
-		cpu@3 {
-			reg = <3>;
-			sound-dai = <&rcar_sound 5>;
-		};
-		/*
-		 * (Y) PCM3168A-p
-		 */
-		codec {
-			prefix = "pcm3168a";
-			mclk-fs = <512>;
-			sound-dai = <&pcm3168a 0>;
-		};
-	};
-	simple-audio-card,dai-link@2 {
-		reg = <2>;
-		/*
-		 * (G) CPU6
-		 */
-		cpu {
-			bitclock-master;
-			frame-master;
-			sound-dai = <&rcar_sound 6>;
-		};
-		/*
-		 * (Z) PCM3168A-c
-		 */
-		codec {
-			prefix = "pcm3168a";
-			mclk-fs = <512>;
-			sound-dai = <&pcm3168a 1>;
+			/*
+			* (G) CPU6
+			*/
+			cpu {
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 6>;
+			};
+			/*
+			* (Z) PCM3168A-c
+			*/
+			codec {
+				prefix = "pcm3168a";
+				mclk-fs = <512>;
+				sound-dai = <&pcm3168a 1>;
+			};
 		};
 	};
 };
@@ -115,7 +118,11 @@ &pcm3168a {
 };
 
 &rcar_sound {
-	rcar_sound,dai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	rcar_sound,dai@1 {
+		reg = <1>;
 
 		/* dai0-1 are defined in ulcb.dtsi */
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
index 2010e8ac7fdc3..828501c3f1fc0 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
@@ -13,45 +13,51 @@
  *
  *	(A) aplay   -D plughw:0,0 xxx.wav
  *	(B) aplay   -D plughw:0,1 xxx.wav
- *	(C) aplay   -D plughw:0,2 xxx.wav
+ *	(C) aplay   -D plughw:1,0 xxx.wav
  *
  *	(A) arecord -D plughw:0,0 xxx.wav
- *	(D) arecord -D plughw:0,3 xxx.wav
+ *	(D) arecord -D plughw:1,1 xxx.wav
  */
 
-&sound_card {
-	/* dai-link@0/1 are defined in ulcb.dtsi */
+/ {
+	sound_card_kf: expand_sound {
+		compatible = "simple-audio-card";
+		label = "snd-kf";
 
-	/*
-	 * (C) CPU2 -> PCM3168A-p
-	 */
-	simple-audio-card,dai-link@2 {
-		reg = <2>;
-		cpu {
-			bitclock-master;
-			frame-master;
-			dai-tdm-slot-num = <8>;
-			sound-dai = <&rcar_sound 2>;
-		};
-		codec {
-			mclk-fs = <512>;
-			sound-dai = <&pcm3168a 0>;
-		};
-	};
-	/*
-	 * (D) CPU3 <- PCM3168A-c
-	 */
-	simple-audio-card,dai-link@3 {
-		reg = <3>;
-		cpu {
-			bitclock-master;
-			frame-master;
-			dai-tdm-slot-num = <6>;
-			sound-dai = <&rcar_sound 3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		* (C) CPU2 -> PCM3168A-p
+		*/
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			cpu {
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <8>;
+				sound-dai = <&rcar_sound 2>;
+			};
+			codec {
+				mclk-fs = <512>;
+				sound-dai = <&pcm3168a 0>;
+			};
 		};
-		codec {
-			mclk-fs = <512>;
-			sound-dai = <&pcm3168a 1>;
+		/*
+		* (D) CPU3 <- PCM3168A-c
+		*/
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+			cpu {
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num = <6>;
+				sound-dai = <&rcar_sound 3>;
+			};
+			codec {
+				mclk-fs = <512>;
+				sound-dai = <&pcm3168a 1>;
+			};
 		};
 	};
 };
@@ -65,9 +71,11 @@ &pcm3168a {
 };
 
 &rcar_sound {
+	#address-cells = <1>;
+	#size-cells = <0>;
 
-	rcar_sound,dai {
-		/* dai0-1 are defined in ulcb.dtsi */
+	rcar_sound,dai@1 {
+		reg = <1>;
 
 		/*
 		 * (C) CPU2 -> PCM3168A-p
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
index 217d890198459..d98624e22126a 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
@@ -24,7 +24,7 @@ sound_card: sound {
 		#size-cells = <0>;
 
 		compatible = "simple-scu-audio-card";
-		label = "rcar-sound";
+		label = "snd-ulcb-mix";
 
 		simple-audio-card,prefix  = "ak4613";
 		simple-audio-card,routing = "ak4613 Playback", "DAI0 Playback",
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
index 751cfd8c52570..44a6584ca7d77 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
@@ -18,7 +18,7 @@
 / {
 	sound_card: sound {
 		compatible = "simple-audio-card";
-		label = "rcar-sound";
+		label = "snd-ulcb";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.25.1

