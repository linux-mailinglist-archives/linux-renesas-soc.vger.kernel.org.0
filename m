Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C265C5F115
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2019 03:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfGDB6a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 21:58:30 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:4597 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727229AbfGDB6a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 21:58:30 -0400
X-Halon-ID: 37709c7c-9dff-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 37709c7c-9dff-11e9-8ab4-005056917a89;
        Thu, 04 Jul 2019 03:58:28 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 4/4] rcar-vin: Always setup controls when opening video device
Date:   Thu,  4 Jul 2019 03:58:17 +0200
Message-Id: <20190704015817.17083-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Now that both Gen2 (device centric) and Gen3 (media device centric)
modes of this driver have controls it make sens to call
v4l2_ctrl_handler_setup() unconditionally when opening the video device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f8b6ec4408b2f5fa..cbf5d8cd6db32d77 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -789,26 +789,26 @@ static int rvin_open(struct file *file)
 	if (ret)
 		goto err_unlock;
 
-	if (vin->info->use_mc) {
+	if (vin->info->use_mc)
 		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
-		if (ret < 0)
-			goto err_open;
-	} else {
-		if (v4l2_fh_is_singular_file(file)) {
-			ret = rvin_power_parallel(vin, true);
-			if (ret < 0)
-				goto err_open;
+	else if (v4l2_fh_is_singular_file(file))
+		ret = rvin_power_parallel(vin, true);
+
+	if (ret < 0)
+		goto err_open;
+
+	ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
+	if (ret)
+		goto err_power;
 
-			ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
-			if (ret)
-				goto err_parallel;
-		}
-	}
 	mutex_unlock(&vin->lock);
 
 	return 0;
-err_parallel:
-	rvin_power_parallel(vin, false);
+err_power:
+	if (vin->info->use_mc)
+		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
+	else if (v4l2_fh_is_singular_file(file))
+		rvin_power_parallel(vin, false);
 err_open:
 	v4l2_fh_release(file);
 err_unlock:
-- 
2.21.0

