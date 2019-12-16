Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6E12027C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfLPK3o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfLPK3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:44 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8B5EB1A;
        Mon, 16 Dec 2019 11:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492176;
        bh=iVKHkanYUVKEN78LNrq66HLl46bCSrAtpvh3rdpeH8U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Prs9UIgm0diNFH6oyy2ZCsvR82kgEAKFC8UfvoZM4UWqYvLExgASyUeRa5lqpW5D/
         m563TM0BYPwHk5RrQx1zlFD9mNQ9ROb+YJa3mhyn4HiiN3pX4BNdBAqtNTcgX6nZem
         fy1vrPL6zoZL4IMz8XsaqI3473MpTqiAyidxl8Os=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 11/13] [DNI:DEBUG] media: i2c: max9286: Add max9286_check_config_link()
Date:   Mon, 16 Dec 2019 10:29:28 +0000
Message-Id: <20191216102930.5867-12-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Add extra debug status output.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6e1dfc518e03..057258a3c645 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -502,6 +502,51 @@ static const struct v4l2_async_notifier_operations max9286_notify_ops = {
 	.unbind = max9286_notify_unbind,
 };
 
+/*
+ * max9286_check_config_link() - Detect and wait for configuration links
+ *
+ * Determine if the configuration channel is up and settled for a link.
+ *
+ * Returns 0 for success, -EIO for errors.
+ */
+static int max9286_check_config_link(struct max9286_priv *priv,
+				     unsigned int source_mask)
+{
+	unsigned int i;
+	int ret;
+	const unsigned int max_loops = 1000;
+
+	source_mask &= 0xf;
+	source_mask <<= 4;
+
+	/*
+	 * Make sure requested configuration links are detected.
+	 */
+	for (i = 0; i < max_loops; i++) {
+		ret = max9286_read(priv, 0x49);
+		if (ret < 0)
+			return -EIO;
+
+		if ((ret & source_mask) == source_mask)
+			break;
+
+		usleep_range(350, 500);
+	}
+
+	if (i == max_loops) {
+		dev_err(&priv->client->dev,
+			"Unable to detect configuration links: 0x%02x expected 0x%02x\n",
+			ret, source_mask);
+		return -EIO;
+	}
+
+	dev_err(&priv->client->dev,
+		"Successfully detected configuration links after %u loops: 0x%02x\n",
+		i, ret);
+
+	return 0;
+}
+
 /*
  * max9286_check_video_links() - Make sure video links are detected and locked
  *
@@ -831,6 +876,11 @@ static int max9286_setup(struct max9286_priv *priv)
 	 */
 	usleep_range(2000, 5000);
 
+	/*
+	 * Check to see if the expected configuration links are up.
+	 */
+	max9286_check_config_link(priv, priv->source_mask);
+
 	return 0;
 }
 
-- 
2.20.1

