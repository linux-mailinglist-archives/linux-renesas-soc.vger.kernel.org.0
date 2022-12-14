Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB64A64C1F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236997AbiLNBsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbiLNBs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:28 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5672253B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/91BIKCA1tr/ZC9C3SX9daW0oZxuTGBIPBGEipE/55GMKRt+Of+v3dkoLpoOk8asShcg9EsdwHcOV+LcrpQIoPtGta2GP66v+Qs/XEroyXVG0Vtsmeb1V3vyrV/Y+UgX0bslR6zcqMCrZ0XWfbqyD7H3GOXQldg9BJbQ7/4knB4RZCnvAs886rPs/jilrC1ftl1elYEsJ1UNullVb3poe8IfCnljcSwub6CMylehC1sOT1fEC4TjoGPdagH8J6CDBMJkGA88nUYpoQ13U+cER5WI1Qjj6GW9hclwPOB95CSw0fTMdy+uUwNmJ85DdcCVfthK8VTWZbvXKi19iN+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxCWmSzPcqf0x8yVIqa2NivdAg+dQ8x+f0+vfSEKFvU=;
 b=Dv2GryNcIHBRHPrr0yhtFGq58VTiYJNsOh3WiUz0Zf/DWk6qR0prvHqVA0XC9PBJ/M1O2v4Cpbd96N9Iw3FKWQUuZiL258strQLQxWnwo1NwkcsJc4EeA9kP+aEouQxlNCbytSEtDx2PiAl5p5XLqJF4Y8Z9F+BsbEstruCXO969ulTMIhTQRRkeafGRzFPzlfOuhaVZQt2BWMWN9Uf4RUegPT1ylfBFEhOX4cpj1nBs6q9dziRnn/81/KA6fbWpRn2eh17uZUAABA8nKFJrm36IDi+LFyomnlxskBucQCYwO43Q5TJ/RPsD75Fyu7k6+pg2GOTGSaoxzHqr7QtR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxCWmSzPcqf0x8yVIqa2NivdAg+dQ8x+f0+vfSEKFvU=;
 b=LgByTJozVX/e/GsqongT4To63+XSq1Gi6+i4VIb1zE3Ibn6ZRZbx4oJhOUdQKTKlXxocdPt2HI0sVK3iBWwxmWIt/3u+EGx0jq92rHDSvZAzDqTyC23M9EQ8uAsKk3iWBYCiaxCz4gg73r+K2vNFm3A9QcVbmjlmTZkYZ4juF6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:23 +0000
Message-ID: <878rjapxg8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:23 +0000
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: d087bea6-b735-4f13-c904-08dadd754950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f6sa1iA568Ljab1ju6Bqrv4+BmqTB02hHURhY/xmNM921qbQCDGWmjJHCic+tZuSj/sAyPQ9rrr6Xp+NratrYSBlyIUJrckxtpTfHES7qCItHkZxcrrn40hHBFuS80kVR4U8feBqkNEFKqZG4LEtB2S3JC+OV2r2l9m/vffAKiP8x1V3ve7vJupQlpW9h+XeKhUUhtvIdNKcUSIMYoASz/VUlSKG00UhrJNzZgXKVyUSFmLdvImgQgk3xfkOkTaewi/6zcSjVoSQ1RKonvGTKLpSEmfqDfszASU1/XD6zW8UMwO5Lf8AwW2cqU4DB4L4kFx8se0YtCy3cRyfAP3eQGsKD6VNk2bv2RruBn+VpIz2EfIDmknoqmYp6NJalrulirK9Shit6w2tTdTwT99i/LtmPAECEZr0AVP7H9P5VoqEGx/s2ONA6wjcJtj6cjvWvE+ud61dvbd8fWuRL+qX/Ttzp/DlefAHAtgLvHdB3N1qHcmnw0HhzIfbbS3J0AJ1pit3UH3DKZsrq2bVwV6Rn5lSFxijvfeAu/HQHjgzCuzM6SOSQNVU6dZ0wXmRloKyeDq7jK0uReAjMfJNRYP6FQKte8dwOHxT/oscbgaN5JNAHwdsHiMUpvx49ICX69Qst/JdgoLnOVTYe95j95LyzjOIgTqacH207PnfinQYc9Fus+KGlAJj8CEv+lvQNCk9yUjF0d/Yy/fZ6Z3fjugAv4gO/rsvDC51KAo7I22y4VA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TlnNiQWlIUE1AMAUju8R2uvqiKz5lSBCrMd3OWMdgM6LR1188pyIvvgIZxVB?=
 =?us-ascii?Q?g/ZEX32iEM7qr62KtZNsvvyPXpQeR0+w6M1FzzZhqJzmVK9YYmPJfGOpXuJU?=
 =?us-ascii?Q?gQqEfpaBwsLdfGJsTQ7NzS17VKCsSn3tc9ZMyIYTod9POM2UOlwKUHgN21pi?=
 =?us-ascii?Q?ESYmZ+BDuR/lwKqiQwbyszWSbD7iue7ISf7H0DGyqK7XR2SvjVwwjPJkvjkS?=
 =?us-ascii?Q?aew+gh6U+4qzIZdtE7R6DLnoI3GmIOgWVF5hT5bVNpJKwD/dXwSQHPxBOgW6?=
 =?us-ascii?Q?boS3lLkaiUXwt1K+naDsn1JSuzQSo+9hkosNpg97RaRxQ7S81i09Vgj4eiAe?=
 =?us-ascii?Q?NPFsQYtAsa7MLUw2FnjJJ6IzGEaIG0xaFg6o10e+HfDK4zEsHKp87R8X0d0v?=
 =?us-ascii?Q?OXFJYcZm8l0TEDZrl+GGrdaEIfCh9lX6jCNO89q+7ocft2QYEOMD/GcrpGN6?=
 =?us-ascii?Q?cFZ0XRTLyaQoFjen2o/54byEfyRCvanyoAZOlSWiVIhdunKs3BDN4ebqZEDB?=
 =?us-ascii?Q?V3SPzD9SGJ7S2yqRQbK1rq43j3PGRe4VlNVJzU4RTCOL9ilvufMzXsgywblW?=
 =?us-ascii?Q?mYL8uH94btvvgDv392oAlISKQKN7c1aHIna3q05ZyXhiIWg1ZJH/anSQYSEG?=
 =?us-ascii?Q?Whfj59bi6I0g4Niep9uJFUOr8ihTfMJy6MAQwqq2XgFytJY7jzxr5Ti3FxwB?=
 =?us-ascii?Q?X+XXzY/XIJH9YlbIqsfxd2xqn1noQsQuHOs0CKH3a8PhOGkHHDPWqX/j8fQx?=
 =?us-ascii?Q?uk5oBrPuVQstpAzXioH4JPoTka70bTrzU0CWgXQZF6aTcdVu5IJAicsDtWED?=
 =?us-ascii?Q?9eGdq+OBgpwA0R6gsBIE43O+suXCYcazOcYp4q1lcevHO42hQIOLCjDjDjZs?=
 =?us-ascii?Q?hwSxvzbB/89g7y+ndYderVz+X9EX4NhyZlSM5FZxRj9/nA/FAEP2iwbw68Y7?=
 =?us-ascii?Q?1957MdibKQrynwNEDiPKIbVShKoPY5RdyCeX1yI3qcVY2AXPCUgCJR7p5GQU?=
 =?us-ascii?Q?F9+bXKlSL4bXoFOhJE/YRztTOoTzlrVlGZi7lMsNp3inR8yNOUK1NDWfcTc4?=
 =?us-ascii?Q?Ij3q1mniEkiJMRfeinu8QQwc9s7F6ha+SeR3Bu7S+4+mS5n97vVLwMRLHbzi?=
 =?us-ascii?Q?Jg9V99NyO6UfJBBIhR5ahezWALbzRxdXuKNd8GjK1z/dhG0/9rF/BcgR1TvB?=
 =?us-ascii?Q?dW+wMMtLW+Zl8pd3RH2RODMTXtLb0otkTsuQWpNJvjZCTPCPIMvb7/Xw/9l4?=
 =?us-ascii?Q?nVwnBMUZhjmHOpHLF9FrfChBMi0YlO1abw/cXLSY8+qjn7OFEK1+bbHmJPss?=
 =?us-ascii?Q?fsTnxD1DcDjAwYoI5ke2s6hfirCTl3Dss0rvjqw/12RvyRLxdvsc3vRhh2BR?=
 =?us-ascii?Q?pOkHIORwqtCkq5Ab3iFVHN/5Moam5thHIs85yJKAOyECa4gSLyEvU/OlESFx?=
 =?us-ascii?Q?UpdYIVcH55/b6WyY4WFgnRCqKem1zaPJpUBLrcZSAB+7zty2wy5bfAi/qDFm?=
 =?us-ascii?Q?rSGhgWOM08owv3AmOpLoyH614Lp9ElElnoQHiP1eyuxq1YqbmWmqlIxB1uam?=
 =?us-ascii?Q?7LN8vVfIXxETD/cw2gwfwtE1Nvd2CpdktpIX3lGqQMBf6vJlVnXk4z5dU28x?=
 =?us-ascii?Q?cP35vlcrq+U0NpZmsLlzERE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d087bea6-b735-4f13-c904-08dadd754950
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:23.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww/oc15b2Rb+XI1xy3DghDT5M3dQlbUABiYigE9L5ABKulgWJbsFdq12+ciRMF/KhRX2CEV2ykV6fu7AXxko25i7zTu6hoUIXwVl+0yBVQ7bqOe9hIzgYMOk9GwzC/Be
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7819
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ALSA SoC has many type of Generic Audio Card driver (Simple Audio Card,
Audio Graph Card, Audio Graph Card2), and Renesas/Kuninori Morimoto want
to test these.

Generic Audio Card driver had been requested on ALSA SoC.
It has many type of device connection method, and historically,
requested connection support range of generic driver have been
upgraded.

Upgrading connection support range itself was possible on generic
driver, but could not implemented, because we need to keep compatibility
on Device-Tree. This is one of the reason why we have many type of
Generic Audio Card driver.

ULCB/KF is good board to test these.
Kuninori has been testing these Generic Audio Card driver by using his
local patch to switching drivers. But it is good idea to upstream these
from information sharing point of view, because DT setting is complex.
It can be good sample for user. This patch is one of them.

From normal user point of view who don't need to test the driver,
it should keep as-is, nothing changed.

This patch adds "Audio Graph Card2" DT setting file for ULCB/KF,
and switch to use it. We can switch to other Generic Audio Graph driver
if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   | 26 ++++++++
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    | 30 +++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 62 +++----------------
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 52 +++-------------
 4 files changed, 75 insertions(+), 95 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.d=
tsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi b/arch=
/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
new file mode 100644
index 000000000000..4668ee5383fc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Audio Graph Card2
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 ------ ak4613
+ *	(B) CPU1 ------ HDMI
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+#include "ulcb-audio-graph-card.dtsi"
+
+&sound_card {
+	compatible =3D "audio-graph-card2";
+
+	/delete-property/ dais;
+	links =3D <&rsnd_port0	/* (A) ak4613 */
+		 &rsnd_port1	/* (B) HDMI0  */
+		>;
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi b/a=
rch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
new file mode 100644
index 000000000000..7b4ed8fc8cc2
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Audio Graph Card2
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 ------ ak4613
+ *	(B) CPU1 ------ HDMI
+ *	(C) CPU2 ------ PCM3168A-p (8ch)
+ *	(D) CPU3 ------ PCM3168A-c (6ch)
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *	(C) aplay   -D plughw:0,2 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ *	(D) arecord -D plughw:0,3 xxx.wav
+ */
+#include "ulcb-kf-audio-graph-card.dtsi"
+
+&sound_card {
+	/delete-property/ dais;
+	links =3D <&rsnd_port0	/* (A) ak4613 */
+		 &rsnd_port1	/* (B) HDMI0  */
+		 &rsnd_port2	/* (C) pcm3168a playback */
+		 &rsnd_port3	/* (D) pcm3168a capture  */
+		>;
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 408871c2859d..b5877120ab46 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -212,26 +212,6 @@ pcm3168a: audio-codec@44 {
 				VCCAD2-supply =3D <&snd_vcc5v>;
 				VCCDA1-supply =3D <&snd_vcc5v>;
 				VCCDA2-supply =3D <&snd_vcc5v>;
-
-				ports {
-					#address-cells =3D <1>;
-					#size-cells =3D <0>;
-					mclk-fs =3D <512>;
-					port@0 {
-						reg =3D <0>;
-						pcm3168a_endpoint_p: endpoint {
-							remote-endpoint =3D <&rsnd_for_pcm3168a_play>;
-							clocks =3D <&clksndsel>;
-						};
-					};
-					port@1 {
-						reg =3D <1>;
-						pcm3168a_endpoint_c: endpoint {
-							remote-endpoint =3D <&rsnd_for_pcm3168a_capture>;
-							clocks =3D <&clksndsel>;
-						};
-					};
-				};
 			};
=20
 			gyroscope@6b {
@@ -418,30 +398,6 @@ &rcar_sound {
 	pinctrl-0 =3D <&sound_pins
 		     &sound_clk_pins
 		     &sound_pcm_pins>;
-
-	ports {
-		/* rsnd_port0/1 are defined in ulcb.dtsi */
-		rsnd_port2: port@2 {
-			reg =3D <2>;
-			rsnd_for_pcm3168a_play: endpoint {
-				remote-endpoint =3D <&pcm3168a_endpoint_p>;
-				bitclock-master;
-				frame-master;
-				dai-tdm-slot-num =3D <8>;
-				playback =3D <&ssi3>;
-			};
-		};
-		rsnd_port3: port@3 {
-			reg =3D <3>;
-			rsnd_for_pcm3168a_capture: endpoint {
-				remote-endpoint =3D <&pcm3168a_endpoint_c>;
-				bitclock-master;
-				frame-master;
-				dai-tdm-slot-num =3D <6>;
-				capture =3D <&ssi4>;
-			};
-		};
-	};
 };
=20
 &scif1 {
@@ -476,14 +432,6 @@ wlcore: wlcore@2 {
 	};
 };
=20
-&sound_card {
-	links =3D <&rsnd_port0	/* ak4613 */
-		 &rsnd_port1	/* HDMI0  */
-		 &rsnd_port2	/* pcm3168a playback */
-		 &rsnd_port3	/* pcm3168a capture  */
-		>;
-};
-
 &ssi4 {
 	shared-pin;
 };
@@ -498,3 +446,13 @@ &usb2_phy0 {
 &xhci0 {
 	status =3D "okay";
 };
+
+/*
+ * For sound-test.
+ *
+ * We can switch Audio Card for testing
+ * see also ulcb.dtsi
+ *
+ * #include "ulcb-kf-audio-graph-card.dtsi"
+ */
+#include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index 4b6562fc1bdf..6196494452c9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -102,15 +102,6 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
=20
-	sound_card: sound {
-		compatible =3D "audio-graph-card2";
-		label =3D "rcar-sound";
-
-		links =3D <&rsnd_port0	/* ak4613 */
-			 &rsnd_port1	/* HDMI0  */
-			>;
-	};
-
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible =3D "regulator-fixed";
=20
@@ -201,9 +192,6 @@ rcar_dw_hdmi0_out: endpoint {
 		};
 		port@2 {
 			reg =3D <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint =3D <&rsnd_for_hdmi>;
-			};
 		};
 	};
 };
@@ -218,7 +206,6 @@ &i2c2 {
=20
 	ak4613: codec@10 {
 		compatible =3D "asahi-kasei,ak4613";
-		#sound-dai-cells =3D <0>;
 		reg =3D <0x10>;
 		clocks =3D <&rcar_sound 3>;
=20
@@ -230,12 +217,6 @@ ak4613: codec@10 {
 		asahi-kasei,out4-single-end;
 		asahi-kasei,out5-single-end;
 		asahi-kasei,out6-single-end;
-
-		port {
-			ak4613_endpoint: endpoint {
-				remote-endpoint =3D <&rsnd_for_ak4613>;
-			};
-		};
 	};
=20
 	cs2000: clk-multiplier@4f {
@@ -405,30 +386,6 @@ &rcar_sound {
 		 <&audio_clk_a>, <&cs2000>,
 		 <&audio_clk_c>,
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
-
-	ports {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-		rsnd_port0: port@0 {
-			reg =3D <0>;
-			rsnd_for_ak4613: endpoint {
-				remote-endpoint =3D <&ak4613_endpoint>;
-				bitclock-master;
-				frame-master;
-				playback =3D <&ssi0>, <&src0>, <&dvc0>;
-				capture =3D <&ssi1>, <&src1>, <&dvc1>;
-			};
-		};
-		rsnd_port1: port@1 {
-			reg =3D <1>;
-			rsnd_for_hdmi: endpoint {
-				remote-endpoint =3D <&dw_hdmi0_snd_in>;
-				bitclock-master;
-				frame-master;
-				playback =3D <&ssi2>;
-			};
-		};
-	};
 };
=20
 &rpc {
@@ -538,3 +495,12 @@ &usb2_phy1 {
=20
 	status =3D "okay";
 };
+
+/*
+ * For sound-test.
+ *
+ * We can switch Audio Card for testing
+ *
+ * #include "ulcb-audio-graph-card.dtsi"
+ */
+#include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

