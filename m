Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9296872B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjBBBEh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjBBBEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:04:36 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F8D6A69
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojmz6XPvXPWMwAuFoQWkkVjlhwEJSDPk3aQQ66JGXv51LyXGu1cBykeWBZzi1ndFeJFvQWr86Ui1UKxxvbZlcyUz4QP4jHQOGx89CYPzABHlWqUYkhtXDkfGYduqXS0LzbNq7xKFWdKTFPu5LZ39dvKM/iC/heQSAjOnJl3/OZQrguG/aedrI3mn02ajv90JuXYveNFumaMORK9LL6huTR11dIbdyaapx9+sI8LCOATuIeHCvhtnE1l60msdZZHA4gO/ORtNjJq4u5GHixfqmFOISEVrF2D+UOZImARzpXvhvAVH5WyPFTbrSNdDFkuGL9YWRLAyzYSxO8HcEvBU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1TgYvsbbvjdfSS1hZvpdsbqe6tio0rRSrHMuwaHR+c=;
 b=nF0xqc+P/jriY5CV5k5kaH6PlAX4dcOr81dx/QaD12jB2nywUklrB/v6ij8Nk7hV1TPELlaetI5kOpq3pskmIdumblKu57TvJv+294Jm9w83WUEztx0AnRBl9lbDDo3p6N1eNE9gr8TgKvGacTt+hJyl/mR7TCyfTL8kUjBiPhvW9CLvPkzkpZWJUl7Rre2HiLQMhZi2eW62yuagdyfvSQXr+ngdU71C4G8iQVW/uTVgih2H6nFMjfZgsPxcYPxCULIoxlX96q1EfLmQoErbz8+WR5ixoalm1RA6+xO6g5M12BCFRC5yfPG1mDILfAZoEsgmOWFTijhE3o103Sn0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1TgYvsbbvjdfSS1hZvpdsbqe6tio0rRSrHMuwaHR+c=;
 b=Fquv5v5IFGc0pRjdV37S0U8emePSvdrY6WrMuTXyfgHenH5rDkV2iqYsPFjYrqeDm/dulHWyPMjXn1sUm8Oaey6NTQ5wCPBORz5TnFq7w8KJjBeWwv9UN0zLOW1TZsmG0NZw0OYMEkbAFoTyq88WubUYAyBNlSzA9hh1fPJYhh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8628.jpnprd01.prod.outlook.com (2603:1096:400:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 01:04:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:04:32 +0000
Message-ID: <875yckands.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/9] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:04:32 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaddf21-af8a-4920-3edf-08db04b97182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f698vEabhJ312fNx85/7/LkSwQWmaKn2EWtkfFCGENM8ue3TAugUeZqIN4Cz/1eK1lxM54IKrYLyDFd9iSebXrydOjRTLhJFrpDayHRKFXiWYyeBVjWhbJXxD1NfmPKa7kYX+NhgSSgyt3+YGZcVDVqQqJl0KTEJRrDOEzbEFPSuh7STTtSUADVx2zahmOVN2Um0++V8XeW4NnWFFxNs7plffY4ZMKcbHtLTGYYX8+Eon2XT+YXxmGD7qialmVtzOpp+ARYrgYWc4BRjZ8vKMrr4KadYB/C4IqphhDE+yi7djpynwmczEECu04hgHevM/6MTgiPMt08Wel8tGMNjWQHjUhH+Wpshz4vJpzFwQPMyoS5PPyM7KJkaAJZvfHy666yEQSEFeGuRSW4rGncY8MAW3pP/P99zWc8t6+0w7ChJWGJpKOwVs1BNThlNcBL6QmNLp2qxvQW1yALA03wS2aqXnrar/rPgGujpUrNQWcZX6v9DhEipRPvpM+OvHX3PAwsMILszBUKMEzWIj68DS2XRRiOXRHjhfkHH49ySD8Msy4rhWUfuqjsWBAub6HY0MOSjv/Fl5smjEw2sBHGuE38zrhjRvY3Eqq3CeAUnjudMgLS2WKZ4jlB+DALl0bO3Ue07xuS2xO2BGOhwv1Z1xpHrtbvuF/iT1HZHW5gs/FbwFkhDzf1OLJi2uMUg7cH7LR8KAifYDvPQzV2mqO+limtGpOMAgh3BtpyWECALS5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(36756003)(4326008)(8676002)(316002)(86362001)(41300700001)(38350700002)(38100700002)(66476007)(66556008)(83380400001)(66946007)(6486002)(966005)(5660300002)(6506007)(478600001)(2616005)(8936002)(26005)(6512007)(186003)(52116002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sm8Ai5UXPi1FKAspsaRwGa6cq5M5oOQgRqLbSEE/Po2KWowp7EVJkPXIOJ0k?=
 =?us-ascii?Q?rTtjnma16pWTqQJEzSBUHyZ7RKoyc93WY5/ZeIPUxmx0iyyCucNGf/Axzapg?=
 =?us-ascii?Q?86QsM20Ke/e2bILGMlOQkiL+vh2MsisbbduoeilMPtkMwpezvR/lMX6UxkoS?=
 =?us-ascii?Q?iFm9AE/SKsjQ5A9RC/KUT3M5OI3O2oNVjecC7cVTztbqOofKIfVboFPkdlxk?=
 =?us-ascii?Q?BwybXFESOSan/cz05JTXJlFRVtdQzZ0jaTk/vcEv0SolIkIZHPte+1j/M2qh?=
 =?us-ascii?Q?cVfpdC21FhT1GzIk5TyHm1tCyxHiQifzxtquUm+52Hi02eDXyuhmVRTePzC2?=
 =?us-ascii?Q?q1Z2+WojZYP6GaVulcOp991U0bKUqSbxJh1Nmbutp5cZZxur2k6yDn+UNTsg?=
 =?us-ascii?Q?zh5xa0VvZFHynRhhKq1fJeJq6SvycFiqohj7Y/EarVLujlVqmP7fsJmZKcD/?=
 =?us-ascii?Q?djdZAhb8NwbEuGS/LZMM7BqExSLy8mnLQmZN5r9HTUVpQyu827EJ1ooRBgGW?=
 =?us-ascii?Q?KVgBwhnmYU+X0CRbNnv8ZjRbtqDmcTcbfblxH+dJtyfeJPnN8sZLOpufPg19?=
 =?us-ascii?Q?I5mixJ3njkMs97FKj8TQsdmQANRraDUBB9oyZns9AuJlui9E3Zalf0hwKt1h?=
 =?us-ascii?Q?sWq1zumD8ujbQfnR8kFaIhuqcHZYm2FTYr1/4NueJ9eBGXaIZlqU3BsyFGRW?=
 =?us-ascii?Q?h34KR+zwq2v5gXs9+QaFLSBc3oqKXvsUfwkfy6V+NnKImEtNlN+yWBs3BoA5?=
 =?us-ascii?Q?mkNA5pP+QlL8dOTQbGrfFaV8dMdQX1rI/UfaXf83Fh9dSchiU5/X3QgsNy83?=
 =?us-ascii?Q?GaApQ2uoAOZUL38ROa+mwrP0irTE7SZ27LPerfA5fLiaxWkOWCrl2By+o2cc?=
 =?us-ascii?Q?DYfS4gIUSiklRISBdTwfZDU37pOmFT+6+G+lJXI4cVccq6fWHDCMBDMu0nDI?=
 =?us-ascii?Q?xd9xRI03qYyMYTdLf9U7skqVDhcD0OAq4lMHNyTzrmEiLWSiLaTmJXhAFAUf?=
 =?us-ascii?Q?1CQHHigwGwX0QBCFd972AP+TCFQ07cCKROBn+Rh2NXWxeMFHGAXatE/uZbO5?=
 =?us-ascii?Q?SatTe2c3K+W0IE591PwPn0nDnh5RJL9LA+xTntBGlax8Ml1zgBlBFOQrf8GH?=
 =?us-ascii?Q?/Ew/QUCHGPpQ8DP/wVSJy4lanRqw022EarHVGQS+MopKly6MCorNH00GVypM?=
 =?us-ascii?Q?a0d3aNHGCJ7QNSscK5XOAUpQyrVtCdKq7A1mlVBvYEb7agtWAwR8fL/LXz+7?=
 =?us-ascii?Q?ay224Mo0uERjFIkRDKerKedD7G3mU4RGysHYlPeybye9wZDoiwJ+IiC/xPD0?=
 =?us-ascii?Q?gKO9YJYxmB+uZ8y41/RHbkBZVnU7/7fICKS7jL/MBy6wC8AVRlo0hwdCdl6k?=
 =?us-ascii?Q?Pza/mefFzGtnfqAGTLNyxj8hX26Ds8KhVR4owcJ4g3hE3D3CJ1KPINDmwiCB?=
 =?us-ascii?Q?nk2MoXU4b3MPkHJyGMo/YCuHREZMdttWOoiT4Y2C6Y2R2yVaNKcgWjxOYBq6?=
 =?us-ascii?Q?400ufIuiHB9uGWmtEFi57tStYimhfpx5f8aW9kODqgkJQXWtVPOYil8XsfWL?=
 =?us-ascii?Q?UmnueMB3U4yNHaWOChAkb57WXFFqaNusYmbDPfUwytueetJeyCJPqE7QhQor?=
 =?us-ascii?Q?b0u/FqyQGp/6cV6Mjzw/Xo8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaddf21-af8a-4920-3edf-08db04b97182
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:04:32.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M9kcl6enOTQ9UgmwHVX8b6uQjd0VW2DOMA/YNa44L86P469cxNnXwzbN2f+GWjpyXxQR71Iau+RqO8s4shl5G1EZimNCcGh4bNby+MIs2LE3Ri/NG3/rsAroO5GcUPa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8628
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

These adds R-Car Sound support for WhiteHawk board using ARD-AUDIO-DA7212
external audio board.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../r8a779g0-white-hawk-ard-audio-da7212.dts  | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0699b51c1247..df80c30e03ce 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -67,6 +67,7 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts
new file mode 100644
index 000000000000..25c89217c122
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dts
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the White Hawk boards with R-Car V4H + ARD-AUDIO-DA7212 Board
+ *
+ * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
+ *
+ *	https://www.digikey.jp/en/products/detail/ARD-AUDIO-DA7212/1564-1021-ND/5456357?curr=usd&utm_campaign=buynow&utm_medium=aggregator&utm_source=octopart
+ *
+ * [Connection]
+ *
+ * White Hawk				ARD-AUDIO-DA7212
+ * +----------------------------+
+ * |CPU board			|
+ * |				|
+ * |CN40 (IO PIN HEADER)	|
+ * |	AUDIO_CLKIN_V	  pin1  |<--\	+---------------+
+ * |(*) GP1_25/SL_SW2_V	  pin2  |<--/	|J2		|
+ * |	AUDIO_CLKOUT_V	  pin5  |<----->| pin7  MCLK	|
+ * |	SSI_SCK_V	  pin9  |<----->| pin1  BCLK	|
+ * |	SSI_WS_V	  pin13 |<----->| pin3  WCLK	|
+ * |	SSI_SD_V	  pin15 |<----->| pin5  DATIN	| (@)
+ * |				|   \-->| pin15 DATOUT	| [CAPTURE]
+ * +----------------------------+	+---------------+
+ * (*) GP1_25/SL_SW2_V is used as TPU
+ * (@) Connect to pin5 (DATIN = playback) or pin15 (DATOUT = capture)
+ *
+ * +----------------------------+
+ * |Breakout board		|
+ * |				|	+---------------+
+ * |CN34 (I2C CN)		|	|J1		|
+ * |	I2C0_SCL	   pin3 |<----->| pin20 SCL	|
+ * |	I2C0_SDA	   pin5 |<----->| pin18 SDA	|
+ * +----------------------------+  +--->| pin14 GND	|
+ *				   |	+---------------+
+ * +----------------------------+  |
+ * |Switch Board		|  |
+ * |				|  |	+---------------+
+ * |CN5			    GND |<-+	|J7		|
+ * |			    3v3 |<----->| pin8  (+3.3v)	|
+ * +----------------------------+	+---------------+
+ *
+ * [How to enable]
+ *
+ * You need these configs
+ *
+ *	CONFIG_PWM_RENESAS_TPU
+ *	CONFIG_SND_SOC_DA7213
+ *
+ * [How to use]
+ *
+ * You need setup audio_clkin (see [(C) clock]).
+ * And set TPU from user space.
+ * Let's use duty_cycle = 50% here.
+ *
+ * For 44.1kHz (= 11289600 Hz) (= audio_clkin)
+ *	1000000000 / 11289600 = 88.577 = period
+ *
+ *	echo 0   > /sys/class/pwm/pwmchip0/export
+ *	echo 88  > /sys/class/pwm/pwmchip0/pwm0/period
+ *	echo 44  > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
+ *	echo 1   > /sys/class/pwm/pwmchip0/pwm0/enable
+ *
+ *	> aplay 22050.wav
+ *	> aplay 44100.wav
+ *	> aplay 88200.wav
+ *
+ * For 48kHz (= 12288000 Hz) (= audio_clkin)
+ *	1000000000 / 12288000 = 81.380 = period
+ *
+ *	echo 0   > /sys/class/pwm/pwmchip0/export
+ *	echo 82  > /sys/class/pwm/pwmchip0/pwm0/period
+ *	echo 41  > /sys/class/pwm/pwmchip0/pwm0/duty_cycle
+ *	echo 1   > /sys/class/pwm/pwmchip0/pwm0/enable
+ *
+ *	> aplay 24000.wav
+ *	> aplay 48000.wav
+ *	> aplay 95000.wav
+ *
+ * You need to setup Headphone
+ *
+ *	> amixer set "Headphone" 40%
+ *	> amixer set "Headphone" on
+ *	> amixer set "Mixout Left DAC Left" on
+ *	> amixer set "Mixout Right DAC Right" on
+ *
+ * You can use capture (see [CAPTURE])
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779g0-white-hawk.dts"
+
+/ {
+	sound_card: sound {
+		compatible = "audio-graph-card";
+		label = "rcar-sound";
+
+		dais = <&rsnd_port0>;	/* DA7212 Audio Codec */
+	};
+};
+
+&pfc {
+	sound_pins: sound {
+		groups = "ssi_ctrl", "ssi_data";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clkin", "audio_clkout";
+		function = "audio_clk";
+	};
+
+	tpu0_pins: tpu0 {
+		groups = "tpu_to0_a";
+		function = "tpu";
+	};
+};
+
+&tpu {
+	pinctrl-0 = <&tpu0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&i2c0 {
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x1a>;
+
+		clocks = <&rcar_sound>;
+		clock-names = "mclk";
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply   = <&reg_1p8v>;
+		VDDSP-supply  = <&reg_5p0v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply  = <&reg_3p3v>;
+
+		port@0 {
+			da7212_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint>;
+			};
+		};
+	};
+};
+
+&audio_clkin {
+	clock-frequency = <11289600>; /* 44.1kHz groups [(C) clock] */
+//	clock-frequency = <12288000>; /* 48  kHz groups [(C) clock] */
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_clk_pins>, <&sound_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout */
+	#clock-cells = <0>;
+	clock-frequency = <5644800>; /* 44.1kHz groups [(C) clock] */
+//	clock-frequency = <6144000>; /* 48  kHz groups [(C) clock] */
+
+	status = "okay";
+
+	ports {
+		rsnd_port0: port@0 {
+			rsnd_endpoint: endpoint {
+				remote-endpoint = <&da7212_endpoint>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint>;
+				frame-master = <&rsnd_endpoint>;
+
+				/* Please use exclusively to the 'capture' */
+				playback = <&ssi0>;
+				/* [CAPTURE] */
+				/* capture = <&ssi0>; */
+			};
+		};
+	};
+};
-- 
2.25.1

