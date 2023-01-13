Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7DE668955
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjAMCEP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjAMCEO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:14 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7497B621B1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIFEYbTB1mFtCdeQJjY+1X3BgSMXuYgzHUyv6quOXNJorHJsobt7Jn6aw+gyO5sXBFW5KUJ5lxMZgkRxne5j3eBP/2Y8O+5deu6q2AZSXuhtrEQi3SKumccplPHmtZdlU3Ok6XUTh8+tAv1yFQyotXKu3ecBvqZzn9oAkyySfq8V5NeQWsjm4sQQATRZlqJ7e1xD/fR5VnF0azNSwTjNIuOYO+nmUqclKUm+6eXkA6yLx5YzX7JANwKMyCKSsNC+6ERaQbvWKCDpQ3Lx0RQtcDbXpFF1a1OoFqSEWuBzzmvOewzYQMuat10yjLDWfuaK19NlStZZtYnPQloL/wx0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwwXoJozOHEqJ34cJX8nC4JMqnq/p9f5yIABQsABbGY=;
 b=Mg++hevwwS3AlFDLHa8Jpm6I+6auJ9IiX1OS7lIQP7bthBTuhngt6lGcrvh8C5Bhaid+Z2FgwQWFyyfqZvKWEyzPX/6yHd8eLIN8P4c21L7tjwX2zYCSZpg05PDSVS7jVuaS4PxVEaumBE2moVU/AzXVb4aYF1dFUAxw64aQ1UC4IqvjX3Odx5zFotCi1jOo4xSTjM1OKPT67NtwQKRsvbqd1uS1v+mkpNxvaYINF7tTWFyc7vo99vLfhacKWP99+WL1dX7OGfPornzGlzEKzc1ynJINfsieEQBIskLUIytlqKfiGLDZrSpf3Kw5oX8H3FH5xPd9yW/xtFDzbpFJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwwXoJozOHEqJ34cJX8nC4JMqnq/p9f5yIABQsABbGY=;
 b=a/isMN0gUeN024mk59MUBKkFr5HHE2H3tvddIBXPlO2wR1O4h/KfK+EnZTSQz2rNMoU5p9QMzxfNnrifcDcPxuTlrxzToEsQGQtrVbjRLxe+A3SLXxp6HVhKAlUen+BxvTtHNPezCqsdvNmJbmw6CZeW6fbIvEAYjqoZH8/bqtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11239.jpnprd01.prod.outlook.com (2603:1096:400:3c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 02:04:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:08 +0000
Message-ID: <87bkn3i414.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date:   Fri, 13 Jan 2023 02:04:08 +0000
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11239:EE_
X-MS-Office365-Filtering-Correlation-Id: 12835b97-608c-4337-532a-08daf50a74b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/ZxSAJNTBAAqcHXweLKBanPS0YFfOcwd4c4gbxqcM4LxguvucrLb7XNoy7RT2ZS/AR+9fd49ywAaBJyD41Uim1Im0yXOCuYwandTK4L1mQts9/NfkhaUGyB/pS8z7qmOjc5Rg8xnokKxgVbpfSN7eRTLrsZ+MOq4JN3MamTLwezUm0whBCJBoWcpunQh+KffkeNvmZ7ubJjzFwzgbnpMSeInXjRHQFhx/R+adG6RaV6rSu/DWVfwQ4g3cpPh62g54khntVmvJKUomFA2u6oktFUTmX1eciDOovQMfviZHYEIvzGdC0eSX5piCp7SSJeuXh6wATjGWsCuGL+UjcpqLD6xlmabQviD6eCtkKR3yWZRuHzcKYasSqz4FCMkgHleJBsZAOJ+akRIdlsQdEd9Rx+PLyLgay7vqAm/lU/HNFfgH+cgqSN1qAv9Zb/O8F+6h8ZAgpoAldcTS8RO2V1pW/2MklUFpfTXfk8w9xk9FXld29TUFpKOkC8wxMfDnohhuER+Irf73hSHCv78/CSCEKP0jN8CbjF0vb6Z69br2OvmweqORkYV5JVDWO+OwxqXc0RTpN455nzXT/Hsm1DfL+Uckle19CcMZD3Xrts/ZgqXthaB32mJRx1V2WwW1ZUmT5jG+gLjdW8RcKxZzU5rgpRIsXWx7a5f1ZL3enLQoE1yAMEV2jIjh6ZhdyZUSFg6c9p1rcsQkpL6dDaS8iYZJwtGovzDKhpxsAyLz+/2dKYd/PuGJO6cBHtcRZg5ewn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(52116002)(6512007)(478600001)(38350700002)(966005)(36756003)(38100700002)(6486002)(86362001)(186003)(6506007)(41300700001)(26005)(8676002)(66556008)(4326008)(6916009)(66946007)(66476007)(8936002)(5660300002)(83380400001)(316002)(2616005)(2906002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eg9HQIOUPU1cWXcUqrldDebF3V5BxwWuPLqQX6Tun8bAeblTXj4grNUhjMJV?=
 =?us-ascii?Q?avE/V6stFAVRSN3xzmByYs6MOiSfmB5OGwlvchL6jeevTVGwDve9eoOf/b3T?=
 =?us-ascii?Q?Q1m8E2IazMVMm5Ks2l341ZSC++0hhqKh37eBk5dzxVcOV7j1ytvPKfxpd/qD?=
 =?us-ascii?Q?PPhMvNSBH01BfaFMP9UT6iZ6g4Y24a26zbei7Ad4vD9LSIwCAmgTM4A6n+j9?=
 =?us-ascii?Q?qRSldQPzr0bu4MSN7t2hj17LNPFhTuIvQO/OmHNVFw+F5FjjrKzfRLa/6GF4?=
 =?us-ascii?Q?mEbJ99H5SjiTcVIAW56WnJbfKu5AiYU9vt5P8KeC3NXDCUWRRzZPeLpr4zBR?=
 =?us-ascii?Q?+xxcCIeF/psRLpmpK/4wNXllaaeWjTCetpvfSEcb+iIDvVbavgyyuqN/kK/a?=
 =?us-ascii?Q?YHgnSuUwA/Ewr5d0Ncpb8xjVHzM2NSgjf9sjumrPpmJZ8kgxARU4hKpogQ/H?=
 =?us-ascii?Q?vhjqdfQfmg9CPZcgJKBAnsUvjc0NNWANCDn6mtP/SeXRiGgc2dqMoLEzhrMU?=
 =?us-ascii?Q?CkFm1jfpnBsGGQgM9NscTz7DSoJtidM6L0BXjHxmBOcy+3xXGZEUvc9W1Ubh?=
 =?us-ascii?Q?8xakuzTYD2wtTxO5UBxt2034fP77kLJjjRzrj61yB2Y7dKTu++uuM5RGwyDi?=
 =?us-ascii?Q?e8Brj1M7rb+QUpI/rp5417e6gF55QvKv7LDl4lgmFVEvpxIBLp2ozBN5hg6H?=
 =?us-ascii?Q?K0u0V4a9zufTBLjLn6zLOMEz2erwM/Cu7HgwfTgQOsOBAMKslzaIEKmPwn7n?=
 =?us-ascii?Q?Is7jP6BSEoeQDerkFMKlTCk97y88HW4jw2/PDXqTsqETlvZosJUhUvvGDVwd?=
 =?us-ascii?Q?d9ESuFToG92KXxFOTrwZKOoxQn4c/aV7uzk9fzzvZpjSA3RL5YfYLf+dH5BK?=
 =?us-ascii?Q?B2r4Sr4r2pvAd53mGUGz3+TEbsqdzq3KQi06QghiLLXikKStvCi6E6nVtIdb?=
 =?us-ascii?Q?46phnphW8T5XNZ/qRdAp5WK0udLLpneigmkwmMuB2SBzGStXGhmIJOEeO2z6?=
 =?us-ascii?Q?3UcdXxbw6dcstO4AwRy9c+W43vFxfTecHLebzSQLhcRP44hRrRUd0Uza1sGB?=
 =?us-ascii?Q?2Ue4qAuRB6ZUtWnigvG1rbwiJqummYnYeWvYDP3tUzUQpsq0ZvWqh0jtTntR?=
 =?us-ascii?Q?6+5pgakLzFJfysUXCDNP78E2uBivyPwjvoa8GKjXMzoIQvOqL0SfKMbwFw1b?=
 =?us-ascii?Q?DEGYVGwFCsyck8bIPbT0mFxnEJZv4supjgiQ6/CKIH81l9WYhKNEoTO51DoC?=
 =?us-ascii?Q?AcYMf2VvMSQtG6JWr4D/bdxXzUeQJTazn7opKqsRX1tERMSIO/pcWt9E9+Fe?=
 =?us-ascii?Q?EGgXqH+B0LjiMoNrl/LM360moqq3HssP7UzdGZHdN3spC5OP4OB2+0vP3hj7?=
 =?us-ascii?Q?Pg2uQmjphT/p5UE1hQpP2AmkZ9NGqMaTZ7MOEo3ANtXlgwzjE460Jg7IYxjG?=
 =?us-ascii?Q?jH2e4ftbUOGpr+/yuTTp/OJQKmPeGai0yDoE4+M6RCxN0R+QAlMidUxjxprt?=
 =?us-ascii?Q?tnld+JK6hXtDtBKxgIs9YM+VY65WMapbgKm8p0ohdhhXeAbZviNLfgZsupaQ?=
 =?us-ascii?Q?YtuVynzORKsqce/OCVU9TEMIB1vedSF1aRuDB+FAI9222jW49QDgenw5C6jA?=
 =?us-ascii?Q?qER2Cc8/KNcQ6sWbwxzEWiQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12835b97-608c-4337-532a-08daf50a74b9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:08.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfT1WGJ2EBNcRPfH140zkHWczgmBKbakNdXvOwWp7zeNAN6wW7/RK/KL12cRjykTmw5MPfJ7+4xRDpcV1MJF/g9DtwSOujXPVtgAmff7UHAFQtM7ucaLvXDzyxOwV454
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

This patch adds "Audio Graph Card" DT setting file for ULCB/KF.
We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.

Because it needs "switching driver", not "add extra feature",
it doesn't use Device-Tree overlay.

Link: https://lore.kernel.org/r/87a63qpxge.wl-kuninori.morimoto.gx@renesas.=
com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/ulcb-audio-graph-card.dtsi    | 85 ++++++++++++++++++
 .../dts/renesas/ulcb-kf-audio-graph-card.dtsi | 88 +++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dt=
si

diff --git a/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi b/arch/=
arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
new file mode 100644
index 000000000000..3be54df645e6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Audio Graph Card
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/*
+ *	(A) CPU0 <-----> ak4613
+ *	(B) CPU1  -----> HDMI
+ *
+ *	(A) aplay   -D plughw:0,0 xxx.wav
+ *	(B) aplay   -D plughw:0,1 xxx.wav
+ *
+ *	(A) arecord -D plughw:0,0 xxx.wav
+ */
+
+/ {
+	sound_card: sound {
+		compatible =3D "audio-graph-card";
+		label =3D "rcar-sound";
+
+		dais =3D <&rsnd_port0 /* (A) CPU0 <-> ak4613 */
+			&rsnd_port1 /* (B) CPU1  -> HDMI   */
+		>;
+	};
+};
+
+&ak4613 {
+	#sound-dai-cells =3D <0>;
+
+	port {
+		/*
+		 * (A) CPU0 <-> ak4613
+		 */
+		ak4613_endpoint: endpoint {
+			remote-endpoint =3D <&rsnd_for_ak4613>;
+		};
+	};
+};
+
+&hdmi0 {
+	ports {
+		port@2 {
+			/*
+			 * (B) CPU1 -> HDMI
+			 */
+			dw_hdmi0_snd_in: endpoint {
+				remote-endpoint =3D <&rsnd_for_hdmi>;
+			};
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		rsnd_port0: port@0 {
+			/*
+			 * (A) CPU0 <-> ak4613
+			 */
+			reg =3D <0>;
+			rsnd_for_ak4613: endpoint {
+				remote-endpoint =3D <&ak4613_endpoint>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssi0>, <&src0>, <&dvc0>;
+				capture  =3D <&ssi1>, <&src1>, <&dvc1>;
+			};
+		};
+		rsnd_port1: port@1 {
+			/*
+			 * (B) CPU1 -> HDMI
+			 */
+			reg =3D <1>;
+			rsnd_for_hdmi: endpoint {
+				remote-endpoint =3D <&dw_hdmi0_snd_in>;
+				bitclock-master;
+				frame-master;
+				playback =3D <&ssi2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi b/ar=
ch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
new file mode 100644
index 000000000000..1db99b7608f0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree for ULCB + Kingfisher + Audio Graph Card
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
+
+&sound_card {
+	dais =3D <&rsnd_port0 /* (A) CPU0 <-> ak4613 */
+		&rsnd_port1 /* (B) CPU1  -> HDMI   */
+		&rsnd_port2 /* (C) CPU2  -> PCM3168A-p */
+		&rsnd_port3 /* (D) CPU3 <-  PCM3168A-c */
+		>;
+};
+
+&pcm3168a {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		mclk-fs =3D <512>;
+		/*
+		 * (C) CPU2 -> PCM3168A-p
+		 */
+		port@0 {
+			reg =3D <0>;
+			pcm3168a_endpoint_p: endpoint {
+				remote-endpoint =3D <&rsnd_for_pcm3168a_play>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+		/*
+		 * (D) CPU3 <- PCM3168A-c
+		 */
+		port@1 {
+			reg =3D <1>;
+			pcm3168a_endpoint_c: endpoint {
+				remote-endpoint =3D <&rsnd_for_pcm3168a_capture>;
+				clocks =3D <&clksndsel>;
+			};
+		};
+	};
+};
+
+&rcar_sound {
+	ports {
+		/* rsnd_port0/1 are defined in ulcb.dtsi */
+		/*
+		 * (C) CPU2 -> PCM3168A-p
+		 */
+		rsnd_port2: port@2 {
+			reg =3D <2>;
+			rsnd_for_pcm3168a_play: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_p>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num =3D <8>;
+				playback =3D <&ssi3>;
+			};
+		};
+		/*
+		 * (D) CPU3 <- PCM3168A-c
+		 */
+		rsnd_port3: port@3 {
+			reg =3D <3>;
+			rsnd_for_pcm3168a_capture: endpoint {
+				remote-endpoint =3D <&pcm3168a_endpoint_c>;
+				bitclock-master;
+				frame-master;
+				dai-tdm-slot-num =3D <6>;
+				capture =3D <&ssi4>;
+			};
+		};
+	};
+};
--=20
2.25.1

