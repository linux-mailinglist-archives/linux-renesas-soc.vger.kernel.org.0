Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189ED1A33DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDIMMS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDIMMS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:18 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E407B76;
        Thu,  9 Apr 2020 14:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434334;
        bh=pdHCUgdVl8LkYL5fW7b0d6FhnYAruiXmUZz019Mzh/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DuQxfqE1IhHFU6dNQZkPNeTN+ID9fN4/CgwcRm9whbMjqbpDj847w/qy/De6qKjnb
         H3iP6tfDm9/2rnRIJu3HxA9bCSdwA0EYX4jKRqfB8HuG52DmakpbKRtd+pxpbauQUQ
         YrjfOb+AbPejcv5cqoKdKbRpUcPXgTk3b6ZZpz34=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 13/13] sqaush! max9286: Remove poc_enabled workaround
Date:   Thu,  9 Apr 2020 13:12:02 +0100
Message-Id: <20200409121202.11130-14-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This boolean is a flag used to handle the regulator when our
multi-max9286 workaround is in place.  It shouldn't be in the upstream
driver, and is moved out.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6f114756a1e2..022f4cfaf294 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -152,7 +152,6 @@ struct max9286_priv {
 	struct v4l2_subdev sd;
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
-	bool poc_enabled;
 
 	struct gpio_chip gpio;
 	u8 gpio_state;
@@ -1066,8 +1065,6 @@ static int max9286_init(struct device *dev)
 		return ret;
 	}
 
-	priv->poc_enabled = true;
-
 	ret = max9286_setup(priv);
 	if (ret) {
 		dev_err(dev, "Unable to setup max9286\n");
@@ -1099,7 +1096,6 @@ static int max9286_init(struct device *dev)
 	max9286_v4l2_unregister(priv);
 err_regulator:
 	regulator_disable(priv->regulator);
-	priv->poc_enabled = false;
 
 	return ret;
 }
@@ -1324,8 +1320,7 @@ static int max9286_remove(struct i2c_client *client)
 
 	max9286_v4l2_unregister(priv);
 
-	if (priv->poc_enabled)
-		regulator_disable(priv->regulator);
+	regulator_disable(priv->regulator);
 	regulator_put(priv->regulator);
 
 	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
-- 
2.20.1

