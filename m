Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F40C668953
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjAMCEE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjAMCED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:03 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F6A621B3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH5MI0cE0kC6kdpy3J/wJZRRrhlFcXDZhscKAzYvf6WUYu4icgOaFWs2OaaFNpL68sjdb6dGyeDXfBMRDHTL6jwU3e2LbbeQHgi2iUjch5/J4fVCMVGgS4F+Fcm+pZb7dKz+ieC/IQz7PPoYd0RiKMI5mFs0Ze0YvzzHmaVTclpJQDt6RdpkkH3KPO0AUQVxFw5Re+LavsqCfWSQVi1A4pkuxaZJL6HR0exfKoy7vXmpl6HilP/YRJpkdD7PqQ0gnRXJQBhd/kKRm+XGzAvLuvj2YVoNrzsemVgWpAudLdzdOS5esyqkm5nwYnO6o5SWUtSE+CncPQCNSYMqzx5Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO4Aht1Y5yebDWJ5G9wdT5AG/AhQ9v6IfEd24aHQIts=;
 b=oSukzJYrpxlKKaLGdoZnYfmyNYgaQY2niy3Js1TakcTViw728z/r24aDv+JAKCA9O9Syw8MsYbp+42cIYxmg6FjasnUC0Pu2dLiMStrvbE069B8FpneprIvSyAW4VBAIQrmtUOv3Cb90pI69jXwcSoMDHbgMe8qQJmQJVB/jLMLyfxdqTm8sN/mzEu6bq6qu7r7/OFVFFsLndLi/2OcEy7ScuqBpaZpsX/y/Mc0FAK9ErKbs7H36kHrnR+GgmA29/vd0iGmx2IDHArfOoIUjiAwm0YtwVQhy/rO+kh9XwWDIk5gBNYe/PfA2c73EDjvRjQbkYk2s2pvun4qbS7v4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO4Aht1Y5yebDWJ5G9wdT5AG/AhQ9v6IfEd24aHQIts=;
 b=f6ObjyWcSC99HdHeWrRQF1L1QHfA3qh8/KAxC5CSxS8zpf8GHXwBSouaLBsabKcFI51FOf9xarjl9qBjQFyCfSboecHDPZt1C2QVEUgdzDnVE/vgQf+20BDMvoVARcKwp5dECB+JRj8XiDIkUs1wOiqjPbafoi9ir5+AejMCJK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10859.jpnprd01.prod.outlook.com (2603:1096:400:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 02:03:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:03:59 +0000
Message-ID: <87edrzi41e.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/8] ARM: dts: renesas: #sound-dai-cells is used when simple-card
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 13 Jan 2023 02:03:58 +0000
X-ClientProxiedBy: TYWPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 956f634f-c0b8-494c-2b74-08daf50a6f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVQ7dV6MtpodP1721RqyV3lrysR6RjeNeTnadgkTftDipjYl3dfxKStp4wM8vYycBsoyRFwGoEoItTQ0RcLmsV9Rcx70cjWhfXcFQo4XaV5vq+m2ug0NmJGMwJ4MY1oBIiFjoT2JJd27oGYpeRa3qP9lPw6AjmKJZFtExU8bQP4QeyQCTF88Jel0o1eWCKK7i/r0UFPzpql2Ik/WZ1dWNoDVxw1rH3MLyVzjp3Jm4+2X0Lj+WCQGIRC15I9U70OjoDDLNYKoVjB+kso3AEjZULI8sId5PfpDnjXp7q2f6GYZZiHNuREPYvxDtJygJvEw4HsDi/BarMBwTllPG4vG0ad24mvVuSJoQbqMlVDBxLygWywaZK/lfu3Epmi+2rtUZJ2fk6hWIUBFpFSapGNkbGiJbSJIPKRk+dZzCLc+IYyhaCEf7VH0QzoKNizHjy+8F3RTpdlxoVGhxXtkJFiTApAUnzF1xJhzvTdgUP84OBxpk6H+Mcbt0JGytF6VvVWKkTIdToMTTDnkDFAJLIL7F9HtbbC9j2SVxyARRjDyGKYFSobaN8M3b8SFncqR6pF0lY0eROXa+MQDzhIPE1QZ6HtSziKu1N3nlSTvj9pJEC+Q0wSPgEPgDB6dLAWCxBnItHvjOqlmoLCVH3XfVL98n67T+KGUM/FYEj+DmPYw3wK0gaBbldl+AklfGyu7x1lzFNkJDY3WR4l5YLAxNjtJsf13HjwttrI06/noKooAUcU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(6512007)(478600001)(26005)(186003)(86362001)(966005)(6486002)(52116002)(6506007)(6916009)(4326008)(66556008)(8676002)(66476007)(2616005)(66946007)(316002)(38350700002)(38100700002)(41300700001)(8936002)(36756003)(83380400001)(5660300002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vfBSdeXL+FMcbG7OREJrhDQad8Es7IBcgQ79hXyUlLmpFwUbIAkMtlvzWf+Q?=
 =?us-ascii?Q?pKHHpbEc17dYv9kYyLR0RNnjRHHYBaonrhTYuwH1gEBapLT8sJXEAkxH5MaF?=
 =?us-ascii?Q?d09GuXX3jEe2c1aL8KXZf68jfghbxK/ze+drwVPb5GzTEmIyxetCJGQk6y5b?=
 =?us-ascii?Q?Rl8wsLWPAE8KtSuUcsyvzL0BhMA7ok7BjTAg5wCHLg4q2A5XIGQnun4SNwFS?=
 =?us-ascii?Q?yeZ1tbFXgwgH8DhZNs+FeuNQQh3gOUCou7NtqyMzH0fon/YyTXtZDpWJmWrR?=
 =?us-ascii?Q?hh1/iKu17qSrEEB2GAW+k6hH6yKSvGTrgGFTGyweKDqN8s5cVTJD2Fs4SebA?=
 =?us-ascii?Q?oxZL6BHxuaK2chL+MssxG6i++YYW5Nkm3GvZC6GG0iVIwsFP3PkFDYD8ML4z?=
 =?us-ascii?Q?8LVj+sEFTDbC2ADri1ZDJNlEEGY2mE2EdNe+FYiPQuDyxHr1bifM9uBQ9uAS?=
 =?us-ascii?Q?0WrAgoNeyLrOifBvBqhUT23ljC95MfmT3FmBcYOCC63NWC5K5Cki7hjyo/ZV?=
 =?us-ascii?Q?xY6LICM0VW9ch3B7Pclu6ZjqJvYlWo3Obve+EUF7fS6jTXQrRSXj2/9iLj5K?=
 =?us-ascii?Q?m//0xUMqeRKqphnizmwyE3GyFGJy471zJAPYy/qgfcO5yz3DbfBq3yQhPAoj?=
 =?us-ascii?Q?32Dn0Y8qT+yLrzAmrwgPErgE0PKj7JqhGVpPVj872D00qIa68q1vCjywhcQH?=
 =?us-ascii?Q?nPXgiwI86mIEhuT0QY8fwfDJ6s8oK/O92KyMx10Ukb4ynl+1nco+yAaJvbDD?=
 =?us-ascii?Q?3qZumvlb/QzYpUPSXHexqpv9/oVueGnDsJdaTpmRogWYlJsZIAMLsXvdUFSm?=
 =?us-ascii?Q?JSYiwPRfXqrY9d+P3XV2jG4fOdrOV/EUVY5K1raHkHsABGaEbqQmgq8QanqO?=
 =?us-ascii?Q?gr/4FsbyKXztsoFlwzezTMM3L1j/e3nqpUYCdHZYtoKNVOpUwPCGnGnny4cp?=
 =?us-ascii?Q?cNRjl9LCQq8qVkQYve/GQxYsE4iO+j5pVf/7KSd41Iy2FjCh1/6YcaGUNMpB?=
 =?us-ascii?Q?j9U6Kj1Sc9vQZp9mFIwNaI386U/w+XDtDioWFvTm+tqNL4h3ggejy5gujzv+?=
 =?us-ascii?Q?jZsLwuOeOw/TSMq8pv1hJXgYIhG3WPB9y6Cyg2B5P5bhcCZo6/GKj+KEgSCJ?=
 =?us-ascii?Q?exlPHzEF8YN0M0auJ5BTji2g58kVOxXNkiI+kv8/G+/mFf1GyNbs+GQf+eqL?=
 =?us-ascii?Q?HMNEssCfry+Idnn0J1JLmj9FyrsRDadosKrBOHehcYoGutFdOI4zi4p6L33n?=
 =?us-ascii?Q?BPaXCJ6tLeEHBbAZvK+sUNFotbuCQ6fFPlXk7rZrBWVD4yiv4z6OUdy+E0SY?=
 =?us-ascii?Q?cIvO9h1UdStehg7opSCnu/Qx+x+1Qj1WE6SxJw45tfA1LPYS0FHkyzDVgWF+?=
 =?us-ascii?Q?fYjRJQ6fkvxIP/ccS0RtB7eFFTasoASkU7nekNZPPSTKTxwPxkB0Ufq2dq4P?=
 =?us-ascii?Q?meCjK/3a/YttqroQucrq3N5qUdl0SSZ5HnkvvLhMJESF3bCbQUoE6T+5qFgq?=
 =?us-ascii?Q?iyk1CgWYsEUmIXpa7PLrgACSDlQYHuXqLc69BGqcsZJQROxNO307xgkwSTuh?=
 =?us-ascii?Q?80BNQlz5Dqd0dJEMHhuVavHxYoNd89vvKKV4rJvdmgUlykSiaUMEIgfkcCiL?=
 =?us-ascii?Q?rSzOA93ZasdVHarpfuqytGs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956f634f-c0b8-494c-2b74-08daf50a6f12
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:03:58.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJKpi08nrhvTsGLY+m6bF+kH/Bg5p7ESnx23xEGGRkCD+GFdU2KW4v7t7WlJOpN/8r6OI8JuIsY+Pi6oQePvnAeqWi06vrZLTNGNoCmEpF6E+of5iiRqOjqobJRZ3KC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10859
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

Current sound comment is indicating that #sound-dai-cells is
required, but it is needed if board is using simple-card.
This patch tidyup the comment.

Link: https://lore.kernel.org/r/87cz8mpxgt.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/boot/dts/r8a7742.dtsi | 2 +-
 arch/arm/boot/dts/r8a7743.dtsi | 2 +-
 arch/arm/boot/dts/r8a7744.dtsi | 2 +-
 arch/arm/boot/dts/r8a7745.dtsi | 2 +-
 arch/arm/boot/dts/r8a7778.dtsi | 2 +-
 arch/arm/boot/dts/r8a7790.dtsi | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi | 2 +-
 arch/arm/boot/dts/r8a7794.dtsi | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 73be346001cb..16d146db824a 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -1155,7 +1155,7 @@ vin3: video@e6ef3000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 20f1d98a048d..2245d19a23bb 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1190,7 +1190,7 @@ vin2: video@e6ef2000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 96b2d5a4e8f6..aa13841f9781 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -1190,7 +1190,7 @@ vin2: video@e6ef2000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index afc902e532d8..44688b8431c3 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -1120,7 +1120,7 @@ vin1: video@e6ef1000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>; <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>; <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 95efbafb0b70..8d4530ed2fc6 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -241,7 +241,7 @@ tmu2: timer@ffd82000 {
 
 	rcar_sound: sound@ffd90000 {
 		/*
-		 * #sound-dai-cells is required
+		 * #sound-dai-cells is required if simple-card
 		 *
 		 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 		 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 111a6d23159e..2f2e483a2c2a 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1109,7 +1109,7 @@ vin3: video@e6ef3000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 777b672b59cc..b9d34147628e 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1223,7 +1223,7 @@ vin2: video@e6ef2000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 3e0be1b58931..f51bf687f4bd 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -988,7 +988,7 @@ vin2: video@e6ef2000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 7aa781ff3bff..371dd4715dde 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -955,7 +955,7 @@ vin1: video@e6ef1000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;         <&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;         <&rcar_sound N>;
-- 
2.25.1

