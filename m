Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BDF7A8FFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 01:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjITXx0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 19:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjITXxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 19:53:24 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98148CF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 16:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLo6hClt5UdYoGbm9ckftunp4ZQr25sIhUfkzZoTlSpX2B9k+eF4guKkD8zCO3F1VX9+1eDe4F9EccqXchp65O78WbbofzL7HbprKiExTX/TiBSZXigJs+3DxSfrWp+VlihF8K8fFkD9Z58fVRNpXB54Hrub67Ps4X79zO9YVDUapCxLGQfiRAY/qhgsnenO2zlpiEaX2/rnAGHtuDBiaYzbcuAUH3OivSmV/EsmM6gOGJHS7qmkTFFSfuRdxIYTY1fGmOJUnYJ15MtNQAmH2aMNHvy2WanJ9dnxEfuXNlngSgP57cmf8bV7l0HHcZ7P7r+TOgETDdRgrV60BMl5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8YwWrllrkidIWX0jjQA3Ly9EuVrhA5Bdu3YT/OU6qg=;
 b=F78Bfyt/zrChpuuZqdlDL5FJtzg5YIme36G23JqlsvGS8dKkO2AXW04kwvu6KyzTNzq9x4V77CrIgMQOodbzKInL0gqAL5354ywA3E1LoUCj66EfbbmI8ns/EUDG1wHl2RMb00X6KnymMBG/gRgo0u9Dg0KdNueO/FNrkMHaaYQLytVhenIGqSdjwf5Oi0T4Ko2v1UIkbXSMOicZw62G2qlCn68CWX8QuqQEkGw00Vo80iiFzeSrvsaQ8LAJcvCCbKxMZ3pGuT4+MLNASC6EQfTfgplHqJUE8Hj1QeIk19xfFO2EChliuuK33MeRnAalpjrH9jt+YT1IqvFpCso+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8YwWrllrkidIWX0jjQA3Ly9EuVrhA5Bdu3YT/OU6qg=;
 b=m8eX0dE2QLfLEqfukz0beJMGlTKw+av4jlxMh87LWYurxKGWRq8BBbHzHZLCFFf+BQNyxB0rHxzGuV86fyZbtM+1RXdItqkzSXs9AtN9dLoEForu1pAdqbn/oe2U91HpozSj0JyczOPMiBL5cKlf75RBtWiIMKRnzxY7UI/YnlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9914.jpnprd01.prod.outlook.com (2603:1096:604:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29; Wed, 20 Sep
 2023 23:53:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 23:53:12 +0000
Message-ID: <87fs382yhk.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] arm64: dts: renesas: use multi Component for ULCB/KF
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 20 Sep 2023 23:53:12 +0000
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: 30758286-8305-484d-b734-08dbba34bfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mxTYVCDxriHRzMjLXarsocqny3K6M71NzgpklbBe1tLRV9Aj60TfJvAbO3vbKWBpkqjnh1KxfK8FaL8exclf9TVo6OmecQLRv94imuP7VoC0WJEchz25tUKv4U5vrLxb5AhwtXqYUwEQgXE45QywBMYJIApi+Shr0uvFkfpqDOOmWnJUbVQr+6cfsG4S5eoHYa00IJxK1Arh19QOiQC+uT1mO5JZg1DWXO16QIiUyisXK6bmmZgJrtEOQh1dMQgrbP9HY0hkxCmuoTkBRyNOfh42ayIiVNfegILT0Wk3RQCi3wHz8/Q35NcY6C9sNP9Lzz1UC7lqTtKQkR2UmnNIpnznCrFJRTQlYjYbVhZsvUObx91yr5njAbFXwWYn3J3sJJ0Amjrm6RtdohdoTnJ5pcHp3njuaCyKJqDS/t18TlJeOyL9ztsP2kQT4Kvbekas/QjJv4/44tAXcCiMl4aGc1nUx5v+GgT/0PoMiBFphmZLZRrxwQF6dPLi7Y6tzbgJEr4doDsAMufhR7kbIvwQSe70+0wNEN0K1Us1f8pIffNRI6WoawyL6CzrqmB/Nfke4Zxibsbft5Wa7iyhzykrT0WgB6zfFwMsNE/Qamuw1C9fkVsKzLsq1fVBIVSHfbUva9j9m0aqWEITuyND9+CQ7uZaNVjY82rff+Y1VkAkZ/Iza2imOp0nDSGUIq9bHrPS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(186009)(451199024)(1800799009)(6486002)(6506007)(52116002)(6512007)(83380400001)(8676002)(8936002)(5660300002)(478600001)(2906002)(30864003)(66946007)(316002)(66476007)(26005)(41300700001)(66556008)(4326008)(2616005)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wQCIMrp27kaiJMgUnZcIdP9MYaeqR6vCe6NIEAPVXP91xsQ6pwU/2FF+agIh?=
 =?us-ascii?Q?HdGWEkEwnqW2QF+WtQxZIU0K3gLSodf2VePSl4waA+01Ib1i5d2ThvuvXoBE?=
 =?us-ascii?Q?AHSaGDWFOoar2kRGtXxuI1OkqHeSTmd1jqT/7c+XBOn3YX6y6aL9Hv0lX9MN?=
 =?us-ascii?Q?HYJ1bJfF6/zzIglsbKmbG7ideyo9xfqqxEyGWLruWNNc8PSwXf7/BvribEna?=
 =?us-ascii?Q?2+RUXW+KJZh7UizSpjA1zZ/ZxXl99Yqsxr3whhGAa3WDz847Wi/8Pr3nNUsX?=
 =?us-ascii?Q?j0zPvAWSQj505Wgy2SApvRqGKPoO962PnnhvkQiW5X/9YOI+bSZ2+e+8j5nr?=
 =?us-ascii?Q?HR9L0SHymYX5M57SjHCNDJVKcN6MVXuiCG7sYxIDlAXiAdcrexy6rrLTWNsg?=
 =?us-ascii?Q?Sr6bSImAo62OazOGIaDEzRgkLhKM987rGuQF4tkAylvqQywCgbpTW9JuDKmY?=
 =?us-ascii?Q?xg9rjE82XGUeo9yTq/ytDfj6hN6Jw4uJN686YEtNNgErrcpMq1HjX5cxUZsZ?=
 =?us-ascii?Q?Wr78fLqaPvgzLG7AK71/XW895ce8D4YVBy/ZpK4PlISkenvgAUvD/nDrvmVa?=
 =?us-ascii?Q?aG3Ob5SBbsJd2cdtHEWihNbTKfP45iCdASAwb1UiV/t8C0UOUb8uZRf9Ei/E?=
 =?us-ascii?Q?0OmHyf93ImUAR0pI1i1Cy71fLcwcZRFfyLdSFENWw6HTyTr6IfJI9fPGzSYp?=
 =?us-ascii?Q?QTYZZ+8lwm8L1rN6ncH2ydRqFcKGIpzciuBYH9ZDdeSI2wCc0KIbnjlgMZ6n?=
 =?us-ascii?Q?uCMi5lj8hG5UtTrwjB+ZsfNrhZJKfSzWEYTxBS9Cf3cBrDSzBT2MtKvlvxM/?=
 =?us-ascii?Q?Wn/KoQ8+LvrB/kNX4oOnwfnBOiwxutmjBytd5iGxtUJOXiDlAwJUa/laCwpL?=
 =?us-ascii?Q?BDUtGnZ/rusMELjV4w6zNB8G5PKMt9U1aGWnatg/BskzIvrR39Ar33ZOyVmb?=
 =?us-ascii?Q?DkHaMK2NuZRndThymFEsq7KBprhbkPP8i08e7vKrs4BmHtC6sXzmIkqD4Ois?=
 =?us-ascii?Q?jhiNsoIkBgJzk2VOggC3uJ3g/kyUINWKCYVTOGevRnGRA2NmI+5Kha8tGjMe?=
 =?us-ascii?Q?b6yw/dH+40Z4dTvrpm/4S3eIq3xUd82EjURY5CW9bwCppnfxK6SsuBDNnSdn?=
 =?us-ascii?Q?Xcfh8VCFEwbTNtgs53r+gBUGdyNfpDcClvOUGlda9ez9ezcXmd1uauZPruvf?=
 =?us-ascii?Q?IwDchYvep/YLbD/cG13X68bXWu9fsgh6ssRuoD+pm2muTafw52FpC/uq5Pvz?=
 =?us-ascii?Q?yn7MSWtX4xaUA5n3oP8MOJ7hG8nw87mXh+Sw0NLTMMa4+3qxFWb2kBmPMKnJ?=
 =?us-ascii?Q?XX51BPjhcum4c+vEo6wMsrhl3QKkeRnskMO+tvfoZYdstsvmwU/2ciDda1F8?=
 =?us-ascii?Q?UJf96CcezUOFHFRWmVjNvL3A7kRc4Hcv5TwfdPTFMB8Uiop81F5FI0roPpLd?=
 =?us-ascii?Q?iDQjUeIXXw+MP2miHwa0vLYJ5SMIkfmxdCRaQEWXQGRk4nBxqT7KOFFTzh8c?=
 =?us-ascii?Q?4db/M4PMYH4qLBynUHrydIrppEKr9no8I5hY930Z3zVNXSjlv9qkZeszF5C7?=
 =?us-ascii?Q?h14qAOaKGvl9vhILiUdn78oSVhLSy9WvuKSPViRmUN2mTtDFnRFq6XINyrWi?=
 =?us-ascii?Q?gv7EpRwGCB3zEWx6uO3EBIY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30758286-8305-484d-b734-08dbba34bfd5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 23:53:12.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRUyVclCo30b2AMNjHJSy8mBXH8muWiBkBkKqY61eoEp9riZdY+CiwK8sRfyuJv58zQ3g/5P0NHvGCK8vhiM/x5x6zVz1bAwScuwN0VyAyFn4jt5qkMsNbY45cuLCACy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9914
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
because of ASoC Component vs Card framework limitation.

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
v2 -> v3
	- fix type on git-log "framwork" -> framework"
	- fix comment-out style
	- "rcar_sound,dai" -> "rcar_sound,dai@0" on ulcb

v1 -> v2

	- "ulcb" uses "port@0"
	- "ulcb" has #address-cells / #size-cells


 .../ulcb-audio-graph-card-mix+split.dtsi      |  16 +-
 .../dts/renesas/ulcb-audio-graph-card.dtsi    |  17 +-
 .../ulcb-audio-graph-card2-mix+split.dtsi     |  13 +-
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   |   4 +-
 .../ulcb-kf-audio-graph-card-mix+split.dtsi   |  57 +++----
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  27 ++--
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 108 +++++++------
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  14 +-
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 152 +++++++++---------
 .../renesas/ulcb-kf-simple-audio-card.dtsi    |  77 ++++-----
 .../ulcb-simple-audio-card-mix+split.dtsi     |   8 +-
 .../dts/renesas/ulcb-simple-audio-card.dtsi   |   8 +-
 12 files changed, 270 insertions(+), 231 deletions(-)

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
index da644128a9ae..4cf632bc4621 100644
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
+				 * FE
+				 *
+				 * (C) CPU2
+				 * (D) CPU3
+				 * (E) CPU4
+				 * (F) CPU5
+				 */
+			fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
+			fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
+			fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
+			fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
+			};
+
+			ports@1 {
+				reg = <1>;
+				/*
+				 * BE
+				 *
+				 * (Y) PCM3168A-p
+				 */
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
index bc221f994473..f01d91aaadf3 100644
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
+			 * (C) CPU2
+			 */
+			cpu@0 {
+				reg = <0>;
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 2>;
+			};
+			/*
+			 * (D) CPU3
+			 */
+			cpu@1 {
+				reg = <1>;
+				sound-dai = <&rcar_sound 3>;
+			};
+			/*
+			 * (E) CPU4
+			 */
+			cpu@2 {
+				reg = <2>;
+				sound-dai = <&rcar_sound 4>;
+			};
+			/*
+			 * (F) CPU5
+			 */
+			cpu@3 {
+				reg = <3>;
+				sound-dai = <&rcar_sound 5>;
+			};
+			/*
+			 * (Y) PCM3168A-p
+			 */
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
+			 * (G) CPU6
+			 */
+			cpu {
+				bitclock-master;
+				frame-master;
+				sound-dai = <&rcar_sound 6>;
+			};
+			/*
+			 * (Z) PCM3168A-c
+			 */
+			codec {
+				prefix = "pcm3168a";
+				mclk-fs = <512>;
+				sound-dai = <&pcm3168a 1>;
+			};
 		};
 	};
 };
@@ -115,7 +118,8 @@ &pcm3168a {
 };
 
 &rcar_sound {
-	rcar_sound,dai {
+	rcar_sound,dai@1 {
+		reg = <1>;
 
 		/* dai0-1 are defined in ulcb.dtsi */
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
index 2010e8ac7fdc..28d29ecfb395 100644
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
+		 * (C) CPU2 -> PCM3168A-p
+		 */
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
+		 * (D) CPU3 <- PCM3168A-c
+		 */
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
@@ -65,9 +71,8 @@ &pcm3168a {
 };
 
 &rcar_sound {
-
-	rcar_sound,dai {
-		/* dai0-1 are defined in ulcb.dtsi */
+	rcar_sound,dai@1 {
+		reg = <1>;
 
 		/*
 		 * (C) CPU2 -> PCM3168A-p
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
index 217d89019845..9b955510e38e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
@@ -24,7 +24,7 @@ sound_card: sound {
 		#size-cells = <0>;
 
 		compatible = "simple-scu-audio-card";
-		label = "rcar-sound";
+		label = "snd-ulcb-mix";
 
 		simple-audio-card,prefix  = "ak4613";
 		simple-audio-card,routing = "ak4613 Playback", "DAI0 Playback",
@@ -72,9 +72,13 @@ &ak4613 {
 };
 
 &rcar_sound {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	#sound-dai-cells = <1>;
 
-	rcar_sound,dai {
+	rcar_sound,dai@0 {
+		reg = <0>;
+
 		/*
 		 * (A) CPU0
 		 */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
index 751cfd8c5257..ba0e188e7b21 100644
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
@@ -69,9 +69,13 @@ &hdmi0 {
 };
 
 &rcar_sound {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	#sound-dai-cells = <1>;
 
-	rcar_sound,dai {
+	rcar_sound,dai@0 {
+		reg = <0>;
+
 		/*
 		 * (A) CPU0 <-> ak4613
 		 */
-- 
2.25.1

