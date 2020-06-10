Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203E81F551B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 14:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgFJMqi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 08:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJMqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21348C03E96B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 05:46:37 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B304BFD2;
        Wed, 10 Jun 2020 14:46:28 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 3/9] fixes! [max9286]: Use single sample per pixel
Date:   Wed, 10 Jun 2020 13:46:17 +0100
Message-Id: <20200610124623.51085-4-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

MBUS formats for a serial bus should be specified as a single sample
point.

This change requires updating user-space test scripts to configure as
1x16 accordingly:

-    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_2X8/1280x800 field:none]"
+    media-ctl -d $mdev -V "'$CSI':$IDX [fmt:UYVY8_1X16/1280x800 field:none]"

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7e59391a5736..807024a9a149 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -684,7 +684,7 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->pad || code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 	return 0;
 }
@@ -720,13 +720,13 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 
 	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
 	switch (format->format.code) {
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-	case MEDIA_BUS_FMT_VYUY8_2X8:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
 		break;
 	default:
-		format->format.code = MEDIA_BUS_FMT_UYVY8_2X8;
+		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
 		break;
 	}
 
@@ -788,7 +788,7 @@ static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->width		= 1280;
 	fmt->height		= 800;
-	fmt->code		= MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
 	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
 	fmt->field		= V4L2_FIELD_NONE;
 	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
-- 
2.25.1

