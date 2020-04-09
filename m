Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4202E1A33D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDIMML (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgDIMML (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:11 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8F51DA9;
        Thu,  9 Apr 2020 14:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434329;
        bh=S3luRTSPZAsB8Ytob3I9t3Hd0nDjS9LWobOWyBZXHOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IxWb3HqetRH22DlOh1M2h4MzyVLU6ejiZpTRF0BK83dnGGLAS+ZmIOQRkuogPlJeV
         N/UI5ibunOoM+pHch4Ht9gAzoWj58nNHtG3HYqP0LMJpF0csoYEZrHIH0ecFBSNP+9
         c2ZhQPorgdfwtEhZL5lyz8Lh//9x4fr4TyAW9u/w=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 02/13] squash! max9286: convert probe kzalloc
Date:   Thu,  9 Apr 2020 13:11:51 +0100
Message-Id: <20200409121202.11130-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
2.20.1

