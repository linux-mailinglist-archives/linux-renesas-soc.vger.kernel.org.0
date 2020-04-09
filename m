Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFC361A33D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgDIMMM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:11 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B094E12F4;
        Thu,  9 Apr 2020 14:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434330;
        bh=xUCZkRKcSbIO0Lks2uwsKQj3NHo/YccCIwEjdM2ogcs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JEJ82y2vVV3RszxfDPwYI28q046/bQdZzUYRZO19BLHUfHs3+4aNIo8F7Dp13piH1
         mY6bjtgZkfrkq3vX1854BMYNYDdP1QD+HuUIgFNhqQjJTCL236xAStXCWd6CnGQpli
         d+smJkRygzGgRMcsUbKwFWbt4pSfFNEsLW3dQP5s=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 04/13] squash! max9286: cleanup GPIO device registration fail path
Date:   Thu,  9 Apr 2020 13:11:53 +0100
Message-Id: <20200409121202.11130-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
2.20.1

