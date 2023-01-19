Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B34D672E85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 02:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjASB4d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 20:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjASB4E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 20:56:04 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9158C4A1C8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 17:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKkGxHMgMGDwFEruRbyghXLe0ltxzXgPcHkPcP8eeufYMexwdekjk93gqzrU9NJN+IaitYeZMiK/H9zYfCbGuJdzVYCNod4YzBlD8fOkhYhj8rUrIbVyUhgAWjw2gFEYwERRalFmklB9f4TGvcMWxeH7ymyQQ1jwPQDCD4dg3Rz0U5mFlTZGO3F1KZdfiJq5zPOwT4dLnlgojxBegt+l8rfpK3WPtaaYArT9cjXrp6xHhBji9YjEqA3Bh1VtlCisL86CAQeDbRbxvgbFG7CuaWWegKiX/M/ADfuUwjGGcGFrccDNLYp+4PWo3MmxilA4wtdVr4B6MV0DmLFFSO8NAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnmKlUmjwRxvv+D0X/MYfquacxatV8syjg0rghUs7A8=;
 b=Dytj3etfzajM0CP0MNpx/CcwfXAzJ050seGdpe0BPAxcjYLfCAk/l4imPxYOsu5eqa/uyJqFbeQKzc0NqYhF8wo6iy5LlC23gu4Voxv5Fiktat4ojHqcISEo5pG+qgOA4AYaVrGCUHAdrfS2vI+KV61ga5y107BwZnTQZirDH8vjOZx6mplVmraKBO68rylCc5yI5xfL47g23olyDd0RhKnNeyewXB/NQOcWXEwA4g5j/a7W5souBBNSLVkwmRksTGSaBfM5zplbIBP4OnxBrkPy1ajgaQz+KXtphl2KRIxWw8CNuBYGveDbWswFtes+lwfdSQrqXAC4NPpcBIUSuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnmKlUmjwRxvv+D0X/MYfquacxatV8syjg0rghUs7A8=;
 b=OD/dW8K76CmT4FVM0HiXeLF3IPLvTyhH/xmf1Xd0q0hgRs0bfBl8KowsZT3E0txgqlUHy5K+K1he7rHurBHix+eTKqOYyT7+uB+totXV+z5ONiLBwzmf7LtvVTp7lBYBqYY4TmBgkXAfCHzEYbdyg6gWAXTlyj8wgIftqn8WUcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10725.jpnprd01.prod.outlook.com (2603:1096:400:2a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 01:52:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Thu, 19 Jan 2023
 01:52:17 +0000
Message-ID: <87tu0nz3xr.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] clk: renesas: r8a779a0: tidyup DMAC name on SYS-DMAC
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 19 Jan 2023 01:52:16 +0000
X-ClientProxiedBy: TY2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:404:e2::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10725:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f2cdeb-6e5c-4d30-ae12-08daf9bfcb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNK21X3fRKEHZ2O/kFc/fMDs/XQADY8ABfCGzpr7Z2v38XH3gvMv+4mkT8nYZq/OcbUGrUvu8hMqFDsKXGKwztBJmg7AIsBB1khlYZwtDeOzBV4euuD0mYEzXz5Qg/+K7GSkpMvPjdSuHJXki9cfxHM32Y7BS9PdHHsT9x28KNiR/wUHWATDba/h+boOJ+YM6DsFoT4Z9O0RNkkvJ8suoyZcaPZtxQsa8P4jhAvc6aN3JqWNBxRsawNmbMJE4Wuop7cbZMVoYS8iLKRnY76vwlM2HBT1C3LehsjeQEy6GNTprH8sD3DEgfRICQdtm9174VbD7jf0u8QA5SOCWpDWp8uxzANeiDoJ+kqYpgLwy/pXxWCe5KHtAo732+40RqtzAkmqTJdtHQW0DPwFGpZyCk2XQulWtps/JhNhAu1iEJmSw93IOjoufK0jaq1kQVt+7RikpFBSRYmP86rkIEqSh6v6eDpU4DTVClEyNk8FpSPwv/178HfpIizn/y7RSxqQchD2aQy0QN5FvCV2nva1wxy0D4deg4fEbf+4Y58MDHhQNabLnHMyJg/8/sJ2jF4x7khMLrj5Xm2l+yI0ba/xaC2CfPfEXYN+05mBWVXuRBqT3HbtXZ5plpaAkdm0M2z7xzX8a65MhjWh6sbbdY+SynMkJ0jvBHym6YufppPnOH2NKbAoPWI4QsR7iuGwZ1xy0G9AtU4Qi174MYDSpCB+1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199015)(6506007)(6486002)(6512007)(478600001)(26005)(186003)(2616005)(66556008)(4326008)(66476007)(66946007)(8676002)(83380400001)(316002)(5660300002)(8936002)(41300700001)(2906002)(38350700002)(38100700002)(86362001)(52116002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z+Efd2qFf5EXWGdYMxj/JFOJOQkAuXSCsY4FRg0HE0C88MyBTLKAJP3jWHeE?=
 =?us-ascii?Q?GVlcMiK2mXpTyItDoxzW796YqRGT078EMwQpePCatEMdLJzr1V6mjUnqbWsL?=
 =?us-ascii?Q?RW0Xwl2sPd1ujaxcyXq9MyXpCjJ5ZPX1KZ5jPREBrOYTlI0jm4u3dLUUscvX?=
 =?us-ascii?Q?82H89U1HnA1geMXhBpkGoh67o4n8M1OD/KRlh+f26HxsftO8jbjtNC9/f523?=
 =?us-ascii?Q?uR4BMhiFRbnTTIw+BJ1mbeJR0J+qHezkzDPMfdhE7YB88hPCRSPxQzTHmjgk?=
 =?us-ascii?Q?5JwioO+J39X/hAyBr6JPHIXn1r+jWZJ01v5OeEJlv6IJh9guS3RX9f/VrNQr?=
 =?us-ascii?Q?+dIGj15VZ1vsaIRjT2Vlt+Flbt85G1L8FHxOOXvhzXXdhZx5s4SVU+Ot6Po2?=
 =?us-ascii?Q?8OtDxCE5lETBiuaewKEUGsM8t8Abo+mxUfipPP9V9DpqVpt6uS4IzCoZKO9A?=
 =?us-ascii?Q?LHKG2GKJA4RvURviR/Shy4KDKMYP+Ok/ZU8NWa5Ll+6HnX/dfn9UahZf3Cwg?=
 =?us-ascii?Q?MR/5sypNwXRmcu1ZQ5UIgDuzGyQWdTZ6rU9c4a7dQUMpaGoieX14Plf0u4f6?=
 =?us-ascii?Q?WWq6TdS29nF6cUAzvp9UpSRe1XkISOsRlV8DMPlrqriXewWRJIA8zGBXErCe?=
 =?us-ascii?Q?wNsDuupT8aghkJE15Z+Gxmo8xj4lvANXJjz/4t1lNNDAbYc9fVoNOI6JWVs2?=
 =?us-ascii?Q?drK8O2c0QJmy0FWf88msObWikcS3lZe0Hl3SNthrtIc2ULc1CPPkW2UwaSSk?=
 =?us-ascii?Q?/2Z76EOPyKSPMInbup9s0BUeC0oQ4OtPSdnH275niB5HGXkaTOO7VlPyHLjK?=
 =?us-ascii?Q?PLuh3ipu/Ch6zeTELjUFlratNAeLFVIF5yhheCGeg1VI2o1IZ0vfzCGVNI9j?=
 =?us-ascii?Q?cnC2RQ0wZ/+qhQf2vBLE+Zk2e7P0cLWFEnxc96KLk/k9gpvfeaZs3h5wzncy?=
 =?us-ascii?Q?Ak5RRRZfF1V6kF0MQUBiZ24BkgSIv59YHwaHgMxDip4fB7gafPxuJqA1ot6Q?=
 =?us-ascii?Q?PAU3dxu/D+znsbXwRjAjTIJAEwXDV+FHA/FeiHAVyV5ywvxYPbTq1QiUxbKm?=
 =?us-ascii?Q?5X/st48u/PrDR8joB0nqjHQC9gSmfhkPA52ngsEkYEbTgX+AAjH6EcQjYZCB?=
 =?us-ascii?Q?1nIXZBDG9B6cJozeoJuF8PKa84BnSEsc6FE4iPYjExGflrBds9QFI7qPwXXy?=
 =?us-ascii?Q?JH5pj2Mb5yU4gkuP23VjCzljcUD7/XvAg46/cbnZpLBuVvoj4TrE4UILL4Bu?=
 =?us-ascii?Q?pwMvNR7XyqGn3ydEcYvYmc8wkb99/VLtP5+WwH2NN9jJuvZOExWe0sMVlwz7?=
 =?us-ascii?Q?ZxzX+2haSGkEBBNILqOIPvKDZJ89E6BWwT5zFXfyjcctBaz2M9SQA2H68P0Z?=
 =?us-ascii?Q?W0IVbdoEGP+0130bbQAXTsEk7YB2ZZUtu74mScXDLsIyPa7NoBQQO3589YI2?=
 =?us-ascii?Q?bWuTUDgLQdXLmhjCbOa6WCZcT9ZHoSTutedzdSkMXoEETNVvqg7tdyHZduAN?=
 =?us-ascii?Q?ZIvxf9hLBt3ljjeoFVBJAPQGgP4dP0ENd87Br9wOyP204Xm4J+M4CEFlHZW9?=
 =?us-ascii?Q?hOEiGNMEiAMg8cOFpU6pl3+sbjZOL/X46dqssPkpCWcYhZy+3hoEsxAFnOvr?=
 =?us-ascii?Q?L+yn5/g7OnFVHpK0u3Lnmzw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f2cdeb-6e5c-4d30-ae12-08daf9bfcb2f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 01:52:17.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52cevB8Vc2KzdKBwLSOY8dlU9MJSzYgFyyUcn6O6VsUEoKOCDT2h1f6nSekcFWaH6PofXHdrOJeCpo5b9m/NGqb/UWeHFjXceqiSR6Kpot4p1K2L6FyIjs90eY+3nfwP
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
This patch fixes the numbering, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index e02542ca24a0..b4baef3c9857 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -176,8 +176,8 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
 	DEF_MOD("sdhi0",	706,	R8A779A0_CLK_SD0),
-	DEF_MOD("sydm1",	709,	R8A779A0_CLK_S1D2),
-	DEF_MOD("sydm2",	710,	R8A779A0_CLK_S1D2),
+	DEF_MOD("sys-dmac0",	709,	R8A779A0_CLK_S1D2),
+	DEF_MOD("sys-dmac1",	710,	R8A779A0_CLK_S1D2),
 	DEF_MOD("tmu0",		713,	R8A779A0_CLK_CL16MCK),
 	DEF_MOD("tmu1",		714,	R8A779A0_CLK_S1D4),
 	DEF_MOD("tmu2",		715,	R8A779A0_CLK_S1D4),
-- 
2.25.1

