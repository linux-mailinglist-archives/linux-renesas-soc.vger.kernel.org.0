Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A172B571
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfE0MfQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:35:16 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37444 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfE0MfQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:35:16 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id HQbF2000V3XaVaC06QbF75; Mon, 27 May 2019 14:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEqR-0001Vf-Gu; Mon, 27 May 2019 14:35:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEqR-0001sq-Ec; Mon, 27 May 2019 14:35:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: mstp: Remove error messages on out-of-memory conditions
Date:   Mon, 27 May 2019 14:35:14 +0200
Message-Id: <20190527123514.7198-1-geert+renesas@glider.be>
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

 drivers/clk/renesas/clk-mstp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index ebd5cd74ca0733d8..a5e9f9edf04079c7 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -298,16 +298,12 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
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

