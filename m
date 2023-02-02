Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17D86872B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 02:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjBBBDp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 20:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjBBBDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 20:03:43 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2092.outbound.protection.outlook.com [40.107.117.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8259B3250B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 17:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itgqzYvYj4Tfbf5pAds4L4lH4Xn3qM9LDiK3eRGTTCLxXucT/TmZ84MOXeVNUC3K5Ry+iV2fDfaULR0UYVFuXz/jWidnlAa30C65e2aIew/mg2yezDJPGMrHTB37BhmeCx6fvtpS0O93G4UhqogzH6IJXSGbCC/Js4zvRDZE1JdDcUOtEzDZ5KSGnBZ9P2ZGRTBb9HyoV+FKDj+2CqdbN71OFqibZtRgfe2TsXltYts5zR60p/air6/PnK6pqbmgvVbJEhvsx6FHdm4/LbQyNjFevKMdchVKFYzbGAraCwmrhDrItWcMvurRWP9dPhvaTIPSu3clwyBkOgKI7fGpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1f9JrIniHDtYdhD9jC8zYxAWspqo3o5qe990IvQISc=;
 b=Wv1ENeqUUa1rSP818PWtBZuNQaPlr34Xk/FYEYtulq5rwmt8aAXe9tiF28NxbYW3ETVWP/LHCKZy09t8Cjm0qLNE3ByD+WIO30q1Lp2Bk1zisMeAmpVXfzgPNAtmQSlXhN6dSyWiCY9xTTM86QSKUtNvPy2lNaonYb4ovnwpEa20S8IAbJfQaRex4OhdaJBmXeHpiWGn4xAuGKZsoi5TVBdwbZK0n+IL42iXMr0Aj3jAhJ381KyK1HBcmbmumNdEPsUJhiEuoa4aoI3n0gh+f35Mudl0CLoteQQIgaTYBVMBcGyxZokPUda944I2AgdYvVSgIW/WAblziQJdSB7xqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1f9JrIniHDtYdhD9jC8zYxAWspqo3o5qe990IvQISc=;
 b=dLEQrqmOxnxEGAcSt3dOJ88k2rPr1O/wxFL3Vw40+usPMDtcC/ZrqLOF0oyOLCVlQRd56+KkT+IfV8sX+CXmQmgUu2uCwFqgdCg7/jdJCpBbqjihQGSjQK8JXsPVmzZK8rB4y+wg1XjWD+Zy9tV6W3L44i5wdBam5FmF8H5GXQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8757.jpnprd01.prod.outlook.com (2603:1096:400:16c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Thu, 2 Feb
 2023 01:03:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Thu, 2 Feb 2023
 01:03:34 +0000
Message-ID: <877cx0anfe.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/9] arm64: dts: renesas: r8a779g0: R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 2 Feb 2023 01:03:34 +0000
X-ClientProxiedBy: TYAPR01CA0211.jpnprd01.prod.outlook.com
 (2603:1096:404:29::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: e59989b4-b1fe-4600-faa8-08db04b94ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgbXAjtg4YHycn7Z/WY8yGRlO10Sl0jx1zdDjsaW6mENex+r6Mv0OakKXAl11qTCNJHuaJ84dZe/khdJgHK+DyteUlI22uAUHe1J9FgE5QO/eRIsmn27pGQAPMM0SsGPs1WW/igmKTh8EvoFfELLKs6h0QIWvo76ueWgF/vil/K0H+9o+uUknVpv1EX/Dazqi/sA5TANxcKxbA2w2nUQpVvy2wVV8cVX0xYRLmDx4bchO7Vrz2DOWmKuj+RAqIgkASI6r5Z0zGF8ykZukkW9CN/g+pn3mM8Mk+0hDjIaiw+7hFW6QH7Wo1fccjsunKQqB2mr1EEKRJqh1t+sSBpjwU04hTcDfoXddAf3Isvbr0fLFCbjMdig8oxb7nG3T8G7bWPDNE+RbDIRXHzbEpp7pNLc+2huRHxJTZfV063Aj8ZwlwOqWtRbzrlTRvx8Z/0V43AaIVyKPFfZfmmMjWXH5tf1qElh/h2+oWefFZo46apunFUCtTx5h3rZE+4ubGxu3KY8OcfWit18yZbW33DnxxY2yCZfiGG6JGz5j5GU/L7bH6R2o/KcXOTCeSDG8Kvd7QY0MkXcV6hhq3JsM+K5tz2ShGRg/ubNdnFy1CdqiUMmwyZyxrgIEM8k9Y1gX640zPTPDZ84/dSk1k9EYev9gynBk/ql88nVDgEtfp5mL9Ya5Wo28Av3G9Xc86loOppf97xEtAteloWtKvhp9veXbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199018)(5660300002)(478600001)(8936002)(41300700001)(83380400001)(2906002)(66946007)(4326008)(66476007)(8676002)(316002)(66556008)(52116002)(6486002)(6506007)(186003)(26005)(2616005)(6512007)(86362001)(38100700002)(38350700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtrHP4j1u/TGCSfXQu5jHhd+UGhB3JoqoED4B98YKenxPDldNatSGtJ0Mz2r?=
 =?us-ascii?Q?jZ72NVf7z/94t4V9l+QVTbGnKB4bDp2xJBIcWYZM5uPvGQM4YHvupsP7SMEe?=
 =?us-ascii?Q?SimZEqm3Lx64tw86vD9cf+90UgbejzKtGP6KgBoQUaSZqolqHrl4SX4NF2TW?=
 =?us-ascii?Q?BWzlCKFDB13mJKtiMH5LzkYfNp34w09ex0Ycc5nRumroT0s9cmObepS46All?=
 =?us-ascii?Q?5ytE/NavH/F1+rrJ2qa/Izm1a44OnADXFWWyllFqz8opQsHv6wPQcjaJMYcW?=
 =?us-ascii?Q?2bHxU6tfjmS6urkgQJ7MFILgB4eVnEc2PNDiqWnl22/CoYVf7gcqaii9Kmja?=
 =?us-ascii?Q?1F/pW//l5Jvj+HcKIPfz0JoIPjHqJNqB/IrT4MAD7sM90mz6SuFhj/3cDhpd?=
 =?us-ascii?Q?Hfv1DVJQE3Ay1d5ikBJkOnybtlzO8xYApExHukr6Z8SHcjosWanB/o9VDKds?=
 =?us-ascii?Q?TJf26hurIzaSQIenFHLW5oDouJEY+v1GkSdz5MocbF0/7h39JfsQ1oRvOTK4?=
 =?us-ascii?Q?OobJXf2cmx8DI91sTEFd2d3QzZz73s/tIf/bOSnO5pydUuK0Acg473RcH/pw?=
 =?us-ascii?Q?NsYLxTONiSA19uZ6RoocZRF4Zgm1NnDSOAZM9qK8HxQeZlVF35e5VL3q6ibJ?=
 =?us-ascii?Q?UNHuWVVxQy6RE6L5U/JLnY3wYnCstoD6c2sVytbwJJSpSfRgCvOKE6TGXfPv?=
 =?us-ascii?Q?M8H34Go9n8L6m6y/8M08yg6pXPJe1WtmweZ+Fp1NvGkwY+HSEE+K+iicc0pi?=
 =?us-ascii?Q?OV7f/FKH57WWjg1Zbu7Gy3d4ACJ7mYLoWbNgqSsYP6UAmA535+/NPlkG3rXF?=
 =?us-ascii?Q?dToxM5VEu+7UINb2lYu7kqxRgsbE6X9ry7bwu2BPu/LxuS9iSwOhuWQzRiI3?=
 =?us-ascii?Q?LTVhddPt4iuntzIwIPGXZ2UHSCLOqktcG04w7fDnFoh8IuMbIPwMFKe9VPcG?=
 =?us-ascii?Q?NNi77bfDFgGRjsbzOsDPr/uNm7rja+UMbVkxMlgNSXlR3auUsw0OvAUsmMbE?=
 =?us-ascii?Q?CcxE8wz0fszhxq/fvOaqXmqqB1jay68PTQ+P6ZYvw+fTiuQhNuQjcX/jac60?=
 =?us-ascii?Q?Xo6QE1IWCmuww1FDF97isp3sum+gZhbnkqR/ycFvmrWCQ6g5b+u6XYzVDYHM?=
 =?us-ascii?Q?I4ojYHlhSV0VpBqylBgQB0BkviwHUsV66rLBuqGI2hqPrbuegO9RchGxrLIv?=
 =?us-ascii?Q?gpnY6o2PZiSgZWk9/bCcKCXrg/TQA3iDb3kx96VW6CUSeVXi+fjOq43PU9DE?=
 =?us-ascii?Q?68896ThnbiKyzJRGIDqYfWdcieOBPE41qt65DZzjo65qUYFSxOJv2ry8ysro?=
 =?us-ascii?Q?JGM9uQS5kg/ZtgBZUlNFdN9dTeuz3B2VFFg4gG0wRyMsSQxyc/b8MUaGoXrQ?=
 =?us-ascii?Q?Fw1YngxVfpU2KzW3fa6L89EIQVBgME8VswVd2SucqFU7RMOUNaiFm17ZmLkM?=
 =?us-ascii?Q?R3Sf6+x+AWhQdj/kc0lEoYfyGCZjYGQV9W7urSJUaLl3708ejKyTq+NsG1wp?=
 =?us-ascii?Q?VJHr1QOPGY9CTYlGDgFDgKoAQS/QYaoyGxDpYYVjb0gZpuTMu9WWz2vQ3JO1?=
 =?us-ascii?Q?63RPFhSbovITdf2Z7Np8PQmFk9PjllI+P7fs48W1KgJzHq1DjctMjZnAuCJa?=
 =?us-ascii?Q?YxcZ6Au546rX72Z0ju//r38=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59989b4-b1fe-4600-faa8-08db04b94ef9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 01:03:34.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWa74sZyz+wVvxhIBfUu7zBw4vFMSClgvPxuZ2lSPl6SKkpjqQA6vb5QikBqsspFDzYIJ13flpLnJxrmhEEgWCloRqZ4+JEhAedT0hiiw/S1Xww0+ll/ygwDUiad0csj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8757
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
index 7a87a5dc1b6a..b7855aaebddc 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -178,6 +178,15 @@ scif_clk: scif {
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
@@ -1168,6 +1177,75 @@ dmac1: dma-controller@e7351000 {
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
+			clock-names = "ssiu.0", "ssi.0", "clkin";
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

