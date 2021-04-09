Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98B73599A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbhDIJoC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 05:44:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16556 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbhDIJnu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:43:50 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGtS35Wttz19L9v;
        Fri,  9 Apr 2021 17:41:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:25 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] clk: renesas: r8a77970: Use DEFINE_SPINLOCK() for spinlock
Date:   Fri, 9 Apr 2021 17:51:50 +0800
Message-ID: <20210409095150.2294437-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index 0f59c84229a8..7b153c6f299c 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -47,7 +47,7 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static spinlock_t cpg_lock;
+static DEFINE_SPINLOCK(cpg_lock);
 
 static const struct clk_div_table cpg_sd0h_div_table[] = {
 	{  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
@@ -212,8 +212,6 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
 	if (error)
 		return error;
 
-	spin_lock_init(&cpg_lock);
-
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);

