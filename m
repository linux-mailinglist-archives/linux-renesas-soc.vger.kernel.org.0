Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F101603B3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Feb 2020 11:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgBPKsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Feb 2020 05:48:36 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:41377 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgBPKsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Feb 2020 05:48:36 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3C01460005;
        Sun, 16 Feb 2020 10:48:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 5/6] media: i2c: max9286: Adjust image format size
Date:   Sun, 16 Feb 2020 11:51:04 +0100
Message-Id: <20200216105105.3751688-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
References: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RDACM21 provides 1280x1080 images. Reflect this in the format reported
by the V4L2 APIs.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
   v7: new patch
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index dd3bfb3c59b7..730ce4fd033e 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -842,7 +842,7 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
 static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->width		= 1280;
-	fmt->height		= 800;
+	fmt->height		= 1080;
 	fmt->code		= MEDIA_BUS_FMT_UYVY8_2X8;
 	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
 	fmt->field		= V4L2_FIELD_NONE;
-- 
2.25.0

