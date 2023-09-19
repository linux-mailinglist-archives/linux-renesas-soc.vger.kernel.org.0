Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED087A6FB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 02:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjITAAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 20:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjITAAd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 20:00:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7BC95
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 17:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGO5im/zFpAqarjc5Uk1GPXZKSXYdy7RnSNnq6hRRC4vPLW7zeGjYaaVdR5Fw7ebnIgUlC7SX7gefgoBFzNAiC4XZKYC4M2u1MhPSYv0jq3W8+2dydgpOSNmqEgL2vTtdiQVv7QXUF+36TVQYAnCVgZMRUFJp9UqMK/yQAJhHAD+09NtLwYlTzuIdx2+hoZHkNSi73L+d16TPPClx4zGaUIvoWAuAxV+k6ofQqXY+Bw7HrNiJDwElNmAoUqwUGDkBfxyFgTOa5SNuYflEhIDu/kI1nXmrWFsVkDVQ2LfTCyzj38GxTvFWTc1vnyKed7gtwvjrj0P4WzNz0eGGdrBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJuIjUxNwDNAVo7RnpZqBWzfAvroJ8dn5lk3YJ8j7bI=;
 b=W8jwBQtjIXb9rhhT/junnAiwkoKCLrGip8gk00GFhmS8LPoBmsoHlBZJWyTOMbQqgEWv+V7XeaFDuFvsSunoiF1smOdPwzec4xVUcJG/iIn+42m4pAwKC1wJV3UnX/RYOYWvnlR1Ej/2AR2zZRfXQm76oDxcqYmd3f3bbwOs576B4JauxWq5OMonPfD184tBnkdMiw6vcscT283BJ4C/7Rw4f2qLg1uKvXmeNggxDoocrpj6wEvFuXvA9lNUtWX0H97gY9ct581+7HQCgxz4ph3mBQH/HBw4pY4j+JIEE7NDHXgg2onXzqhKVkEB4piD0tb6GFGlQJHiLK9QRdLgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJuIjUxNwDNAVo7RnpZqBWzfAvroJ8dn5lk3YJ8j7bI=;
 b=fLC0SAxal16ElQEcdoeGSgtL5+fV2BQdfheb92EXAiUI7UXxg3lPTqW3F9zNfmzZnxmWG1PTRXhvbgoDbP2XRkVZqSSFPb+hYadoK9MJ5W5Nu6PmIHmHbToNRl34YzkDJ/c9U6s6YSMzTHmfy70AJhcSLpJnsFowx8DuCPZq9HA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYVPR01MB11171.jpnprd01.prod.outlook.com (2603:1096:400:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 23:59:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.018; Tue, 19 Sep 2023
 23:59:59 +0000
Message-ID: <87pm2dyarl.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm64: dts: renesas: use multi Component for ULCB/KF
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 19 Sep 2023 23:59:58 +0000
X-ClientProxiedBy: TYAPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:404:29::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYVPR01MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: 75aa0935-e985-4bc4-53a4-08dbb96c87d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +P32cSyGvwA6jk1umTasZTfEaLYtJhbrK1bx0JaCEl4QGlbyZEi3ksB/5RPrPejANRCiltvMSiMxWqQq+zARMClC7f/R+RDCoa3jfVgsZ42GbimIqYsTQCG9ncI59Aqz4MOU/dnYMDhXbv+uOOomlsNQbl/Av8U3zCIWVkk950iTRQtswMR/q49KkaTbba6Dj+/VIBnxZ1l/gJR5bJismXtRyuL+IGai+ih2V9qE2+fMUNFNNf50zfAP1OfGfi+rZeyHyTR+nosh8cz61bmlupKFaAgyGxK8ziFDBVHgJdeF6lRn1yBQ3yn2ZaxfcSeleMMPLTIbOPB+7TvyViga3GM6Xbo2+Yg4SV6dzPWI36E3u4B6Mqurwjqocg7VHboj0ABxyT9QMQs6rn+Y7xBO3GuMeCv7icwTkaCMfaea4Q2wMynCexZvl1nERDn0zQIF0mK3Hqxc334eiuGylRuKuHJifryRCtlOPSiM6TSdTe6h80Qv2qf+ZH7Jqa3Hej7TBEEyhcUIxTUqvsAuWw4z814fTcraeDkE6ERcK+IjCQsK7pB+wBm2NNPyB31Y+5QrU36X6mnnqVqym/PA7Bkst9IM/GZPTKghpkkF1k+kCdIHf5vHtNZC/UFZLsj44B8UYt2BHnu5opXjmApEYwkAog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199024)(186009)(1800799009)(41300700001)(5660300002)(8936002)(8676002)(4326008)(52116002)(6486002)(6506007)(6512007)(2616005)(26005)(83380400001)(478600001)(316002)(66556008)(66476007)(66946007)(36756003)(86362001)(2906002)(30864003)(38350700002)(38100700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPwYiFNpdoVjvl0uQ2bKZCgcSxRHGVxvUHrZNgRUAnK77uKNU9HMUzIVKkae?=
 =?us-ascii?Q?G0/jB0kD2A8EvaMv/e4osmJwXj5QoyZvfMR+SWp1rjAyAmQaZ53MAwiTAAw7?=
 =?us-ascii?Q?za2eZRkj428NWRsb4PdChcMVxPnwUX3tfNzyiqWPpmWzXK9aDE2zFrupLs43?=
 =?us-ascii?Q?xXVMsgxVGkHOBNlPGqE4zi9VUeMLkiqKvhGslpOQ8VW/iUS6cKtnWDGL8oZC?=
 =?us-ascii?Q?oR7FkUEliBGq/8LzHXUW5sj9BUceAoBOfU5ikNQJNvl+oT2/aGY1vyFsrYdr?=
 =?us-ascii?Q?rPw3h5CndHhMgp6p5rRLLoJ7VvVipd8gW9Siu2wt4KbQeJRwJaMb3jrVQ7zp?=
 =?us-ascii?Q?kLzCPVjIp3WsOuckZ4XrDYKSYJil+sRucGZZJFDYdoFT3y6O7ZN7DMKCukJw?=
 =?us-ascii?Q?B36aZ1AwAeAM7fZ0Bw65suAqwX5HxOv9iH2/rf04BeO0PhPvBRdjL05kr5kF?=
 =?us-ascii?Q?9spNZVz2IxkjKAQI+JUsFmDAyc7HLrtLgR4stHXP21PEu/tAyFliYfzNxZif?=
 =?us-ascii?Q?8pbN0JhmjPFXHrukxud2cJIClpUsTp/tzaE3NPLXAO5ABivuKzZY7VlltKUB?=
 =?us-ascii?Q?x1Yc29WzoICwBjM9CtDrkdi3g7DS1b5LqWKx/9kbYIXdG84ZqdH3v7A3nsra?=
 =?us-ascii?Q?QWBXH96k183mWxyuxzSUNrM1eIfJr5KzgwCE2ej70HXuW2xY0QvRFae9rrjv?=
 =?us-ascii?Q?tWpTR+BSj3kfgth5Ii8xVhSd0OxB/1p6t2BetPJHgQ3/P1RMlk359tXARB/c?=
 =?us-ascii?Q?Futl3TUVFzBqOb8pQl7mkAXcch/wInQoFSyyKdiXm2vCJtbX0q7HoPH6wQai?=
 =?us-ascii?Q?TW1a6l/TnLdcTcKo5cN/VWVssL593ylKLA91Suw55DcxKYWkig3W27sO8C/y?=
 =?us-ascii?Q?IioOvLeP0xm79cGVamxpVhFF6RJ+cDK2v0kZDLm/AGl/8dOpNc52jJR5i/Xo?=
 =?us-ascii?Q?7Wc6hEJnjxKbMJ6LAZc1FkPeHc6uvBNB3gZ6Ro/hWZ30iRzsSZC0PKdwdriR?=
 =?us-ascii?Q?GoUngT/Z/bYotF6YdIdOQSlXleiv9gDpHhM6nk8YoXXzT5hkR728M8CM9f2G?=
 =?us-ascii?Q?6EAM54x2WiPur3NG6R7TDOJYNloLqoh8GgWSKuTCHP0UTre2AOiYRepult+J?=
 =?us-ascii?Q?RdXILm1ia/syPRQzEZqI3ziL/j1L3voTQyHscudbroQehORsTk/Cef+tUXI7?=
 =?us-ascii?Q?/DkyiEurS6h65gO8gzlZkccgNqrgZVV0znlsQi4GceJ6XDHh24nVVeAanxKf?=
 =?us-ascii?Q?gMYYDlYiTVBdmk/TVJV9NTOd2BsQ/T6vgrvPcMYD8ADXYSswseLpBhqX3Wit?=
 =?us-ascii?Q?ucrYa6lkFCCMBeWlVkEEUpUqcSVJoBQjwHvQd/f/25fFw4zW352ny5vK3Pia?=
 =?us-ascii?Q?VUGHaLI20t5eEy0PSiHjx/qlP1MsV4h75gmd2YtEOQfP6IFctLQggPFWWfph?=
 =?us-ascii?Q?prpQOrM3RltzZPzvkjawdMvKfs5UsQ0b6pVwBoZpDYdcuGsprP2VYEfZTv+8?=
 =?us-ascii?Q?uAF4b1G/2AhlDmG4ekKPyoh88AIWbBqNzZfN9JgpYd8b8QMAss/C8pRBqgbI?=
 =?us-ascii?Q?TF4VmFVro7jSaLSUBUbce0FKHWGN2rxKYnHhDc5BG6w/+36gziaDqP+nQBng?=
 =?us-ascii?Q?WVL1F+IxZUGMG07aKGf6dlM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75aa0935-e985-4bc4-53a4-08dbb96c87d9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 23:59:59.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJOMfPGvWmLRMrTBhOij7EHI+nAEjl+EHPbQ5q2qFfdonhkNASI4TM0/NYyKnYpD4HUV/JgG1QDF4ate/ZYiU41HlsatkFEXu+4dyqpS9kOv5dKoi49lniCuSFl9xv3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11171
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
v1 -> v2

	- "ulcb" uses "port@0"
	- "ulcb" has #address-cells / #size-cells

 .../ulcb-audio-graph-card-mix+split.dtsi      |  16 +-
 .../dts/renesas/ulcb-audio-graph-card.dtsi    |  17 +-
 .../ulcb-audio-graph-card2-mix+split.dtsi     |  13 +-
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   |   4 +-
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   |  57 +++----
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  27 +--
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 108 ++++++------
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  14 +-
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 155 +++++++++---------
 .../renesas/ulcb-kf-simple-audio-card.dtsi    |  78 +++++----
 .../ulcb-simple-audio-card-mix+split.dtsi     |   2 +-
 .../dts/renesas/ulcb-simple-audio-card.dtsi   |   2 +-
 12 files changed, 265 insertions(+), 228 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
index 672b0a224ef9..be6d7a035739 100644
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
@@ -58,14 +58,18 @@ ak4613_ep2: endpoint@1 {
 };
 
 &rcar_sound {
-	ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		reg = <0>;
 
 		/*
 		 * (A) CPU0
 		 */
-		rsnd_port0: port@0 {
+		snd_ulcb1: port@0 {
 			reg = <0>;
 			rsnd_for_ak4613_1: endpoint {
 				remote-endpoint = <&ak4613_ep1>;
@@ -78,7 +82,7 @@ rsnd_for_ak4613_1: endpoint {
 		/*
 		 * (B) CPU1
 		 */
-		rsnd_port1: port@1 {
+		snd_ulcb2: port@1 {
 			reg = <1>;
 			rsnd_for_ak4613_2: endpoint {
 				remote-endpoint = <&ak4613_ep2>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
index 3be54df645e6..3f1df6ee17ea 100644
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
@@ -53,10 +53,15 @@ dw_hdmi0_snd_in: endpoint {
 };
 
 &rcar_sound {
-	ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		rsnd_port0: port@0 {
+		reg = <0>;
+
+		snd_ulcb1: port@0 {
 			/*
 			 * (A) CPU0 <-> ak4613
 			 */
@@ -69,7 +74,7 @@ rsnd_for_ak4613: endpoint {
 				capture  = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
-		rsnd_port1: port@1 {
+		snd_ulcb2: port@1 {
 			/*
 			 * (B) CPU1 -> HDMI
 			 */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
index 75b024e3fef1..8966e6a7d28b 100644
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
@@ -50,14 +49,12 @@ ports@0 {
 			};
 
 			ports@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <1>;
 				/*
 				 * BE
 				 * (X) ak4613
 				 */
-				be_x: port@0 { reg = <0>; be_x_ep: endpoint { remote-endpoint = <&ak4613_x_ep>; }; };
+				be_x: port { be_x_ep: endpoint { remote-endpoint = <&ak4613_x_ep>; }; };
 			};
 		};
 	};
@@ -78,9 +75,13 @@ ak4613_x_ep: endpoint {
 };
 
 &rcar_sound {
-	ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		reg = <0>;
 
 		/*
 		 * (A) CPU0
diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
index 5ebec1235843..19fa6e102995 100644
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
index 9b01354940fd..8ae6af1af094 100644
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
+	sound_card_kf: expand-sound {
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
@@ -103,13 +102,15 @@ pcm3168a_endpoint_c: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* rsnd_port0-1 are defined in ulcb.dtsi */
+	ports@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
 
 		/*
 		 * (C) CPU2
 		 */
-		rsnd_port2: port@2 {
+		snd_kf1: port@2 {
 			reg = <2>;
 			rsnd_for_pcm3168a_play1: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p1>;
@@ -121,7 +122,7 @@ rsnd_for_pcm3168a_play1: endpoint {
 		/*
 		 * (D) CPU3
 		 */
-		rsnd_port3: port@3 {
+		snd_kf2: port@3 {
 			reg = <3>;
 			rsnd_for_pcm3168a_play2: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p2>;
@@ -133,7 +134,7 @@ rsnd_for_pcm3168a_play2: endpoint {
 		/*
 		 * (E) CPU4
 		 */
-		rsnd_port4: port@4 {
+		snd_kf3: port@4 {
 			reg = <4>;
 			rsnd_for_pcm3168a_play3: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p3>;
@@ -145,7 +146,7 @@ rsnd_for_pcm3168a_play3: endpoint {
 		/*
 		 * (F) CPU5
 		 */
-		rsnd_port5: port@5 {
+		snd_kf4: port@5 {
 			reg = <5>;
 			rsnd_for_pcm3168a_play4: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_p4>;
@@ -157,7 +158,7 @@ rsnd_for_pcm3168a_play4: endpoint {
 		/*
 		 * (G) CPU6
 		 */
-		rsnd_port6: port@6 {
+		snd_kf5: port@6 {
 			reg = <6>;
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
index 1db99b7608f0..5fbd4ca83e20 100644
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
+	sound_card_kf: expand-sound {
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
@@ -56,12 +58,15 @@ pcm3168a_endpoint_c: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* rsnd_port0/1 are defined in ulcb.dtsi */
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
@@ -74,7 +79,7 @@ rsnd_for_pcm3168a_play: endpoint {
 		/*
 		 * (D) CPU3 <- PCM3168A-c
 		 */
-		rsnd_port3: port@3 {
+		snd_kf2: port@3 {
 			reg = <3>;
 			rsnd_for_pcm3168a_capture: endpoint {
 				remote-endpoint = <&pcm3168a_endpoint_c>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index da644128a9ae..94fbd4c62db0 100644
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
+	sound_card_kf: expand-sound {
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
@@ -111,8 +115,10 @@ pcm3168a_z_ep: endpoint {
 };
 
 &rcar_sound {
-	ports {
-		/* (A)/(B) are defined in ulcb.dtsi */
+	ports@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
 
 		/*
 		 * (C) CPU2
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
index c30e056538e4..4fc229418dd7 100644
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
index bc221f994473..aacef322c79b 100644
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
+	sound_card_kf: expand-sound {
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
index 2010e8ac7fdc..255e20446085 100644
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
+	sound_card_kf: expand-sound {
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
index 217d89019845..d98624e22126 100644
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
index 751cfd8c5257..44a6584ca7d7 100644
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

