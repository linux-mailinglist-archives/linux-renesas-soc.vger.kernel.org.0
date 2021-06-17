Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081923AA8EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 04:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhFQCYT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 22:24:19 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:59382 "EHLO
        out30-56.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230155AbhFQCYT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 22:24:19 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UcfeMjX_1623896529;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UcfeMjX_1623896529)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 17 Jun 2021 10:22:10 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     geert+renesas@glider.be
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next v2] clk: renesas: fix return value and unused assignment
Date:   Thu, 17 Jun 2021 10:22:03 +0800
Message-Id: <1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the function returns NULL on error, so exact error code is lost.
This patch changes return convention of the function to use ERR_PTR()
on error instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

Change in v2:
--simply "return ERR_PTR(-ENOMEM);"

 drivers/clk/renesas/renesas-rzg2l-cpg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 5009b9e..d46fffd 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -182,8 +182,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 
 	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
 	if (!pll_clk) {
-		clk = ERR_PTR(-ENOMEM);
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	parent_name = __clk_get_name(parent);
-- 
1.8.3.1

