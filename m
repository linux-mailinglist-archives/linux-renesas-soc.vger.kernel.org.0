Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1AB10D613
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2019 14:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2N0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Nov 2019 08:26:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36454 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfK2N0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Nov 2019 08:26:49 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E71BD23F;
        Fri, 29 Nov 2019 14:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575034007;
        bh=bHWyJdgi+Lnwg4MyVoc1m04jrSp/ct3qpcBehkDWFkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JUgaYzRUby7PQ0hH5Ski48yPxLjWyPW4pBVjsMZZEWtVEiZVbjykSgOSo3Nilu4XE
         fWfDu/cmAetk1m68xQEjWQ9AnXxISP2k5nR0c7Zh62nrdNoYpzltTPKQvDagcwyFGq
         jZm6CUquX9KWQGSjGckKRnUohhZ6rLfoA2W07Ruw=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] max9286: Improve mux-state readbility [v2]
Date:   Fri, 29 Nov 2019 13:26:43 +0000
Message-Id: <20191129132643.6429-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
References: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The MAX9286 implements an I2C mux which we maintain in an open state
while we are streaming from the cameras.

The development code for the MAX9286 uses an integer value with
arbitrary state values to control these state transitions. This is
highlighted with a FIXME and is difficult to interpret the meaning of the
values 0, 1, 2.

Introduce a new function call max9286_i2c_mux_open() to make it clear
when a component opens all the mux channels, and update the usage
in s_stream() to max9286_i2c_mux_close() the mux on stop stream.

We previously had missed an occasion to sleep after an update to the I2C
Fwd/Rev channels, so all writes to this configuration register are moved
to a helper: max9286_i2c_mux_configure() which guarantees the delay.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 74 ++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 5b8dfa652d50..b34fb31c6db5 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -144,7 +144,7 @@ struct max9286_priv {
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
 	bool poc_enabled;
-	int streaming;
+	int mux_state;
 
 	struct i2c_mux_core *mux;
 	unsigned int mux_channel;
@@ -221,57 +221,59 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
  * I2C Multiplexer
  */
 
-static int max9286_i2c_mux_close(struct max9286_priv *priv)
+enum max9286_i2c_mux_state {
+	MAX9286_MUX_CLOSED = 0,
+	MAX9286_MUX_OPEN,
+};
+
+static void max9286_i2c_mux_configure(struct max9286_priv *priv, u8 conf)
+{
+	max9286_write(priv, 0x0a, conf);
+
+	/*
+	 * We must sleep after any change to the forward or reverse channel
+	 * configuration.
+	 */
+	usleep_range(3000, 5000);
+}
+
+static void max9286_i2c_mux_open(struct max9286_priv *priv)
+{
+	/* Open all channels on the MAX9286 */
+	max9286_i2c_mux_configure(priv, 0xff);
+
+	priv->mux_state = MAX9286_MUX_OPEN;
+}
+
+static void max9286_i2c_mux_close(struct max9286_priv *priv)
 {
-	/* FIXME: See note in max9286_i2c_mux_select() */
-	if (priv->streaming)
-		return 0;
 	/*
 	 * Ensure that both the forward and reverse channel are disabled on the
 	 * mux, and that the channel ID is invalidated to ensure we reconfigure
-	 * on the next select call.
+	 * on the next max9286_i2c_mux_select() call.
 	 */
-	priv->mux_channel = -1;
-	max9286_write(priv, 0x0a, 0x00);
-	usleep_range(3000, 5000);
+	max9286_i2c_mux_configure(priv, 0x00);
 
-	return 0;
+	priv->mux_state = MAX9286_MUX_CLOSED;
+	priv->mux_channel = -1;
 }
 
 static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct max9286_priv *priv = i2c_mux_priv(muxc);
 
-	/*
-	 * FIXME: This state keeping is a hack and do the job. It should
-	 * be should be reworked. One option to consider is that once all
-	 * cameras are programmed the mux selection logic should be disabled
-	 * and all all reverse and forward channels enable all the time.
-	 *
-	 * In any case this logic with a int that have two states should be
-	 * reworked!
-	 */
-	if (priv->streaming == 1) {
-		max9286_write(priv, 0x0a, 0xff);
-		priv->streaming = 2;
-		return 0;
-	} else if (priv->streaming == 2) {
+	/* channel select is disabled when configured in the opened state. */
+	if (priv->mux_state == MAX9286_MUX_OPEN)
 		return 0;
-	}
 
 	if (priv->mux_channel == chan)
 		return 0;
 
 	priv->mux_channel = chan;
 
-	max9286_write(priv, 0x0a,
-		      MAX9286_FWDCCEN(chan) | MAX9286_REVCCEN(chan));
-
-	/*
-	 * We must sleep after any change to the forward or reverse channel
-	 * configuration.
-	 */
-	usleep_range(3000, 5000);
+	max9286_i2c_mux_configure(priv,
+				  MAX9286_FWDCCEN(chan) |
+				  MAX9286_REVCCEN(chan));
 
 	return 0;
 }
@@ -441,8 +443,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		/* FIXME: See note in max9286_i2c_mux_select() */
-		priv->streaming = 1;
+		max9286_i2c_mux_open(priv);
 
 		/* Start all cameras. */
 		for_each_source(priv, source) {
@@ -490,8 +491,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		for_each_source(priv, source)
 			v4l2_subdev_call(source->sd, video, s_stream, 0);
 
-		/* FIXME: See note in max9286_i2c_mux_select() */
-		priv->streaming = 0;
+		max9286_i2c_mux_close(priv);
 	}
 
 	return 0;
-- 
2.20.1

