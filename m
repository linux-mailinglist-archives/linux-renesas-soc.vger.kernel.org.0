Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBF176A503
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjGaXtm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjGaXtl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:49:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AD910C7;
        Mon, 31 Jul 2023 16:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/rRRI6AbxZDRVxL/KNK4n0UztLLuxzURN8RxilCJ+XVcZxN+NGSkjGuV7WmooOrPf7H1dTVOVqc1lT0mWtyk8InzeUWPG4XG9XkaIBm5Z1FAgjvJWUrewPa7zSfBhwNoILyzTxM87tdkI5c3MP19NvRxFYcwW4JXSt0jKhBK9Rn+5aZ4AI1gU9x55hailqu86DITL8SXuzTshC3ltA1NddNuQgFEi8px7njKFCyNGCoJ7Rpdpz3AY930JFeNOctEYvvKCNWtLxQOZ+Yr8acQZhsM2HUlWOeiale5JkWFQ8Z57l8bggqvd5/WaZYown3hf/cJwNFjr7oj2ycCNbSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZyM01yg2OoUyUUtXPU+iwPhrpN+XtBilAswDjkQWqg=;
 b=LBnqPfFGjVnDKpdWAqEpAAVq5yq81dnZYaAO3+CbAuaT4335HGUAeKwWY+lD+bVW9F+MWK2ZS/HlZLVZqcWCsuja1BEYrUP8A8rvkuLFWzrrseHtpUrf1pL0UNuK7V+kGtEvaXTp0HwnHhqx4C9K55INaAEOTUXDJjBboczJ5HFyA+g/af5B9S5jQ0Z0B0RWWAeJmx0SApGhNcK73yeu5l5Ncp5QBTm/CBSGkBmG/y6EYQWHioc7zFasmk1ADFoCt0RSRv6pM5afC8++7/DeM7awFsGT8gyFuNMW7UjEZve+JOpBjazjlmSBYiqcRq7oTfSi9Pq7npekpDks3ZcMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZyM01yg2OoUyUUtXPU+iwPhrpN+XtBilAswDjkQWqg=;
 b=NZGBEKTSlS95vq7RD4fzi0hXhLzqq9Ik7Muq5oXgQxSKkMeDxt/Fn4K69O1o3fo5MzailREjhlQqh2fKsuOUoqPn3GNVNflO0SoK7emU5kbVbxcW0BFR6YgUCdBMVoJCyEoYTT7Ft6Vde60A9uIs9AvumpGa0CbyCsg5N+VRVVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:35 +0000
Message-ID: <87pm47prox.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/9] clk: renesas: r8a7795: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:34 +0000
X-ClientProxiedBy: TYBP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fee0d6c-30e7-46a5-434e-08db9220cb28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jFqfZvgl1eEZ+dUwGrgvn6xwmLzfaDpRtskxpiYDAzssDeiRiOQP7Y+lpFjULMuN8yctSfO51SuY3y72KxUqUC2ieno2capejtbqev7X28ztAiIanSgNNOlRc0JuBJdvQL6M/EgS6oHDwA/Pcibw53tKmhFPQ9kUo9FDfxk0tgymbIVgDXaM6rrm3zClur49QzBLJ7j1m/vTgxfMF3Xvv2dnnIp+8RDTU/JOGoO0pdkby6irQUOuuk5r9hG+RfBVJhBZm9ckD7MtOYhZrcVQj6fmStuF6H/+jRG7Pbj1ZNx8M/cwQuhjTBElKHXpKQm1RLHUXdt0bBmb9rn8wv6JqaFL+6K2m1IQqD9XSfVo7/gqX/yDhAM4d2T6At5gcxkK78o2pGhfkrKmuGD5Bz+ZxMg0Owai1v/oB6Fh9CnBqQWbol806jWrJlWhtYKMLLLZfw4u/2aUzcxrXkHAJaON1O6e0J7XaCUj9TK9XDJWwOJ9P3ZJeQlVsIiZ3PIkSr/Nd4UeAoOhcIRtdVzPsiwqKOwwwXLLtZp3egyACFQZYcsdJz7RGhaZECq8tN4VJKuNCkiVWqZr+TrihySAoNEC2LLpIIDBFBeryi3Y9980toOpn+c+1/inmFcjaerFWEC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Vxbs4rmooAXTKyqUc4PyrS/m/jKDIm2i+p90csfOFMC4LW9RRQjme7df1Ow?=
 =?us-ascii?Q?e+vQJuOZ08zI7IlE4ZjszaVfLDG/866toW+DnpNpBtjgy8TlhUm7+QdfwI7f?=
 =?us-ascii?Q?tjne4rZykulFpcb9clPqUJo+v+G7jsu0pgL1itYKcKjOr9NcKs7yrg/0FsNw?=
 =?us-ascii?Q?YWK+a7kyvUBhoesegBzBJzXkQN0Vme2eeFvdNCSOvmInKO71HwdzzjBwpC/p?=
 =?us-ascii?Q?StwH2BYjr1FIy5xF0eiFcNHxLFGzxHnQbiplgxze8wP1+ELs9vDmJJ62zPxG?=
 =?us-ascii?Q?QiXkhKmQLOtlizRM+qRO2woJ40bKnLLzUl1/QPQIfi9pyjAxAg6a8e59xXyS?=
 =?us-ascii?Q?cUiSEg+UjbeYPKWWtOFYaHCiL1Y1LeFnCxUOEsFk2fYFMkakX9jLzKlFhRYc?=
 =?us-ascii?Q?c6TZyrhgEvacYv29SNpIy1Sq7u15WfIUgkVSo0lRkXMCM6dlwK8tn8pV+E5U?=
 =?us-ascii?Q?v/8IwYjQaGC76bteIAkQz9dKifg9fgLBtde2nurczbTBc1q/Y2LZbNd/qLyx?=
 =?us-ascii?Q?//ZrqbnZpz7jsTLnGG2QUOBntXlF/tsVzt4W7eLch5HQzJLH5U+4HjsOLiVu?=
 =?us-ascii?Q?V5ye1FfqUdkb0d+A2IOmm83j5XEtYW/OJBMl2Jt2u6gj/XHq+kb/AcvuE9La?=
 =?us-ascii?Q?h2qN9pc14IS/Fvmljz45FL7BLb8jFvvhKk+SPMk0fHwrtI/ZRrJPiCCbMZL2?=
 =?us-ascii?Q?x5N9anaqi+DCm5gHTGh5ITqSIX+8qYVErkVjidmKV55zKJkNSIRAZW4JKufW?=
 =?us-ascii?Q?w0/gI2g/dsaNUlG2NAjxG3txmbBLTLwOZ6X/QkGN/AGrz+tqaZuJOL7eO4BZ?=
 =?us-ascii?Q?awVu+IcVb0/I9B52LUP5eexN7Is3Vf7b6/xC6BlL3lZwc5IqMryC/0Brg2Vp?=
 =?us-ascii?Q?IMDk868Go28Z3DfdE2tq4bLY6lXYEVmZrVRnV8JeZyZvoZIVJy5Y9cwfwihc?=
 =?us-ascii?Q?EoiIUn6A3QHi4gOINriQbvXrho/FkzO8Sm3FHc6XeOiLFRdwWAO90jZuMts4?=
 =?us-ascii?Q?aokTJza4vdQBwFj7ENfnJeIDKAkrfWXdUDlZYFEVhdDHbDLyXkS/JLQS/g8/?=
 =?us-ascii?Q?63gLNwb8Zkt/darfDshdO+5iAifWFfRPB3jCt9OzA1ndzvJDTj/rbVXXXNpB?=
 =?us-ascii?Q?geIjULneLYbX9m3oEjg/35LcM8si8QrWzeKuKz3jNbfiQ++7qlp/IZb6xMoG?=
 =?us-ascii?Q?EKxhnJ/8jUzPlkSaf4YtaeKfxWPG6RXyrZ6CrBE79dQBo2pKKQ/UvAgVt7lB?=
 =?us-ascii?Q?LpQAzpIWnwQNfKzhPAAxilis4iaNmrzSL8044rbbnKV6iIABKZOAuhDgTaN8?=
 =?us-ascii?Q?GQf/gnXJ8k35yM0Rt5d6U57X9zi4VQ/K7HPxdEBohFtI1O57+9GpSfcFrRlf?=
 =?us-ascii?Q?0LxHN7NXon0XxjMIUcAd7L4XCxWa80/zv4nZQUvDOdZMjtPq8+PDgO/UZaNm?=
 =?us-ascii?Q?yAvdOzmOGkjHRlb3NVTTqVF3jXTcEryNtMMeTFPdAVCERec2fK4leJjP/rNI?=
 =?us-ascii?Q?XhwNxraThN2WE0+4Tm/Fl9z5pbVbSB2PxYtuzUtoUSUZuifrv7QrbAoIkagF?=
 =?us-ascii?Q?Ou6op8J/7cj7Fif3s3shreoqPCu7ld7liyamuietoDuAJ1rD/tJMRrRahPUh?=
 =?us-ascii?Q?nmX3E2Hy4KerlUOJbhDmJwA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fee0d6c-30e7-46a5-434e-08db9220cb28
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:35.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epSUvyiby4axWjuYH/E86q+Bw4anxULq/y+DsSYri9Q93mhxxYfWQu39Ln+BexyznQhdWvk3PJbnKuIJYNqyjxidYbSH29IjW6UPWNIkzqIEQYdMXnylCM9KZBIXY4cR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
clk_i which came from internal S0D4. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 7a585a777d38..152d5c1ba3cc 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -251,6 +251,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("rpc-if",		 917,	R8A7795_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S0D6),
+	DEF_MOD("adg",			 922,	R8A7795_CLK_S0D4),
 	DEF_MOD("i2c-dvfs",		 926,	R8A7795_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A7795_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A7795_CLK_S0D6),
-- 
2.25.1

