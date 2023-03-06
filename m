Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A1B6AD302
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjCFXts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCFXtp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:49:45 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5BE34F40
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9wu6JF6TxsceRqaJaK3L+2bSKsZvNmhl2BOOx6fAFVbbAQMmQE1tEZE/jfeuOcp1vJb9ULMv8cYFdlqB+mxQ4ncE9dymq7onaWBqPSWPZPgTQ5cDavLpYgcrboGspKTxqaMXHkVPhbwGyegAoSxqR+MzUEUzxClI/QHwi9vtBlpZhkusDCxLRqgkHi1zVwHnzyBoshgAMKj80fEEkzNbp1opwWI5za8aLAtCWSoj0rXHmQ9YOfxf6oW+YpU51ic7sFSkkzwhBVmJZv0fO+JrT9bz7UmRmqEOfiu8lCdGgQ0lXSi1fnqVBFhq6LaH0jsidiSpLz3MgmxG5G256kRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqKIyMWlxuJyuXt2Je84uA4KY2xs9pBUmcZ7l4d900o=;
 b=V4R6kxibdeBY7laRC9uiBMUEpzmh+0aRzI9EXVhjqWMFkH3YkDowcgZFMFiQWELWkBFrDQ4Q/nvGrQBdbwEnm8PhFR3rpdh4D5om5dcjNtQl/OeUfhU9655D7djl+OwOr2DB/jwZt+ajCI4Mr8FnO8sEtYFaHfPPEtgtSX1B47j7Yrx2uyEiDiiIHCrR8a0uiY7Ubhh6Inu6uGfCLcXrOqGcbFI9z9wr+s7RyeDlBi/Z2m2Jld+ILW3B5KWdW4eecyheLsJUEY0JXuEWFUCcKEXZ+RQQ5k10tgWa55LyaJ8tuFthNaKvhEdw5zXF+cUVW5SMt5arNHOmaLWFI1GS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqKIyMWlxuJyuXt2Je84uA4KY2xs9pBUmcZ7l4d900o=;
 b=k5zlUaT0ZLn6kWForg9wOXMs1kWogic3hHlcn6+eiRVPMtoyHKCVjPg8xkjdgkphEYGk2878LMzJ6M/6/GWg3SRp3B4xOPddw8pNNZo9V/iEKQYPK17i47wTQhK3ydIgLDx/ZnKbub+2Qp6Uf2w5ePux4GvWlkBqhdxw89r/LWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11980.jpnprd01.prod.outlook.com (2603:1096:400:3fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Mon, 6 Mar
 2023 23:49:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:49:41 +0000
Message-ID: <87o7p5l9t7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Mar 2023 23:49:40 +0000
X-ClientProxiedBy: TYAPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11980:EE_
X-MS-Office365-Filtering-Correlation-Id: 0110c397-89e3-41fa-4c07-08db1e9d741c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVVySU0+N5emSkK1s05zmIb879hUBLtVHGynjn00V6AwmwG7JtPxFrN0Nllxj4XrysHxL0WTQxY/X3rXjMQR+dYoUtJFEvb3g/Y4Dna8O72FXlwEFzSJ/QGAfPhBYgwLfmI5XkvUFv1q2wLAZoLioJRqXpBNpVCCpVq/rdRU/YKKKgPhPKVlZC2+/ZqFpyDrTz5qBfNKuWXbDwdI/2GA5MwG9okJb0wrNzm6iMQOV8KnwRlU4WC+j5CTghD1tVpoGeIgx/kdQZnuP/Owy9LUhyWHPKxC570NtqdG73AzLNTBTk0zkSbudveyCK8FaYxt3RftLEcAKc12VktLE6Kzva+jlA9RxKvqqxf1MOm0Mk6Ma2FIXm62DTRBRWfcWDzOOUZV84AqpX/hnNMMu95QtbzSRUO28IeDw6ZvAUTXpMQ75TQV+UnII2xdFKmANUGfWh+o7VSAt1ubF7mSUBWPrA/fIQGFvujA7X5jHq6TD1cgDOoNbtuu4Fc3T1oKIZjNyNEcL+f1F0ZEL/d5gAIaGH1EwuX4WmkiJrYTsEJwg6qEmTDAgm96hjMj1G9YH+otkWsoDnd1fuJ6em1t/GytJqzLLCVRdprmOxydxFnyV1C/d97qdiLbZbAqD3ax/vsYAsve3W70zJddnmCgLRiV7QYGaMGEuqQYWCHKoEDbcmReG/x6O8tuD/4mm+0fK0Jy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(36756003)(6512007)(6506007)(966005)(6486002)(2616005)(186003)(26005)(52116002)(316002)(41300700001)(66476007)(66556008)(66946007)(8676002)(4326008)(2906002)(8936002)(5660300002)(478600001)(38350700002)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2qAm/cONf8Pjo4A3OCvhev7ADh/RMQj5qaaFTXd1r73Cg4UIH6ciDNzciC/?=
 =?us-ascii?Q?TdOUA+1xFR5Sfdt2L8GLLUZoacSmrgehe9svPUI9QbjC1s7H0s68esPCFu2d?=
 =?us-ascii?Q?YVv+/x1QwPBJEegLXPZnEcm+6XLdZHxiIns+JMOxep9+KdJFaFznBnd7QAO6?=
 =?us-ascii?Q?TVSN9UcfeWeJpBswFaoRAETueCzfRuPRmaBoWTYYKrGSlaNABmbiJjHKXbGB?=
 =?us-ascii?Q?WR0RUDa2p0n5CuJDlfqtrCM1FHFM1mvCLOQADMLKq4wGff9mNJU5vVh277j7?=
 =?us-ascii?Q?3lZibGzgkgZPghYPAiWFAiXe1D0ygkWiOtkV+Sib3xWS6EYeAZqweCj24Rox?=
 =?us-ascii?Q?JPSEX0RkypfHX/tmyUaDlMkxwpVYeZd70J3ZTNevZucW/JulvM6rEYj2BVU+?=
 =?us-ascii?Q?EU7KZpx6M8tLqdBevPmuGpaI1ErNjo3ZuD0EWezW/cRsBycq2Ms0rntn5O9t?=
 =?us-ascii?Q?YszCbFYAKokpF2pQccLpDYtvNzho4WRBAW0OwxjCDle9DgRuEKBhjD/Ib7sn?=
 =?us-ascii?Q?JGNQY6UlvbHkrgZCk76aymcu6k2znBAJmQjxlAM1bV/S3gvasltET6CwAc2m?=
 =?us-ascii?Q?LjnM3yyYb99PF2Fl7/YxxSO3Zwkgr0xBUKuOinbxvfvV18IYhbqbUj9Oqh7h?=
 =?us-ascii?Q?UGSLjvDXH4HCgwwzQnIigKelIrPcfKr54bv9kHSh1d/xOfLvEwTywmuVjC5E?=
 =?us-ascii?Q?ydnt5Sj5ncW2E+1UmLR88kRQNXBfecZf55tV2mr4GmAvl86wZAzmPC65bzvo?=
 =?us-ascii?Q?sUO2/YhSqwB7A5NGBBUli4Akb6By2W7io7cNcd2JiMuHaVEchYFSiKSgHJL3?=
 =?us-ascii?Q?dVPh+pCgKuTIsTtLNAOGaZp8GEZ6EAXNfJEcFTUODlqLbisVP5wd27538uuB?=
 =?us-ascii?Q?0WYEVSc/12tVDIggdlV4VKyd8cIIE0Wyajpj4U8VyQmJjJ2frHuRlaujCerU?=
 =?us-ascii?Q?12OqRPNjma3aJ8u05LpyNmfpo7bCOGmI+ebQjg/h2SS/3p3AnUMcxWb93gVr?=
 =?us-ascii?Q?TqejCfOv32Uc+UTP/FBGe2wEKPufruWRtbebIPo2PqHZJFe/qQIS3TYOVD5K?=
 =?us-ascii?Q?/F4N6tcR9v55HqCUeLgN067i8c7jTqPcbMfuIP4HZwey7D7dAJcFCt8HrmFv?=
 =?us-ascii?Q?plKMdIBvHJ1vRcNg3oHSOXI08SFZdmTUlWUq7UCLAlLEtecX0hF0TFoetB2Z?=
 =?us-ascii?Q?xsy2BVrz6jvP0G12cvFiGKmij1ieouZ/mGLRsbQjv5zQnfwhq7BPDBeMZs0y?=
 =?us-ascii?Q?C0CZbZaEh2xGWlCpDFIo0Sf7IqqNOACDVYlgcDkn4zPwsiLvCFcgT2tYCOSr?=
 =?us-ascii?Q?Hq1rdYJCYTOyN492ta3nX4vCpUJahsPOxRhs9HA4BzFJzH/apVOS529PeHRk?=
 =?us-ascii?Q?a3xNs2gx2xMbT7tgygCpKp8pjFmiXNMH/S3Mp8bDrFDa/B86R7A3n26qF6I9?=
 =?us-ascii?Q?b4Upejg7GIM1rGpNF8KCs0csonHInm/bqnz6fAhyHIu8sqsGeYC5OpaNRtRw?=
 =?us-ascii?Q?y+JoxwnBp60gtJSuEx0KtggKI/eryqbKPj4xFxipfKPQwt4I8ptdllbsw1Cu?=
 =?us-ascii?Q?DUGNYiPE4RY0oFcrmVKvKJt0EFe1Yc1efrRUu/uIKRUy9XIuF7puyPh8Uvkb?=
 =?us-ascii?Q?Rti4+BlzxLu9grGdGXk2EXM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0110c397-89e3-41fa-4c07-08db1e9d741c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:49:41.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL9+5NMF3ewd9BArOPj9XfYMZ6prvzwU4yGABYjaeW0Vdk25OGn8tE3pljzyVnpNKdDnEYvpZpJ2buOkfbfCseC4RRJEmA0qK+ySZIu/ZyHZflktdFZd9fvGKCiayIBK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11980
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

These adds R-Car Sound support for WhiteHawk board using
ARD-AUDIO-DA7212 external audio board.
It is using DT overlay.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 0699b51c1247..22c1d20224ef 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -67,6 +67,7 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
new file mode 100644
index 000000000000..9135d8e4ec0e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the White Hawk boards with ARD-AUDIO-DA7212 Board
+ *
+ * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
+ *
+ *	https://www.digikey.jp/en/products/detail/ARD-AUDIO-DA7212/1564-1021-ND/5456357
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
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
+ * +----------------------------+
+ * |Breakout board		|
+ * |				|	+---------------+
+ * |CN34 (I2C CN)		|	|J1		|
+ * |	I2C0_SCL	   pin3 |<----->| pin20 SCL	|
+ * |	I2C0_SDA	   pin5 |<----->| pin18 SDA	|
+ * |				|	+---------------+
+ * |				|	+-----------------------+
+ * |CN4 (Power)		        |	|J7			|
+ * |	3v3 (v)		   pin9 |<----->| pin4  / pin8  3.3v	|
+ * |	GND (v)	    pin3 / pin4 |<----->| pin12 / pin14 GND	|
+ * +----------------------------+	+-----------------------+
+ * (*)	GP1_25/SL_SW2_V is used as TPU
+ * (@)	Connect to pin5 (DATIN = playback) or pin15 (DATOUT = capture)
+ * (v)	These are just sample pins. You can find many 3v3 / GND pins on
+ *	White Hawk board, not only CN4. You can use other pins for it.
+ *
+ * [How to enable]
+ *
+ * You need these configs
+ *
+ *	CONFIG_PWM
+ *	CONFIG_PWM_RENESAS_TPU
+ *	CONFIG_COMMON_CLK_PWM
+ *	CONFIG_SND_SOC_DA7213
+ *
+ * [How to use]
+ *
+ * 44.1kHz groups sound is available in default.
+ * You need update audio_clkin settings to switch to 48kHz groups sound if you want
+ * see
+ *	[(C) clock]
+ *
+ * You can use capture if you change the settings
+ * see
+ *	[CAPTURE]
+ *
+ * You need to setup Headphone
+ *
+ *	> amixer set "Headphone" 40%
+ *	> amixer set "Headphone" on
+ *	> amixer set "Mixout Left DAC Left" on
+ *	> amixer set "Mixout Right DAC Right" on
+ */
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+
+&{/} {
+	sound_card: sound {
+		compatible = "audio-graph-card";
+		label = "rcar-sound";
+
+		dais = <&rsnd_port0>;	/* DA7212 Audio Codec */
+	};
+
+	tpu_clk: tpu_clk {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+
+		/* 44.1kHz groups [(C) clock] */
+		clock-frequency = <11289600>;
+		pwms = <&tpu 0 88 0>;	/* 1000000000 / 88 =~ 11289600 */
+
+		/* 48  kHz groups [(C) clock] */
+//		clock-frequency = <12288000>;
+//		pwms = <&tpu 0 81 0>;	/* 1000000000 / 81 =~ 12288000 */
+	};
+
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	codec@1a {
+		compatible = "dlg,da7212";
+
+		#sound-dai-cells = <0>;
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
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply  = <&reg_3p3v>;
+
+		port {
+			da7212_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint>;
+			};
+		};
+	};
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
+	/* update <clkin> to <tpu_clk> */
+	clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&tpu_clk>;
+
+	ports {
+		rsnd_port0: port {
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

