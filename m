Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFB61ABE57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505019AbgDPKpC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:45:02 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38033 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505339AbgDPKiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:24 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F373A60017;
        Thu, 16 Apr 2020 10:38:04 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 05/20] squash! max9286: convert probe kzalloc
Date:   Thu, 16 Apr 2020 12:40:37 +0200
Message-Id: <20200416104052.2643098-6-jacopo+renesas@jmondi.org>
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

v8:
 - Convert probe kzalloc usage to devm_ variant
---
 drivers/media/i2c/max9286.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index b84d2daa6561..0a43137b8112 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1155,7 +1155,7 @@ static int max9286_probe(struct i2c_client *client)
 	unsigned int i;
 	int ret;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -1232,7 +1232,6 @@ static int max9286_probe(struct i2c_client *client)
 	max9286_configure_i2c(priv, false);
 err_free:
 	max9286_cleanup_dt(priv);
-	kfree(priv);
 
 	return ret;
 }
@@ -1253,8 +1252,6 @@ static int max9286_remove(struct i2c_client *client)
 
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
 
-	kfree(priv);
-
 	return 0;
 }
 
-- 
2.26.0

