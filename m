Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F787839A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbjHVF7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHVF7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:59:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3FA185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN/ICUApa207YjJgTIlne+jMMSBL1M0atdRgWip5nZrbiySCEUdfLTGxMugIoSw71qi3xznw2K40dCtM3mwrChwMhNVl2iWoG/A1M/1jv0aRF19scOueKv+Sir3G5p39di4XKYJUSWrjxJmPACPOPa8Ffsgx0Pd6vadGEX0jjUSjMjga5HUqZ8juUkoiPRgb9jKkxs36u6hhmx04Gxh4OkiH7fbKJGntqQ6gYCG88oxYvjE5ePTmcGcG1A6sY3Hxp/9LARp4iUpExZEAJtCKydfrpeCOo7XGse9hnmBR27FkLjsHFjkIT6L+1/vs05LDFyutyqKC1YDjIY9zhQbPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORAF9mnuypj1bTgYohZZIJ/Ahtq0OYQHkxhnjMi8fII=;
 b=ItsbrNTwuRbieV3Hvx/kM39+F4pdn4gWMB/uDSu2y2COOYhxlVhSMs/O8ecpMdJ9RmzNgN5kWjdVtYENZLE2j1GT4CYDSA/u36bqWxHSOA0cjuy64FNoSvSbT6bgJ8BUyo9Qx1EWDwHQKr+ec//SNAuCjHlQxz/zYF7XZJThxbuj4yhmhkCebEUzRtKmJ/KnaXlxNPXFOSqGCUB6f+bkI53uA0JCkKfcvdqDTzMGK7gTlVDlhsZgpDjLc3Cn3iLZlSaw1zXR05sHjXtpv0wv9zA8jOOm6DSylJVvTtxfZEgTMpi7bjTeAtjIKs0MT9lvNMSTNFJXfSQ98SUw/l6uIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORAF9mnuypj1bTgYohZZIJ/Ahtq0OYQHkxhnjMi8fII=;
 b=Q83E4jFqUQ/MYgjxT6k4ITDaxr/lvEzjAhbA3eqH1DI9BgM7tynANAVKrkrZLv6agwboEDpM9tftNFRxG3Q0stCM9LA3gCoJa7LdJJutuddnhBsGn9xchHVUD4JYgg1hHsDiA5teqNFpcccoO/FLFcTsxGazxpgw0PUbDJvKc+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:59:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:59:04 +0000
Message-ID: <87edjvsjmg.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/15] arm64: dts: renesas: remove CPG_AUDIO_CLK_I
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:59:03 +0000
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ebb4e1-f2d5-41f6-191b-08dba2d4e3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHtWQQr/aWQmhuojJJuO3SgaNbJOco8DtPXhPRFgzLOWefCpTYavHTQFiMeMi5Lr8VneJJ5LZ2rIEkZ8syA6rNbBJKi1VowIXrRaNI/Rv0jyVOLptQH4LbTe/d3hCkABezj7Eix0OeXtWH48xAcEvtk5X0GbRkZiY1HJyIp4vXiwrjL4CIkIy/AA5o2xtCR+f5xBuvNO0VWa9EKbTgMUW19mbin7eFogzSAoqnUp8sMzoJzSAHva6AlZc943ixVPyspLENyj88F/e5gFQJb4tbTautnjpDi75pwKmpO9B4hQ6mkwnHgRX5WxTXe1PMr9ffEXt/PlUWLma3TYO+gmSggi+BMRTAgli1a7GJuYyIna/Eeq+8CrOVhrmVoGn4F+rUhaGXjiHMINxDEamM37vasYjmSWWpAeUDn1aTxiTmKw5Fzez4FMxot021x+M9kn+VIiTvM8yHaq5zIkPpMbHPN2vj2rBRrfFJv7AadAR47x9gy0cumr2xtgVOfnijtPt4VgST9tBlW4Lql4VK5eWDYFwm7jeAcPGF5H9oUA0W94eiEpLjuVp6UNDyq+qfO6b5qYwu/Pa4FNP+0/RkYZXyLH/X5btPdK9JSFmegcEoxslfknaK5JRddK/7kHYcfI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GGpDwBxy5EvNMJy9R+LSm6Yb8szLNifObn8kLXsP0G7vajZWJAzJIoyY3DAo?=
 =?us-ascii?Q?rfBjodYGdPiStXF7bD4uk5gXpT7sTksrZtreLGk2V2Mtj8cfbW/2BBDPmzaf?=
 =?us-ascii?Q?ek1wnh6esfTcyv45IH06n/gFwM1mX2pFVhymoRBMLbzfAoyhcwSa7ksVyUIQ?=
 =?us-ascii?Q?lKSV3jGQvq7luuQhcSSwBWZhM6ZmwsLRIqEWo3Ekg7bW6IvAY7OfdOKHuvk0?=
 =?us-ascii?Q?Ue2bXra0YaO5Ju9BFWOPpdZHTsKvWY10AGgfdjdMuyExxxbjY+pqjmz/qon0?=
 =?us-ascii?Q?rII6SbpPRDjtF2GJGXUcKkqBviPy++FzEmwJRIKpAH3bwfUfypNukg+EXoNl?=
 =?us-ascii?Q?VuIx6HksssPMgIfS94lA2FlnbtMDhnGgILG8r43BqpTDHSGF0Yn/n0IukHsN?=
 =?us-ascii?Q?iYg3yk0JoMY+FhtP79wWqOgEJ+0cPTTddk/Psfh2xRCZtSXp41cO77ERXCYi?=
 =?us-ascii?Q?tiGJPH9Gh7dfxGUD0ZXDN9zEN3X/Lc4Qvi8t1Bd3Qn6d1ZmGKJ79HC3MADmr?=
 =?us-ascii?Q?gz96BRxEg3HGfJmUBbYgwS4taCcS1HqIRZe0M0g2Dd/mMo/931DySZkVY8M8?=
 =?us-ascii?Q?9yFDd6OWk/Ne4tWm5MGFSTpqUzZJuPg7KE3jkT37RB5wOG8iVcBlxS5oyjFs?=
 =?us-ascii?Q?mvFvC5REi2At3a+XFqTFE+WfQb3qjsEyXWa/3ePoHDKNDzRlnKS8fA9I4Ghz?=
 =?us-ascii?Q?+K3878wtiVuFSdFwC72SAfzSqmaFZdTrYl6ucXSv+oau33AUyBN+CkcP4sdG?=
 =?us-ascii?Q?uhGcPCVROQqUSfJuDw/tPD+rYcFpgWehzZ6QS0gRjrjD4GTAeuI9iYmOloR8?=
 =?us-ascii?Q?ZrVtyQyEBWDyu2kFGjAqtP2HGE8CLbEOCiZNMAusiWKAW/vsOUtKigvTjYJ1?=
 =?us-ascii?Q?hFApDlKZ3KYId5uhOuuH0mrsUWrWYS2kfQvBQhCIiyPezG87x/jFeBtK+hTI?=
 =?us-ascii?Q?4yJVOdmOSkuzkOrLwAFGjuc8b7hJomlsVLOdGxUJvOa+sks0uORPzRrsmdjK?=
 =?us-ascii?Q?gqFKTkUw9CvbAP06SO+0GUjXEcl9BKrEVHKnHPucCUni3N+DX6uMKb4UzC/k?=
 =?us-ascii?Q?b2gPv7xHzrZi7il2qhiIO/FBHwremk4wsYNt3QuZcq0khkIRx+nXvbgWUBYp?=
 =?us-ascii?Q?/A4SxF3qgYGdD9Vnafm7ESb61MxQ13yVcptCDLccFv6zRVx9OccS99R69gjd?=
 =?us-ascii?Q?kgubDpAr4RyWM3V8bGc1JFlQb3jBvvhFmGe1p3fTVEz9+MXDSeK9cVEyF+Lq?=
 =?us-ascii?Q?MZJktrhhVZem5h5PdVpEpEfziAQO+VSv5Ovx1XFWIm2UXv1VzDzXcVnz4+tE?=
 =?us-ascii?Q?A/gs+TX1fvq4S5nV/057srTgGGN4hannE5WtxCF/mLukB0uRyfBmQ4+xOwWd?=
 =?us-ascii?Q?4/DbBrp1quc7fZR00e5krSZkXl9YBGtoJVpUFlCL9G4AC0Rnf9xb1tfooH8o?=
 =?us-ascii?Q?AaC6v5te2YxO1rzQuBkJQ2K/MqK1hC5p+GdYoHIa1DAVzP3UKdB7sN5an9xS?=
 =?us-ascii?Q?LfZArhtAdRBogP9mN0D1+7e6NklHflV5WIuXYUDPRaYclY/2WwpjXEQnDA+7?=
 =?us-ascii?Q?V7io20FOLDRFEocg4UjB2YOFCZlKmrQ1HD+7gw/URZcN0ZZh2DzE1xr4+/08?=
 =?us-ascii?Q?X7lo/eTqogKhrCHTyDZ6I9g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ebb4e1-f2d5-41f6-191b-08dba2d4e3b4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:59:04.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3lOemcddBxDb9bVW6CV1U9Zr3tBE3cJAXmEak5+CKodCc6QwskN24OXE0ztxRENfOPgejWYIq+9qnD4B+EcEyuzDassw+iuSnMmNHV993bKGy9uDAQhFb8eE2zoEhw8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10727
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No board is using CPG_AUDIO_CLK_I any more.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
 7 files changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index a7b7a8cd5bf1..95b0a1f6debf 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -10,8 +10,6 @@
 #include <dt-bindings/clock/r8a774a1-cpg-mssr.h>
 #include <dt-bindings/power/r8a774a1-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A774A1_CLK_S0D4
-
 / {
 	compatible = "renesas,r8a774a1";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index fadbde8ee3a0..786660fcdea4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -10,8 +10,6 @@
 #include <dt-bindings/clock/r8a774b1-cpg-mssr.h>
 #include <dt-bindings/power/r8a774b1-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A774B1_CLK_S0D4
-
 / {
 	compatible = "renesas,r8a774b1";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 867170a10e14..175e5d296da6 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -10,8 +10,6 @@
 #include <dt-bindings/clock/r8a774e1-cpg-mssr.h>
 #include <dt-bindings/power/r8a774e1-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A774E1_CLK_S0D4
-
 / {
 	compatible = "renesas,r8a774e1";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 80035578de26..a4260d9291ba 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -9,8 +9,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a7795-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A7795_CLK_S0D4
-
 #define SOC_HAS_HDMI1
 #define SOC_HAS_SATA
 #define SOC_HAS_USB2_CH2
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 52d699578d81..a631ead171b2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -9,8 +9,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a7796-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A7796_CLK_S0D4
-
 / {
 	compatible = "renesas,r8a7796";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index b27930101df5..7254912a241f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -9,8 +9,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a77961-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A77961_CLK_S0D4
-
 / {
 	compatible = "renesas,r8a77961";
 	#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0db25e5aa006..e57b9027066e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -12,8 +12,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/r8a77965-sysc.h>
 
-#define CPG_AUDIO_CLK_I		R8A77965_CLK_S0D4
-
 #define SOC_HAS_SATA
 
 / {
-- 
2.25.1

