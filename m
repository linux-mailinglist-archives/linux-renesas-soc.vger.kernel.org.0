Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7BA1603B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Feb 2020 11:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgBPKsf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Feb 2020 05:48:35 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43657 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgBPKse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Feb 2020 05:48:34 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4786060002;
        Sun, 16 Feb 2020 10:48:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 4/6] media: i2c: max9286: Adjust reverse channel amplitude
Date:   Sun, 16 Feb 2020 11:51:03 +0100
Message-Id: <20200216105105.3751688-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
References: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Start with reverse channel amplitude set to 100mV and later increase it
to 170mV to compensate the serializer high threshold.

This allows more reliable communications with RDACM21 camera which have
not been pre-programmed with an already compensated reverse channel
configuration.

Warning: this change breaks operation with pre-programmed RDACM20
camera modules

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v7:
 - new patch required to operate with RDACM21
---
 drivers/media/i2c/max9286.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ed5dcae6b363..dd3bfb3c59b7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -594,10 +594,13 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
 	 *
-	 * - Verify all configuration links are properly detected
+	 * - Increase reverse channel amplitude to 170mV
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
+	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
+		      MAX9286_REV_AMP_X);
+
 	max9286_check_config_link(priv, priv->source_mask);
 
 	/*
@@ -984,12 +987,11 @@ static int max9286_setup(struct max9286_priv *priv)
 	 *
 	 * - Enable custom reverse channel configuration (through register 0x3f)
 	 *   and set the first pulse length to 35 clock cycles.
-	 * - Increase the reverse channel amplitude to 170mV to accommodate the
-	 *   high threshold enabled by the serializer driver.
+	 * - Set reverse channel amplitude to 100mV and increase it later after
+	 *   the serializer high threshold have been increased.
 	 */
 	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
-	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
-		      MAX9286_REV_AMP_X);
+	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(100));
 	usleep_range(2000, 2500);
 
 	/*
-- 
2.25.0

