Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB2D3EE746
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 09:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234762AbhHQHfZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 03:35:25 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:60157 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234669AbhHQHfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 03:35:24 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 0958FCD8F2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Aug 2021 07:27:00 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CBB20FF811;
        Tue, 17 Aug 2021 07:26:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC 4/5] media: i2c: max9286: Fetch PIXEL_RATE in s_stream
Date:   Tue, 17 Aug 2021 09:27:02 +0200
Message-Id: <20210817072703.1167-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The max9286 driver needs to fetch the remote serializer PIXEL_RATE
control value in order to compute its own one, as the sum of the
values reported by the connected subdevices.

Currently the control is verified to be present at notifier's bound
time, which requires the serializer driver to register the control at
probe time. As the serializer driver might need to register the control
later, by adding the control handler of its connected sensor, post-pone
the max9286 check for the control availability at start stream time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 1b92d18a1f94..98fc90339a9e 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -595,7 +595,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	max9286_check_config_link(priv, priv->source_mask);
 	max9286_configure_i2c(priv, false);
 
-	return max9286_set_pixelrate(priv);
+	return 0;
 }
 
 static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -674,6 +674,10 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		ret = max9286_set_pixelrate(priv);
+		if (ret)
+			return ret;
+
 		/*
 		 * The frame sync between cameras is transmitted across the
 		 * reverse channel as GPIO. We must open all channels while
-- 
2.32.0

