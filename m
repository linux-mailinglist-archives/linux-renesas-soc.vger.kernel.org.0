Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6DA4159805
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 19:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbgBKSTd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Feb 2020 13:19:33 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:52110 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbgBKSTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Feb 2020 13:19:32 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 1WKV220115USYZQ01WKW7C; Tue, 11 Feb 2020 19:19:30 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0002oL-SM; Tue, 11 Feb 2020 19:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1a89-0003yn-QL; Tue, 11 Feb 2020 19:19:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Gilad Ben-Yossef <gilad@benyossef.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 15/34] crypto: ccree - use of_device_get_match_data()
Date:   Tue, 11 Feb 2020 19:19:09 +0100
Message-Id: <20200211181928.15178-16-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211181928.15178-1-geert+renesas@glider.be>
References: <20200211181928.15178-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If the driver is probed, it means a match was found in
arm_ccree_dev_of_match[].  Hence we can just use the
of_device_get_match_data() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.

 drivers/crypto/ccree/cc_driver.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/ccree/cc_driver.c b/drivers/crypto/ccree/cc_driver.c
index c7e44f212d4b0ac5..e365ede32cc0e6a0 100644
--- a/drivers/crypto/ccree/cc_driver.c
+++ b/drivers/crypto/ccree/cc_driver.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #include "cc_driver.h"
@@ -270,7 +271,6 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	u32 val, hw_rev_pidr, sig_cidr;
 	u64 dma_mask;
 	const struct cc_hw_data *hw_rev;
-	const struct of_device_id *dev_id;
 	struct clk *clk;
 	int irq;
 	int rc = 0;
@@ -279,11 +279,7 @@ static int init_cc_resources(struct platform_device *plat_dev)
 	if (!new_drvdata)
 		return -ENOMEM;
 
-	dev_id = of_match_node(arm_ccree_dev_of_match, np);
-	if (!dev_id)
-		return -ENODEV;
-
-	hw_rev = (struct cc_hw_data *)dev_id->data;
+	hw_rev = of_device_get_match_data(dev);
 	new_drvdata->hw_rev_name = hw_rev->name;
 	new_drvdata->hw_rev = hw_rev->rev;
 	new_drvdata->std_bodies = hw_rev->std_bodies;
-- 
2.17.1

