Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6D42B56F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfE0MeW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:34:22 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37444 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfE0MeW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:34:22 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id HQaM2000h3XaVaC06QaMut; Mon, 27 May 2019 14:34:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEpZ-0001VV-Rp; Mon, 27 May 2019 14:34:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEpZ-0001qZ-QS; Mon, 27 May 2019 14:34:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Remove error messages on out-of-memory conditions
Date:   Mon, 27 May 2019 14:34:20 +0200
Message-Id: <20190527123420.7057-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pm_clk_create() and pm_clk_add_clk() can fail only when running out of
memory.  Hence there is no need to print error messages on failure, as
the memory allocation core already takes care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.3.

 drivers/clk/renesas/renesas-cpg-mssr.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index d1054204f3a75022..082d0bf12ea7f219 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -509,16 +509,12 @@ int cpg_mssr_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 		return PTR_ERR(clk);
 
 	error = pm_clk_create(dev);
-	if (error) {
-		dev_err(dev, "pm_clk_create failed %d\n", error);
+	if (error)
 		goto fail_put;
-	}
 
 	error = pm_clk_add_clk(dev, clk);
-	if (error) {
-		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
+	if (error)
 		goto fail_destroy;
-	}
 
 	return 0;
 
-- 
2.17.1

