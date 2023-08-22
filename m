Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A1D7839A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbjHVF67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHVF66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:58 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2A2116
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1S0YT5vDSJmktL50HHZ7fNsP7/AD91GLLt8nhhqqeYH3xBMxW/ucAtPIIMJtBkUUiFTVIhY4UPqAa6j+O5czm13N1+2thmkkRg75ieCWJlcKyuwi8kaRWmnzFtBxertsAOmlhUPMMGfIQ2DHXWf/KBC/ZIwjdf9xoueqdYYzE/XEOuO3jJjmCfC5edfCDQsLybKAAkzPT1r+z3qPl1qw36l2S9Q+NublkkAS24NYwhdF3c7arIDR268svFboNQRBciDMK4HJjPXlJ8xnBH4DMYQYPGTaRvvjkg4v1C175Y3qFaBW2vamiSgu2s+XhNRXK9d3msuLZ7SgYLsdR3qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Ngprav//L5kS48alx+vIhqrA26kU0TRFeWpUb90vE=;
 b=PaXEh4yCgjLv0GB7ZPuUpOWCYx5RKjk/K2PKILfLYc+Gxw++tHEgxnWonNdrNQkkiNXNdjggb5il+H3E1NbaREbvv/2DZxKArQegjUNsCO+lwZ563MMMUqasbjOQVzY2xkF+Wlp7j3Fn7kJLZS7qXc3SgIhJjRJugFViq0RaCGSb6iiX8J3/gnsWGswaoYI3iZQFLOvxfyKbTl5IHFCgjX1VUTq64MI+MmZY2QSy497N+YtOlzdgi8tNgjZK39Ts48MjZ0haBmlCsK4uLCa9PPL2uDdxWCzCbbq3082k/Ud/gfNqi0IaX/3QsvwTtWLV8k5Tdq66dTEjjF5/rtbcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+Ngprav//L5kS48alx+vIhqrA26kU0TRFeWpUb90vE=;
 b=oAQRO0Bh9c52zTvmHxOQ6yabu6KgCNjuZP+5r2DIE0d/EWorS9yuayGhm/NvCfiwQ38d8X7cka9xjkj3UfqSAst7BLFHNXwZxetGf8KH8QLg8aIFxHjGroLME0GisY+RM4jyoQ9rvslunYfXXoElGDxsW8wEI9+qE2/GiRbwS54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10727.jpnprd01.prod.outlook.com (2603:1096:400:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:54 +0000
Message-ID: <87h6orsjmp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/15] arm64: dts: renesas: salvator-common: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:54 +0000
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10727:EE_
X-MS-Office365-Filtering-Correlation-Id: ed981f29-c5c1-46b3-25a1-08dba2d4de2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfRq8ali38GHdpzwsPeg8cNCZoDG/WzpePv2lkylYTjBNpf7o9PW+5SLWYlzdbzOZK88YjB0RFS2/6bRipVJ3f+Ar9PLnnjK32yCCe5Qb4cORl3TFDpiehiO6ly+0xzXzTosmFvMGzrwB086zTYaZl2OEZQLiUlqLOt5gQee42nt3i8wnnOQBoITRTKdVs4trtlzSH4q6hlf37MLCpnau09mokV3lwjwv02Wfz5tyWUPJyhNPOG0oGpXmPAOoRbNPNpUsB0lHytn2Rqtb681aNkLARsq2C50dnfSansQ5PW9gJ+C+mgIi6Gx4rUriqgVLmmbs7g4pF5ts9nGlZ7FdHyfj7OrCd19DYPjRMI2yHp1AQM5FICxFaLG+wPT4W0ziFEo1u0OqR3XYosY27yIiAoPAZRvaye7xA9m01Ry8+0la/YVzo3jXT8OFrwBnDZgs4OImml9qZFcojBQKtDTpEcRbP/PIlpAm21onsGwo057y/ug7dAKX7699sh1/jUcimFz3WQH2BMwrZ96OezqxEPq1JySd5DB2PTahFV7RhZSuI0uCnItueJwU3sut3fKoqF/+A7HL/5GoSkd699e2M4fykpiWvjHzuYwAG4xEwj9XK4FqGMOXIlekA1ZRJom
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(451199024)(186009)(8676002)(8936002)(4326008)(316002)(478600001)(66556008)(66946007)(66476007)(52116002)(41300700001)(6486002)(6506007)(6512007)(38350700002)(38100700002)(36756003)(26005)(5660300002)(86362001)(2616005)(4744005)(2906002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYZywGZ1KYj2BtDrXVXfuaC55mrd4YBNSBlweIe5wkjyFI9nJOZ2ZvvjmYhm?=
 =?us-ascii?Q?8oWiNluay1R7tWBfuChie7sruS+mtEL4IuC1eKw9bxDMTonkcUijLXSpg90S?=
 =?us-ascii?Q?rbbyiLuVe5/bA+Ck2OLhNN3XO9nt27lKmcqWnPTDpT9XxqJ/rnBGDtNrffVJ?=
 =?us-ascii?Q?n2JJ2YB38sHYftAXfomoRUMheWbzGr6yhAdQMCXV6gFxPZk5PoaDb05yKTPS?=
 =?us-ascii?Q?lSG1L9gOaz94RLMVZoPtd2lvn30ejzAljf0BIVPqDIrNSgT+QG1vOwgGXO9T?=
 =?us-ascii?Q?yqPvNxyf48RKtYJTlH9koA+UJSYUAJYjytorbrccbltii2KnPUSlLtW4hk+Z?=
 =?us-ascii?Q?fd6q4U5iBi/47ww8rwbzqiNQPdIHjOpMb+MB+wXkrHBW4Bn6a6UzjZ2c8puT?=
 =?us-ascii?Q?4+zBa8jgEr8QpDHwJkz/2SIZXib8blWIRGHKr44ML7ATMFavDz3UN9fXcM/4?=
 =?us-ascii?Q?hf9CfDzDfREWRJWCXi/50x6kPwjCv51SKMMyJ4UpMgjliriDfR6StaDRd/yF?=
 =?us-ascii?Q?b25YQKkAYIJmqg7f5uCc/phRlwAPbJc9OsUzr0DJucGFI4PFmSyP2RJ9IJDl?=
 =?us-ascii?Q?Aa4HpH7q/SAz7xixqbixQM0wOiX4fVTkoevBFpf954NCIT5jkZxWGffulkW+?=
 =?us-ascii?Q?VyfDgiXyhutz7gFE7Sp1x2lzHeAu9zsuqXmaaS5gjj2wyYWQZ51G4PNe1z0u?=
 =?us-ascii?Q?GODqkx812cUIYUHyNGm7E4z1whqmFT03645xcbLRyf4qlnJTqyavaKBG4+0I?=
 =?us-ascii?Q?2IXc9oeUjpwaaOme5Fm6ZlqAqnmXM880cpLY/5osG73/gX2qNdD7f3ft4T8P?=
 =?us-ascii?Q?0i27oEav059ch4wmryOnZosMPAaOebHlcIbjJLkLBWTblvLHv6suSEpNoLB5?=
 =?us-ascii?Q?0grbNN5SihjhVLVBfEIAcXYG/QHOhkfhq17m3u4GV4o/xGWptmvW6AQAoEb/?=
 =?us-ascii?Q?w+1Nae2IJZRvOpOAqGImb9s4GVEQIbaf/3jyakiV7uw5NgVeg31vUdyYIc2/?=
 =?us-ascii?Q?Rk3WmMSPWkDD3Z7cAEf+mSwH6DBkn3JqMAXDJURRgVNiLS9cLybkHXZPya1t?=
 =?us-ascii?Q?Tj4b+rCnchOoX7sTWCdjU9Ey+rObIogK69fsmSHEbxqSuYWoMhX7qG2jM0h2?=
 =?us-ascii?Q?lA9sKfhuYExdcK16LzdWKjdimj/r+A0LgsxJmbPxBQHxxRAwUKXFJ2EN0ipt?=
 =?us-ascii?Q?ZwNnfMqa0YCQ979Ij/LyPT2mL3MXoFPv4xJdKCoNJLQMkfOcRZ2WxRTk0Xzh?=
 =?us-ascii?Q?x7Gm3BLbJ1xEKJybURmmXZE4u3gvWfB6QZ5N4jWuYAFEKWz+CwPlZxpOttAx?=
 =?us-ascii?Q?pX3YixVLqip1AlbEiv4mgbIFGhbNCLU8FGdK/fOhc6OGQMpEceDwK0S25Nwy?=
 =?us-ascii?Q?h+5USU8OVbc70reD5ve3lAM3AjI/WbhGxQtm5On98zOpWnw3oPEDakhJzvRQ?=
 =?us-ascii?Q?b/aGR7yyltLXsWs+Y2q/70zISbt9JHOLikg4eZLFrT0Jr+nLwNfLeh0ETLQm?=
 =?us-ascii?Q?XdVUPZjBiA/yQ+8DAlnPSGdRZJItSo8VHOCc7GgnyeGCx8EgLC+LKtaRl/z1?=
 =?us-ascii?Q?c7giHddXGxsVkINY3GKKB4MIUE/smw4KW8HAs+7PtB+dfd+wNW5aI3diVF1Y?=
 =?us-ascii?Q?pch7cJcgGqgQgnJO5nrV8gE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed981f29-c5c1-46b3-25a1-08dba2d4de2c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:54.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBjH8Z2S2i1vLcM3UkGwh1o5cuzlNsGADZ4P6202DFe9uucfx0lLfa+rjtFMzbSmP4QmnQjLS0ZuR2c9oITW8Wk/QZ5r+P7xMFd6q32cSIngdz7Zb66To4uWlpZRh4Bz
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

R-Car Sound clk_i needs to handle "ADG" bit on RMSTPCR9/SMSTPCR9.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 4a3d5037821f..1eb4883b3219 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -822,7 +822,7 @@ &rcar_sound {
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
 		 <&audio_clk_c>,
-		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+		 <&cpg CPG_MOD 922>;
 
 	ports {
 		#address-cells = <1>;
-- 
2.25.1

