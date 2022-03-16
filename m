Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1254DB538
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Mar 2022 16:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357363AbiCPPs3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Mar 2022 11:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357356AbiCPPs3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Mar 2022 11:48:29 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF3C6D39E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Mar 2022 08:47:14 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 90F1B240014;
        Wed, 16 Mar 2022 15:47:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 09/10] media: rcar-csi2: Implement set_routing
Date:   Wed, 16 Mar 2022 16:46:40 +0100
Message-Id: <20220316154641.511667-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
References: <20220316154641.511667-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the set_routing() subdev operation to allow userspace to activate
routes on the R-Car CSI-2 receiver.

Routing for this device is fixed. Validate that the provided route
respects it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 39545e631e42..0f1f667a7aee 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -968,6 +968,42 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	unsigned int i;
+	int ret = 0;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	/*
+	 * Routing is fixed for this device.
+	 *
+	 * Only routes in the form of CSI2:0/x->CSI2:x+1/0 are allowed.
+	 *
+	 * We have anyway to implement set_routing to mark the route as active.
+	 */
+	for (i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+		unsigned int vc = route->sink_stream;
+		unsigned int pad = vc + 1;
+
+		if (route->sink_pad != 0)
+			return -EINVAL;
+
+		if (route->source_pad != pad ||
+		    route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 static int rcsi2_init_cfg(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *state)
 {
@@ -1029,6 +1065,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
+	.set_routing = rcsi2_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
-- 
2.35.1

