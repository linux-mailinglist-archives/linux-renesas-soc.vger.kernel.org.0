Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A1464C1F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 02:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbiLNBsH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 20:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiLNBsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 20:48:06 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9471AF23
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2022 17:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLFPN3sKQjaY/4jfyY5IMcLelUNTry6ANZm1hqohaKz2jjOGI/FZuwDyP68Y4Vmqz5rBfbZLR80Q8zUHJU7zOAYKUPPXgl0xzWzATuRekRvOoH7wQ1euchRsKSbib1+ZvHvBBWtxWqJZ7faShaVvsAW+EyeWi4SPcyeujigoSMwzKwk6s+kacqPzgvLVJsjt67LZnqKfyGg+4pglQ2x0Z+DXD4OXUWfTZkICwfAbmZIoFCBqFnRrV6PrWHMDAORTt81DLqgpx6f9NOE8XWLK3ZfIwO4T+W4UX/AVRrhmsNrUj8cPjtjW7shYFqefALggIXCe2JWeIE4fWs2Sz9dl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDxkabEa81042dTAZOVqBL5VH+HJrtFRhpsb2sdpJio=;
 b=d4TLcEuAALUQZ87KCb6L8UcGGDl6JPlW2Umznetjd1YP57ONaQTO4qqxvzwAsO0ng+Ky/30iujQJJrMcKhLvIIM30qLDve+ITZGF92CSfpW8SokCTWKoBPlTqt0JAbTYdfpR/70BmEI/Td5V55ercFaDqHYHE04diRmulKO6VcqS+fe/ksPHeqL7d3nFFStA1JCnyZ8/WjnWOQx8XbeNVguP7R3/DZlKCaXayUib7g4CL0YkB9hzhEz9ub/d2/iptj7SqAKj89ZZA6YEUBJ9sPEmTbT5npZJwFDDt6EBkS9Zx4YLxQWAypRlqobiNGB0pr0KvMGQ+400zmO+n3VRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDxkabEa81042dTAZOVqBL5VH+HJrtFRhpsb2sdpJio=;
 b=R8PZPwkwYPUFfZJdBUsPwInJjJ/28EpqLFh1EH4f+ZXuj/eROsCMdqfs606WWb6lGeEh0XfnPCAqMPsXjRiJPt08EkyZCADTw80iu0euOeA9yNlN+2RM1ygvfEokr0Nvccb/NkZIuV3U7hLLk/Xkb8j8L1gXNy1WON4mm+6Cl/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5860.jpnprd01.prod.outlook.com (2603:1096:604:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:48:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:48:03 +0000
Message-ID: <87cz8mpxgt.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] ARM: dts: renesas: #sound-dai-cells is used when simple-card
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 14 Dec 2022 01:48:03 +0000
X-ClientProxiedBy: TYAPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 6653def6-7f60-4688-ddab-08dadd753d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLkDTE0W2C+u4vyufdQTLHCom6oxCWTihAps3UfckmNuDP5gRwSmsetFj5C4LXH0JdJygGfC0tSpTzIRqm8hOhsAswbLVy/8Oms1YgG1qluMcMs/PEE0Ok22PglGIb+23Kr+mpbQaDYQrpacwnnZYybLYJ34Au3RMVjjnFweQzDwAjO6xa6j5euAdd7rTiHLigbsHm4EBSPn9ELg9jz0QPCj3jeVdRXwU9Off+Wln9nDFJPEBLfaEhkhnJzJ6WmZ76zZEsPU91OwK4ZGPF7A9NXfxC3yf2zueVVk5wmAMd/YCnTkWgPZqloOItvyBmku+PnFIC06E+33T27YrYpZHfOG7/WTGW3opURAoKxGXMxNas7TE6mwcYnhbgjK00LZs/9OlXjSHxQUkxgooscdHF2Z+bPNrOffJyFVyxZ49aqwkaPKToA6huvJFVfIpRirtqsKc73dSDzA6EQSLT38KZE0KmXl2JzEqhaUTbrSXU5jGySEmZQVdZta6RjXzqZunsh/I5al2Ci4AGjc2me+dDEBnLq0blQUyNNhXykn6EkF4V5SRgCbomnMD10bTg32+buSZrg9MO2ctm3ld5ieUx4CIr5srtjapxi/7iTIj++z0/QfzHRQMG1+KtkVBTsm6t5//sINR1OwTN4mFihdW/9uY655kltI/o+fk93NdiEz0pPZ0BOKMyy5oSEoY3N2VhdFkdsRuq5u2jtympDViw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(36756003)(66476007)(316002)(4326008)(6916009)(41300700001)(8676002)(83380400001)(38350700002)(38100700002)(86362001)(2906002)(66556008)(52116002)(6506007)(6486002)(26005)(66946007)(6512007)(2616005)(5660300002)(8936002)(186003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5raw5IPdy2FRMv6H3xigW5IB4ZXcoUrEGvWt6bhz3eDpE9ogebu3XK3R57RO?=
 =?us-ascii?Q?8L3eGjPl7dQzys2sTBKcmdTtg5Cg6BbxupZQQYMXM43RSg6vOl2eB2Zcj82l?=
 =?us-ascii?Q?SUnd5CfSAPPlHeV2tMqRWAnjDmWm1L1fttckhcStwM3Z7pKw5fjnLlNBVLhD?=
 =?us-ascii?Q?dyKFr776+zUFdRU+Bh/JVcutXRY34fd/5WNaOiXAt72xBFCop7OPAELkDjlL?=
 =?us-ascii?Q?eZqgPmZwyk6yGQQkooyeW12eeJMs6guoyqPngfmIJ/f7T2Hp27A4DxhaGVDq?=
 =?us-ascii?Q?0d+uUJEdNvSqr86DXk8ztPYKdpMN3Zf6Z4M9SYL2xh+x8IwQ4lepycqi9aS4?=
 =?us-ascii?Q?GujS7FqdtTpWbS+GV0BilwnEx17bUIzO1i3FGBsvpERLkIfwm30+nz8Z0x77?=
 =?us-ascii?Q?yIPHfzV1U2xTh1nJDj/bGfPSCdt4eVbVQAXseb43mUzO4ZxMSDYR9xmrncBJ?=
 =?us-ascii?Q?thNjTvAqT9HEGECki7cJUFYJrjYYfevs3PGW3WMyJjRuOkJmUYbVFkMZI2QV?=
 =?us-ascii?Q?tbPACQWnJdwPdO0Hf9cYuagdx0e26Kn5m2n61LHp4ssY7BJQC5OLW5sO6Bg/?=
 =?us-ascii?Q?cMlSp0usn+wvnvDY/jt8UJiARsKU+bBZtzqfw/yoUFL3SOqj9xfTa3Uya4jj?=
 =?us-ascii?Q?usJZL9YqDALJbbOp9wMcb9BoTkTnvO+K4Fgk/bUfIXk+OBRW37K4mpy/IRKQ?=
 =?us-ascii?Q?WRqrqt8faUpPtxelgi/8bPmu3FW7/kIElMCHlZEGX9LURQpYMoY5EHOcuGiO?=
 =?us-ascii?Q?jd3CG4wHUcmO8Cp+3xI34joo1z2xURXBjerowO8lrsRqEAGrN98ggXeilRPj?=
 =?us-ascii?Q?fpL5MxaygJBfD/msEZUpLk3e6muLfD+azGPReX3Ns4ho6HGvCcGXa3iVX2fJ?=
 =?us-ascii?Q?vUj6ltHX5sFUDL5Zuyo+2A156a/KQi9h54pq3GILdw2iB4G1aGy2DFQb7wmP?=
 =?us-ascii?Q?o83VG85mK5Slu0x/ZAKTT0NJUIF3ARIFODsgks0nfatQgFvef1RU+EUTVAwf?=
 =?us-ascii?Q?gnflIQbq4HBbkGvwWjBqvxhl/G5X/PFKZqScefTS2V70QT5618RKdeFGxWKY?=
 =?us-ascii?Q?0UANMhitOefqOc2Qe29daEB3cJUzVu3x2h27mAlshlpC8ho/oPj6YO0jEU1R?=
 =?us-ascii?Q?7uRLXXBn9xQoWL/eCfkFaVM8hCmxokwMa3lGIDTlJSWckzFuWdZwD6zU6E3W?=
 =?us-ascii?Q?tmfJLHUU1SENpL2hAlYp1kTLbKrRnpiPh+Qb4ojLwrx8JQQ//H0+39hH7fA3?=
 =?us-ascii?Q?2YykIzxG+oM1t2tByMbOiGD8VT4Xg1SbQ3pimHXCPVFIJRLWt5/Itn+D413Q?=
 =?us-ascii?Q?qtIaaPZTjZpGYRYI6+6D71A4eW9Dk5EWbCpyAD3Cr/2Uyv/BDpmonxb0cjJk?=
 =?us-ascii?Q?5VfMBir0/0qGJAqzYmhNrzgogUuC62yRs0Xkhq30aH7Is/TC8j6jK6fM7U7p?=
 =?us-ascii?Q?C/OSwNcghkqbcGul3oFg3vcKfbb2F+4hjyGajGErl4nC34+tuVmTQ4+ekqjP?=
 =?us-ascii?Q?7qK+S3/sO4dJF0ALFCKVsF2Jc45V2CGKsFrEPYoLGF7B2MYsoJopJWZrC14S?=
 =?us-ascii?Q?G4iS0QAn5cTuqN8+FZdSchmPWihB7RtBy62zZpAVnJ3608exNFypd1zQ/MJj?=
 =?us-ascii?Q?1wR0HBedtIeV1kdJUtkOuYM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6653def6-7f60-4688-ddab-08dadd753d15
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:48:03.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0wDiCOxzDTswETE4hO49tHjYByrI4qUfyJmQB3bpX2Ra02TxGfXGpgDOpbbscPXpxSfmsc5xIAEek7NqBvDWHfhN72JIKlpHVyw2GM/fM9E8Rd7WQdCc2jAztkj+BxA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5860
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
index 758a1bf02fae..d1c256d8bd56 100644
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
index db171e3c62f2..b5e362fab418 100644
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
index d8f91d9f42ae..853eef9e031d 100644
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
index 9ebe7bfaf0ed..8bc3e19f8adf 100644
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

