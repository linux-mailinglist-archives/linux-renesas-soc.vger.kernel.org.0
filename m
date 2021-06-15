Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81813A7AEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhFOJlj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 05:41:39 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:42634 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231187AbhFOJli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 05:41:38 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UcVXEi._1623749971;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UcVXEi._1623749971)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 15 Jun 2021 17:39:32 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     geert+renesas@glider.be
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next 1/2] clk: renesas: Remove unneeded semicolon
Date:   Tue, 15 Jun 2021 17:39:29 +0800
Message-Id: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/clk/renesas/renesas-rzg2l-cpg.c:299:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 5009b9e..1fcea17 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -296,7 +296,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 		break;
 	default:
 		goto fail;
-	};
+	}
 
 	if (IS_ERR_OR_NULL(clk))
 		goto fail;
-- 
1.8.3.1

