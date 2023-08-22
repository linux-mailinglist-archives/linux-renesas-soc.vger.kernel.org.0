Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4A978399A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbjHVF6G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHVF6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96073187
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rip0IQT8sDr/ZCYh+saWLlk7Vzv5r0QrBwfxOnGTlRfwpU2/8WesE77RGaQzCo1jLEiRjZW0h7D12ugyOp5R7yRlnC1f9pkzv5oKJzpkC3uMEnngSqw2e0izELco96GIftjp7VJvf/s73jtIfViiVVRyfv2aCP8i6whJp29Up2ZvIGDkGHNNtNK0EMcT45nQXCaH8XxUT8oo50m24+Z4IKPVZ9gFH+VqSaU5zOPCy3M3b1hEBwOnjCvs179R43I7XbyqGxP5jQooncc6HsaxKzf3dCh3Ccbbhhe1BjgOJNnZ54HYZ9buPrqDWJbQg7wmhDgoXipAp5Z5Z9JggvkSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7d28oSybytysvkUQGSL227Ts0kSv9o2Cru9ALbe5yc=;
 b=Ph5DE9Mflf/Q+rFmLgxVkE1jitm87NwBPwkfeEcnd6ym2+olWbFE6RNJFSbgmhsZRzLTggbeeYDmlTyz0SGFKFdGY4uvzaVd4thS9W1cNKeIv4NHBrBxniI4wT2kv+BzBqrQZfA4+iDg3IH/0f3n7cIAyBcIFum8q/QZyYd5I4Ku5AJjzBsf0ctC5Vu2B1T3cQ96Fu2b4Gr1vyGoZtOYBCwNHTQUqSgybTqDfzxohdbBsENaFnyrXMZj029pyjlSl/bk36gboMOpHchY9ym4XWh6M4uZBGicQdmijmsm1B39rdV8Y5QWg7CRHFPtrp8+dp29bDKl6xDeg1N5V0nbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7d28oSybytysvkUQGSL227Ts0kSv9o2Cru9ALbe5yc=;
 b=IQVTRir/nh032SJ3atib3I7KuX9Y04swFey5iv275jHGIqpAI78kEbGOFFP1mHVSebZlwCoNrmFDLKSQsEq76+nDwRnGfm7dPVzdsE5oMsXFHbXFDQjfi+M2Xoylzbb/s+l0dlsVRsweEd2hldRo5qmJZAu4D23iCu1V75sQh/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:01 +0000
Message-ID: <87wmxnsjo7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/15] arm64: dts: renesas: r8a774b1: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:01 +0000
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c5fb9a-ec0e-4107-17d5-08dba2d4be37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5rK8nUz8uUGQyYIuM8y6rYznrKjq2cyfST3/I1yIm588YuCovqO5Aa0keMlb+kBjie0o7EHUjksIS7NcdI2rVD9beSe+yE0c4SklIphGPzeY7uvgwtGdnb4MpVNAVSkUiAUS3XnR641bpptARC1Rt5sfJ7Po5dtIdrZrzIgqwCm5QHLIk+n2TQFgENHlqCmPUlOmtzz0wEXEveoFsWL8liovGH1Rk3uDjPZuHfvhv57dQyz6bRYe+Y8/ii4EW9My1M+I2nKaioHUfKefyCRPqdZqekOIO08fz2Eih3+4o+rBAhA6mgPw77dCfQv0N9Qd8L+KLsQ3ukqfI/SIL8FIjlOhNGM7CrPhcuimRpbkd6AbCflER8suKOCVYKn1D0p7U19nuNc3UFWQGQ7hOndKJGJeTUS4SMz/SMHgPE6TFh0cdnbhwIF7TYL3vbJDxDKyrjZcHnmGiNhxpOlm5lmkzHFgC69RTuSC/Gjf5iIuXbQgpe954ZQ/Lhz3CesHTKyB3BGPxfXUVOkepbwxgr6badzyNW91G33IBW02Zn5AceE/fs7qwWDBhHKHs87oLyEtBgsVGFIovF9asRVqeal5K+E/MAkviBg1I3sxvZa2LleBehyVvsBF+jr9UaM7oK+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eTLY45Q2uWU59ryCMk/1viKT9WGAgLKHJAubWPY47vlchnbUcgfx4tawmw/y?=
 =?us-ascii?Q?kwkv1Izic3mIk0fMHzTkl/PIadrxwUToV0quCYfqgbaTnCOBjTxHYqfuRHft?=
 =?us-ascii?Q?90C/vAtabzpz5TmmesgX266Gi+ySbdIp5YXdcJG/6uUhu8dA0ieYViC1c57h?=
 =?us-ascii?Q?m9cGjl1VbF6iaL1Rat2npBB4i7LmcYrabwjPgjfjD93oLeoCa/qg+GDliuY2?=
 =?us-ascii?Q?TUebPzTSBSmoWHIfHLMjZXviMJtN1JlPhpZraP0sa4ij2Ve1cb+W8p23N+fE?=
 =?us-ascii?Q?RgwQMRzit3SJ2l4Vyb7DkrAoveEjuQ5Q6LLeKSAYO6NUegDrIgVaaWVDgwU8?=
 =?us-ascii?Q?6Aze5ePa7LCPfvJIQ44HnRr7MFRcxb5mlxhLH6Kqj3ifvpu7W7g2n3Xd00zt?=
 =?us-ascii?Q?QDCLtUHaBCIujhaBlJdZ54poiLzJ/bAEf75nQEGrcK7vhba9lUQXIGOFEaUm?=
 =?us-ascii?Q?URA8lbWon/iAXTNYiybaDOX3iDLXQ/wzPfw+UjZq+cpNZLSKAWxJCUtvjevC?=
 =?us-ascii?Q?QM6V/Esw747ht+6xo6bHuwqcflMKO1+jLPjX8qS6dbb5CZMmk/m2xB0neCZR?=
 =?us-ascii?Q?w5KRd0TGryJUXgJUDxTYHxRp0acrnO9Lhta8tBB7RNZVvVy2o7zIhJEs6Unw?=
 =?us-ascii?Q?ItkWHrvnvDMS9YrX+iGgIVKl3WB0XKxn0yD2OSWvSBgux9I0x/rXUiIze3ZB?=
 =?us-ascii?Q?tJ0AVK78iRA6rcBF3Ns8XjrR83qHaj8YRyvULFkVYPg4VpkRQWtTXNI3VB8b?=
 =?us-ascii?Q?V01yNP+eHMG89fLJLyJ6YI7YD2K1F/B99x98pH9z0yt1mFe/0WYoTvO3r5YH?=
 =?us-ascii?Q?V1rF9ixBzZP1gNLGuXx1SB2h+fKikHSvKTxH+5y4/pVXFFpCJ/8bPnXalyoU?=
 =?us-ascii?Q?Qkc4zPZdVvc585wdyakxrqg4j6zyMkucy8gTn5DE5V0sCgRcpzD5hDWY2ISf?=
 =?us-ascii?Q?W+1d3mICMotxLVtiKd7QlUaYToEMt4TG88ZX0A8EnyCuNZIE0ckVNNxqXuGt?=
 =?us-ascii?Q?blt+tlAbeW7XO7kl05Gl66fgkJM8HCkj3yadpldzSWuPOzJZFOLHW/DQ9SDk?=
 =?us-ascii?Q?+dn+CBaEl44iLUqMIvzh2cYfnN//4OikvJHFSLuW7/meRGxzkfHNB8TAPmcX?=
 =?us-ascii?Q?pFMHzR2+uHME7i04vXFM0mLLkMQE+rNuhaLLRgAZ40txQ0cQoNB1XeG7wpCF?=
 =?us-ascii?Q?+E6YtceyQ4YCMVV1sCKUiVkgmD3D3Dz6Tsm8u6o4bHH98YxR13R7yHrcG7+N?=
 =?us-ascii?Q?sQhthx1x5n6FgkKFw3/58DZvmsEvU1kWd0aVzYrY9PRbewhwi3BtyBr7EbPb?=
 =?us-ascii?Q?SD0CacEAg9+5u3LokcKFlOq8b1PTbRWVeBxtGXq3m/cHmv48P/uCm7lKwRPH?=
 =?us-ascii?Q?D7cdizoPkVJ5LD/5/Jzuk2yF3LUuxxkgyAnzlvtnEA0ewTKwY3vYAAxdXXVi?=
 =?us-ascii?Q?XBcJLIxiS6gy63yuDGII/tp6SNBwDi0nILwnTsH+sU/tniKlcoNoLXgsPzsY?=
 =?us-ascii?Q?SnMOn5dURWq39Z/lf/Vn1GQQTZF4Q4XobTtotThPd1fuPIjOpCLDT3H4qNF6?=
 =?us-ascii?Q?+hFdqrTBO17Ud46nqETiQDZyCfjdp63MYcnpByltk9fJhUQdosoeLsEtWtmJ?=
 =?us-ascii?Q?siMimpaKXKhuu6Q7LtC36x8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c5fb9a-ec0e-4107-17d5-08dba2d4be37
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:01.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5pA1Xl3ru0r7odVPQXUM9X/3A3oSGSnXv5riwyzzNPgCSCUtcp/Vksr1UYCXorC6g1t88V/s+OQbjALfP7bWyEkau6mUOtGIXPpw/NSMz9jeDJzF8RDNRLob0KANcAV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
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
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 75776decd218..fadbde8ee3a0 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1597,7 +1597,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A774B1_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

