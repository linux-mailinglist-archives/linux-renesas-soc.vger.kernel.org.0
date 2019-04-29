Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26772E621
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 17:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbfD2PWM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 11:22:12 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37338 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbfD2PWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 11:22:12 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 6FNA2000J3XaVaC01FNA9p; Mon, 29 Apr 2019 17:22:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL86c-0002Yu-89; Mon, 29 Apr 2019 17:22:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL86c-0005xI-6o; Mon, 29 Apr 2019 17:22:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] sata_rcar: Remove ata_host_alloc() error printing
Date:   Mon, 29 Apr 2019 17:22:09 +0200
Message-Id: <20190429152209.22851-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ata_host_alloc() can only fail due to memory allocation failures.
Hence there is no need to print a message, as the memory allocation core
code already takes care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/ata/sata_rcar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 59b2317acea99e46..3495e1733a8e6756 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -909,7 +909,6 @@ static int sata_rcar_probe(struct platform_device *pdev)
 
 	host = ata_host_alloc(dev, 1);
 	if (!host) {
-		dev_err(dev, "ata_host_alloc failed\n");
 		ret = -ENOMEM;
 		goto err_pm_put;
 	}
-- 
2.17.1

