Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401AB1ABE51
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505455AbgDPKof (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:44:35 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60255 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505340AbgDPKiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:24 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AD1086001D;
        Thu, 16 Apr 2020 10:38:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 07/20] squash! max9286: cleanup GPIO device registration fail path
Date:   Thu, 16 Apr 2020 12:40:39 +0200
Message-Id: <20200416104052.2643098-8-jacopo+renesas@jmondi.org>
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

 - cleanup GPIO device registration fail path
---
 drivers/media/i2c/max9286.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index cc99740b34c5..d0749c537152 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1185,7 +1185,7 @@ static int max9286_probe(struct i2c_client *client)
 
 	ret = max9286_gpio(priv);
 	if (ret)
-		return ret;
+		goto err_powerdown;
 
 	priv->regulator = regulator_get(&client->dev, "poc");
 	if (IS_ERR(priv->regulator)) {
@@ -1194,8 +1194,7 @@ static int max9286_probe(struct i2c_client *client)
 				"Unable to get PoC regulator (%ld)\n",
 				PTR_ERR(priv->regulator));
 		ret = PTR_ERR(priv->regulator);
-		priv->regulator = NULL;
-		goto err_cleanup_dt;
+		goto err_powerdown;
 	}
 
 	/*
@@ -1232,6 +1231,8 @@ static int max9286_probe(struct i2c_client *client)
 	regulator_put(priv->regulator);
 	max9286_i2c_mux_close(priv);
 	max9286_configure_i2c(priv, false);
+err_powerdown:
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 err_cleanup_dt:
 	max9286_cleanup_dt(priv);
 
-- 
2.26.0

