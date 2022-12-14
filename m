Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49C764C1F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLNBsQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbiLNBsO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:14 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53904193D9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1+TdPa+2gPkMWgFaddj7u3eUGdQUCk5Mxehjxw1FVfsoiBS8g3TyYN632d0dy70WrkoviA7hA9YbgdWCdS+zbfubwQ3BpulkUc3Q3iccqvnru+fRlULqtAEXSst3wUSkgv+htfwL6/9bRTBQNgS0fvQXdkHaun9dc0/Hw2zA7EvIiWxyHHTPfAu7RoJFlTnxoB2uuaWrNoQYnsRPe/7kPURL9SNRVQnfCxl71mDRRw4jFo1CCySvtz1ccE7/arTSIwmW1/ElIfdOq354so80D8y8Oaa+oYyu1s76gJyceA3otUxRfftOmB7Fhwx8zC61i/reh0RP+96IKzPDIh65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAWKYxkA+4RprhjL1LhJPBYsCLCP8k4bj7MC4plUjU8=;
 b=ESmAtokNbYc8JfdJOcI32pPYBQeUq6O/Nl3VwSERC31N2UXpak7HU/u05m1ZspTFQ3AegT5hJ674PoOz9EyLV0dx5vWqxTfYu9+dzLqo0Be7nOh4m8UCuAQRhRbmdr88LCAJGrPwW/BLOoW5EwmMFdo6xB3fBx3h0rI3aIOywAKkwAsMVRWDmqDMl5R1erul3f7MrTaN5dzHE+h17lUYJnpa6KV3VKQxepFqeZeMPRF3dBVOBG9sb+sOoqhwXtBMEnIgm4uTntjwkQ30PmO9J+mZyjfKozmRM/AxXp4yo7zMxY+mkNkh5KuwwwJ0gAOk0xmJ8AcGZ4+tTdAo0F+atA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAWKYxkA+4RprhjL1LhJPBYsCLCP8k4bj7MC4plUjU8=;
 b=e/kYEX6E9VM2+h7ulHtvPA2iuANic8nRUfaP3gYhQCVynFJCn6Wz1eISpCFKVI1SJyHlbeyjJ4K6zGc/SFj65sXPtqVoOUWhDWbb/LMOa/u1ih2xduyyNzWrYeysuGomKWTAOFbdBzmfW1euye3u83rTLblA1JJhwYKO1nZh+sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7819.jpnprd01.prod.outlook.com (2603:1096:604:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:10 +0000
Message-ID: <87bko6pxgl.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/8] arm64: dts: renesas: #sound-dai-cells is used when simple-card
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 14 Dec 2022 01:48:10 +0000
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 286786ac-84ac-4f8d-e071-08dadd754195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ye/cdbO9k/T5XIwBiUbcqzwAYEAT88DbHx8RInoQ3x/3/dDW53nO3Tqg6Jj6EiNY7qOl5M3v2LjbVs1e8CmrRnxoz523jyf+w4zCJwDUQrM4+R3WdowCZEF5bEcgrcO4a457uhOgChory5zmd7AHh2yicmOYD99v6dS2NUGa13b1bbHnTuOkJP3dhe9CFcpyNShjaFubIIjjcH2Z7eEemNugeICYR2LFrnDNxSszeQDaYphPcWoHIxrOyVpCS4M2PjXlXIJ18x3mOtVHMvsJHcVv/6RDTICdiHD2lPfjhA4xUVtvhH9KIhSSSsk/pIBcg5LOJjNJLDofXcqCaVNn3CZ3uBlHSiILlmPeJQg8CXuzGMM0PjamVHexiteVV5CrDxTs3g1HvRTUymPDRST6PdjI4lOosWmXgciCJSbja7EykdL+1ASoxLMsb63SHHS6JcmrniNkoWv6bU9NsmqJCUzrvkzsForzdF1oOZ5rhjHN3Qo1qVaqiR3z6OtQE3RTktky1qgjFer+yPvn75xRcKGvEtyvrGqONcV+y5S44k3XeycDl7P3wmCGGO26fJzP4hGZxr2jJsSrajH+83v4moYQ/HheaFpcquIQQDDeYQl3wCMDGwGuUDErA1xydlOlSn3zToj2lUAPNThN0quAZEjo6WEiLIkPpoh3bNy8zHsT4FIpFnNoep959F4wDQvB6JVYUS1u8b1brX5HzJQc7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(83380400001)(38100700002)(36756003)(8676002)(41300700001)(66556008)(38350700002)(4326008)(66476007)(66946007)(86362001)(5660300002)(6916009)(478600001)(6486002)(8936002)(316002)(6512007)(6506007)(26005)(186003)(52116002)(2906002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dHS09lCvIqAl/4hLdqAbD6sMUE29LqmJvuLz8Fag+sDDQXeKgOv4D4d9nrP0?=
 =?us-ascii?Q?T8xD8dmSTdfV9K05UafZror+nW71mMlO7OllaumEvVVnAOtbOYhbCpGsedXv?=
 =?us-ascii?Q?tnsX5ghKJag/yb9PnXPbeOtwCYqRPOYGFHeFMO/azGxZR31TtXfIGo2a6nHU?=
 =?us-ascii?Q?kgr3F69xU4avvef2LwVnxUBP1oylcRbOAsBNTZ0Kp8ioXfEdfkT/31M+0D+W?=
 =?us-ascii?Q?dFmGtl+54VzcipvvqWSjK+sjqYNRcojPra6rH/gf2ESYdVq82z4zqEBGNi0r?=
 =?us-ascii?Q?v+bHdMFbq7kN8dus60v9BN+M+0MR/8fgKnqpKZE3PbpXn8Q8U2ZMPLuW1RQr?=
 =?us-ascii?Q?+AXTvacHTYFpUd8dngOA+okkKQlqh/yHzsMaNJQsD4Day+iYgc9wkuL4L4cu?=
 =?us-ascii?Q?GY4g3usCt5M4/spc4IZIg7ECmMwsrdxo/g1HZ5N59NCMYerDJ61eOY3uMzns?=
 =?us-ascii?Q?q5f8yxcTnwyYY4RzLpBG74GpZZQnryK5hb1iP/Kq1qMbuubo/6z6fd51fGwV?=
 =?us-ascii?Q?2MT3OWHcnpmb3OtFY2ovjVyLFrMFjL65QkHqnH780UJfUaZIbPr9YnIfCbDu?=
 =?us-ascii?Q?0o2I9UYVMQb2UUDiN1v+ajrXJQtWG2qPiqu3kMJpuIJh2Id7k0qp0zVrHO55?=
 =?us-ascii?Q?IwaFg/HOXabpomb4N/G/asne7KjNbBA4jreXLQi+RiZCRPnha9/ecfT1RxW/?=
 =?us-ascii?Q?rn5xB5B2oa84d8fWdfHtE9aX6mJGo+wlWP9XNA3TIlZ4d79C/GWK/oQUIZ5h?=
 =?us-ascii?Q?phWHuq7xAljx1Ah6UrZho+ulTu3pJKrjXVaxJtgD2Zmg/kZq2zbCiY587Or8?=
 =?us-ascii?Q?stIupXEqUOLUCZ3G0Beedo4MJq0tAs1Q78YViQ7Hlphx7RWn6rY99Ua2UCr5?=
 =?us-ascii?Q?08EEDfKZK1Rkv4+QPqNkFtFKybN1U/2Xn5Asd3eiNF1nWkHl0gigkkJv3x4W?=
 =?us-ascii?Q?aolLhWkoR9GHcpSGe8gAdvwTuEGSjwe6qEQ0S3JuBWkHHkAr8ipathO65K3c?=
 =?us-ascii?Q?q890m1ye9BDCKsiZX94CwjuuD/iOUIL8Czn0cX6208auv4GdRS5PwlfE7hmV?=
 =?us-ascii?Q?Hx1EkMl69fHp7vNnzv5uuTcLWBY3wrXq5PYLm3A/5S4LRLWaHaAVmGrlBxRb?=
 =?us-ascii?Q?clnnmuUayDCem/Vtqxzb+gjyRfvsTd4B79FRduyrzuVLzo4EQhT6TuBortda?=
 =?us-ascii?Q?7f74nt5fNjDTg8n57RQGB3e5Wydi+JOyIr8i0C8vAuVrCQHTq5odUxd0DJVt?=
 =?us-ascii?Q?aTXRqPDt/jCTlt3CKB8fb705ohhZorX3BIQTEqnSQjqjThiQzto/a8mjYRM6?=
 =?us-ascii?Q?a7o1Z4r46k7f2vslNfd3O/8HsT5C7yX6lbnC0mPqwTYnupibSquNDn7n5Ja+?=
 =?us-ascii?Q?DBFP5fxqF765ybqPsk96YxtMCo3q1l7WtqBHnfsaT+EsyD65ShD3YQpeVNBX?=
 =?us-ascii?Q?1l/QLzskQTxLuDoHqEp2HwV72FK2Joo9Lpip3ldrM48xTONWzyJ7/Q89aNVj?=
 =?us-ascii?Q?xRgI+yI6LodqOIj9RHHS1xI5T6tbXgaFFi8GtbmSXkDqmr48SR8lLTNhfafV?=
 =?us-ascii?Q?ozWqD8/DPXEoLMhgVLWPoMgPKKcEwtUvKKvf+aehy0PqC6rNKUCfG3/+MLXi?=
 =?us-ascii?Q?PdCxva6GPtru3BWpz4m42gI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286786ac-84ac-4f8d-e071-08dadd754195
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:10.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBtwCiIije3prYBlrc8WAecSlj3oGQEhpYVqIfwrz5+CnnOL8vkwLjGCmF8ISU0N7Ekeb4MaZwNkBvBo6PxAqLkTCnLE80XhEkJ+D4O2tem15FmTLUExwXg8432WsjWl
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

Current sound comment is indicating that #sound-dai-cells is
required, but it is needed if board is using "simple-card".
This patch tidyup the comment.
Because it is already using "audio-graph", this patch removes
unneeded #sound-dai-cells from ulcb.dtsi / salvator-common.dtsi.

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

