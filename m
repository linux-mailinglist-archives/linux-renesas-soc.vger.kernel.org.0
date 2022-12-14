Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D7664C1FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236955AbiLNBtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237018AbiLNBsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:55 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A8B2250D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHNb7XbrAZTcx7b6c74OpVDmjEay99weF8BuHyrK+pUU2nC+T6+G3TRmKXxW5HXPT0yY0Gpuy0G0jgoHqaQND3iHZZhM9YLqdeRzqNgYqHzqmZ2STBfPayRHE3osmnGhXI5Sui8REC6ncTZ33qifHuOCAqYHTV7VDeubsRToCo9oxv+wQErYmYtrvdB4kNyaVrq5S1mrUfI0Rbk0hyWH2wxqZGVmh67DEW9b04HxBp5M4Rlz/PrSYtyBEGpDv54r05R5WHPEW8aO056xqSk/l/Jb2d44zNK7ZmEy2iT5zLwlEIKByOM4bOuv/2qECpEy+bqmntmVU6Hjj27ge4ZIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tTcxXYNVuTZbD3VbJ1LIGmxXNziZCqNMuESMyo7SZI=;
 b=P4utkrh+usUeaRNXKUMZRl+FAJiNzc9jSw88lRJQL5y7aq9IlK7UJXMRSC7itSoGzQjIJleLGcNjv1NMP3onKZ+mDE69UF8aZsh/9WvNGS3bO/KNKzNxVLgyiB5MYVGSA+vMOPLd00tKC8phYwRG4jBejJoTYF5AKiQGOwMbN/3bibh0gEyqk4TpLXbn++SL6XCMzR0pJow/m3XVSiq5FuTQ0R3SwS7aDtZJF25Hb4pf/U33OR5qKt/aWhACqubAnGK2eAbicQ0/xGWfvDt5EMi4s+8ZVnGpDUDkKqXBboBj1cilo+Ab7jKcMj3JhwPlWERuhTNEtdJIRA776rJp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tTcxXYNVuTZbD3VbJ1LIGmxXNziZCqNMuESMyo7SZI=;
 b=UhJb6PYmLLVfahg2RZteHkpWN5CcRt7WyJxSzlQDao07zV/Osx+Gx5Vyhn73G/vMz35WCjyZYztidKritmqDqK380XmTUfV7R0p04hB+LkEgvd+rcyabnLMCxg1/oTjhT/n9K3sMLQhRNJ1FLzWwT0KiHyQBu8BBqX797/KNUyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:49 +0000
Message-ID: <87359ipxfj.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 8/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 14 Dec 2022 01:48:48 +0000
X-ClientProxiedBy: TYCPR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:4::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: d00c148b-9f23-4a1f-6ecb-08dadd75585a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7c9sqzVpgFFCw82OXlyeRPsjep4w7Fv5JENnfyAEdzXuRD0LqK2dCYqya0qmf6zrI1PRH3jsjJkqiR3nzdrbNQBwltlIWqoQ6lCIznj213nDQBR1tPhZv/k4/lMlb+8MP4Fj8AsuUtOOUeCc4uDlrxNEBJ8lEds8/vfLCeAEv2ZPbYqvzD+v4UkfsAy9GnRiSXiLtBtazSsfuJE2QZEuJUPpeCa7w8sf8UoYJvKQRbwyRxS7izWC1JGvvt+Nkpb7iLEgA2v1XbAy+YqyOtcAt6eEgYncmFtXqoNx0QedhK2UAV76f9/NqolbHl7l56PxLJSaKhBH+/36iQ9xzw1VOhqyKgBeJT9MAuzJjCmm2RCFJEVIPjdF53jl/bf0FlWoT8eEp6TzW8frvRVZfgVNqoXg9f84e44K63asVLgeMDJSzLQwocPG1JWwJGsm6v29dEI4nc9y/6nv+uaBP4xce99OvAefWksJ+QZpIbtiOMTwtCXlVtHo9r9CXoL2KjadmFRMc0CPt1Nm+i+75iKjmIpANO9m6cqBVHHBhexvNCLtG1R1YDkkea7I0hYouvXd9KruPnxFOnVKIaiLNIQDN5yt9+SGd8bcxs2laK9R1cn7g1ZHYLKpjRh7ljAh4MRM+RajlCCfu3ru++EyQw85AgkeX0atjJlMpjfSGLpWXRq2otvnzPs2wG0p/IxJM5wBrCV9jH8PTKk10l+KD7yKVWkTyU7WEy4psFKHjcUFpFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W0xxJxIulhaxV3HUXFMi6UHb04JD71u+sPVjjAVXziriy6XVibVl8Qp/Dvp5?=
 =?us-ascii?Q?+CHbwh57DCI15kHRBvA1IqPP+UPe4cvxur8wuOP29HGQlLgdil9fFHircJHW?=
 =?us-ascii?Q?3d8+6aId+5X0PSMhxqSqOmWwkEtLijRn32BZbmjaDrggvhFcGg4wlj1L3+yD?=
 =?us-ascii?Q?yeTgvr0RtlxNFMsCLTG0vZsgsAsO0FRUkJ9ni4azIJsei5oUN/42+awzCfDW?=
 =?us-ascii?Q?p1rl6LnooVGTQGPC4SO0VKNXsHaRJMA4DF/iBOUeYJESKdh2vUFxeWzvQSqw?=
 =?us-ascii?Q?c3kUIcpKxKu1VoKCB4Eh29o8HNH8JQzAZBDmYGiLLe8MzSjrbX8ugnt9FyJK?=
 =?us-ascii?Q?einKLfUaPhGW5cHSB2LqqPFYQXkNsrgXHMW/0wv9hcY6ZCWSOvBxKcexZ6AI?=
 =?us-ascii?Q?ixnHH1pPM9LfRmnWtQWmVwuARsao/fAjKxjurORxFtERvDuBGnn/gn3hEEv7?=
 =?us-ascii?Q?NektGaHwdIDpIoZzA5+GU6f8Ua3rZau+Mi7PF5SbAg//QuvgkH2A55Sieid4?=
 =?us-ascii?Q?88eoCEBAjMRq4CkZXZ588cTMJQiQ7knr+QI3zGtJPkCczuXEqv+RwKWxD83Q?=
 =?us-ascii?Q?2ySiZr/2HKcEmWmTfn9JBcSHY3C+TmU3ZJeUm0PJ5CAZkUmRi2bfhETeW4X1?=
 =?us-ascii?Q?ECCYXXu51W8HocHGaGMqnATlPLrvGDomn8dcADxgq6YfeIbmJgDNmHoApoo6?=
 =?us-ascii?Q?1zOpJqy1/9r+rlpQj2AfSbBA5eedwN7Go1K/Xi9VRQi1qvbddsOTvmjR/+kR?=
 =?us-ascii?Q?86r9Z8cZUX9z/FAFkyv3hZxhjKUhJ4jPCvErFdpU64aNY5xp+h8lUXDmXVDk?=
 =?us-ascii?Q?c2tS4MuFYEJDCN0RQlX1wXi4EbfUIuCB3drgr+nVRjDNEXZdG8y7L1/F6DYD?=
 =?us-ascii?Q?Dr4MMvsa1RIHOfJtprx5TFaaqEPtPmPs1qJlM/Jiy8B3xnhf5Wu+I2esOVM2?=
 =?us-ascii?Q?MP5N8G1EfaeePomHaECAXyOe5tP05S9XYCvO/Mpaa63tx9zHZjIteeXM6AX2?=
 =?us-ascii?Q?stQmNRtw7E+Vu13L8uiA/j51DNT/HbUzSozKANYc6Z9ZWZfK5JIC/iCP8+yt?=
 =?us-ascii?Q?FUYMOzsVOf2MvWr7kS9auciG/yqVeoWhKUl7RsxXEmJdoAdDCvAtlHt7VsK4?=
 =?us-ascii?Q?MVVgZ2WhJlCyZUpFbfC+0OoT0dHuwXjQX4AcTYWL3N47My6u6cg6W0EQONGr?=
 =?us-ascii?Q?JXPbqlfkemG9LYpzzAHvcBlpcc2+LMQuxLSNF1NG73r/A3DTCJkSA4d/1BvL?=
 =?us-ascii?Q?3PYGxq2Wujkv+ObIE09NONFWMK/+pex6bLkm1eGqBry9k7BCrqRnQ7XsZM3m?=
 =?us-ascii?Q?0nLwLGloiWPE/fy7ktShrQGNBpHGmGXt9v/vRhPqwqSpRIBdGkT/ZW6OyQJK?=
 =?us-ascii?Q?7R5R74aWXvRHHU24iA4t1qywvLc8R7KbEI5kCRE1ZsJcGaL7G03Rq0pIv3Q0?=
 =?us-ascii?Q?cDNvR/NidrPoGlM253ihvDhbciJ4VYTZQkII6yl/3GeuHqb9aegDdI7MtH/J?=
 =?us-ascii?Q?nyujxWzfuEWKFdDCEs7fMxxlVcELEZENlgJcnoFamglvnF/PlR7j+30DW/E9?=
 =?us-ascii?Q?SWL8lL6uS8aHcdlE4mbPCWYuKl3G6b973u3iYxCMYSyQurQlxOp9RjbVDmKi?=
 =?us-ascii?Q?DwKzBRurLNKueFmhFtL74i8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00c148b-9f23-4a1f-6ecb-08dadd75585a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:49.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV5Ez7LUMhzrXPBjl1USll8x7RFUOagJzr2VtnN4WbXD/XCpB9HOyZpIbMzBmw3JpOMEAF3RZbrVqTxy51i2zVxrRk1zG9GfW7NwBiXYcYeWzvhMWCeA5tqCauqjV277
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

This patch adds "Simle Audio Card + MIXer + TDM Split" DT setting file
for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 137 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |   1 +
 .../ulcb-simple-audio-card-mix+split.dtsi     |  86 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   2 +
 4 files changed, 226 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-m=
ix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+=
split.dtsi

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+spli=
t.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dt=
si
new file mode 100644
index 000000000000..fba226fae0a4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Simple Audio Card (MIX + TDM Split)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Note:
+ * Because there is subdevice maximum, it will ignore HDMI output
+ *
+ *	(A) CPU0 ------ ak4613      (MIX-0)
+ *	(B) CPU1 --/                (MIX-1)
+ *	(C) CPU2 ------ PCM3168A-p  (TDM-0 : 0,1ch)
+ *	(D) CPU3 ------ PCM3168A-p  (TDM-1 : 2,3ch)
+ *	(E) CPU4 ------ PCM3168A-p  (TDM-2 : 4,5ch)
+ *	(F) CPU5 ------ PCM3168A-p  (TDM-3 : 6,7ch)
+ *	(G) CPU6 ------ PCM3168A-c
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
+ *	(B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
+ *	(C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
+ *	(D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
+ *	(E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
+ *	(F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ *	(G) arecord -D plughw:0,6 xxx.wav
+ */
+
+&sound_card {
+
+	simple-audio-card,routing =3D "ak4613 Playback",   "DAI0 Playback",
+				    "ak4613 Playback",   "DAI1 Playback",
+				    "DAI0 Capture",      "ak4613 Capture",
+				    "pcm3168a Playback", "DAI2 Playback",
+				    "pcm3168a Playback", "DAI3 Playback",
+				    "pcm3168a Playback", "DAI4 Playback",
+				    "pcm3168a Playback", "DAI5 Playback";
+
+	/* dai-link@0 is defined in ulcb.dtsi */
+
+	/*
+	 * (C) CPU2 <-> PCM3168A-p  (TDM-0 : 0,1ch)
+	 * (D) CPU3 <-> PCM3168A-p  (TDM-1 : 2,3ch)
+	 * (E) CPU4 <-> PCM3168A-p  (TDM-2 : 4,5ch)
+	 * (F) CPU5 <-> PCM3168A-p  (TDM-3 : 6,7ch)
+	 */
+	simple-audio-card,dai-link@1 {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <1>;
+		convert-channels =3D <8>; /* to 8ch TDM */
+
+		cpu@0 {
+			reg =3D <0>;
+			bitclock-master;
+			frame-master;
+			sound-dai =3D <&rcar_sound 2>;
+		};
+		cpu@1 {
+			reg =3D <1>;
+			sound-dai =3D <&rcar_sound 3>;
+		};
+		cpu@2 {
+			reg =3D <2>;
+			sound-dai =3D <&rcar_sound 4>;
+		};
+		cpu@3 {
+			reg =3D <3>;
+			sound-dai =3D <&rcar_sound 5>;
+		};
+		codec {
+			prefix =3D "pcm3168a";
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 0>;
+		};
+	};
+	/*
+	 * (G) CPU6 <-> PCM3168A-c
+	 */
+	simple-audio-card,dai-link@2 {
+		reg =3D <2>;
+		cpu {
+			bitclock-master;
+			frame-master;
+			sound-dai =3D <&rcar_sound 6>;
+		};
+		codec {
+			prefix =3D "pcm3168a";
+			mclk-fs =3D <512>;
+			sound-dai =3D <&pcm3168a 1>;
+		};
+	};
+};
+
+&pcm3168a {
+	/*
+	 * (C) CPU2 <-> PCM3168A-p  (TDM-0 : 0,1ch)
+	 * (D) CPU3 <-> PCM3168A-p  (TDM-1 : 2,3ch)
+	 * (E) CPU4 <-> PCM3168A-p  (TDM-2 : 4,5ch)
+	 * (F) CPU5 <-> PCM3168A-p  (TDM-3 : 6,7ch)
+	 * (G) CPU6 <-> PCM3168A-c
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
+		 * (C) CPU2 <-> PCM3168A-p  (TDM-0 : 0,1ch)
+		 * (D) CPU3 <-> PCM3168A-p  (TDM-1 : 2,3ch)
+		 * (E) CPU4 <-> PCM3168A-p  (TDM-2 : 4,5ch)
+		 * (F) CPU5 <-> PCM3168A-p  (TDM-3 : 6,7ch)
+		 */
+		dai2 {
+			playback =3D <&ssiu30 &ssi3>;
+		};
+		dai3 {
+			playback =3D <&ssiu31 &ssi3>;
+		};
+		dai4 {
+			playback =3D <&ssiu32 &ssi3>;
+		};
+		dai5 {
+			playback =3D <&ssiu33 &ssi3>;
+		};
+		/*
+		 * (G) CPU6 <-> PCM3168A-c
+		 */
+		dai6 {
+			capture =3D <&ssi4>;
+	};	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts=
/renesas/ulcb-kf.dtsi
index 131846dde002..ec115124035b 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -454,6 +454,7 @@ &xhci0 {
  * see also ulcb.dtsi
  *
  * #include "ulcb-kf-simple-audio-card.dtsi"
+ * #include "ulcb-kf-simple-audio-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card.dtsi"
  * #include "ulcb-kf-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-kf-audio-graph-card2-mix+split.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.d=
tsi b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
new file mode 100644
index 000000000000..37cd9a7ec1b2
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Simple Audio Card (MIXer)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ * Note:
+ * Because there is subdevice maximum, it will ignore HDMI output
+ *
+ *	(A) CPU0 ------ ak4613      (MIX-0)
+ *	(B) CPU1 --/                (MIX-1)
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+
+/ {
+	sound_card: sound {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		compatible =3D "simple-scu-audio-card";
+		label =3D "rcar-sound";
+
+		simple-audio-card,prefix  =3D "ak4613";
+		simple-audio-card,routing =3D "ak4613 Playback", "DAI0 Playback",
+					    "ak4613 Playback", "DAI1 Playback",
+					    "DAI0 Capture",    "ak4613 Capture";
+
+		simple-audio-card,dai-link@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+			convert-rate =3D <48000>;
+
+			/*
+			 * (A) CPU0 <-> ak4613
+			 */
+			cpu@0 {
+				reg =3D <0>;
+				bitclock-master;
+				frame-master;
+				sound-dai =3D <&rcar_sound 0>;
+			};
+			/*
+			 * (B) CPU1 <-> ak4613
+			 */
+			cpu@1 {
+				reg =3D <1>;
+				sound-dai =3D <&rcar_sound 1>;
+			};
+			codec {
+				prefix =3D "ak4613";
+				sound-dai =3D <&ak4613>;
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
+&rcar_sound {
+	#sound-dai-cells =3D <1>;
+
+	rcar_sound,dai {
+		/*
+		 * (A) CPU0 <-> ak4613
+		 */
+		dai0 {
+			playback =3D <&src1 &ctu02 &mix0 &dvc0 &ssi0>;
+			capture  =3D <&ssi1 &src0 &dvc1>;
+		};
+		dai1 {
+			playback =3D <&src2 &ctu03 &mix0 &dvc0 &ssi0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/re=
nesas/ulcb.dtsi
index d8b0b07404ca..377fe6891c57 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -496,12 +496,14 @@ &usb2_phy1 {
 	status =3D "okay";
 };
=20
+
 /*
  * For sound-test.
  *
  * We can switch Audio Card for testing
  *
  * #include "ulcb-simple-audio-card.dtsi"
+ * #include "ulcb-simple-audio-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card.dtsi"
  * #include "ulcb-audio-graph-card-mix+split.dtsi"
  * #include "ulcb-audio-graph-card2-mix+split.dtsi"
--=20
2.25.1

