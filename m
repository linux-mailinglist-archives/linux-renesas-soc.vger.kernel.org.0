Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529977A6325
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 14:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjISMhx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 08:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjISMhw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 08:37:52 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793CCFB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Sep 2023 05:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ1cmk9HTTrWYfZzhQ1LW55omj8KDpmTuFrAiHFOxKV64AH0ynwNjLNo3QdJKWVBTk/jXVRmZi2stk0S27UMIuhFU9vtSljKcRNkkh7Na5fq0TSksg/LMUS7QG0RPydDE1hRKOhq1+28rMDfSj6J+JD4z/Qz0pviF6ytrT5T3o1jg4t0Jt0p8WdKyOhompow2TKzCOxK/oRN7VU6BK9mSgxShPLI89S4pdnPHjWLLzM7QYnJsu87CcZBwlDF3uz1lEZmcjhQrQNMajoVtjrCxnRkPDhZnuLB7rJlAbuVBi81csAN9CWvcvNCaWr6Bxf5ia9gX6et+kgj90l2ADJu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaevxNPP8eA8tlacQQodhqQgqQN/3wuR6AsjeYTFtK4=;
 b=LGN723VrCYeKc4MsdZ3pzndL0bJiesD71C00LjImMj3E+fEIZN1dpkY4E1WutzZeh5gB7eFSObbV9impNa9KjJPanHAHjIlhJnCoauzhO0oyHdtPGwJIrX/iftdqAtzCY1qLnC7HtFoCf+BFvYVmPUy44Fl0o4TxfEOnYtsNovD7IwTtGvkkaw29FIBHUZ0KnFrBfLm9y/9Jj64CM7a/197PRG604BqyfTfG6WtvA51WniNL9ZNyR2tZFNj9nmstEsKUqLYQ20v85Sd6KH7vq0D2KauUvzewEayRVJT2UDKe2iSw5llpUAesDfc/Rm+VSDk1fnCf16vm7Y7KaUZIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaevxNPP8eA8tlacQQodhqQgqQN/3wuR6AsjeYTFtK4=;
 b=ALciD6UIdq5YWZBqHqhlJ5JxkBBAgr1rUq9wNU09Cs4TfMUu4yW7rRQ5nie1O9mnqw1X5C1WNen2hp2KMZ/cMTx9aotdsEGQlZhAHt9CVJLkJjCzmxU1cwDwJc3FLpUKfBOs1TWXooHxTF7y5JhD63ddFyvAzPU6EeJ31o6okuGRw6dFfaYpcWhv7+ruhNDtM/A0GhejhjBssvFaie+Byk8s8bF98nrBjerSGTKYGH+xW+7SiqJaYwkdrWKa7FOqR27Mx3bOx/ta1hXeSxlMYOzu338anm43Pqg3gRLkSAB8gXBgExXikT6LwCrMUyo9ZHOAYmtwiXk6VyM7Pu27EQ==
Received: from AS9PR05CA0101.eurprd05.prod.outlook.com (2603:10a6:20b:498::15)
 by PAXPR10MB5710.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 12:37:39 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:498:cafe::33) by AS9PR05CA0101.outlook.office365.com
 (2603:10a6:20b:498::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Tue, 19 Sep 2023 12:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6813.18 via Frontend Transport; Tue, 19 Sep 2023 12:37:39 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 19 Sep
 2023 14:37:39 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 14:37:39 +0200
Received: from HI7-C-0001H.de.bosch.com (10.34.221.200) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2507.32; Tue, 19 Sep 2023 14:37:38 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>
CC:     <dirk.behme@de.bosch.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
Date:   Tue, 19 Sep 2023 14:37:22 +0200
Message-ID: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.221.200]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7EUR03FT031:EE_|PAXPR10MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a5e707-9210-48e5-cb7a-08dbb90d361c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/E779gfhRvXSRHWni9aIP1PmfqMD22Na1GgRel2J7+es4XZMSxfWnh82rVoe1EbhH3UxYiuZ0xM4vSvdHpnqQX7QbQ9020xTJBRgKxMa/Exo/jm99Ya1YIazB1rx+gR4Zv/jIYJ3dIxzFvcqRrkihpIMzAGLSc+2yMJJSquSRc3ALNqot7HfIc69gd1SfHnT7U+MpsSEev3KgBzqbNB9jq8nLRefM32jZmpQ5OdG5kCQTy22tY36byuEE4EnV978rMXckkZTBf4PGTXLZSrwaf46BZaahqNCjPrG39Q18pbhbCCvergLGZJu79m1RtuuL1/sxNxL+HnLP4eW0wVRPO5MtfVc9QRZuEDuyw517h2zV0dMlQbLrogM1BbMSSxXpnBzPX1YZA3BPLh6EtlaD2ZtfccD1KGOWy0itb7+wcgFrGUQT447AO3GqiqxSAiqwDkQUM4en/y69/0ImkYIsbimNL0gLEcgaCSwoqtQobc14Eh4ICJR9T/kCCe4vpsaiJsoThyKG+vCbMk6Fpongc8ysT5F6s+TcDWAGLab30ngSm7wLWu/trcgmN/D4o2fR3rWcgKXIP2kSHh+wz4vaUB5wizNpd6KsNrkXj6W+9fDscMOmPPyvBKkzytdzK5zOg1mnkr7+VYil2+Gdea7IYhgCSse6SadUvhdslBU6x9GPU5XNjtk4XPvn+NwSVaZprqGo1gb0dgSl//kuaX6fCisuTxgbqKrfyeXL/3BrjRD5RhjmSNb8ytZImsSoEZdTWCsdL90BfQbNML4oeejxwL5AUda4cz4CQNT0nYFdYalMLqRDYtx4CdtUAqrnYD+hJM9wDNPPLgPwVZ2HYJRg==
X-Forefront-Antispam-Report: CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(2906002)(40460700003)(336012)(5660300002)(426003)(83380400001)(26005)(1076003)(16526019)(2616005)(47076005)(41300700001)(36860700001)(316002)(6916009)(70586007)(54906003)(8936002)(70206006)(8676002)(4326008)(44832011)(45080400002)(6666004)(7696005)(478600001)(966005)(86362001)(356005)(82740400003)(81166007)(82960400001)(40480700001)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 12:37:39.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a5e707-9210-48e5-cb7a-08dbb90d361c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5710
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The clock dividers x 1/1 and x 1/2 might be used with clock stop bit
enabled or not. While this table contains the enabled flavor (STPnHCK == 0).
The version for stopped clock (STPnHCK == 1) is missing. This might
result in warnings like [1] because no valid clock divider is found.
Resulting in a 0 divider.

There are Renesas ARM Trusted Firmware version out there which e.g.
configure 0x201 (shifted logical right by 2: 0x80) and with this match
the added { STPnHCK | 0, 1 }:

https://github.com/renesas-rcar/arm-trusted-firmware/blob/rcar_gen3_v2.3/drivers/renesas/rcar/emmc/emmc_init.c#L108

[1]

------------[ cut here ]------------
sd1h: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:141 divider_recalc_rate+0x48/0x70
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.1.52 #1
Hardware name: Custom board based on r8a7796 (DT)
pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : divider_recalc_rate+0x48/0x70
lr : divider_recalc_rate+0x48/0x70
sp : ffff800008033820
x29: ffff800008033820 x28: 0000000000000000 x27: 0000000000000001
x26: ffff80000894c19f x25: 0000000000000000 x24: ffff800008033958
x23: ffff0004402fc4a8 x22: ffff0004402fc400 x21: ffff0004402f8400
x20: 0000000000000000 x19: 000000002fadcf80 x18: ffff80000875c290
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: fffffffffffc0000 x13: 0a74657320746f6e x12: 204f52455a5f574f
x11: 4c4c415f52454449 x10: 5649445f4b4c4320 x9 : 00080000000000ff
x8 : 0000000000000003 x7 : ffff800008034000 x6 : ffff800008030000
x5 : ffff000440188000 x4 : ffff800008034000 x3 : 0000000000000001
x2 : 2836f9a35ff96400 x1 : 2836f9a35ff96400 x0 : 0000000000000000
Call trace:
 divider_recalc_rate+0x48/0x70
 clk_divider_recalc_rate+0x48/0x50
 __clk_register+0x450/0x5d0
 clk_hw_register+0x28/0x40
 __clk_hw_register_divider+0x148/0x18c
 clk_register_divider_table+0x48/0x60
 cpg_sdh_clk_register+0x88/0xd0
 rcar_gen3_cpg_clk_register+0x168/0x490
 cpg_mssr_register_core_clk+0x16c/0x1c0
 cpg_mssr_probe+0x128/0x280
 platform_probe+0x64/0xb0
 really_probe+0x148/0x278
 __driver_probe_device+0xec/0x104
 driver_probe_device+0x38/0xf0
 __driver_attach+0x4c/0xfc
 bus_for_each_dev+0x78/0xbc
 driver_attach+0x20/0x28
 bus_add_driver+0x17c/0x1d0
 driver_register+0xac/0xe8
 __platform_driver_probe+0x88/0xe0
 cpg_mssr_init+0x20/0x28
 do_one_initcall+0x88/0x1c8
 kernel_init_freeable+0x2b0/0x2b8
 kernel_init+0x20/0x124
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------

Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/clk/renesas/rcar-cpg-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index e2e0447de190..4d6271714755 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -70,8 +70,8 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 #define STPnHCK	BIT(9 - SDnSRCFC_SHIFT)
 
 static const struct clk_div_table cpg_sdh_div_table[] = {
-	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
-	{ STPnHCK | 4, 16 }, { 0, 0 },
+	{ 0, 1 }, { 1, 2 }, { STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },
+	{ STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },
 };
 
 struct clk * __init cpg_sdh_clk_register(const char *name,
-- 
2.28.0

