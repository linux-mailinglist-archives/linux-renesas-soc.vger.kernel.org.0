Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C3967C2BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 03:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjAZCTm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 21:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbjAZCTl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 21:19:41 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2106.outbound.protection.outlook.com [40.107.255.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF16F38EAE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 18:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q99kChDJNOkAoK6VJPv2eJfZx+m7A7cAuWah9Ee51D+AzJIqdVQP5BNyTOvLr4Rsga4Ydu4vPm5srGV3Whw6gPpwZAXk6GsEjovG9yLzgAhADza0A4pLDQFWceD+ia5xX/unE2tJukDt0jO8nEAKeaBwinNy9emnCbC+sqMhO1dkkH6t+ZKTNtx+rmB6Su/YvfEd8U04JE2M4bDUT7RMW+QDnFBPps7muulxV20DTM3kyk66JhBOQTK6YhDqatyXSziuxtxUF1oVlKDP98OhGTMVji8YPVKRItJmoInu4T21ulfEXK2IqVqzIsgxlMjUhAfKMYjWpDDBnnsy5VXVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBhbkUbZCd5VGRURZeZrIaO3q9g3s1CFHMSzfLZjQic=;
 b=dq/oA6yAL3JXnAr412mvskzAepN6D5V38WpafsgwFVp4A7VftMhYgDOJnJDejpx1+p7qFcRhsXnh4JUKA6ugSoNg2qRCCGsnQIWXts4xayYtOX1mmzbgv6xa1rgIjPgIjgp4d+b/E9WMb42xrHN68qmXGq9MJxaCHby8zjrNHM7cDHvxPR2eHGQ+Az3ws4cfliSx+KPNyvKSclpYyFyvvXQ7VKq9+PqJl83LWKiSDQH/QaF/UVJmw4yQsgNWeD7c0N9T9pkfdCGO13xPtzAwutmAWMaGMR0jZbY3kuJNTM5iUrwd2YZ8q9qsAXLpZ8mNUskzozFcPwHoc4tsF/bwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBhbkUbZCd5VGRURZeZrIaO3q9g3s1CFHMSzfLZjQic=;
 b=H9tHvzLFj6NBRgftWIQNgGuLnw1wU/hl0301ynELCX42st6QeMC0wbcekcS36uT4K3TBEB1FPOusH6XeTb7YZLeS5vDZSkBvyOF1vW0CCom6SUgILTTtt1En2HZBuXExm9GU8Rseni6XMI3z5TL/ozOVFguBc2I+INPNQx9nfMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11323.jpnprd01.prod.outlook.com (2603:1096:400:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 02:19:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 02:19:35 +0000
Message-ID: <87sffyt4ug.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779g0: R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 26 Jan 2023 02:19:35 +0000
X-ClientProxiedBy: TY2PR0101CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11323:EE_
X-MS-Office365-Filtering-Correlation-Id: b372d1f4-26b1-47d0-edc2-08daff43c4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxVpHf35hRiHk7bt4GZ0tozB8IPB9eFasd5Pfukn/sLbDMk2uWxo0dhwvhDoKBT0Sm8kgNtCjAUTmIDYn/ucpLjofFQ15uSLl6I1aKgOA+tFsIR32QOCBwgOOl+TEqmillCdxb5dDuwTsl92J42tUCXSXpxrjTuA92Un2mSn2fFaIrCt4yZ8Zzp47zrxayNHm+5leOgWDkwgSTfuJGPWy9zhhv05YUYW2CwQdLQHagd5TF6qyDcJKS8g7vEs6yy7D/MHc+dJ532N/FXEUJDNoTLspSkCVmLD4KZhc3m+1ZFEKwx3TH+HbN0VDlTyBxFnttplSYtWSEHIJgyIXZe1MvaxUxsxzZe6Z04SJ2DT5wfrZyTT38MJCrHCIayKogvRmj3gt6D7ZbfR512RiNfAplQZGLnVAoUQ3ZDSSG5PpAx4PbBpJxG2mifu3T9wo+cniPb8b2+1S97joSFQJCGx2mthaI4gUy3roxwZQ9JVX+BwvjSFdEgwLr8Qa7lRuMiQgUaEmn8lx0OYW6ZifO/QPbjj6kVaGQBL0Hwjq8Ah0yXO+iohzSos8eHwWdEDVK2QxWSNG8s9WNQ75HFx29jZPwzELRgioBB5aH9JUhQAIEcVQypcixzo4wX9uI5Mneh+q49cScRhR7Es4EqT3O7D6C7O9GRUXVgjfUjWiKtAbOUkuQpGLMEAOABVFQjPf/ON7uZxgesVhwdIo8zTwMgf6hCnk1lJ+KhHP0DkjOwl2b9+9SFyZnTvq8wiWmGRqBzq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(83380400001)(316002)(2616005)(2906002)(38100700002)(36756003)(52116002)(38350700002)(478600001)(66476007)(8676002)(66556008)(66946007)(8936002)(86362001)(4326008)(5660300002)(41300700001)(186003)(6512007)(26005)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6C14gWyl13irsprh2e8msZjEpOPkzOD2X2MT81Zctp54xt/vYuQUObo5VOw9?=
 =?us-ascii?Q?U/pHOT5uq5+c7ghCWGrzP7Zy1Ew85svQLeFyYl+t0jGKpvZ87xhEBJxfkquU?=
 =?us-ascii?Q?5WHlbtYd4/z1XQv+frpO2qRm0NSV+pesNixDJhiZqYWrInLQHkhTWrevuWbN?=
 =?us-ascii?Q?a+safzV4uBtVQrogjgJ4REhzg43vigQJNwwsjt58Y6Zkv5igpklYDdkalI1l?=
 =?us-ascii?Q?lIiAt3mdB4RvM2DKoAvJXAK/+zlm3CuNz3YYM5XMZUgsaevcgDEPmu3nQjZT?=
 =?us-ascii?Q?ZrfGEy92X2vKZeJyM7ybwjdy6BNV1PjOjs7elqXhxNtbqTtsZxqF9pJsrLXu?=
 =?us-ascii?Q?amWXsoYFquknPfdJufa/waMHV2Dnn0nrocN5c+Zuc2HFbpmP30q+Va2ohgni?=
 =?us-ascii?Q?mxR1mLkChaGj/2VAebZ7RZR6hhq948mf+/sH0DfRkMVFfIm4R3ZaURSBdBY8?=
 =?us-ascii?Q?BRDDzy31zKz2kgKei/+Cv3KVbwfOOyGvpQWKdev22mWab2PLS8493WFjXSPI?=
 =?us-ascii?Q?Ti/vHlTyGHDfsl+OMV38yGTJcm4dX+hF1n1rXpNW7h3Px7+S6+TPCbWrwzKg?=
 =?us-ascii?Q?+MIMUubsKhwbfMkhsgJlnFfJrOtvzMYGgv6ye3NkLR4neCiofuYxFX5sQ3/Y?=
 =?us-ascii?Q?bL56/m3OHlLgXk/sHsWOzDAoCYjkSatIdD2tJ5KQxv0Ouf+IjW2BZZ5TJ4eR?=
 =?us-ascii?Q?4oZ+NdU0MBlsVeFT1X9Iw2Cwi41CSFlwNxs9MqVqhK44Cc4ioSetrdDK3wz7?=
 =?us-ascii?Q?3YEhsRkwPaH6dIH5uB7Jmv94Nwp3feIW2uVOsZlQblj8C5b3g6rE0Y/hRCJw?=
 =?us-ascii?Q?oAVLFjiP4KQprVgDrka7VfsmR6qHvxxzfLDYsMmBHYxV+ag5or7qqpqtnWzs?=
 =?us-ascii?Q?2VmiJkZUFJs1GjgnA24kHktpzxlPMjFtMdmRJAFfr2dVZkZ+McJHUZf2WGHw?=
 =?us-ascii?Q?pWnXGgIXgXlcWC7jXw8x5I5C5Zor7ILFA/wKCLb5HY9fyay+JXA8nnpLRN32?=
 =?us-ascii?Q?YSTHbvv3cwTxN4yL/iTyhkQUWztvkzgxMoyMTN6pyOOUa+c5O8SDtcMFSuKz?=
 =?us-ascii?Q?DliQHKYdKt5bNSOR9actjE7X3d9oaGvwtNZna0TVd7XNZ3Q7xhGurDGckn+J?=
 =?us-ascii?Q?Ggn3dFpUWQJpDueMnCLh1bJNRT78QH39BoZHh1QmspVyelmfq54jbOxbvz6S?=
 =?us-ascii?Q?cWTNKhvPo7p9NohjGhQPEMzFqzcMYbaEcAlCTgQu1HgQOhkjtjlo0yFWEDo7?=
 =?us-ascii?Q?QZBIAS0Wpdgz4Z0Y37bQY4SPIqtpFIYB0EhyGw3AOmY6OowFgdouti7ljibG?=
 =?us-ascii?Q?CGhdtglUkLJuinpVBGTi37cSBEeOqcfpU91ZP44B8hpo2U+xPkqu6L13rX3+?=
 =?us-ascii?Q?MTyrUMQF+0f1JoSLl5QH/e67cgwClo0dINGrGLk5xkbAfICX0lnenaBYKaUg?=
 =?us-ascii?Q?bwTXkcYns2+MYmXwJSCswVE+1gIMSmsPow3KVzAb4ZlDefS8CuSVN1GJmjrI?=
 =?us-ascii?Q?D9HmKi67DJ3DDtGMAT1/zFKVYlmMn4lBV7jGjU/ndvs/mNF3NcBFqeTVqy8s?=
 =?us-ascii?Q?peZ31dPxRGHRianN1cS9Xp17X9khbmQ6ommiFNfaff2bEpR7hssqxAg60PqR?=
 =?us-ascii?Q?ioxh1b+KMs0toFmgjrrKUAw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b372d1f4-26b1-47d0-edc2-08daff43c4d1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 02:19:35.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNfqCzoAo45JJKKioOMaqnqPYqPLaZudHP317b4Vpx2aanZS2Jq/TBNUh2dkS/Ghxi4w/Hs7+Ml1WnhEiYbveHnj0qDhd17H/T5jsu3EOf9+LyLwojjVX/HkT0R3eQ55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11323
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Linh Phung <linh.phung.jy@renesas.com>

This patch adds Sound support for R-Car V4H.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 78 +++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 45d8d927ad26..46696af36b4d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -172,6 +172,15 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The clock from AUDIO_CLKIN pin are configured as 0 Hz fixed frequency
+	 */
+	audio_clkin: audio_clkin {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -1162,6 +1171,75 @@ dmac1: dma-controller@e7351000 {
 			dma-channels = <16>;
 		};
 
+		rcar_sound: sound@ec540000 {
+			/*
+			 * #sound-dai-cells is required
+			 *
+			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
+			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
+			 */
+			/*
+			 * #clock-cells is required
+			 *
+			 * clkout		: #clock-cells = <0>;	<&rcar_sound>;
+			 * audio_clkout0/1/2/3	: #clock-cells = <1>;	<&rcar_sound N>;
+			 */
+			compatible = "renesas,rcar_sound-r8a779g0", "renesas,rcar_sound-gen4";
+			reg =	<0 0xec5a0000 0 0x020>,		/* ADG  */
+				<0 0xec540000 0 0x1000>,	/* SSIU */
+				<0 0xec541000 0 0x050>,		/* SSI  */
+				<0 0xec400000 0 0x40000>;	/* SDMC */
+			reg-names = "adg", "ssiu", "ssi", "sdmc";
+
+			clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&audio_clkin>;
+			clock-names = "ssiu.0", "ssi.0", "clk_a";
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2926>, <&cpg 2927>;
+			reset-names = "ssiu.0", "ssi.0";
+			status = "disabled";
+
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&dmac0 0x6e>, <&dmac0 0x6f>;
+					dma-names = "tx", "rx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&dmac0 0x6c>, <&dmac0 0x6d>;
+					dma-names = "tx", "rx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&dmac0 0x6a>, <&dmac0 0x6b>;
+					dma-names = "tx", "rx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&dmac0 0x68>, <&dmac0 0x69>;
+					dma-names = "tx", "rx";
+				};
+				ssiu04: ssiu-4 {
+					dmas = <&dmac0 0x66>, <&dmac0 0x67>;
+					dma-names = "tx", "rx";
+				};
+				ssiu05: ssiu-5 {
+					dmas = <&dmac0 0x64>, <&dmac0 0x65>;
+					dma-names = "tx", "rx";
+				};
+				ssiu06: ssiu-6 {
+					dmas = <&dmac0 0x62>, <&dmac0 0x63>;
+					dma-names = "tx", "rx";
+				};
+				ssiu07: ssiu-7 {
+					dmas = <&dmac0 0x60>, <&dmac0 0x61>;
+					dma-names = "tx", "rx";
+				};
+			};
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a779g0",
 				     "renesas,rcar-gen4-sdhi";
-- 
2.25.1

