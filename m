Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB75B7839A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbjHVF6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjHVF6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:39 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D71185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUsI2Maqj0BMydpjTLvD6ccK1pSeQv92XvLuy1nmlSNmFd1z/N05TAfUrH56Uft9bVPsUu+6sbvxaM69E5yvBheGpv1IDdALQiZwsYqmokvFo4t18HQDdIHWXeh1WmeXqfCHvnuPcOWcKrZiBoMhAtwduGusFnUHYCV9PlUcYqHHaoI30vlFArdzwj88xFszAQ7dVMocEh7/aojrzP2zU/lu82w5UUuHZVcVrsC2JDCIJ8neWs8QJ7rpJ7q+BIeMo/bAu9ci7FlLYF7z0VTBpRvLm8U6mU4NbrpL6DnL0Xzws4yHpJpsjx7Iuj2HSKpLCzmXv57EQkxMFkZXd8HJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjh3+64yN94+zXGy3Y2C1uS9Y3dcyexuX+943+KpL+w=;
 b=dkj5ByhhPEKn8yL2GQguIbcBRBKZzGycbbj34ek/6ZN91WW86w/8AEKnggCS5kBN0sSfebUNzEBg+q/F7Iqk5AVQ+tNecL16hz6uXtAiQcnVHLLK7cZf8AmCsm3ViRXz7h2hGiaUq8QG9bUjB/Vzh7vEaSa+rM0nMTJWA/+om1hrlQ038TiDOW1eXgGpE8PrSElvipxQ39WgcokC6aGCuQMZxnqftqFG3zYmFFFaHI28PqhBCMcdGkicc/uEMtkJjrlun02StmjzJ4A4LptuunH6OCfMKKqBp0DS5s7sXN9koymWsAw+au4Loo2aIMZVMDNUKssGSRoVEHjrCg0jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjh3+64yN94+zXGy3Y2C1uS9Y3dcyexuX+943+KpL+w=;
 b=Ga2FdvYYeZhk8WtPp5hEFHNjcU+LKl7OJKANEDkWWzu0BTJm/E9mndZyCmj25X/g+xLNrMbM0xs5R/b8I3DMoaqyfHzG+8GV+WwrjNCQfE0taVaTkWaayvdo5KQ7QT6/Yz0Y85OSjZ6nChdHJRqwJOkgCbnsiPpULZKkZozKEH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:35 +0000
Message-ID: <87msyjsjn9.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/15] arm64: dts: renesas: r8a77990: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:35 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 125870a5-5697-486c-263f-08dba2d4d27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2w6j0AfjRuZ/sMnLAbfmLIYohVD1ZtiWiGqBUqMTfrN8EyNH6eDZMXK3C1ZU1QjN9wceqW5Reqcyk2D/RHbaW1G6CNJPmMgEANpWYbJpC4TX5kJ3eoiD2iitvSy5biesPEm76+X1wu6anA1czW+ajqLBebgcGmD2ch6E81SbPEWKNqhxikOAKDR77TrucHC6Ecjg2lQptvia9VZq3T4CrpyMhXrKLYunAckQ0IGVH7ny4Q1FRnGSn8B6RgwrJh4lilJdidvG3GTUvZAHdvvrY64s8rWC+ttbQ/wJuYzoqH3A4kmIgGKf2IZBu19t1FOAxIc7BaBqoBmPik7K/jM5XCNri7OAGM3Oe+i1iBXdUWPCuiD5asq2k1SHeLmDb8goVjbRf+2FRqu2OQng7br0VtqEaDPdJplNe71obRgb2YBBmkImQqOuDFJQOoLgRQquc9GvySebTiF+yvgref9OjH+05v2sI0WTTDQxabMu1cyNaUNkP5ikuRAikkydUrZaAnD0xvso1mtq/bzaTKfAy3fzRFk5S2gzr/crTfz9uvDzAepRyAUBLm/WMILngy3DJm8Gaqfe/+q6PB2GDW8YqKJS9CSgMHqgZmAeszejggEreCBL0ObhEqfguF7kMBsc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pbaF2J8LHvz6AwrMkSmdlFRoEmBDkMAIsKDw7Pw5RIUmdeHQZXYgAp4SyNIe?=
 =?us-ascii?Q?5DSb9ElEt20M2sTZkD/ED2nkp/b75QgmfunJ+YVNHC1BYoADrg6h2AtEqOZ/?=
 =?us-ascii?Q?dajD4nj+PHgwIVbOQpStRu7aWu+QoOWmEtXNNLtPjrCHJt07qHPPdEGwfEX8?=
 =?us-ascii?Q?apoQmhp3ogeCtFosoTye3dMDEfeWq2/cFQs820rfSak9G8MtDFzso11LjgcI?=
 =?us-ascii?Q?7ovDqbNjnkc6qtCXWq9qZluyqOVtbf0z1Ak+b8RCAnB7BS1m2QjxLbaxSwuu?=
 =?us-ascii?Q?+bBzlB1f9VgKu89InNF9IckVa1GQsGzX2UsFQ6GX2t5KW5iMi6MZ3/X4CzYi?=
 =?us-ascii?Q?whTJc8HMELtPUU1WLzCTPxAhfBx/W52DZQjpamICLfRrl7oL+lPajDr2vxRZ?=
 =?us-ascii?Q?niYyE+4GNb9ZsXJ6U5lNilLkglxZt4cvhGBuOzCNCSs4sbGJ0xeDy2VZvzjX?=
 =?us-ascii?Q?JisNG2TqwUMV3sqxZYYRH6Zf2e9Eeia12bBvUyXlr16o4Vzc384dkGf7ooHn?=
 =?us-ascii?Q?COo2ZRAzOisx7X2nF5XpBGiUUJ832Go5x8zpqraVYXi4fJVtQQRoBWhS1t0D?=
 =?us-ascii?Q?P9Dd9c3aFoqv/eK/Sayl3BUhbYoBQPrX1y4I2VqZgtdEet6pFUcdNNoUJX+D?=
 =?us-ascii?Q?5neblBh2GHLc0e1FfFak0+J1qs1RvYwcQa6dhD1o2C473Rc3Biep+djVbQSc?=
 =?us-ascii?Q?Z2nHHUoGR5vEwkuRSEqjdOEoeMlon8Q2YHUiMotTNVxxny/a+IS8GGWfgyQg?=
 =?us-ascii?Q?PUM5SBTJFCaCh9m8e9pI1EWjP2fRZO72P9MAQ7wM/Br+46v2BEnUbRpVui44?=
 =?us-ascii?Q?aK3WTRzoXyb9npdnid5Z4lwaWMKbh/HsT292yO/U1bi9XESDhtwJQKWxZ3Ho?=
 =?us-ascii?Q?S1ktwHjty5UiCY5OLMdbcHInH+Wl0fss+GjXYq2BgiG3URVFtZ43lv1Ior62?=
 =?us-ascii?Q?Poe/uodsFPwKg4LkOjmG0co1XX0I0XQAkdDPU+QWdoM7xT3zDWQZy0rWof6h?=
 =?us-ascii?Q?nqULZeOHW+N4o+3+Y6fi5rC0TDLY2xdEXJdAL49wF4vOFEQnvuxDL+GI+nHv?=
 =?us-ascii?Q?+OZ0lIZ5Vd4IM4/4zNpdpt3WI+AdV/cXYq+1q2jW6LCalZvWaDAqCB2ZYT3Z?=
 =?us-ascii?Q?4akiZy8DT6l/vBSW6a1tjdE+uWF5AdHuAmTVg9UcpuTANA0JYsOyDNHKbBaZ?=
 =?us-ascii?Q?QxyaZfbWk3PKT74J84Vs54bvK5HVHvmYBO9BPGaXX47xmNC3HKlRi/ATtaSR?=
 =?us-ascii?Q?XAS/+eGgAo1ZYd8oYoLyDPcAVyvglKPx9i1HA+BUu8a4AB+OiPw4MidEzTwX?=
 =?us-ascii?Q?Hui1IIhYuKTDjQmxbhc27jaxRsYcT7E2WSAWF6KyvoQus5ZniYlGg9jUcTpG?=
 =?us-ascii?Q?dyY+qPguRcRbF3TKyF6/XKF5dacfk1t0H/Bfmkm2+1qsUSVq8kAzAAlDXTm/?=
 =?us-ascii?Q?nJjS8nzO1lEnTWEYPSYSlsaI21fc+ZxuP1fZscAyGzQX4CA9H26nf/90lJfT?=
 =?us-ascii?Q?EJWjWqP3u3tQ1jyenssAi8AIfPcRwH6RXk+FGGkGCZ22bFsBT1raXGWAaSIY?=
 =?us-ascii?Q?L+r2bFv4Qj+CNE6qjLo3o75cfLB1Bj/f96zDYAHT8D8Ix4w6phpggfFIhhgy?=
 =?us-ascii?Q?m+yLZS7iR5bkp8aVO+xYvO0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125870a5-5697-486c-263f-08dba2d4d27a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:35.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X88SWGY7+CepG0neTJlN2Yc8zfio64cQfAfmJsaae08ItXt0pHQN7iU//0/fP80yjKfPqTtnrdkLZGt5+uNlfL2H0OTTVp0IhKhKNZPCT+rBeRCWC2ekTY/V+m6koqQB
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
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 1be0b99c15ed..626ebd9f2f46 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1501,7 +1501,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A77990_CLK_ZA2>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

