Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E86F668956
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjAMCER (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbjAMCEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:16 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF45621B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo61OcZZT6Bnx0aWVPTzf3xAvw1NoqMhFBOOJBulUBmGi5GD6k62OxqO/P9SXg1CBnG73eOPIBTI4k+EPsMjfQkhLkJuzkO/QLpj00umWZMpNyJZ6sx8Fti/V5OHJCEJoqW4rbg9GP8Ghn6O6sHdTdW5y0Wx6Y6s2hR4zv2MKLCdv/UWiE2uEEdrwCB44SS1LC2npVG+B6RKcq/lblZ+lIHmLxZZ0a3/MfqAMfm3XeAQu+fJ5jMwjpBvlmU9bjm6NeHcdXLeVnO6S9xuYhPERRYzIUqVAEgs+eQJ9pNoCZKGx/UR3KUrl/GeWtSsFdPawC28v2ZKyQ8POlk5AhFm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4WlOIfkcSoPF+BZPNu3XODXC+a69eQQLRUqY7B4zfU=;
 b=VbbmGF4lWnzD8UJn7of5Si1dn+MUxZFYLy6j1R9UbouIU9n62xm4ksEu6u/Z9SMJWOVbqPNlEcLEsyBBu4a2DPwXvU8cfpYnfiI8TzQvmdF0QpJ9hAo9dzTw10e1xd8JkS2KJCDtqn+25/YPO2LvJAXhIU+TDOMp1VCyz4cvrwpU/GwtCKRLdc5KkleGIan+lPJyLpFWbNlCoab4pxqJUMs/YKvFgumnuEGK+qz5yux2QxdVb9xSiVP0Go7c2xxrL6L+6/dCuKKdVNMLmCYKgHPhu6V03u8Fn+LjPeQaMyz66VBFzUZJOVNIMj4qbS80KHw4Fgk4CVLTRQ8fUTvLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4WlOIfkcSoPF+BZPNu3XODXC+a69eQQLRUqY7B4zfU=;
 b=A4FfyBJNa0ZluKUHNJHwDhVknChIYsTATiL8Ie/lNCmwSgZn/wB9Zs1mWB/darCUq+rSqzX8/XsKAQK89h3lqBmbIB4C82ozeizjr5NlNpE8jGpoQNOuVi/2Jr7wUM2FUJFrCtej0HLPSXbaEtbzQtS6wQsyMdKnN5/cgsZpAfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:13 +0000
Message-ID: <87a62ni40z.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:13 +0000
X-ClientProxiedBy: TYAPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:404::16)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: 5678bc80-d6eb-45d2-2f29-08daf50a77bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEGOLvJf44aZFh4Sw4ASZ7V9rb3Jnbiyb94eaXc9tsLfb6uGY7vX86pS9s3JVxOSSB6hOJ9oICuGB8gRNEoOgN39o9aVZcaovbBJaCjeE89mnoqtC9Qq9iHHLoohbatYcjog5E6ha8nhQ29pZ0Jx65W/XoJVyofccYdxBpj1iFgbFUdCc7vRJXw1q/Wc63NeDTwcXGfhhu/gnI0ElFqLJgJpIKwvWuR6f1O0YaWrXK4LkjrGvnWgDiazha1fVoRKvKu7KdlnNK036EJUTm6CO/FjqWaJYXbOwUD3ppIvlCht2HszpsGtaEwGjaxGshMAMnuq874o0bm6URfaKtrRXky+ICiWTQhibsgJl3Z8TYvHTb/bbX00YYPfUEfPZln2HkAthucMrlqThx/C+LSzR8eooMfLnz9XqHPYH+Ww3AS+b+r9EDJsGRtuppIkHjk+VI7PK+t/q9NoQH8MfVdD/y48LALsxCgdWU0oRALQ1fSRyHbM08WhMeH8KqXn8OymPrZswhCg5w87Jh2iNdsXFHDLAPGNOb2PfUmOOGqSVi8xh5SAnum25L/Xg7+okiavEzsfjdWXcIeccTWFPX822MoXcEVbOvr7hnA6zoNNj3y0tCRBGZeabVRarluD5uy3bwqfJtSSRK2jNWOlkI+sztjwtBvJlMombiEkLmV1pQAtiD8gwGP19o4SceYEjdhI/upms8j0f5FJ1+vSv6IAGecq9gyJrrKVrV5HMHje3LNuaX2ES/BRvh1/CTIE+dId
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6yjAKdf3c6FAsv68c1nSPZFZgeEWnei3i+gadGxFp4+zeI1QY9zGux/tAUMD?=
 =?us-ascii?Q?Sc9OkXrsQcrTqpH/spQCGeP1YY0sEjIxqrlzPrQe4y70ZhzPatiexZsXhFbY?=
 =?us-ascii?Q?RyALzKzCvVbJKY3LZS8Guuifw9Ev/Y+Ky3lAN470lC6nom5JqqS74suHwDU4?=
 =?us-ascii?Q?ry1/mdXcZA9/T9pI3DrU3VskjbVbYHFcgqM+R6GT2/f745fG137xytGI6Kcg?=
 =?us-ascii?Q?glucqftmA6lXTXHmfmRkT1h00TBUER3r0IwLyc0rZdurykYDxPk8DDMjPopu?=
 =?us-ascii?Q?ymU10lSmvtkO3ZFjY5ePr8EHyvg1MwtFZDU5zdJqh391p7rB8JuPFaH5NBL7?=
 =?us-ascii?Q?MVylCsnIuPYHAs3n5g8Rnv7Yg5Jr04Zq/Ho2lxV7xtfYR7+xTGsIOJPpcbK/?=
 =?us-ascii?Q?L9PfMKIxFS5vz06mkksz+yFl/oxW8tDnBalUSoMTDGs/XmVqLnFNq44F+CpX?=
 =?us-ascii?Q?7Zc+RYEwaKxPhBLwgFjMXvZeAfTfYZOya8w6cZvUqRtaLraplG0/o4t+UvsG?=
 =?us-ascii?Q?x1LfHM7FCYNW+uBr3kuO0lPKouCymKOc/Es/UBRLYxyq3kVxCfKUNYJRNQ94?=
 =?us-ascii?Q?6MKQI8F1HsjwYmkIqUCqQFj1bfcwGKDC0BZqW5hxnCqeYOxiiEBA3509E+d3?=
 =?us-ascii?Q?dIN6uFHye6NAx5Bz5wEtOGbTPtopF25izj36K3s1EzC2axlIQogP+WTE4E+1?=
 =?us-ascii?Q?A4cquGYxFoD+uVSRbKZV7jpPLBA8nLLhJMOOwvDibyv6NY8EoA9ybr9475p5?=
 =?us-ascii?Q?6WD9drV010Gtz10PeIM7Cuuy3dWdhiqjdRVCtwMGvw9lHFThZ7xC02BaoLzT?=
 =?us-ascii?Q?Hc9OgZaKPcjonuT80UCBL4fLeqQ49JggilbQ43z2JrlLZPJKAIuy2uOz8Uhm?=
 =?us-ascii?Q?KeR9qUSpw5SVDc9mMEI76yGxRIXAFWqBvtIeyEJNAsBl0INa1fNaTxy+1KkU?=
 =?us-ascii?Q?bTnYfgAEt+BDPHaGA5q7oyZdcaU1K09SDDC4JJVrDuzmR+3oUDSA81PFMmZ8?=
 =?us-ascii?Q?j8ioo0qVAFGmWNITrvAM4tdV+jtFEQhOGZJEmv0WIayVnvRCjmpANX+H99bE?=
 =?us-ascii?Q?HC/xtAZTHsAcm2Ou0c9bNukXGXJV5qJvSowtynMr6ecMeBEcVKmcSS8IgtBs?=
 =?us-ascii?Q?whYiNk88isDI6pGjyVl48RC0Y74SxkVFOg0U/Ltam6KskLl4ejdJQUUmOkIw?=
 =?us-ascii?Q?+8Iyqj+4mwl8k2hpMicch1WjtpZGh7ut03ZPe4FR/J97W3fgDrRg7l/C/FAH?=
 =?us-ascii?Q?ISnL/Y862wuJw9Ady9WNf6PIdltb45iECaN/FXgVvTbOACizj8plnmlfjMIc?=
 =?us-ascii?Q?xopLPxlMFUoo+exuzEvkQgJoX1qZzkUnPUE+WAfHPYuDTOZRQdHfnEepWN8E?=
 =?us-ascii?Q?cQOwObrBabuLxKOCsy9FqFQ4ulS3yyhbd12KGcrJUQ1u8p6Ki00vkoAQPTQQ?=
 =?us-ascii?Q?5kx13T56EvhOWu6VDlOmoPFKqwKlNaRe9UKfIgnf7ydG7e7k1Wytsyo6olWw?=
 =?us-ascii?Q?XMcwSTPXRlbFjHB9surrp7rR4TqxDiRovREZeXW8pdKE4gDCc8OLkh0tajTE?=
 =?us-ascii?Q?R5bZafxOLAannQ5+Oz5Ni6tNSiUdZLz6QJv2dvZ0Qt3dD5nNQCGB5MWxZX/E?=
 =?us-ascii?Q?jUar68P3WOwEqkSMFLAJTZs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5678bc80-d6eb-45d2-2f29-08daf50a77bb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:13.4830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dApurJPSM1HYXaulYkDfUH0SQ4iWRMJDD7kC0eWqwSFvVlZcTWA1w+5bWjKkHt8Ei9JLzfI0nitqQqOLcj4HUl7aaARv6Qayj5cLKfA7bw+v1I+Caz+HjMtqpGSLdCIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11239
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

Link: https://lore.kernel.org/r/878rjapxg8.wl-kuninori.morimoto.gx@renesas.=
com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/ulcb-audio-graph-card2.dtsi   | 26 +++++++
 .../renesas/ulcb-kf-audio-graph-card2.dtsi    | 30 ++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 68 +++----------------
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 60 +++-------------
 4 files changed, 75 insertions(+), 109 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.d=
tsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi b/arch=
/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
new file mode 100644
index 000000000000..5ebec1235843
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
+ *	(A) CPU0 <----> ak4613
+ *	(B) CPU1  ----> HDMI
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
+	links =3D <&rsnd_port0	/* (A) CPU0 <-> ak4613 */
+		 &rsnd_port1	/* (B) CPU1  -> HDMI   */
+		>;
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi b/a=
rch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
new file mode 100644
index 000000000000..c30e056538e4
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
+ *	(A) CPU0 <----> ak4613
+ *	(B) CPU1  ----> HDMI
+ *	(C) CPU2  ----> PCM3168A-p (8ch)
+ *	(D) CPU3 <----  PCM3168A-c (6ch)
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
+	links =3D <&rsnd_port0	/* (A) CPU0 <-> ak4613 */
+		 &rsnd_port1	/* (B) CPU1  -> HDMI   */
+		 &rsnd_port2	/* (C) CPU2  -> PCM3168A-p */
+		 &rsnd_port3	/* (D) CPU3 <-  PCM3168A-c */
+		>;
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 408871c2859d..3527d538a20e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -6,12 +6,6 @@
  * Copyright (C) 2017 Cogent Embedded, Inc.
  */
=20
-/*
- * SSI-PCM3168A
- *	aplay   -D plughw:0,2 xxx.wav
- *	arecord -D plughw:0,3 xxx.wav
- */
-
 / {
 	aliases {
 		serial1 =3D &hscif0;
@@ -212,26 +206,6 @@ pcm3168a: audio-codec@44 {
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
@@ -418,30 +392,6 @@ &rcar_sound {
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
@@ -476,14 +426,6 @@ wlcore: wlcore@2 {
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
@@ -498,3 +440,13 @@ &usb2_phy0 {
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
index 4b6562fc1bdf..bc0ed53c89f4 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -6,14 +6,6 @@
  * Copyright (C) 2016 Cogent Embedded, Inc.
  */
=20
-/*
- * SSI-AK4613
- *	aplay   -D plughw:0,0 xxx.wav
- *	arecord -D plughw:0,0 xxx.wav
- * SSI-HDMI
- *	aplay   -D plughw:0,1 xxx.wav
- */
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
=20
@@ -102,15 +94,6 @@ reg_3p3v: regulator-3p3v {
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
@@ -201,9 +184,6 @@ rcar_dw_hdmi0_out: endpoint {
 		};
 		port@2 {
 			reg =3D <2>;
-			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint =3D <&rsnd_for_hdmi>;
-			};
 		};
 	};
 };
@@ -218,7 +198,6 @@ &i2c2 {
=20
 	ak4613: codec@10 {
 		compatible =3D "asahi-kasei,ak4613";
-		#sound-dai-cells =3D <0>;
 		reg =3D <0x10>;
 		clocks =3D <&rcar_sound 3>;
=20
@@ -230,12 +209,6 @@ ak4613: codec@10 {
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
@@ -405,30 +378,6 @@ &rcar_sound {
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
@@ -538,3 +487,12 @@ &usb2_phy1 {
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

