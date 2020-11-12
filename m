Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352202B1237
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 23:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgKLWxL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Nov 2020 17:53:11 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:58880 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgKLWxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Nov 2020 17:53:11 -0500
X-Halon-ID: 8377b8c7-2539-11eb-bcc0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 8377b8c7-2539-11eb-bcc0-005056917f90;
        Thu, 12 Nov 2020 23:50:51 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] rcar-csi2: Do not try to recover after transfer error
Date:   Thu, 12 Nov 2020 23:51:47 +0100
Message-Id: <20201112225147.1672622-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of restarting the R-Car CSI-2 receiver if a transmission error
is detected inform the R-Car VIN driver of the error so it can stop the
whole pipeline and inform user-space. This is done to reflect a updated
usage recommendation in later versions of the datasheet.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 945d2eb8723367f0..a7212ecc46572a3b 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -773,21 +773,19 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
 
 	rcsi2_write(priv, INTERRSTATE_REG, err_status);
 
-	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
-
 	return IRQ_WAKE_THREAD;
 }
 
 static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
 	struct rcar_csi2 *priv = data;
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_EOS,
+	};
 
-	mutex_lock(&priv->lock);
-	rcsi2_stop(priv);
-	usleep_range(1000, 2000);
-	if (rcsi2_start(priv))
-		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
-	mutex_unlock(&priv->lock);
+	dev_err(priv->dev, "Transfer error detected.\n");
+
+	v4l2_subdev_notify_event(&priv->subdev, &event);
 
 	return IRQ_HANDLED;
 }
-- 
2.29.2

