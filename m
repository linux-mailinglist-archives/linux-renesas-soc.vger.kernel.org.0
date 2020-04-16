Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698531ABE56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505325AbgDPKop (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:44:45 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38299 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505102AbgDPKiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:24 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 45AEC60016;
        Thu, 16 Apr 2020 10:38:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 06/20] squash! max9286: Fix cleanup path from GPIO powerdown
Date:   Thu, 16 Apr 2020 12:40:38 +0200
Message-Id: <20200416104052.2643098-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

 - Fix up cleanup path from GPIO PowerDown registration
---
 drivers/media/i2c/max9286.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 0a43137b8112..cc99740b34c5 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1171,8 +1171,10 @@ static int max9286_probe(struct i2c_client *client)
 
 	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
 						   GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_pwdn))
-		return PTR_ERR(priv->gpiod_pwdn);
+	if (IS_ERR(priv->gpiod_pwdn)) {
+		ret = PTR_ERR(priv->gpiod_pwdn);
+		goto err_cleanup_dt;
+	}
 
 	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
@@ -1193,7 +1195,7 @@ static int max9286_probe(struct i2c_client *client)
 				PTR_ERR(priv->regulator));
 		ret = PTR_ERR(priv->regulator);
 		priv->regulator = NULL;
-		goto err_free;
+		goto err_cleanup_dt;
 	}
 
 	/*
@@ -1230,7 +1232,7 @@ static int max9286_probe(struct i2c_client *client)
 	regulator_put(priv->regulator);
 	max9286_i2c_mux_close(priv);
 	max9286_configure_i2c(priv, false);
-err_free:
+err_cleanup_dt:
 	max9286_cleanup_dt(priv);
 
 	return ret;
@@ -1248,10 +1250,10 @@ static int max9286_remove(struct i2c_client *client)
 		regulator_disable(priv->regulator);
 	regulator_put(priv->regulator);
 
-	max9286_cleanup_dt(priv);
-
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 
+	max9286_cleanup_dt(priv);
+
 	return 0;
 }
 
-- 
2.26.0

