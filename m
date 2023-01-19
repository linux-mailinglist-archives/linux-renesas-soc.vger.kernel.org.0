Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4BB672E84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 02:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjASB43 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 20:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjASBzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 20:55:53 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2125.outbound.protection.outlook.com [40.107.113.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80243A5B1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 17:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvZlvRnYn5TCrfCL/uuOGCX555caTQrRe7GPVpm4vLB7dMMAqjcvidmhKacPgmVpN1AiR9+g6T8wxLXyo231MHu8Z1BWEniLaWgTaYA456h7N0YZuFcr/RbgAnF6PG9OJaDEqyfb3y9ywHUsEuVIcgkZu1mAHiJzy7UVEnxoGGpTAdfeQDbueL598XeKEFPiOsaKyr76jTa1aJE6BpXK/KzOnBuic9IaIWs9ctPIu8JujjxlMRfF3wgausk381fUW+FVwy12RqgAPEnn+EF6BnE7xaR5F/s3HAHQFjcJhSpanR8Wi0TMHSD8nS+MiUTxyUsDEPzIcvFGWED91Bdw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfBaLUb534mzm6nu6oAv321g+JRL8LXVgGP/69h+aYw=;
 b=YTkp6kycCHsuglLuVrfE49p6xla+jPDgYuTjCqR/boil5HTM5mv+AfkANjZU2i7eclxbRsW2OHevHsmMUdpUDNzBOHN5dPkgwjCyRknrKwsy0X1bqc3hAyXJQqZo1Yba0+pFNImZB7Ob1RZ3pUr9FUUhfMfx4ULF9L1FvknB0qXArwSmfxwFmnqTvTVBl9jBnXCSHOor/6+65b82h5WMvJCZ0NgHqQgmoidlDpaPqUExHf/Uiu+rQPr9B9Ksdna5lonZm1YFeWrn/IIpHB5n1Q/K0njgWzcRFwNokilwiy5TMQXJ0FFMdB1KateNT+7Ydy82kfQSBQQrS1QmDYwIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfBaLUb534mzm6nu6oAv321g+JRL8LXVgGP/69h+aYw=;
 b=Akvus/mWMaY79pKYXCUpL6ww1Ywh2GzlFmIoIw7kkJdjn/j5ww1174P327awQGI2Qcuiym2IR4g8rQ7+YUvs9p0Z8pCBWHCViORVm3ZWrr087g3pN7vtu0WZos6J+LlCqu6kYr2fmQTObBuTc26gIeJd6kN9xCNbHsutZPva3H8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10725.jpnprd01.prod.outlook.com (2603:1096:400:2a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 01:52:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 19 Jan 2023
 01:52:00 +0000
Message-ID: <87v8l3z3y8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] clk: renesas: r8a779g0: tidyup DMAC name on SYS-DMAC
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 19 Jan 2023 01:51:59 +0000
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10725:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b59b90-ebc8-448a-fc7c-08daf9bfc118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0B3LbG8aMYebIcWhYC8tRlpukqyidjJRVVNJt0Sj5xyeZm8bHFLGudYnRJiKyVjdlAEdfN42ty7RQjcBuHhjSPapqIzE5K+DSkDXOVzz0dn1X2EXGzhVRPbasLyyJZvZpU1EkhgalLcnEXl0l1+276lW11n8xrMWhegT3PwhY9eY7mxJWyJ/1QI0IvYmiGHsB3uqNJsrn4a8aUSE2V8p5oUpB+R7iG21pVi3CW123B6tirk1PZcgptPnA0+kOLrD2DlWIi+w9pktOepsayqdImXud2/8p1HduUMiiK/jaYEReDqnNi302U/nz5EZaF8P8wI9XVBBx+eneINUMWjwLpsq5zXih5E1JBJDXPVEROrScrQzn3fQuf+uYk7kTaxf0zp0OGektawQwxB0E56/5+u6qsNQ2Zx8TlL2jIKz/2kg38RDkd7NTp8Uf2BMl4eAyxkX5D/NiQIbMr+Q9zASlLZYY55TuW94kGhFsF3juVlth0SyMSy5kLDuTtqQKTXfxl/fveUYFeXB5t7Llq7d9SZOrIias2+JEFGqf9tyRvl/90TGHPUdDWb8+j+JQXDi+wtZBNRmVjwgOeTWKN5+auUXCd7XZdqtePKzc/G5DBFtAUFhEeoWtWhmosdOdSy31fV4+Rx6C1jj5MIDCQxlskPix6otT+Wy2RrQwcR5JX2u4og9rcydHsttm45Vf7m6t/DwYKWW+Lx41XWnChY+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(6506007)(6486002)(6512007)(478600001)(26005)(186003)(2616005)(66556008)(4326008)(66476007)(66946007)(8676002)(83380400001)(316002)(5660300002)(8936002)(41300700001)(2906002)(38350700002)(38100700002)(86362001)(52116002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9v452D9zydTYG/rkg1hTNVQOkuAzRZ9Le8qG+vlFZiX8Do+htBDFoZMsDYXf?=
 =?us-ascii?Q?93jSQN9XnwB7JTmhloNgyhLGaJS/vl1YdhsXEBHfvwB5YnnI09ZUxVnfP4K/?=
 =?us-ascii?Q?caf0Li1y5jiSlPqZ3LJDCzNKArAKptCOEQhSCd2r3LtnXeegoyEq68IGjOe9?=
 =?us-ascii?Q?EAqtzkoMT7CGkRUIVM7jMXT3ePR5vPeIa5pg3r+4Q4NdheJgaS8dHW3PaKIx?=
 =?us-ascii?Q?4GNyLqauWqVTDrAbMM+uvsEkxoOM7DlBaEHlxX6++d9kwo0wGJ6BfIaSr+JF?=
 =?us-ascii?Q?3S1vPokg8OEKOTLSWvChbkZYgP5IITODsSNtCYeLFTcIba9LHaHCwkkRRNSd?=
 =?us-ascii?Q?Gh1uuS6rFfKvkq7xBonGe4SBVR1H3DSMBPzsl7o2UxEX+wDFw3VMzGoNpNkJ?=
 =?us-ascii?Q?Qh2sx9lwjB47Gw3lSqrmOZ2OFgeFMAQ4r09GbpGN8hwWspuIu2sXywQ0pcmc?=
 =?us-ascii?Q?P7PlY6NvZ/K6BnNaRfFCfGf958gvPG5thet93qSpUvxiz4oua0c6vIfDS2bd?=
 =?us-ascii?Q?Uy7akISvQen8mgIBbCBifJrUO0PwWRE8mEH43IDE2HnyQZdond7fuRDl3sy8?=
 =?us-ascii?Q?cEMLcoVhWMD4Mjf8qa8NeD6y0j0TAS/ZcA2+lFZoZ6BPxm0cva8zmx+0Qt6b?=
 =?us-ascii?Q?NzNHUz/+Om5MwIGxms9hSKcduQ9xA10/JVaxOZ3U/gqRltdxV/GPHpSAt0gu?=
 =?us-ascii?Q?jLJsNv/sWzMtXpzZZiLVlYMHaetlyNwed3J6YsICJsNwnu+sOaUFbiRd8q0w?=
 =?us-ascii?Q?Shj+/JbRksI6Ksh027R1jTNk3BG0+BnVc+HWW6RtmOTS3BUepNf+KvgcId41?=
 =?us-ascii?Q?wG5qPElR/XKiPyLvu2zXfXp302OQSSITdaSISsd8ge+xkF8erKKSVhCwKwaf?=
 =?us-ascii?Q?sbmJ7L1Xkll0Fkw9akZ6egT56U/UebPXzeDERMGRjw6tVq6ur6I3jsOfITdv?=
 =?us-ascii?Q?MMHhTrN5/hKNRLFZ1TmGiC08AuNKu2eoPEBtX7xt/g6cDQx45ElKfRc0q9zO?=
 =?us-ascii?Q?SVyP4LESxJNSOzP4B4ZvpUOpESgDjHaXPlgqePpRH0V1pxhczbHOiZjfMS07?=
 =?us-ascii?Q?zf7kYeDJ9krFbiGuNjg4ti6PQkUuokIQwaFum6VY1YTYxYsqJbFobCK4lMME?=
 =?us-ascii?Q?VLtpc3hQ7WKLZeASwbFrka6G1TrUm9c2Vg1b/QRy8Jv8/eiUGLd5+Xk4rONy?=
 =?us-ascii?Q?Xl8q0au6t59stG+csN9WStKRuvdP8Mf/lS/Eh4wVh/TX9isTDLBS7b/vFjxn?=
 =?us-ascii?Q?tQaVeEecbRhbsZ728rnNeCBAMcbatQJGTwhrkw1epVCNBeArUwyLqAO1o9j+?=
 =?us-ascii?Q?MhA33pqAAAq1N92216cEs2ag/fYtKGDAp6KwSiilL0TdYRukx78yuVVFxsFz?=
 =?us-ascii?Q?LYktB5UqjyNuRAruQH9xfhj+Eu1/kgvXBHNa+8Bv4cIPBDKxZHNHKPqdpLKF?=
 =?us-ascii?Q?EE85HsveZkSOksN61hhkTggeVyhJA6mNxdHX4jKYh+ZWxfKpe1pNkTA3/qxI?=
 =?us-ascii?Q?cz0sTS+HLm8i/SUMjlnMNeayd0cWZ87ku961XNXATEc6QbLBvRskwOM8oVGq?=
 =?us-ascii?Q?/yBhVPQSvJxOAcYDMctNANUpMdi7v65UqsbRjF5TT94j3WCh7e1oJOw80CkZ?=
 =?us-ascii?Q?mhDw/nZZ6FweWlxew7XTlAE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b59b90-ebc8-448a-fc7c-08daf9bfc118
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 01:52:00.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tECr+rBPPDsGc+k+CuHe+98QQm/JSUNwea7GRPAhivcgXK5b5660SHUPQPXnD09th/gmqUJmQdSyuHLkeisu8cQhflqJTEAXWFoA+6PjIuIjDSLy0VCu9wUfq1vxl54
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10725
X-Spam-Status: No, score=-1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

"sydm" is bit name. Let's rename it as common "sys-dmac".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index c6337a408e5e..47a407b75446 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -185,8 +185,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("scif3",	704,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("scif4",	705,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("sdhi",		706,	R8A779G0_CLK_SD0),
-	DEF_MOD("sydm0",	709,	R8A779G0_CLK_S0D6_PER),
-	DEF_MOD("sydm1",	710,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("sys-dmac0",	709,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("sys-dmac1",	710,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("tmu0",		713,	R8A779G0_CLK_SASYNCRT),
 	DEF_MOD("tmu1",		714,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu2",		715,	R8A779G0_CLK_SASYNCPERD2),
-- 
2.25.1

