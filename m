Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26E71F5518
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 14:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgFJMqf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 08:46:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJMqe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:34 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D1FCFD1;
        Wed, 10 Jun 2020 14:46:28 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 2/9] fixes! [max9286]: Validate link formats
Date:   Wed, 10 Jun 2020 13:46:16 +0100
Message-Id: <20200610124623.51085-3-kieran@bingham.xyz>
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

Disallow setting a format on the source link, but enable link validation
by returning the format of the first bound source when getting the
format of the source pad.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ef824d2b26b8..7e59391a5736 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -711,7 +711,11 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
 
-	if (format->pad >= MAX9286_SRC_PAD)
+	/* TODO:
+	 * Multiplexed Stream Support: Prevent setting the format on the shared
+	 * multiplexed bus.
+	 */
+	if (format->pad == MAX9286_SRC_PAD)
 		return -EINVAL;
 
 	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
@@ -743,11 +747,18 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
+	unsigned int pad = format->pad;
 
-	if (format->pad >= MAX9286_SRC_PAD)
-		return -EINVAL;
+	/* TODO:
+	 * Multiplexed Stream Support: Support link validation by returning the
+	 * format of the first bound link. All links must have the same format,
+	 * as we do not support mixing, and matching of cameras connected to
+	 * the max9286.
+	 */
+	if (pad == MAX9286_SRC_PAD)
+		pad = __ffs(priv->bound_sources);
 
-	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
+	cfg_fmt = max9286_get_pad_format(priv, cfg, pad, format->which);
 	if (!cfg_fmt)
 		return -EINVAL;
 
-- 
2.25.1

