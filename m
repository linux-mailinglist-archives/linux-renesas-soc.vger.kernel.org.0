Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6E73B4974
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFYT5Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:57:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:10513 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229782AbhFYT5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:57:25 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85555130"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1C01140E6204;
        Sat, 26 Jun 2021 04:55:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 01/10] drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
Date:   Fri, 25 Jun 2021 20:54:46 +0100
Message-Id: <20210625195455.3607-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
References: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add multi clock PM support for cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
 * No change.
v1->v2:
 * Added Geert's Rb tag.
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c | 51 ++++++++++++++-----------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 1452881b4123..892392b9e0b2 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -586,42 +586,49 @@ static int rzg2l_cpg_attach_dev(struct generic_pm_domain *unused, struct device
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
+	bool once = true;
 	struct clk *clk;
 	int error;
 	int i = 0;
 
 	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
 					   &clkspec)) {
-		if (rzg2l_cpg_is_pm_clk(&clkspec))
-			goto found;
-
-		of_node_put(clkspec.np);
+		if (rzg2l_cpg_is_pm_clk(&clkspec)) {
+			if (once) {
+				once = false;
+				error = pm_clk_create(dev);
+				if (error) {
+					of_node_put(clkspec.np);
+					goto err;
+				}
+			}
+			clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(clk)) {
+				error = PTR_ERR(clk);
+				goto fail_destroy;
+			}
+
+			error = pm_clk_add_clk(dev, clk);
+			if (error) {
+				dev_err(dev, "pm_clk_add_clk failed %d\n",
+					error);
+				goto fail_put;
+			}
+		} else {
+			of_node_put(clkspec.np);
+		}
 		i++;
 	}
 
 	return 0;
 
-found:
-	clk = of_clk_get_from_provider(&clkspec);
-	of_node_put(clkspec.np);
-
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	error = pm_clk_create(dev);
-	if (error)
-		goto fail_put;
-
-	error = pm_clk_add_clk(dev, clk);
-	if (error)
-		goto fail_destroy;
-
-	return 0;
+fail_put:
+	clk_put(clk);
 
 fail_destroy:
 	pm_clk_destroy(dev);
-fail_put:
-	clk_put(clk);
+err:
 	return error;
 }
 
-- 
2.17.1

