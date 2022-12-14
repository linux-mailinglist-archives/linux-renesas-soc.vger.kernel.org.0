Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC9A64C1F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236998AbiLNBso (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236970AbiLNBse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:34 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC642253B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw922x5DvEjrdCffXguBnCyXJaPAIAFi6uxBq+fG3pQxmBZT1FyX6LpsMDFP9wPm54yrSpa5vCTh/pgW2Gch70XXl9aK0oV3uTtCXM1lqeQvKcpSRuIa0lYLaASUsL6Pby008N+diL3B2g7Lh1cbnY1W+Iq8Vp//Co0I0Ge9FibsYJ42DKlSigxM5m1aUFyo9hEvTY6QlJFOqk43AP/BbtipYRzph2YxyzkL7CWiuny8LaDE1JR9g8yb9ktr2Wg6305573rquJkg2IPx7pM7rP/BDP/Zc0HqZuMYWhVIb2nEq1jm6x7L0qW8PVpesFXTHcuDKUCLXwaG76qxMHVDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFPRiTk41l+g3WrH8hZcGXbY6294uvL7WPD0/a3xuN0=;
 b=fjGqwgKRHHaarMudfIsLYLovokUV4thB8swb4K1yj5rOM7ZNXMkHqvT1xAeeFX4HWlhwC5nrAZZJsqcnZJedgoh+1/EvJPtQMa+ioJB5LTr56GhAe3IH0hmG5f0OIvAH/WrSK2570z//EfVPOFyoObLzp20paO3KcVpWeESYPCvLeXwR3ymLuCIS/XvoMiu3WWiJRAQi/tTuwMXAEVJlnOOCBZzBnx6WZWJdxplalN5HBuN3Ycm5HqJwYpO5jLxAQQc6AaU8us2W04SqwlaFyvyFgNg+TnUQWzHnNV6eOT6MPFMMPOBZc1JHgBpZrB3ZCYyyfDwRO1Yg7Vox6FPKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFPRiTk41l+g3WrH8hZcGXbY6294uvL7WPD0/a3xuN0=;
 b=L/cn+5JAa517YNeS8l+9sZcGxDk6W4bC2wpWs6IeHtNGas6eFKZ3caipO4vvkUU0Zizr74zc9hXmIAez0Eg3dE7SlZlCc2ZjhaRAa01ZOh6YuD5OmoqwOD8L0JMYYMscjHIZl3QMv+dbxVSF98eedphQTnHPVznmltraiLafvDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5626.jpnprd01.prod.outlook.com (2603:1096:404:8054::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:30 +0000
Message-ID: <877cyupxg2.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:30 +0000
X-ClientProxiedBy: TYCPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:405:2::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fcc653-7ada-4c33-d2b3-08dadd754d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emEILek8a7/ilbKDkpI7j6zJ32S2niJKCgM6W8T4sXXMob68WLS82sg64XLHjyG35eFT1YWesA+hrN/jUUT8iH0dMvOC33Afkd9OBqia1HPUVPn5o5lCthuBJiaD5z8mCag1CBkHoAKYuaZdoKVvS4TK/miey+C9MFWJ++qzn5Hu4cTO4J04faX5oOCqdHMcgR8RyGf6l9UgtOygd8MoaRb/MLlqGspQ37PAdC0FyK3A83PcRw7rmz8nl1gaIDc9IVfWbEZa/DtrbMKgOclrd0ifS0/VqCE7sYsfNvLszO+/dxGLj663Io7XWvV/okXRiDXXHsnouy7EUmhRh9HWtOoNjsXc/ugDUV707nF/Ehec2dK0Fy1X7YgqakK9K+RHRsTh4OzXRZwR4zZo1b3w/oxOaseE1ZAGIW8+KzLr3zpyKvKr30P9OJl4ek2t58J9oLRnw5Iec7xtUpUv/qYPTV8/E6jZy+wd2wNC0me6SMsQ1cfVOr8pKlihrms2NqAcsb6pYN4bzzh7vouz714IRe20DiTqC+7R2jp/yjKyjj/kc2MMVzyZ8pzW9ed4e/IN6eEzRC/Brv5wZNDnfpvA9MS21m5HQWlfMDPhbvp+3TpvM+Ry8mJyObqZ8OYfSD6XD689tz6N7+P+x7m+cGoIBEb57HoJnargJxqkZ4WtZDla8DPj0mvr+piA/AtS+jCMknMeccOnojxk96kiLHfeuM33p/mkECTGjsktibAzsTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(36756003)(86362001)(38350700002)(83380400001)(478600001)(186003)(52116002)(6506007)(6512007)(6486002)(26005)(38100700002)(2616005)(2906002)(41300700001)(316002)(66946007)(4326008)(66556008)(5660300002)(6916009)(8676002)(8936002)(66476007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGVWQAD+mTa4kUuNhPU0L+tDxvi058w7ngnKH3PBEJF6mOQ+cbYcueztnsxT?=
 =?us-ascii?Q?muzVlVYutd11DNYhVgFsY68u2en9JQBAhz+TyJjqrYHkPATItq/E3lTAN7Hu?=
 =?us-ascii?Q?J2KTHUYwoJ3OQNlXtP0EOzh9G4X5/fTQFvziE3Ty70oV5ALZOm56/j9TEh+y?=
 =?us-ascii?Q?YMVTXXLH5exsQky21WbJGgD7OW55OquaDVY9A1p/KBA5TVB+v2EPl5ytJf/x?=
 =?us-ascii?Q?eUiJCPda133I1+A/JM2BaxlnmH4kC1K11aggw2Zk5+3AsldPF6yE0frGDBVI?=
 =?us-ascii?Q?4IMRdcZJ2N/bQdW1dMzlYA4PDoxKlwgj+83WgZLrPjXrWCeWes5MRwqmyixd?=
 =?us-ascii?Q?sJtZnjBsr+tPWXkggXHMaQ/KtgqHdTtFZ3ZxwAxSKeIlBf3UMFvB2DysfSgE?=
 =?us-ascii?Q?mTpku7+JSSQvUFKqUI1oBdBHWvZMXEcaHsgYSVOR/hQvvkKo3jUTBLYFUV4e?=
 =?us-ascii?Q?skekqrM7swgqfdrXrSWP72f9yb4xJXvOqunEBaASJoZy+SWViSbpRaJcuhzO?=
 =?us-ascii?Q?cc8/bFSSwP/tc6TOe07rPVMtYYUQMImqAW75LA2kbEpcSM6VRcuCDx6Tlk1P?=
 =?us-ascii?Q?Fi3SZWuLyv3eU4n8fUFbrH3qG/XD0Ks3oTqKpHDFgETyIw6pjn8WkIK/yHxM?=
 =?us-ascii?Q?PGR4Ao5vgD1NQ3ncOeBXzaDfppJqDIk5hDpBTNm0/NHcn4neF/3B1rUgp1p5?=
 =?us-ascii?Q?o+W0ddjhJIJ5JztvmTfWm9C1S3TvF26xfjG0i8V2QDBocoTexYwlHrm7N5Wk?=
 =?us-ascii?Q?FUnBd0w5KyetxN3RsvtCBbbowKZmVDbbH9X3suMLFULVt3p5aQ55RYuAaDFl?=
 =?us-ascii?Q?oLql98fSNEyyM8S7QIJ60O24JGl8Tr+AQMxjC+IdXiMJV2yCPL/2Koda0E+3?=
 =?us-ascii?Q?lN+zRouHcDmVikmj0gwTjuvYoPmlCTZSIBSzFXctESEC5+7uILekvN7lDg+g?=
 =?us-ascii?Q?5AB9nibMgTcgaMWsmszl9OPv+Ur+An//EUf1OnHum7hYzHJdm+1Dp3iAJD+E?=
 =?us-ascii?Q?ENGuVKAXbRIjs7RKDqtBFN86oQyfk9e/EFyiUgHbn7tEnT7X8Tc2Aqq1L5Al?=
 =?us-ascii?Q?KYzNTLyfvMB8SReqJSI5QBZX48WVrMJ3SUMWCLVVlRh3ht0Od/WVUYdVjpyL?=
 =?us-ascii?Q?3wHa8ih4pWYlpktT6PZR/M+LwyzqxWXX6oq1QQMpIbZbUNdkofwvSeq51iI1?=
 =?us-ascii?Q?UswKFMdETnxsfdW5OErHfbXXxXBOCk9tcZaYVlzQ4jnDrNT/N7Fj+B1PIuTP?=
 =?us-ascii?Q?MbcJRzymWyerEa6aDvzR16PyOcZ0oILIIUnzvrAngyeVQUsMt+j7FVqZXt+G?=
 =?us-ascii?Q?lyPWW1E+HDKXl/N7V1mu8IBnfKhWfp1xHNJ2dioY7H9woDSV2f9DRBa+13IK?=
 =?us-ascii?Q?EziO3kn8EaZgTBXs6izkSRKycK8ltskavtmcps1aq5nPMO2MklCCd4MqlIzm?=
 =?us-ascii?Q?BIG40dkzoJKFBLEqQ/uHg+9Q4pxzqmnmoW8RJ2AUK9AgJXRp92two3diK4o6?=
 =?us-ascii?Q?T/REoUZtVXF9SgEyNhJw/e6pvjBslZkKnk2Gu8uI0DXDUTcXXJAe+6xSotiG?=
 =?us-ascii?Q?T3NrUTqeQFYeXvQo2wyrxm2aTCAG2vIY08SAoxe61K9dlMbGiQ0iGsqgFK/5?=
 =?us-ascii?Q?CSPqoyv5zSnDBzfQTuOcJTk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fcc653-7ada-4c33-d2b3-08dadd754d41
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:30.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yB2I66fJDCSmH5vaBRR1b/7ihUU4+G1eLq26KkpCgsja6dDaNtaxO3h/2nMUJfmKJzFngGl7IBHE52nuzaDB83eJGc05CSV8f/SIGUBWLhmoclOV7IdQpPwnZoTyhFfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5626
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

This patch adds "Simle Audio Card" DT setting file for ULCB/KF.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../renesas/ulcb-kf-simple-audio-card.dtsi    | 85 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  1 +
 .../dts/renesas/ulcb-simple-audio-card.dtsi   | 89 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |  1 +
 4 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.d=
tsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi b/a=
rch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
new file mode 100644
index 000000000000..8949145d447d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Simple Audio Card
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 ------ ak4613
+ *	(B) CPU1 ------ HDMI
+ *	(C) CPU2 ------ PCM3168A-p
+ *	(D) CPU3 ------ PCM3168A-c
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *	(C) aplay   -D plughw:0,2 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ *	(D) arecord -D plughw:0,3 xxx.wav
+ */
+
+&sound_card {
+	/* dai-link@0/1 are defined in ulcb.dtsi */
+
+	/*
+	 * (C) CPU2 <-> PCM3168A-p
+	 */
+	simple-audio-card,dai-link@2 {
+		reg =3D <2>;
+		cpu {
+			bitclock-master;
+			frame-master;
+			dai-tdm-slot-num =3D <8>;
+			sound-dai =3D <&rcar_sound 2>;
+		};
+		codec {
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 0>;
+		};
+	};
+	/*
+	 * (D) CPU3 <-> PCM3168A-c
+	 */
+	simple-audio-card,dai-link@3 {
+		reg =3D <3>;
+		cpu {
+			bitclock-master;
+			frame-master;
+			dai-tdm-slot-num =3D <6>;
+			sound-dai =3D <&rcar_sound 3>;
+		};
+		codec {
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 1>;
+		};
+	};
+};
+
+&pcm3168a {
+	/*
+	 * (C) CPU2 <-> PCM3168A-p
+	 * (D) CPU3 <-> PCM3168A-c
+	 */
+	#sound-dai-cells =3D <1>;
+};
+
+&rcar_sound {
+
+	/* dai0-1 are defined in ulcb.dtsi */
+
+	rcar_sound,dai {
+		/*
+		 * (C) CPU2 <-> PCM3168A-p
+		 */
+		dai2 {
+			playback =3D <&ssi3>;
+		};
+		/*
+		 * (D) CPU3 <-> PCM3168A-c
+		 */
+		dai3 {
+			capture =3D <&ssi4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index b5877120ab46..6913d778a40b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -453,6 +453,7 @@ &xhci0 {
  * We can switch Audio Card for testing
  * see also ulcb.dtsi
  *
+ * #include "ulcb-kf-simple-audio-card.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
  */
 #include "ulcb-kf-audio-graph-card2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi b/arch=
/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
new file mode 100644
index 000000000000..ae1ea872fd11
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Simple Audio Card
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
+
+/ {
+	sound_card: sound {
+		compatible =3D "simple-audio-card";
+		label =3D "rcar-sound";
+
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		/*
+		 * (A) CPU0 <-> ak4613
+		 */
+		simple-audio-card,dai-link@0 {
+			reg =3D <0>;
+			cpu {
+				bitclock-master;
+				frame-master;
+				sound-dai =3D <&rcar_sound 0>;
+			};
+			codec {
+				sound-dai =3D <&ak4613>;
+			};
+		};
+		/*
+		 * (B) CPU1 <-> HDMI
+		 */
+		simple-audio-card,dai-link@1 {
+			reg =3D <1>;
+			cpu {
+				bitclock-master;
+				frame-master;
+				sound-dai =3D <&rcar_sound 1>;
+			};
+			codec {
+				sound-dai =3D <&hdmi0>;
+			};
+		};
+	};
+};
+
+&ak4613 {
+	/*
+	 * (A) CPU0 <-> ak4613
+	 */
+	#sound-dai-cells =3D <0>;
+};
+
+&hdmi0 {
+	/*
+	 * (B) CPU1 <-> HDMI
+	 */
+	#sound-dai-cells =3D <0>;
+};
+
+&rcar_sound {
+	#sound-dai-cells =3D <1>;
+
+	rcar_sound,dai {
+		/*
+		 * (A) CPU0 <-> ak4613
+		 */
+		dai0 {
+			playback =3D <&ssi0 &src0 &dvc0>;
+			capture  =3D <&ssi1 &src1 &dvc1>;
+		};
+		/*
+		 * (B) CPU1 <-> HDMI
+		 */
+		dai1 {
+			playback =3D <&ssi2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index 6196494452c9..497d07df6944 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -501,6 +501,7 @@ &usb2_phy1 {
  *
  * We can switch Audio Card for testing
  *
+ * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

