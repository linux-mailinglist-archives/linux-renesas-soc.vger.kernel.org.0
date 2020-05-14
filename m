Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB51D3203
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 16:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENOA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 10:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgENOA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 10:00:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD4EC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 07:00:27 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58908259;
        Thu, 14 May 2020 16:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589464825;
        bh=J3ZQfYkcJE46bE8ljP/9BLvQwPr3k/lXc0GkEtRRRHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NwU18eA8/kvePBpRfrSMYPgrLTK/wujClbD7UQIqevXnzQtu+1IYF0sE17TLuACaU
         hpGjy8LhxeDMrsa2gILRN6WGXYKLX4PZLT3xm94/d1EhS1tg6gyLQrRou0zMeQWDJJ
         Kho3WITRr1UZ/+/PvccOw6jZhppVvhlI6Db2H4Y4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9 3/3] fixes! [max9286]: Fix dev->of_node refcnting
Date:   Thu, 14 May 2020 15:00:16 +0100
Message-Id: <20200514140016.1445489-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

With a little help from an of_ref_read():

+static int of_ref_read(struct device_node *node)
+{
+       if (node)
+               return kref_read(&node->kobj.kref);
+
+       return 0;
+}

I've validated the refcount of the node now stays consitent.
Particularly between entry (A) and exit (B) of the parse_dt function:

[    2.305784] max9286 4-004c: A: node refcnt is 6
[    2.310401] max9286 4-004c: node refcnt is 6
[    2.314729] max9286 4-004c: 1335: node refcnt is 6
[    2.319587] max9286 4-004c: 1356: node refcnt is 6
[    2.324432] max9286 4-004c: 1364: (in for_each) node refcnt is 6
[    2.330503] max9286 4-004c: 1364: (in for_each) node refcnt is 6
[    2.336575] max9286 4-004c: 1364: (in for_each) node refcnt is 6
[    2.342656] max9286 4-004c: 1364: (in for_each) node refcnt is 6
[    2.348724] max9286 4-004c: 1364: (in for_each) node refcnt is 6
[    2.354808] max9286 4-004c: 1437: node refcnt is 6
[    2.359644] max9286 4-004c: B: node refcnt is 6

I've added a comment to explain the extra of_node_get() but the exercise
identified that the driver was incorrectly calling of_node_put() on the
same node. Those have been removed.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 66201dc4b7f7..590f384161a5 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1108,11 +1108,11 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 	struct device_node *node = NULL;
 	unsigned int i2c_mux_mask = 0;
 
+	/* Balance the of_node_put() performed by of_find_node_by_name(). */
 	of_node_get(dev->of_node);
 	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
 	if (!i2c_mux) {
 		dev_err(dev, "Failed to find i2c-mux node\n");
-		of_node_put(dev->of_node);
 		return -EINVAL;
 	}
 
@@ -1160,7 +1160,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					of_fwnode_handle(node), &vep);
 			if (ret) {
 				of_node_put(node);
-				of_node_put(dev->of_node);
 				return ret;
 			}
 
@@ -1170,7 +1169,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 					vep.bus_type);
 				v4l2_fwnode_endpoint_free(&vep);
 				of_node_put(node);
-				of_node_put(dev->of_node);
 				return -EINVAL;
 			}
 
@@ -1208,7 +1206,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 		priv->nsources++;
 	}
 	of_node_put(node);
-	of_node_put(dev->of_node);
 
 	priv->route_mask = priv->source_mask;
 
-- 
2.25.1

