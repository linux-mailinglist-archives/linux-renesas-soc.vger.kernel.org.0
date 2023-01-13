Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864D1668954
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 03:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjAMCEL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 21:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjAMCEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 21:04:07 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7225C621A5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRm/d02XZ/HCZAkVOwbqX0S/kN4IZb96ep/kFRYgfopKtJ/XqCDM8UedNXi+3GZ6Wm2p+Vv2hwB8t0BE0iIu4TYNwHo0wdhK0LFsfANdJn0qcTJFxuR/1CMNekoh22aF8NMkcsqAal/TrI/75F+7w2fRPXRaa0xB4RgYrvePSHO3JNcw+OQXT5Rz2MdBZts5oz+pYj5cPhROolnVIlg1Phkw+ehz9elaJwLkBE6L+VTGhfD1Fbc+qkmALvtZj9vibdHdfL6HW03DzATDNfaaRckMBXyRHM9WJk0e6KemEA5+qPrJFZ9rlXrSDFJRVKDMyRxosEH3hiKMJGrjFDTRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kzkRpgBdE7iP8LlniK7oBnEoBHNitmcMe0glVDUGq4=;
 b=giA+7CQtSw9mB4M53ZAGjH4fZPye6eJ+mLxy2ts0D1ze73NH27TRcDTCrkOPQQTI1sOzRGWIvjeMCAB9XRKtwWDRvifRXBRdWQlu0gR+z4KByo+4kAVY0Knu/HpCwqWtnOcFyI5kXsTL/EoeIYR2c7Wvnhu2VZOi9z5XgPjQLv+t20iI2NBJ3yJ95d3u4Q9SDN+apSZDJXBomDx4v2HQ1GvlqnS1xyJQWkwVy4XwsoN+iXeVdNxNnejXrqk4gRQIiuFrlLR4/lKM8tl0ddCA9zB+O5jE8fS37PVSBPWDlo4SHcQ+qQYIdgI6mBhjTYM+9Xe7oPQ83dLoBvljqHar9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kzkRpgBdE7iP8LlniK7oBnEoBHNitmcMe0glVDUGq4=;
 b=NB3M3QATelR2YDJrraVcsg5FuISHM8BDxk8Xuv6pplndD2LZAOm0hSfCGaKLBk3d43hPsIsizk12nkecrUNB9MukEGBETqPRVjRVswE2HbMPTK38/vW2lq6JArwmuMdBgtERq/SwojZaj6tIgaA26U92W4GufN7+aSDLb5EzlPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10859.jpnprd01.prod.outlook.com (2603:1096:400:26f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 02:04:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 02:04:03 +0000
Message-ID: <87cz7ji418.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/8] arm64: dts: renesas: #sound-dai-cells is used when simple-card
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 13 Jan 2023 02:04:03 +0000
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0a0c42-919c-469d-7dcc-08daf50a71ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +amLsNZvVCJTD6CzAzk0q+8N2Bfe8XW729Qw/eERG559ZaJuig5FU0/6eCicQXiDicL+pOxqP9yD6h5n0wMU1YmjB2bbVvmYOG/YXB+6AgOc3I5mCkexpeD5j4Nlskx2Mzt/ClQXJoNIe1oFQyIqec+Hnubv7f+sEhV0wQW+gTw3ktHRJXjZAaZjyeyLqhUnPWy2ozu5Uumvu6+A7iFlSxNf2mJgjqqw6Ei50V3tA/6pr5wY/usHHZhZ8AeILPZ0Q2nq5OCt9FoHIlpdmuhjVbO60hS3yPRKmCguCFUJgJeP/9ZjOxknUF+LbuEt0DeMXYHlk8APxIsjW0rKVJClX+NDp6CVg+VaAFUlJvW7ADUyvC9GxLDHVkFGAbc9cNo9l2I6f2kgVd3vNuurj2iqpFolzLz+ogzf4Ar/GwdmnAa2C/6Kkd04JqB/Oa6Oi8Sa2+wgxHpovKZRHWi9M53U9rL81CpWdrMPdad1R+Tw9lhj/NxF5/j4fkz2pADhMMFfV8e2ax+/94sWhiSFwk2+ahKmevmZMeblPUmEfys5mPoibOdbtSwYRqprsT8lNx6QmC8qRnMOxxbZ9Y/aWDfWNNNFMLlAFI6P6553E1SGrYLXnxcldhJpEavYAhN6BeoAY02JFJEyn6Yu7nAoA2rHmt/bw0oTg0rCPecAGgUcgHGmdWUjKYuoAhznZS0L0WDkUN50PUJXL1PhtCU/EIWbnXHjjLCZQ8y1nGU8yrepY6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(6512007)(478600001)(26005)(186003)(86362001)(966005)(6486002)(52116002)(6506007)(6916009)(4326008)(66556008)(8676002)(66476007)(2616005)(66946007)(316002)(38350700002)(38100700002)(41300700001)(8936002)(36756003)(83380400001)(5660300002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaPLbcu8uWEB/JTubB1R7LRtt9+NzAopPo1UitcTqRAQNkKaxoM4D11bBgbl?=
 =?us-ascii?Q?y8/hxbTX/UuG8uTVjcb0XlV79YXsZztb0CGSbwp5EA9gEt4nEHtclbgf15Mi?=
 =?us-ascii?Q?0INDgWdB7goOVQ3Jbd4JuIJ5lDKd/6RYa/7P1Pb8fOz1eq/LPxybRt4O1wZI?=
 =?us-ascii?Q?COW8v44dD5UxcNSvr51VkO5KQP+vB2wXJ+cy1ggfirTiU7XdOEwQVixdx56T?=
 =?us-ascii?Q?/pgjCoHcrYIQOZWARucLKDsA9qPY2zrKv/scVQjpfZ+SQ2wibhs+jmWtx1GC?=
 =?us-ascii?Q?JBj/rnEYSAmIVXE+Idnkp04Mvitt2gRFS8p2A2qsMUiEyCCytYyXG+GzMK9Y?=
 =?us-ascii?Q?TqWHU9eT8rP+nGXmmoy6WQrwiEXwb8bE+jYyEXJl+JQ2HX3/ccWxl8N0LVMF?=
 =?us-ascii?Q?vfu/1qbLAZ+WSAgSNATYUTB9hxM5ggD9Hx8Ii16i7M3/Ct/5yvKoU4f88Ses?=
 =?us-ascii?Q?Wqm3FBWOfZ7Cwx3BAkq1kDD3WZEXaUFCU2/RYIKvUiuKPFbUYYiOkryJ1kTk?=
 =?us-ascii?Q?J+YEYTkqdIBthnLJVKv7X4/nZu3bVdQzzfcjDLihDpgt92+RSU5KMIVumcI4?=
 =?us-ascii?Q?bqObN1Rrz7f4TZITZ6OtVHhtVv3HPjdhNtkE9xJ9XyteLpIN2xSyUGauJG+Z?=
 =?us-ascii?Q?rrgRxh75ey201vRplVePILPt7cFvLBXSBFhoN0jo64btUrjzZdSxPzxnI/c8?=
 =?us-ascii?Q?2aPIuzgGOmKsAA88Xh2I7rKAkjplMZL9My1vjbOTXeVyP62BSaOTL37b2Ibd?=
 =?us-ascii?Q?A9H26AG93d7XYUaaRNAhFUoMqBm8XQEHgUfk3kgJAFlo8IlEp2s722QFSoCA?=
 =?us-ascii?Q?Gfwp90sGifv3Dgm9XJ6BtBmzL8N/braiZG/zlp+SBHsCpkgmYbPx/VvRfBRL?=
 =?us-ascii?Q?H2sys4uKcy8TmwqH1fOEh7qjjwZ/NVruUQ7222cfKkicOg4o76OuCeU3seZk?=
 =?us-ascii?Q?KZ3aGwksavsYsxh5Nr5sj/n0gBHneZZE0cUKHhMzMLTKYTkEA7O4ItBfqjlA?=
 =?us-ascii?Q?tE0UWpbo3m7jGpDhIYvf2gLCs/PaVU11b8gLQURcD/tU+vgazYNcVAYlwEuT?=
 =?us-ascii?Q?smmElzIdsjP1yWO+WZMhcbiK+93pCcfWZglaH6BA+OIzZ5JtRNUCteekKoSs?=
 =?us-ascii?Q?JJXYQoAN9UnQBeP85pHLGReTO4mwSU4KYYVM2mu0E4/GFcBe0AdD4FqEuWID?=
 =?us-ascii?Q?VgbJq1TGEEiTkuIXN0/FBnUWJM+p8hhS22aPKJd3Qai93pIt3/YiAbMK7rUd?=
 =?us-ascii?Q?1cDb2HG6tDg++PAclHiOxJC5PBDsd4UZ6ece48OJhpxrsZSLo0wr+RAB8JTQ?=
 =?us-ascii?Q?nOlsB1qDi0l+iNU68vzGGdRFXTSO/7Wv+TrTzfjNdpopToFRNhPPAytfO7Ss?=
 =?us-ascii?Q?1u+9nKJb0zpYCESqUrskoEMFWvxrzFazMjUwNx/I0fj8tycNkv5NVc0u0ZIH?=
 =?us-ascii?Q?fMibYCsXfS4VLQ813a21Aeq9RRJrmGS0SFyj0cFZgdBIJp7pJyFCpZ6sy5V6?=
 =?us-ascii?Q?v85ft8En9pzN0TBLeBaFSbXhlU9awCHbjrsdkHdj/f1YG8s2fTftqe7PnAwn?=
 =?us-ascii?Q?7BrBMorpuOSYqcxn2gTIwYjbFyDzqh/340VhhLN5I1HgdEJk4q9V+k/mEzP5?=
 =?us-ascii?Q?XPb2VqhktNZOnxC+CSiQTwo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0a0c42-919c-469d-7dcc-08daf50a71ee
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 02:04:03.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DNLzoy2GeU7WpROyK51RQh/pttI4vODS5ra+Deb8rZNAF6Z54iKLTQGbLbQO4X9VGFpRZS6iKMK1JZPye8Pc4WM5n1aBDa+dKBy7qXf0sz3JPNAo9TMPlPjjP8bQYTH
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
required, but it is needed if board is using "simple-card".
This patch tidyup the comment.
Because it is already using "audio-graph", this patch removes
unneeded #sound-dai-cells from ulcb.dtsi / salvator-common.dtsi.

Link: https://lore.kernel.org/r/87bko6pxgl.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi        | 2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 ---
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 ---
 12 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 7e643243c3be..c21b78685123 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1678,7 +1678,7 @@ vin7csi40: endpoint@2 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index d541b48c7e38..82216ce7a92a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1562,7 +1562,7 @@ vin7csi40: endpoint@2 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 151e32ac0368..e21653d86228 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1317,7 +1317,7 @@ vin5csi40: endpoint@2 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index c5a0e7866b2f..2828e05b40b3 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1774,7 +1774,7 @@ vin7csi20: endpoint@0 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 07c8763c1e77..f770d160e948 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -1998,7 +1998,7 @@ drif31: rif@e6fb0000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 1424d4ad941f..09c61696f7fb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1870,7 +1870,7 @@ drif31: rif@e6fb0000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 3c744b7d0dc4..59a18dfcb8cc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1750,7 +1750,7 @@ vin7csi40: endpoint@2 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 997f29521f66..9b4f7ad95ca8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1733,7 +1733,7 @@ drif31: rif@e6fb0000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 3053b4b21497..d4718f144e33 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1469,7 +1469,7 @@ drif31: rif@e6fb0000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index f040d03e0a87..e25024a7b66c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1037,7 +1037,7 @@ vin4: video@e6ef4000 {
 
 		rcar_sound: sound@ec500000 {
 			/*
-			 * #sound-dai-cells is required
+			 * #sound-dai-cells is required if simple-card
 			 *
 			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
 			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d97473401819..4a3d5037821f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -799,9 +799,6 @@ &rcar_sound {
 	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
 	clock-frequency = <12288000 11289600>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 29cedf4dc1a9..4b6562fc1bdf 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -381,9 +381,6 @@ &rcar_sound {
 	pinctrl-0 = <&sound_pins>, <&sound_clk_pins>;
 	pinctrl-names = "default";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
 	clock-frequency = <12288000 11289600>;
-- 
2.25.1

