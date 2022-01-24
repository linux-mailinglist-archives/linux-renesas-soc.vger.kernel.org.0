Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4249772C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 03:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240759AbiAXCME (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 21:12:04 -0500
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111]:11072
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232200AbiAXCMC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 21:12:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+gBhgrZiS6WrWhTRnVDgKfJpoqosRyDBe4RAewoGwZW6UHa8sToBqrFJssKOLZO+ukVYBWhBh6nCVZsr19rFeHZRctjOuHhib3B0+ybawAQwLuRGhz3jnI8KPsJ9AbyZEit0mAYxrJF1/yvkU7yJq1BiAKYk9Wd4Rt7YZaLHBet5lwacveRon4HksDIYqrzLyL1bsir3GbKxg+T6bM/gayIAN5Dcvgq5D+W6iR/mFvaX7trvdvQD6bZAzt4SxMBz4PFJ3mb8O+zwvafMFFmPWbJEaMKe8sntrH94ymtuiPWons4ug0ClWWpQSZDwe+mMtL/in6hcFXnos9ZyOA3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH2d4RNIHqjxYig/eGnVFKJ+EZzhm2NrgIB4a5ZacpM=;
 b=i3+81zxujicprJsEDMg5QVfr/70/ipvSj2eFQXWo/nqJIxr5UA+nmIJJMk+k7N1WkOTuJbk+QQSZB9mm1qtMBc/4tXVWSIvWa0okaErGF2wJ+DiS+ISoMxmx5OgPz67bhHlTJz7tyx4lm9Twg68FseZQ/Jo1FutBu9hEXD5rBcrD+Du1p9QEmJuG0idO+z6O9m4eBlr7wyBImO63JruVT6b4S/L8UKvQCvTt+CjBEYAlXWQN8EJw8cXoyl3+7apJhzegaJJfSJHhzoQgQabdL0rnZG4pHFqpODLwtGqefHm6fbzLY/ArVKF8NImuWk4+cgbhzs1o2Be+CnxZh62Elw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VH2d4RNIHqjxYig/eGnVFKJ+EZzhm2NrgIB4a5ZacpM=;
 b=YhnHmLeub+D1KEy/gnwSV2lz81+qIQy8JtYpV1aNbveFkNA/DuFbHNG6qjDsvDjZK+kMsFN/2DH0YIpT13hZfnZ2W8AWcD86qK/vNZ1lI8BF/atP9Xd0IgHz463TQZUGg8XpbqjoO/Vv1uFbA6jGYYsPuFExTKVmpPbidPdalBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 02:11:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c%8]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:11:59 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] arm64: dts: renesas: ulcb/ulcb-kf: switch to use audio-graph-card2 for sound
Date:   Mon, 24 Jan 2022 11:11:40 +0900
Message-Id: <20220124021142.224592-2-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com>
References: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917552cd-4d46-4a85-42ef-08d9dedee728
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB6657623E03A54F8A9ACC637DD45E9@OS3PR01MB6657.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2kNtK1K+q700MEUyTf6ut92oLK6UzFBoqDMceyb4Kzc9qDOnsMAVZwqZ3EjuPO4rSrtQtWLh/iQy+NZkyi9BAUVQWmg6P4WItnJhDA0I4+J11/Y/ycUD8vnvvpgHSG+XcOs7nnlzUoYw/Bs5iI00qR5qFqz5Glg6ISJ+D4V5QgGCfm6nevi8BS2flrrl1BYzK+A3/06ZRvw7xHTlqFou34mJkRb+J6mXJcvY9eutFSb1H1/xf4hR45Ios/phaqhRDEVzUE4vxoqQUoFfCOXXELHisf5G05jhVdVmg6R/Ry+HzqXZEdVq3FnmPDbNX2Kobd7f+AXcSAFqQTKlpB/P+U4dTj0NheTzGBkABxJTe+uN3rpKksgkv4oVAaFHQDvs0+aiY4kLA7uiJU5G2okkoL2FqfIPgyAgyKn8dzygTCYnMuYthTBfJt1lNjjyNIxGMT2kX43NYbI48jEEP6jJFzFrW448kUGZl+Q/NxdZYa4ZeTzsg3fUeMdMOxDJN6Bq9ComkeBB8j5WJKb4mafgMTh69lu4SexCqSWewgk5dLxRU31/DFx+EVUAPyjEpfK3bpxGKXSMAeA/A/KB42gEpORuc3vM/NT183QQwdAe8CDNectlcjdXS4+ev/8Y/5xMsdBpJQS4sYKRpXk3qSv1DRUKkclGrHN3CpqL9vaNsWrnv4OSUXB/hxDGMmm6MSvnlmvltBcHilTOA1U153KFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(5660300002)(36756003)(8936002)(38100700002)(66946007)(66556008)(8676002)(38350700002)(316002)(6506007)(4326008)(1076003)(107886003)(2906002)(52116002)(86362001)(103116003)(508600001)(6666004)(26005)(6486002)(66476007)(83380400001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3ZF9iSKg2l1hd0HZ/SKiED6DKDqmoJ9WIa82EgdykmdYBzt917eMeXCMICQ?=
 =?us-ascii?Q?EzTMgYrek7d8Eq2o65kPkvG8C7ReyKr7KOoFYFOod/Ow+TSVPYug+rtF23jI?=
 =?us-ascii?Q?nV6gi/ZuTR8osooYSfu2cK6Oy//NY99EoKkl4xzXcUOM52oQUZbYXie+mTmD?=
 =?us-ascii?Q?AHhI7Bd0+iI/vo7UtoElIF/UTtXctF1BcBxfLV1eKZkl+Ig7NyOYcqfripbd?=
 =?us-ascii?Q?cYj6wGxgjxDMr1RYG5ac8kjhLqCeNOexU0nu/6q5W0n0KBlLlEcQnQrq3nCh?=
 =?us-ascii?Q?W+TdIb56sBBEmT/3+GpEWe3VuCCAEGOSrSvzQ2VPMbFsrujAKRxu3JocIrxM?=
 =?us-ascii?Q?wsrrKU+8trBPrB63LD7ZIxwUDuTWjnE2KANKkIwhJ6USlojhCV7LdOIjT/os?=
 =?us-ascii?Q?aNbkR3DSBqtmUxyksjsfiPpe0QBeaA7vCHvD39ayBixlP87w0mH/tTx2RubJ?=
 =?us-ascii?Q?ipYB//D2K2XMuUdGb05izVI7hWJExCM16zumk2eLjl84+Ujlxiqngld4PHNa?=
 =?us-ascii?Q?A6nIhHypQD480IXiyeyjCgd4gkmIDa0KcWGRH/uHsFOKXaYNlJ42yL47dbrk?=
 =?us-ascii?Q?jUrAupb1WVT6v2FDdZGU32NPUJedvlLWHNtnyjw8rrGUm/q/M+WiSMM12/+n?=
 =?us-ascii?Q?KTC68I0OUkds/ozIqcEC+jON2ttpZKAoLy01xCXq0Zb2+qLLXB/Bz+Lfh9XY?=
 =?us-ascii?Q?l56CLOWS6r1yr5/JtZ3IxplYefNKQiF3AhwUK9wqUfpc3H5nt48T8j10dbB3?=
 =?us-ascii?Q?cNcY8L0uXBqHmusnF9SIyndx92uMY5cpPTXUo2Y740ykKvPSYHlsZzDP9+vR?=
 =?us-ascii?Q?eGvENd1M/pwVa7ObLU+qZmktPMb7EEf2ofVV3wVESJ9j/SMXODa5gP+mIIni?=
 =?us-ascii?Q?dZWT0nAVLEQ/CM7MAvcO3kN8+F2n3B41uFT7iqytZiD61JyCz4/3JFC882jy?=
 =?us-ascii?Q?qEzcifRIKV8DSdUMuZEYKuLAYbshcN0352eNagLVFz/JdXfQlsJgWyth6LD0?=
 =?us-ascii?Q?3D1cWxxIbfyk89sZtrhYJLepvtbNAiVuCBL1mIFhIBnZnv0f4YhZAbsi+5PC?=
 =?us-ascii?Q?4+rK01BfAlUvyK3BrvI+qaGRtkuh7YbzoKQp2aIa1qNE+1QHSRjfduidBMxJ?=
 =?us-ascii?Q?oZiBsdrq8re3nTG69NQUe2SOfb2rJgNY/VE+mgn316O6QnIgjTXfXBOLFAKP?=
 =?us-ascii?Q?upktsB0+q1H1Nz6n0GVMPlsFoiDXto2g0w6c5Vu/rj3jAeW+FizEaPcHjpqy?=
 =?us-ascii?Q?1S7fGgrCLHz/oaOVS09eUKYG8KNzJBX96QnP2V69JZ9X6DFHinR80KW/wCNJ?=
 =?us-ascii?Q?zJa8Y1p1g1FkWeooDw9cCbVYGueVCG1IeH057ifkYhRgQc0xSrc93zxp6IVT?=
 =?us-ascii?Q?0aG2e2ApHDaxOvBgBa6UfLvm/gYJUcKXxnfo5k0QaB+jF9fnDccJH6IMLlSS?=
 =?us-ascii?Q?bNsb6dyXV1vFARJz4+RClSQQOtdWutF//Des2HylV2IOG7a+IbK02iBjQcdH?=
 =?us-ascii?Q?yKGb/V1aKwFgtOEX7xDSkYJgx9p86RMu7x+kBiam7FyweMKaiTKLXLj6+5Fu?=
 =?us-ascii?Q?ER4vTY5Lktfmr3aEs9FdNB0zbuPpR2e7ymUHWksEAgnPPOR9eGLZznkAmuir?=
 =?us-ascii?Q?f1mqp+HaGOD7CXo93+o1Ig7halOLRMB4i0ZyvUJjhBMFhWt5nSJFvQuRYzxa?=
 =?us-ascii?Q?v078qPVtxT2LQCW3PqDTMMml4XxCfnQ70+Q+iHt80IRoPnbzaCM2cTNr4C64?=
 =?us-ascii?Q?25yQS1y3sg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917552cd-4d46-4a85-42ef-08d9dedee728
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:11:59.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j44gV7JsRfKFvrv7MZDk1zLl4CIdFLBAuALdK8jatAz1eBVOphIAAsNoQ0R786bYe8pHu3yDllJ4SONiGG7nFBv73BnD2oHGl0MTDJW2bjJybqFKgNf3g6/r5XwWPFsN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6657
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ULCB{-KF} are using audio-graph-card.
Now ALSA is supporting new audio-graph-card2 which can easily handle
more advanced feature. Let's switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 22 ++++++++--------------
 arch/arm64/boot/dts/renesas/ulcb.dtsi    | 20 +++++++-------------
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 61bd4df09df0..7266c02ee31d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -302,12 +302,9 @@ rsnd_port2: port@2 {
 			reg = <2>;
 			rsnd_for_pcm3168a_play: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_for_pcm3168a_play>;
-				frame-master = <&rsnd_for_pcm3168a_play>;
+				bitclock-master;
+				frame-master;
 				dai-tdm-slot-num = <8>;
-
 				playback = <&ssi3>;
 			};
 		};
@@ -315,12 +312,9 @@ rsnd_port3: port@3 {
 			reg = <3>;
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_for_pcm3168a_capture>;
-				frame-master = <&rsnd_for_pcm3168a_capture>;
+				bitclock-master;
+				frame-master;
 				dai-tdm-slot-num = <6>;
-
 				capture  = <&ssi4>;
 			};
 		};
@@ -360,10 +354,10 @@ wlcore: wlcore@2 {
 };
 
 &sound_card {
-	dais = <&rsnd_port0	/* ak4613 */
-		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2	/* pcm3168a playback */
-		&rsnd_port3	/* pcm3168a capture  */
+	links = <&rsnd_port0	/* ak4613 */
+		 &rsnd_port1	/* HDMI0  */
+		 &rsnd_port2	/* pcm3168a playback */
+		 &rsnd_port3	/* pcm3168a capture  */
 		>;
 };
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a7e93df4ced8..b4bdb2d7e4ba 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -95,11 +95,11 @@ reg_3p3v: regulator1 {
 	};
 
 	sound_card: sound {
-		compatible = "audio-graph-card";
+		compatible = "audio-graph-card2";
 		label = "rcar-sound";
 
-		dais = <&rsnd_port0	/* ak4613 */
-			&rsnd_port1	/* HDMI0  */
+		links = <&rsnd_port0	/* ak4613 */
+			 &rsnd_port1	/* HDMI0  */
 			>;
 	};
 
@@ -408,11 +408,8 @@ rsnd_port0: port@0 {
 			reg = <0>;
 			rsnd_for_ak4613: endpoint {
 				remote-endpoint = <&ak4613_endpoint>;
-
-				dai-format = "left_j";
-				bitclock-master = <&rsnd_for_ak4613>;
-				frame-master = <&rsnd_for_ak4613>;
-
+				bitclock-master;
+				frame-master;
 				playback = <&ssi0>, <&src0>, <&dvc0>;
 				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
@@ -421,11 +418,8 @@ rsnd_port1: port@1 {
 			reg = <1>;
 			rsnd_for_hdmi: endpoint {
 				remote-endpoint = <&dw_hdmi0_snd_in>;
-
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_for_hdmi>;
-				frame-master = <&rsnd_for_hdmi>;
-
+				bitclock-master;
+				frame-master;
 				playback = <&ssi2>;
 			};
 		};
-- 
2.25.1

