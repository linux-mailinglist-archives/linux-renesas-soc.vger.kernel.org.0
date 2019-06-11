Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E93F3D770
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 22:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405804AbfFKUDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 16:03:55 -0400
Received: from sauhun.de ([88.99.104.3]:53116 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405706AbfFKUDz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 16:03:55 -0400
Received: from localhost (p5486CF73.dip0.t-ipconnect.de [84.134.207.115])
        by pokefinder.org (Postfix) with ESMTPSA id 9BABE2C2761;
        Tue, 11 Jun 2019 22:03:52 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: core: complete HS400 before checking status
Date:   Tue, 11 Jun 2019 22:03:43 +0200
Message-Id: <20190611200343.12343-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We don't have a reproducible error case, yet our BSP team suggested that
the mmc_switch_status() command in mmc_select_hs400() should come after
the callback into the driver completing HS400 setup. It makes sense to
me because we want the status of a fully setup HS400, so it will
increase the reliability of the mmc_switch_status() command.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Fixes: ba6c7ac3a2f4 ("mmc: core: more fine-grained hooks for HS400 tuning")
---

Tested on a Renesas Salvator-XS (R-Car M3N).

Simon, you implemented the callback. What do you think?

 drivers/mmc/core/mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 3e786ba204c3..671bfcceea6a 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -1212,13 +1212,13 @@ static int mmc_select_hs400(struct mmc_card *card)
 	mmc_set_timing(host, MMC_TIMING_MMC_HS400);
 	mmc_set_bus_speed(card);
 
+	if (host->ops->hs400_complete)
+		host->ops->hs400_complete(host);
+
 	err = mmc_switch_status(card);
 	if (err)
 		goto out_err;
 
-	if (host->ops->hs400_complete)
-		host->ops->hs400_complete(host);
-
 	return 0;
 
 out_err:
-- 
2.11.0

