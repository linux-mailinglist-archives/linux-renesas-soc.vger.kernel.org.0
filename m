Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1E4545F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 12:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbhKQLyP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 06:54:15 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46028 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236973AbhKQLyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 06:54:14 -0500
X-IronPort-AV: E=Sophos;i="5.87,241,1631545200"; 
   d="scan'208";a="100578553"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Nov 2021 20:51:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9D2294006DED;
        Wed, 17 Nov 2021 20:51:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jiri Kosina <trivial@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rzg2l: Check return value of pm_genpd_init()
Date:   Wed, 17 Nov 2021 11:50:58 +0000
Message-Id: <20211117115101.28281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure we check the return value of pm_genpd_init() which might fail.
Also add a devres action to remove the power-domain in-case the probe
callback fails further down in the code flow.

Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9dfee14a33e..b0cffc8b22c0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -851,10 +851,16 @@ static void rzg2l_cpg_detach_dev(struct generic_pm_domain *unused, struct device
 		pm_clk_destroy(dev);
 }
 
+static void rzg2l_cpg_genpd_remove(void *data)
+{
+	pm_genpd_remove(data);
+}
+
 static int __init rzg2l_cpg_add_clk_domain(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct generic_pm_domain *genpd;
+	int ret;
 
 	genpd = devm_kzalloc(dev, sizeof(*genpd), GFP_KERNEL);
 	if (!genpd)
@@ -865,7 +871,13 @@ static int __init rzg2l_cpg_add_clk_domain(struct device *dev)
 		       GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = rzg2l_cpg_attach_dev;
 	genpd->detach_dev = rzg2l_cpg_detach_dev;
-	pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, genpd);
+	if (ret)
+		return ret;
 
 	of_genpd_add_provider_simple(np, genpd);
 	return 0;
-- 
2.17.1

