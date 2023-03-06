Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE536AD301
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjCFXtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCFXtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:49:02 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0635932E74
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbZcQWD8UlhYL03EgPg6oqffPhYWMxyg4koI+PtdNicRskgFxYcCbIF3HIr8tCRYzGec5mmfu00XcQ4iLCp5K+AhCz1WpYXy5Jr91I/RLfQETV2Fdx21cRHe3+rN3kjUUu6msl8HiB8uzFuzd+OHoNQfRPofyBjrBDfT4NGv+K+2bxSLycES/j2hE8a0yl2vAYoQDHkXoF1z5OtT0sOqk7P8YiDiVg87MGsIm47t5bScmClTt+mPncbry1MnGalmHjbW3rZ7lABZcp1n97BrrdMQF9L+WXuXQZJMcYwIAFFc5YENkw0KAUJGQ4/5j0AYzYObkIpiizSTQMz5VFGhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+fDU7/EaR7N3A0xymsRLyn2/DD9zlRRWGJx4chxAlM=;
 b=Kk76z+RZI23SL8WO8wOfXEuXnf8adnDUQGIgR4WBsIwe6PqZm03nq2dQxHa1IJ/bWqIz4X0avc4NxT/EZdvG7ME7B+gpAY2jGQQpQKDRDieRot0+F0RKO1nFZAcXYBBAJCCADYKPkigEIry+yWu9Hr/7CcnL4SHMbWNVIu1GrQlhw/CEYCH2Q39I9ejGq6KrW+e8I1Ck6Z3XGyb62Q3qyq4EBs5eeBzpYlaq75Fc6UxPxBCF7jEeVSIr8kc0LBXc9hq1gk0ob6bSB0J8e+GnUsmwykvkTZbPVtqIPQbickZfro+0xD2i7lAGCvX+Hr4SedQanOHJ/F+1EJ4OR1o9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+fDU7/EaR7N3A0xymsRLyn2/DD9zlRRWGJx4chxAlM=;
 b=SLFgBx+7XVBWlvOOEEOaa/wWkUQUY1j1TmIpdJ/inqjoZlJBKNFLJJs2fY3JE7ebS8Db4N9VUkBHYAtx4h9gh2eDUdcwDo56eGhhmx7tDPAVXLqXMjuSxfnPFeQVkytRxv8JbkEDU3LBWqSOE6bWYBOn7M6wNmN3GRYhusF5FJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11433.jpnprd01.prod.outlook.com (2603:1096:400:37e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 23:48:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:48:58 +0000
Message-ID: <87pm9ll9ue.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a779g0: R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 6 Mar 2023 23:48:58 +0000
X-ClientProxiedBy: TYCPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:1::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: 825f434d-2aa7-4cde-1a90-08db1e9d5ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIt2Sn7+2HaOi+UZjwAoo09V2uVU8UfNlIY4R4lt3bpgncnxri4nfPJd9sZ3ljqMn+MwG2P5L2u1C9tkjnlyDjdhodmVSWFVlqOdVdnwabElGxP4qvR6QPgtoixwbinobBv9cW+TnN4xseWiuAiH3JBddeZzzTNnjeO9yKzC1tJUCiOIcq2qkOhIH6B+cW48g9DjYbUMHCzzRUMBnzc57s5ZEwYoHLJRYPFdG3+caiVqGNM6jiS20W1ELOokH0+y7ceVlsD2QjkUjoi3pXv49QfMl9VWnmp9ILyQyXH5OFgxB2bMvXOl3rXDd0DiI6rXO1TgziV/Kf4f8Mt80oIHa/bsoVADBywK+SMeg+Ct/giMzM1W+ekG0hqaJ9OAYQLwLnSVDGHIYR9MdOL3Vi6vH1BUWu4pGiE7wsUH4FOdIGnRkIjUvyKvOBSgG///hODJvxZK/0HHvvecdgPqPJrJK1nGPqUPBoPoAZ1U67ZLTMTSy5Zw9FMRuLD8he7AIn4wZHNYw09Hs89/YIOXJotvFKUhV0EsKMUL9mTmslt34mJ91Qb7ALizDO2qrvxWenuk+oLVTj3+CxTtTfqZaE4o2ukwC5APYytpx4RONXd20A5hjwZl1EqozU0Lia3CP1skuTaEB8mhrPM8OE9MSIxSGg/NiB+y90Y4fTR1Yuoo+w1p+/TvyRdK3MF+pb1yNgIERjs5hxgQViBC5+9GLMnqaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199018)(36756003)(83380400001)(6512007)(6506007)(41300700001)(186003)(52116002)(26005)(6486002)(2616005)(5660300002)(8936002)(66946007)(86362001)(4326008)(8676002)(2906002)(66556008)(66476007)(316002)(38350700002)(38100700002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93Wt3aZ36YthpXyi2LnJgc7KYyzZnlPlzosZ5DTMJgWff7azwzwePBOBXMi4?=
 =?us-ascii?Q?nyDoTPamm8L4Xd0PobQad0ef76oam0aMLhPV/WAdPyuiorjQHvI1GUFZdcpM?=
 =?us-ascii?Q?XcWosuIn9SOxQ8mgdhSUtdIlzvGjAg3vQJ6VmzqGuP8GXTNkZKqJ89M2v338?=
 =?us-ascii?Q?+29Nxort/SkIr0EIqBZuGvcIiH/6uek7d38Mq2YtGQNcaNRsh/yroj4yndtr?=
 =?us-ascii?Q?PXHDGyxRppdc3WtITnIlEBYYw6GSczgpPztBbt/06uaoGcbfVCIdTl3CD/mK?=
 =?us-ascii?Q?TedMJTRziWnqWcBr3T4DVTkIozDdesS+ZzarYYMXG8Sf8IratuMFZ+UDrSbf?=
 =?us-ascii?Q?5a0YKO6TsC0Iy/NdlhdeWSKEKShAfLeVJrYk/eIAUMSFROkB5nKjbYtW9toF?=
 =?us-ascii?Q?tyFW2cl0pOELdAAOxZex571wLQSZ4N2vbvliGHfG/WgsgQVh4JQUWUTf8a61?=
 =?us-ascii?Q?OkyN3vKnM7hLXwWiysEg5dO55mUHehVWAs161EG7rfdFXOydYGQvxQGqU4Fr?=
 =?us-ascii?Q?gdpjeLzu/8kaXnjjZFDUcG4UZUzRcHfrDNFTYf11VClkEk1yjaqB144+hZDB?=
 =?us-ascii?Q?Ah4aJ9WcLJU+OcYisfRk/rj5Lg7iq2kT0lyfhMsfuBYSmZ6oH/qFbMS8FzWb?=
 =?us-ascii?Q?Y1u/oSttf13h0M7y5E4e4E95QfRV7F0mirf8EBARXEYkYaL8MHA738mQvPbz?=
 =?us-ascii?Q?A9s8prdPVCWT+8HV5GNquXjR8jFd496Rfb8dS1T4R8XMc9V7mPL+ttfp2hs9?=
 =?us-ascii?Q?Nf/VWA5HAsyCysHqNagK9tcW2fpckCMBXmcf86JCmPzZHhpn6kpBe55nanZg?=
 =?us-ascii?Q?M0oHXCTROmktBcI2dWMBN8lioAisqrJDInqVnTJV46kDWjFUcsgtxjCnaVth?=
 =?us-ascii?Q?avNAURG6HkvxM3B4w2sMl9IVnWojn9kInyb1BvsV1auRx76B1l+hrLi3RdYI?=
 =?us-ascii?Q?tSiLNWvzWZ/YJZfzNwLZ8B8PEmGH6+tHdGbSUvPz0Aq6R1bnHeZX3r48SP3q?=
 =?us-ascii?Q?BKx8ZgqPjAUne+rNqYrj4NM4bpleOwpti9w+qNr3PCgqZ5fhfuNkEkyoCqI7?=
 =?us-ascii?Q?XqMMo2czc1C2aPvMvaG8GG7SYCJ7Pk8vTHslD0g5alySD1FN6C0D4kITUhpe?=
 =?us-ascii?Q?wi9HvTGUJUn2aJBdy2VUqpHvw4j3uWLJP14bWahbirXWHXLqm0falCQi/lM8?=
 =?us-ascii?Q?8Uo5Ar14Ie+8EE14BWSvX+IENM74iDIYrEfuMjRJqz/Ia1oR7KdpEdkb6KXa?=
 =?us-ascii?Q?Ry9HSXPfDSTYWIHuLW2GaxmUlfdQxiMuckYNbhI6NdIvwy/TBAf1jGW65ijC?=
 =?us-ascii?Q?TFFYwCs8Ui+3qeXvr0SDc9BfX7+Flp+aEQjx3rYhgg8XyYm7WMtBBGidALbp?=
 =?us-ascii?Q?DTlGqLTiiXzyKTHdc6IdMMPZobk0tSzVs2CabI/+KnChHuXRu9l3KCEqSeMq?=
 =?us-ascii?Q?DQTgTiGVvTpTj24kQhk938beLHatjZBUgZ3l2R/lgIvmcg3KiwGYSYQev7tv?=
 =?us-ascii?Q?pbg13Bn5MAV442tBL7aPiatwD/Sb6rbm0oGzbq8XY1NVXJupLCLLDJ5zg+Vh?=
 =?us-ascii?Q?ZDFtrEc2n9UuhS7L2ND7HAyi5+lSQzpd4B+bHTO98qaIGtIt5KyHwigQzz9W?=
 =?us-ascii?Q?NZl7Fxht5ljZAJFUFYgJwZE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825f434d-2aa7-4cde-1a90-08db1e9d5ae4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:48:58.7591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q4Ttpw+aVdGEAG1Y7Qopc3xg+3pnXREC8A6WnoC4lUUUQuvMb7DqfZCbhFl5FnHwK4hAhCplPUogsPK3oxrXvjJqGEa0DDpZZWSWTU3EkmonCrEo7M8CAfzqYjoNeUY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11433
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds Sound support for R-Car V4H.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 78 +++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index f782a18c8dd3..30a3b5f65d08 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -185,6 +185,15 @@ scif_clk: scif {
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
@@ -1685,6 +1694,75 @@ dmac1: dma-controller@e7351000 {
 			dma-channels = <16>;
 		};
 
+		rcar_sound: sound@ec5a0000 {
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

