Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65921A33D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgDIMMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDIMMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:10 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32794DBE;
        Thu,  9 Apr 2020 14:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434329;
        bh=eoU4wi2UcnR4EjSywD/5ytmeVzkX0RAn9+pPmDPwfls=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BHZWZ7iworvkt2pK3yMKWJuWt7SnjRRe1FCN1c7GWIqFJDmGdQajNDx7AGHd76wAD
         tx6j5kS1kP19TKHfpqpZ4qig6tcJn/QkxX5iKs5s+cx9oFO/W2eFLtGgMenctF8APc
         4hKU9BCqHHT9P9SMd+akwjkpBGDg78L4VO28R+EY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 03/13] squash! max9286: Fix cleanup path from GPIO powerdown
Date:   Thu,  9 Apr 2020 13:11:52 +0100
Message-Id: <20200409121202.11130-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
2.20.1

