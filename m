Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9F1668957
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbjAMCEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjAMCEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:21 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D96621B3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgLMZLCakv41TBl+wX2JYlg0B84ap1D39pHyK3/aH9RntzhhbONtJRPO8bBvzdli+yd/MDQGq5j17DOFnIbYiXfkQptU/KquDAChtky2OEPzBbQHiyOjBxpX7XJTitPnq+7W/z2Ozr8nBBAYQLGs9QSu21PJ6Eg+tw4jT55SX3dqyY2cB5oF/0r5OJ0XhCx2zzuwGKBboByZSgUzanqOwRp0bG0JMFilsLdtSFR2DnmU5WS58UIXx2t7njZOGAlJQmuD+sF84/NXKe8TSmv5i7NNxGytecdo3Nn2eL+U6GTogue2KwqQFr9gCGw6jKD5J+jZ8GcuL4D2Jfc3geCtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPPw8wyWxPmyr8GqhwOmUtfuST+2RP8ssaCxF2/9HZQ=;
 b=AWTaoCLuSstcNVMPMFImnUFWSvHOPl3POcWijeBabMPPsXoyz7sGfiuRnPIvOz1qJGnuXnN5dWPl6PvBay0WqQwa2zcnrRA/C6UvSIVKNhGMw21SB8zAo+vBrGS6ydErBdo5OzxBNJB0CGVD01xkBZJCzw6eohFu5oF7T0Qek2LaAcOpvv2wqe34vxbJjPHnfiOPMu8nJ+IEHNtPJ4sb7JNPhiqwcRYyuwjz67cAip76/uKi5sC5AN8PDOX+WjyWgm0Ji3OKKeaPOYRvwPCKMlDRr4VwrSNa1WMUzGIWVF3j3LwTiV3UOj6T4xJeAHtUQ5JSfg5QEkio0EckTqjXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPPw8wyWxPmyr8GqhwOmUtfuST+2RP8ssaCxF2/9HZQ=;
 b=lLNYAGREGkWDiX4j5YuJa2oNh1pOl4Ul+18ye4v6uaa9xrKGxnpOLY2X33j/SVgegyjDorLtT6KvstYv7r3xCQ9l3GJg4lrulzzElX18r+3RXDKJfFvd4P5Oj90FHxaizWAK/FHvM8Yy9glgwwlnn0D2l8KYNgcB8I+OblHHHB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:18 +0000
Message-ID: <878ri7i40u.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:17 +0000
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: eeeb9f7d-72fe-4cfe-f0d7-08daf50a7a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtgBy0gfFrLcJWqn32wqapHriYrbsRx6uISTR2a6DrL5qpTQQsLMKVaiDkH4nCR5SAzJkX2Fo8LyqBBSjW5lJ+QRyjN9mlRDMJsrs4aT0kvVwbzTQmCX2bIviiKqwIUrsvbOJhyPjb5W3ygZ2jB24xac2J5BJIk0YUiDgLOMfUGxeew+/cm6mqNbt/FdT4FShSEZLWPltWwj6z2EDrmsyyX6lDBD7lAhq9w5bHKA6z//p+a2HcNQvv0o+QANx/cg3KgnFUp2LigN5Y5wDk+h2tgo3s3WaMQqySD8sadu0hFKnQu5Ii0nZkR9UuHGO/8SNpIAz1sAmz3CW+FGn4nG2krLKE/0RO3vHS1i/q1xnnryl93xAmWQVNYPQix0p65UsFb8EEEEay0neymtxsrwVVQA7rj/1WaVld8Hcca0kUiHPpvqMnqlBWzGRbmCXam3hhu/AdDnT4b1y5pfAGCMNnSp8YDsVyICEH36md1kTdFMM05+zth4tyYJ2K9cw1DROD9GaR94oxv2ZidVugiggZMgL5CCxRlE8PjTwpQsFK/5amiEd2to8LDFKHvG7ARiptFk8y+eK4GjHbEW8wyAjEFBXB3F3c61SrgXYYUv6b7hFjmyzZV2POSuipbRuvqG9hI6pn4ogVAzvTNiEQDd8CCC6RHzea7trTzmNtPUyM81BW0ZZ2tnfdHcyrPQJMLdhKZKAzCpCQjMxjDJZD8V9XpCNoR9zGIHeMZ7Uq9CE1gWTYRqtIvALYmq5uUiJSxb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f05nYZOnZiXz/e6O4sEv4jb2I7ZBejkHGoeGt1lFNb1BluCcNBAPxnCXvvn8?=
 =?us-ascii?Q?e3oUQpZGhY6ODxUqRcJuHOaesY3cgZJZmqI9StA8jM2bNsrjAnsz7o0bcO1M?=
 =?us-ascii?Q?ELz+8N/wVnRG71hdbz8Y93IHF5l9uS+69jVokrRBd9trOVtu7bwTFB2Xl50o?=
 =?us-ascii?Q?oCZE3UpOY9cLHkzA+SdcITatN21QpqodziaNYuTa+eCDQjE3IArgTTkMedeN?=
 =?us-ascii?Q?k7B1BZz64UPZqQ2ph5oF6VIP0Jhp6+j5CIQ9El5Psnl+ru2w22RFsr3Iey8A?=
 =?us-ascii?Q?tFBafCLsy2bfOaHM3V4ngXfksKaxLVw+qFTrAiDxd7wjgiPSAixUU8IasiMd?=
 =?us-ascii?Q?C8fUj2bCNkOSP0X1/JJoAijkM7r12krao1A3eXs8uDy6dphANvaRUPw5d+Yh?=
 =?us-ascii?Q?MnrFBYTtIgAjVrEtswh1iEyF1VtQZprLAtvMnMsm1HW+7eJirSCLPkurobaM?=
 =?us-ascii?Q?4IraT+KkpNoRyNZRDXkpqr9lfP6/EIn64rCWyY6G1hQX/t/xXTstIZDvyHSZ?=
 =?us-ascii?Q?1YrkcUAPT57vqq/cF76lZxSDH19z0X1RhyWIDWMvvi+cDjhb/TbhFnmoU9O5?=
 =?us-ascii?Q?8ldz/bX1f+ZnhEtPzxZ3qtt34N/g44/jszS8ry7kn4uek94UxBhc6oE0mJkw?=
 =?us-ascii?Q?WbAGXg/Gn32DE47bZq/cVtJc9IwWxcnb1Q4cb8suTK7ppzTOU8ln8rwMcOsQ?=
 =?us-ascii?Q?lV1rGgZOvFeURGyse7FoRiYNhGnz75rtgcPTrpwjXndM3Ku6oD7Dx78Dihgc?=
 =?us-ascii?Q?DP2gNuoMCgM/Dq6lv5+7O4v8gTGCL7i5uUOa9NbTYy0SMqFWZEVwBsI4bMM9?=
 =?us-ascii?Q?9Pkl8hxl6t969a8WNLppYIreZ8iIFEPqCZf7OjlDE+CYcIXBDcBkZfNsXFzn?=
 =?us-ascii?Q?2uuo4Phtdu2QsjFlxajb7VG4Q0b/Z4MjX2LIHOxKJqtxp3Ql5RMeQoU6fWzN?=
 =?us-ascii?Q?Ia73b10WkeMeonGngAbI1dOBNW2kXMOSyRAAFk0U0lu2gGzQpvEiFZ7V3sgR?=
 =?us-ascii?Q?2Gz1zdKxAxl8+SDeUUBFCJf6rhawn+De73kjsRj3sBwLY3y5XKb5Ji99B3bq?=
 =?us-ascii?Q?d5fDynF+oG/fjKZr1CTj0ySdKQycG2YQjN5sMHjPBFzPGeT5TjbDheiSoA9z?=
 =?us-ascii?Q?X9y2Jo4yT6w6da4AtEsLa+6uw+3Q81utjYqG9l0Zjbm/Q/HQaQ8r/4jT1b32?=
 =?us-ascii?Q?LdJLBLU8ikkV70QXEe/1RXfzWuXbaku5Xx7fmJrbV9p+8qlgkYv0YSOdaPo1?=
 =?us-ascii?Q?8SSAdKV4UbST/PE1Smf6J2Q0Ilw7qUSd6KGaBC1n68pUhAbs1Lr245RZBk56?=
 =?us-ascii?Q?SFUjIYTNdtFpshM7viivxzOC9avU7npZG0hz6TKhopKA7U/Rhuv7WhDKPeX3?=
 =?us-ascii?Q?K6Exrp94Cq0ksQYkhKi75qio7Tj4+pCLxcSLmASqOyOINAhQgldVYHAIokDf?=
 =?us-ascii?Q?D38em3K2IQOCROAD0qsq8wzxIAdB8oeLGkomDgEKT3FqT+qDC1buOtADt74K?=
 =?us-ascii?Q?08DVexX07QCmO6a0gjGJK6jCI1WdvI/u+H5U6u8L7aGUORsuj8iVYcTaLwCV?=
 =?us-ascii?Q?5eSEsIRG+6kadgBKETRqeJgc+ces/2ROtz45jZ6o9Hw5yq4z/vETqevjiB1l?=
 =?us-ascii?Q?LITc1X92dn6p53YB+FYDJfQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeeb9f7d-72fe-4cfe-f0d7-08daf50a7a84
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:18.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQwkjxkYeSA3nxmwF9WnaBww2fg1lu/BTTTJlbxDWxdh1Z701ZxRVhgmblNqUMol560Ry5qSdJJ0X7cASul4hPrRcAjUX6PElUzviuEedMKUxc2Xz5c+CX5hEfIc4VJz
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

This patch adds "Simle Audio Card" DT setting file for ULCB/KF.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Link: https://lore.kernel.org/r/877cyupxg2.wl-kuninori.morimoto.gx@renesas.=
com
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
index 000000000000..2010e8ac7fdc
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
+ *	(A) CPU0 <----> ak4613
+ *	(B) CPU1  ----> HDMI
+ *	(C) CPU2  ----> PCM3168A-p
+ *	(D) CPU3 <----  PCM3168A-c
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
+	 * (C) CPU2 -> PCM3168A-p
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
+	 * (D) CPU3 <- PCM3168A-c
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
+	 * (C) CPU2 -> PCM3168A-p
+	 * (D) CPU3 <- PCM3168A-c
+	 */
+	#sound-dai-cells =3D <1>;
+};
+
+&rcar_sound {
+
+	rcar_sound,dai {
+		/* dai0-1 are defined in ulcb.dtsi */
+
+		/*
+		 * (C) CPU2 -> PCM3168A-p
+		 */
+		dai2 {
+			playback =3D <&ssi3>;
+		};
+		/*
+		 * (D) CPU3 <- PCM3168A-c
+		 */
+		dai3 {
+			capture =3D <&ssi4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 3527d538a20e..afc63d28bf5c 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -447,6 +447,7 @@ &xhci0 {
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
index 000000000000..751cfd8c5257
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
+ *	(A) CPU0 <----> ak4613
+ *	(B) CPU1  ----> HDMI
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
+		 * (B) CPU1 -> HDMI
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
+	 * (B) CPU1 -> HDMI
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
+		 * (B) CPU1 -> HDMI
+		 */
+		dai1 {
+			playback =3D <&ssi2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index bc0ed53c89f4..95d9086b92fe 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -493,6 +493,7 @@ &usb2_phy1 {
  *
  * We can switch Audio Card for testing
  *
+ * #include "ulcb-simple-audio-card.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
  */
 #include "ulcb-audio-graph-card2.dtsi"
--=20
2.25.1

