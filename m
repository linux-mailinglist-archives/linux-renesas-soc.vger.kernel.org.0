Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040284545F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 12:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237003AbhKQLyW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 06:54:22 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:30432 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237010AbhKQLyT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 06:54:19 -0500
X-IronPort-AV: E=Sophos;i="5.87,241,1631545200"; 
   d="scan'208";a="100916803"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 20:51:20 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CE81D4006DED;
        Wed, 17 Nov 2021 20:51:18 +0900 (JST)
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
Subject: [PATCH 4/4] clk: renesas: cpg-mssr: propagate return value of_genpd_add_provider_simple()
Date:   Wed, 17 Nov 2021 11:51:01 +0000
Message-Id: <20211117115101.28281-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

of_genpd_add_provider_simple() might fail, this patch makes sure we check
the return value of of_genpd_add_provider_simple() by propagating the
return value to the caller of cpg_mssr_add_clk_domain().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f596a6438ac4..dde0693d2f3c 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -589,8 +589,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 
 	cpg_mssr_clk_domain = pd;
 
-	of_genpd_add_provider_simple(np, genpd);
-	return 0;
+	return of_genpd_add_provider_simple(np, genpd);
 }
 
 #ifdef CONFIG_RESET_CONTROLLER
-- 
2.17.1

