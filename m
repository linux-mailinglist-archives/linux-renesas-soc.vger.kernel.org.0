Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B25001A33DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 14:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgDIMMQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 08:12:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48748 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDIMMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 08:12:16 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A808DBE;
        Thu,  9 Apr 2020 14:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586434333;
        bh=gP4HZ6h6HVuGUDhI7Agd4PSBXApU2APvsJMz2lusseU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l355kIDbrOXkFDIeqQDbPf4/7kS4Cq63iTBKAOrwqjwSzr9bi5ABiV9wVnLIf3LY+
         YNzgpyXrjUR67eOErsyNihvvQUD2apyiDLn/062vsAxDvh5BcBE7pvO9jCdq/+QF0j
         kDiuNgt6vyUvtSB8CI+Xnp0Vn4e+Svf761SBMRmc=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v8 11/13] squash! max9286: Disable overlap window
Date:   Thu,  9 Apr 2020 13:12:00 +0100
Message-Id: <20200409121202.11130-12-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200409121202.11130-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide a function to control setting of the overlap window, but disable
it by default.

The function will allow the value to be easily updated in the future,
either statically in the code, or via an external control mechanism.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 008a93910300..61178ae363d6 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -118,6 +118,9 @@
 #define MAX9286_REV_FLEN(n)		((n) - 20)
 /* Register 0x49 */
 #define MAX9286_VIDEO_DETECT_MASK	0x0f
+/* Register 0x64 */
+#define MAX9286_ENFSINLAST		BIT(5)
+#define MAX9286_OVLP_WINDOWH_MASK	GENMASK(4, 0)
 /* Register 0x69 */
 #define MAX9286_LFLTBMONMASKED		BIT(7)
 #define MAX9286_LOCKMONMASKED		BIT(6)
@@ -632,6 +635,34 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+/*
+ * The overlap window is a 13 bit value with the low byte in register 0x63 and
+ * the high byte(5bits) stored in the least significant bits of register 0x64.
+ */
+static int max9286_set_overlap_window(struct max9286_priv *priv, u16 window)
+{
+	int ret;
+	u8 val;
+
+	ret = max9286_read(priv, 0x64);
+	if (ret < 0)
+		return -EIO;
+
+	max9286_write(priv, 0x63, window & 0xff);
+
+	/*
+	 * Process the high byte, while preserve existing bits set in 0x64.
+	 * TODO: Convert this all to regmap so we can utilise regmap_update_bits
+	 */
+	window >>= 8;
+	val = ret & ~MAX9286_OVLP_WINDOWH_MASK;
+	val |= window & MAX9286_OVLP_WINDOWH_MASK;
+
+	max9286_write(priv, 0x64, val);
+
+	return 0;
+}
+
 static int max9286_set_pixelrate(struct max9286_priv *priv, s64 rate)
 {
 	if (!priv->pixelrate)
@@ -942,6 +973,17 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
 		      MAX9286_HVSRC_D14);
 
+	/*
+	 * The overlap window seems to provide additional validation by tracking
+	 * the delay between vsync and frame sync, generating an error if the
+	 * delay is bigger than the programmed window, though it's not yet clear
+	 * what value should be set.
+	 *
+	 * As it's an optional value and can be disabled, we do so by setting
+	 * a 0 overlap value.
+	 */
+	max9286_set_overlap_window(priv, 0);
+
 	/*
 	 * Wait for 2ms to allow the link to resynchronize after the
 	 * configuration change.
-- 
2.20.1

