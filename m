Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D71360376
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 09:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhDOHeR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 03:34:17 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:20708 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230090AbhDOHeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 03:34:17 -0400
Received: from localhost.localdomain (unknown [10.192.139.175])
        by mail-app3 (Coremail) with SMTP id cC_KCgD3LtRT7Hdgs8YnAQ--.20029S4;
        Thu, 15 Apr 2021 15:33:44 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [v3] clk: renesas: rcar-usb2-clock-sel: Fix error handling in rcar_usb2_clock_sel_probe
Date:   Thu, 15 Apr 2021 15:33:38 +0800
Message-Id: <20210415073338.22287-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgD3LtRT7Hdgs8YnAQ--.20029S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4fJr17KFykCFyDKry7GFg_yoW8Kr4Dpw
        18Xa4ftF4jgrZ2ganxtFsrZFyYka43tayjqFZ2gw18u3ZxC3W8Xr1rJFySgasYqrWkA3W3
        X3y2gr4xCFs0vFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
        aVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgwNBlZdtTXCvwAMs-
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The error handling paths after pm_runtime_get_sync() has no
refcount decrement, which leads to refcount leak.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Move the position of pm_runtime_enable,_get_sync().
      Use devm_clk_register() to simplify error handling.

v2: - Use devm_clk_hw_register() instead of devm_clk_register().
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 3abafd78f7c8..a6f82a5a6335 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -131,7 +131,6 @@ static int rcar_usb2_clock_sel_remove(struct platform_device *pdev)
 	struct usb2_clock_sel_priv *priv = platform_get_drvdata(pdev);
 
 	of_clk_del_provider(dev->of_node);
-	clk_hw_unregister(&priv->hw);
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 
@@ -164,9 +163,6 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->rsts))
 		return PTR_ERR(priv->rsts);
 
-	pm_runtime_enable(dev);
-	pm_runtime_get_sync(dev);
-
 	clk = devm_clk_get(dev, "usb_extal");
 	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
 		priv->extal = !!clk_get_rate(clk);
@@ -183,6 +179,8 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
 	platform_set_drvdata(pdev, priv);
 	dev_set_drvdata(dev, priv);
 
@@ -193,11 +191,20 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	init.num_parents = 0;
 	priv->hw.init = &init;
 
-	clk = clk_register(NULL, &priv->hw);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = devm_clk_hw_register(NULL, &priv->hw);
+	if (ret)
+		goto pm_put;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &priv->hw);
+	if (ret)
+		goto pm_put;
+
+	return 0;
 
-	return of_clk_add_hw_provider(np, of_clk_hw_simple_get, &priv->hw);
+pm_put:
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+	return ret;
 }
 
 static const struct dev_pm_ops rcar_usb2_clock_sel_pm_ops = {
-- 
2.17.1

