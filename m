Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1A51151E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfLFOF0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:05:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOF0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:05:26 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED5E2E5;
        Fri,  6 Dec 2019 15:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575641124;
        bh=6ONuODhEjMzl4kqT+4jamlywuUxfVqkfkFDu+SUHM5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PAW+EXgHiGhq0+FQ9oVA4+WGG8w0j7IRksubi3QpNpOyHwExLsAQ5WiU/ugNwdf5m
         Cp9VaXibgGmjSJI0j1V/zcjnP30NttoPqVL+G/w3pgsyWWJYhiDRB9vSX9vlC01XRA
         /fT7i4o9tU+rahXx73RTKNYgv+7B3kHAf6O7VhrM=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/3] media: i2c: max9286: Remove redundant max9286_i2c_mux_state
Date:   Fri,  6 Dec 2019 14:05:18 +0000
Message-Id: <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While simplifying the i2c-mux state, the states were stored in an enum
(initially there were three).

This has now simplified down to 2 states, open and closed - and can be
represented easily in a bool.

It 'could' also be represented within the mux_channel, but I don't want
to pollute that further than the '-1' value which is already stored in
there to represent no channel selected.

Remove the max9286_i2c_mux_state and replace with a bool mux_open flag,
and move the location within the private struct to be more appropriate.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e5b3f78318db..6ea08fd87811 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -144,10 +144,10 @@ struct max9286_priv {
 	struct media_pad pads[MAX9286_N_PADS];
 	struct regulator *regulator;
 	bool poc_enabled;
-	int mux_state;
 
 	struct i2c_mux_core *mux;
 	unsigned int mux_channel;
+	bool mux_open;
 
 	struct v4l2_ctrl_handler ctrls;
 
@@ -221,11 +221,6 @@ static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
  * I2C Multiplexer
  */
 
-enum max9286_i2c_mux_state {
-	MAX9286_MUX_CLOSED = 0,
-	MAX9286_MUX_OPEN,
-};
-
 static void max9286_i2c_mux_configure(struct max9286_priv *priv, u8 conf)
 {
 	max9286_write(priv, 0x0a, conf);
@@ -242,7 +237,7 @@ static void max9286_i2c_mux_open(struct max9286_priv *priv)
 	/* Open all channels on the MAX9286 */
 	max9286_i2c_mux_configure(priv, 0xff);
 
-	priv->mux_state = MAX9286_MUX_OPEN;
+	priv->mux_open = true;
 }
 
 static void max9286_i2c_mux_close(struct max9286_priv *priv)
@@ -254,7 +249,7 @@ static void max9286_i2c_mux_close(struct max9286_priv *priv)
 	 */
 	max9286_i2c_mux_configure(priv, 0x00);
 
-	priv->mux_state = MAX9286_MUX_CLOSED;
+	priv->mux_open = false;
 	priv->mux_channel = -1;
 }
 
@@ -263,7 +258,7 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
 	struct max9286_priv *priv = i2c_mux_priv(muxc);
 
 	/* Channel select is disabled when configured in the opened state. */
-	if (priv->mux_state == MAX9286_MUX_OPEN)
+	if (priv->mux_open)
 		return 0;
 
 	if (priv->mux_channel == chan)
-- 
2.20.1

