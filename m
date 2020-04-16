Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA701ABE1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505147AbgDPKj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:39:57 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:41661 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505214AbgDPKjA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:39:00 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B275260004;
        Thu, 16 Apr 2020 10:38:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 18/20] squash! max9286: Put of node on error
Date:   Thu, 16 Apr 2020 12:40:50 +0200
Message-Id: <20200416104052.2643098-19-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Put the device of node in case of dt parsing error.

Fixes: 9eed4185c7a0 ("media: i2c: Add MAX9286 driver")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 69e81b879a9b..ccd9041b25e7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1115,6 +1115,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
+		of_node_put(dev->of_node);
 		return -EINVAL;
 	}
 
@@ -1162,6 +1163,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					of_fwnode_handle(node), &vep);
 			if (ret) {
 				of_node_put(node);
+				of_node_put(dev->of_node);
 				return ret;
 			}
 
@@ -1171,6 +1173,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					vep.bus_type);
 				v4l2_fwnode_endpoint_free(&vep);
 				of_node_put(node);
+				of_node_put(dev->of_node);
 				return -EINVAL;
 			}
 
@@ -1208,6 +1211,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		priv->nsources++;
 	}
 	of_node_put(node);
+	of_node_put(dev->of_node);
 
 	priv->route_mask = priv->source_mask;
 
-- 
2.26.0

