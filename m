Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FFC3A7AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Jun 2021 11:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhFOJlp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Jun 2021 05:41:45 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:58414 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231187AbhFOJll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jun 2021 05:41:41 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UcVXEi._1623749971;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UcVXEi._1623749971)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 15 Jun 2021 17:39:35 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     geert+renesas@glider.be
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next 2/2] clk: renesas: fix return value and unused assignment
Date:   Tue, 15 Jun 2021 17:39:30 +0800
Message-Id: <1623749970-38020-2-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently the function returns NULL on error, so exact error code is lost.
This patch changes return convention of the function to use ERR_PTR()
on error instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 1fcea17..5bc7e87 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -183,7 +183,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
 	if (!pll_clk) {
 		clk = ERR_PTR(-ENOMEM);
-		return NULL;
+		return clk;
 	}
 
 	parent_name = __clk_get_name(parent);
-- 
1.8.3.1

