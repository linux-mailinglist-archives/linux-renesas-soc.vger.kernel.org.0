Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E07220F6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 16:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgGOOfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 10:35:02 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49345 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbgGOOfB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 10:35:01 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 11AC910000A;
        Wed, 15 Jul 2020 14:34:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6.1 9/9] media: rcar-csi2: Negotiate data lanes number
Date:   Wed, 15 Jul 2020 16:38:20 +0200
Message-Id: <20200715143820.132677-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714135812.55158-10-jacopo+renesas@jmondi.org>
References: <20200714135812.55158-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the newly introduced get_mbus_config() subdevice pad operation to
retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
the number of active data lanes accordingly.

In order to be able to call the remote subdevice operation cache the
index of the remote pad connected to the single CSI-2 input port.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
v6.1 diff to address Niklas' comments:

- s/rcsi2_config_active_lanes()/rcsi2_get_active_lanes()
- s/unsigned int num_lanes = (-1U);/unsigned int num_lanes = UINT_MAX;/
- s/active_lanes/lanes

---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 74 +++++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index c6cc4f473a07..5dac8ea66358 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -364,6 +364,7 @@ struct rcar_csi2 {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *remote;
+	unsigned int remote_pad;

 	struct v4l2_mbus_framefmt mf;

@@ -409,13 +410,14 @@ static void rcsi2_exit_standby(struct rcar_csi2 *priv)
 	reset_control_deassert(priv->rstc);
 }

-static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
+static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
+				unsigned int lanes)
 {
 	unsigned int timeout;

 	/* Wait for the clock and data lanes to enter LP-11 state. */
 	for (timeout = 0; timeout <= 20; timeout++) {
-		const u32 lane_mask = (1 << priv->lanes) - 1;
+		const u32 lane_mask = (1 << lanes) - 1;

 		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
 		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
@@ -447,7 +449,8 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }

-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
+			   unsigned int lanes)
 {
 	struct v4l2_subdev *source;
 	struct v4l2_ctrl *ctrl;
@@ -472,15 +475,63 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
 	 * bps = link_freq * 2
 	 */
 	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
-	do_div(mbps, priv->lanes * 1000000);
+	do_div(mbps, lanes * 1000000);

 	return mbps;
 }

+static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
+				  unsigned int *lanes)
+{
+	struct v4l2_mbus_config mbus_config = { 0 };
+	unsigned int num_lanes = UINT_MAX;
+	int ret;
+
+	*lanes = priv->lanes;
+	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
+			       priv->remote_pad, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(priv->dev, "No remote mbus configuration available\n");
+		return 0;
+	}
+
+	if (ret) {
+		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
+		return ret;
+	}
+
+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(priv->dev, "Unsupported media bus type %u\n",
+			mbus_config.type);
+		return -EINVAL;
+	}
+
+	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
+		num_lanes = 1;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
+		num_lanes = 2;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
+		num_lanes = 3;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
+		num_lanes = 4;
+
+	if (num_lanes > priv->lanes) {
+		dev_err(priv->dev,
+			"Unsupported mbus config: too many data lanes %u\n",
+			num_lanes);
+		return -EINVAL;
+	}
+
+	*lanes = num_lanes;
+
+	return 0;
+}
+
 static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 {
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	unsigned int lanes;
 	unsigned int i;
 	int mbps, ret;

@@ -522,10 +573,18 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 			fld |= FLD_FLD_NUM(1);
 	}

+	/*
+	 * Get the number of active data lanes inspecting the remote mbus
+	 * configuration.
+	 */
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
 	phycnt = PHYCNT_ENABLECLK;
-	phycnt |= (1 << priv->lanes) - 1;
+	phycnt |= (1 << lanes) - 1;

-	mbps = rcsi2_calc_mbps(priv, format->bpp);
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
 	if (mbps < 0)
 		return mbps;

@@ -572,7 +631,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ);
 	rcsi2_write(priv, PHYCNT_REG, phycnt | PHYCNT_SHUTDOWNZ | PHYCNT_RSTZ);

-	ret = rcsi2_wait_phy_start(priv);
+	ret = rcsi2_wait_phy_start(priv, lanes);
 	if (ret)
 		return ret;

@@ -749,6 +808,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 	}

 	priv->remote = subdev;
+	priv->remote_pad = pad;

 	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);

--
2.27.0

