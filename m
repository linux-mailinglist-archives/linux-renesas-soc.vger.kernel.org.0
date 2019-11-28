Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2B810CCCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 17:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfK1Q1Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Nov 2019 11:27:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK1Q1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Nov 2019 11:27:16 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B8C72D1;
        Thu, 28 Nov 2019 17:27:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574958434;
        bh=3YKlc9fE1ujps2CVkGw5Quc7yeSJQeUwkhWZweS0g4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hkzXvBWtAyn1FbdiZsvZriN4B5DtNLKXXdcR7drPZZZ1EzRlQhwDgd88ap5JOkr6y
         6klZGSlFU6XnAC6oJ82fADz2kClkBCvZTfZK2zjCQXaWKrm/q4tCZckhb9SOBw+0Bx
         eFSxnErZowcnDdyEBgvALb8sqptOtsSwqw5LDhwY=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] max9286: Improve mux-state readbility
Date:   Thu, 28 Nov 2019 16:27:06 +0000
Message-Id: <20191128162706.704-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
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
highlighted ith a FIXME and is difficult to interpret the meaning of the
values 0, 1, 2.

Introduce an enum to declare the intent of each state, and comment the
states accordingly.

This state transition is only needed for the multi-channel support, and
will not be included in the single-channel max9286 posting.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 63 +++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index eed00ff1dee4..a9c3e7411bda 100644
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
@@ -221,16 +221,39 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
  * I2C Multiplexer
  */
 
+enum max9286_i2c_mux_state {
+	/*
+	 * The I2C Mux will enable only a single channel (both forward, and
+	 * reverse) at a time, and to reduce I2C bus bandwidth, it will only
+	 * reconfigure the channel when a write is requested to a different
+	 * channel.
+	 */
+	MAX9286_I2C_MUX_STATE_CHANNEL = 0,
+
+	/*
+	 * The I2C mux will be configured with all ports open. All I2C writes
+	 * will be transmitted to all remote I2C devices, and where multiple
+	 * devices have the same address, the write will be received by all of
+	 * them.
+	 */
+	MAX9286_I2C_MUX_STATE_OPEN,
+
+	/*
+	 * The I2C mux is configured with all ports open.
+	 *
+	 * No reconfiguration of the I2C mux channel select is required.
+	 */
+	MAX9286_I2C_MUX_STATE_DISABLE_SELECT,
+};
+
 static int max9286_i2c_mux_close(struct max9286_priv *priv)
 {
-	/* FIXME: See note in max9286_i2c_mux_select() */
-	if (priv->streaming)
-		return 0;
 	/*
 	 * Ensure that both the forward and reverse channel are disabled on the
-	 * mux, and that the channel ID is invalidated to ensure we reconfigure
-	 * on the next select call.
+	 * mux, and that the channel state and ID is invalidated to ensure we
+	 * reconfigure on the next max9286_i2c_mux_select() call.
 	 */
+	priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
 	priv->mux_channel = -1;
 	max9286_write(priv, 0x0a, 0x00);
 	usleep_range(3000, 5000);
@@ -242,23 +265,19 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
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
+	/* channel select is disabled when configured in the opened state. */
+	if (priv->mux_state == MAX9286_I2C_MUX_STATE_DISABLE_SELECT)
 		return 0;
-	} else if (priv->streaming == 2) {
+
+	if (priv->mux_state == MAX9286_I2C_MUX_STATE_OPEN) {
+		/* Open all channels on the MAX9286 */
+		max9286_write(priv, 0x0a, 0xff);
+		priv->mux_state = MAX9286_I2C_MUX_STATE_DISABLE_SELECT;
 		return 0;
 	}
 
+	/* Handling for MAX9286_I2C_MUX_STATE_CHANNEL */
+
 	if (priv->mux_channel == chan)
 		return 0;
 
@@ -441,8 +460,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		/* FIXME: See note in max9286_i2c_mux_select() */
-		priv->streaming = 1;
+		priv->mux_state = MAX9286_I2C_MUX_STATE_OPEN;
 
 		/* Start all cameras. */
 		for_each_source(priv, source) {
@@ -490,8 +508,7 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 		for_each_source(priv, source)
 			v4l2_subdev_call(source->sd, video, s_stream, 0);
 
-		/* FIXME: See note in max9286_i2c_mux_select() */
-		priv->streaming = 0;
+		priv->mux_state = MAX9286_I2C_MUX_STATE_CHANNEL;
 	}
 
 	return 0;
-- 
2.20.1

