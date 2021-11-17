Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A5F4545F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 12:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbhKQLyU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 06:54:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:30432 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236994AbhKQLyR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 06:54:17 -0500
X-IronPort-AV: E=Sophos;i="5.87,241,1631545200"; 
   d="scan'208";a="100916797"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 20:51:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6AF744006DED;
        Wed, 17 Nov 2021 20:51:16 +0900 (JST)
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
Subject: [PATCH 3/4] clk: renesas: cpg-mssr: Check return value of pm_genpd_init()
Date:   Wed, 17 Nov 2021 11:51:00 +0000
Message-Id: <20211117115101.28281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make sure we check the return value of pm_genpd_init() which might fail.
Also add a devres action to remove the power-domain in-case the probe
callback fails further down in the code flow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 21f762aa2131..f596a6438ac4 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -552,6 +552,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev)
 		pm_clk_destroy(dev);
 }
 
+static void cpg_mssr_genpd_remove(void *data)
+{
+	pm_genpd_remove(data);
+}
+
 static int __init cpg_mssr_add_clk_domain(struct device *dev,
 					  const unsigned int *core_pm_clks,
 					  unsigned int num_core_pm_clks)
@@ -560,6 +565,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 	struct generic_pm_domain *genpd;
 	struct cpg_mssr_clk_domain *pd;
 	size_t pm_size = num_core_pm_clks * sizeof(core_pm_clks[0]);
+	int ret;
 
 	pd = devm_kzalloc(dev, sizeof(*pd) + pm_size, GFP_KERNEL);
 	if (!pd)
@@ -574,7 +580,13 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 		       GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mssr_attach_dev;
 	genpd->detach_dev = cpg_mssr_detach_dev;
-	pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, genpd);
+	if (ret)
+		return ret;
+
 	cpg_mssr_clk_domain = pd;
 
 	of_genpd_add_provider_simple(np, genpd);
-- 
2.17.1

