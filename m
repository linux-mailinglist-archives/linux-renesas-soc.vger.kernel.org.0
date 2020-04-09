Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D694C1A33D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDIMMO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDIMMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:13 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5706C144E;
        Thu,  9 Apr 2020 14:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434331;
        bh=7Jtclyfb9VS6qcpjV466UJ/eXAdcguXpmZstAGn2co0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/dAbRrlLQHTRJkHVEVS4icUcPjNqXDkRh5qoyh1QswoQUpGP7UOMKbsQgbzzbjeG
         dssrjJ4eNd7JmwReLy3tX6icr6xXsUAon4lJkTyH1/cxnxPqEWmilSItd+98NEalus
         vrXIDfxqaYnZ/N7jh0FXiBBDLij1nNe9WED0kJ0c=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 07/13] squash! max9286: Move multi-device workarounds out of upstream
Date:   Thu,  9 Apr 2020 13:11:56 +0100
Message-Id: <20200409121202.11130-8-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 - Move multi-device workarounds out of upstream driver
---
 drivers/media/i2c/max9286.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 4656a1027d81..cdebee8a0a22 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -911,12 +911,6 @@ static int max9286_setup(struct max9286_priv *priv)
 	return 0;
 }
 
-static const struct of_device_id max9286_dt_ids[] = {
-	{ .compatible = "maxim,max9286" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, max9286_dt_ids);
-
 static void max9286_gpio_set(struct gpio_chip *chip,
 			     unsigned int offset, int value)
 {
@@ -976,10 +970,6 @@ static int max9286_init(struct device *dev)
 	struct i2c_client *client;
 	int ret;
 
-	/* Skip non-max9286 devices. */
-	if (!dev->of_node || !of_match_node(max9286_dt_ids, dev->of_node))
-		return 0;
-
 	client = to_i2c_client(dev);
 	priv = i2c_get_clientdata(client);
 
@@ -1257,6 +1247,12 @@ static int max9286_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct of_device_id max9286_dt_ids[] = {
+	{ .compatible = "maxim,max9286" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max9286_dt_ids);
+
 static const struct i2c_device_id max9286_id[] = {
 	{ "max9286", 0 },
 	{ }
-- 
2.20.1

