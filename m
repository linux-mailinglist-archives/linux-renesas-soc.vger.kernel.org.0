Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CB51F551A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 14:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgFJMqh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 08:46:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50566 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728540AbgFJMqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 08:46:37 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E031FDE;
        Wed, 10 Jun 2020 14:46:29 +0200 (CEST)
From:   Kieran Bingham <kieran@ksquared.org.uk>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9.2 5/9] fixes! [max9286]: Remove redundant call
Date:   Wed, 10 Jun 2020 13:46:19 +0100
Message-Id: <20200610124623.51085-6-kieran@bingham.xyz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610124623.51085-1-kieran@bingham.xyz>
References: <20200610124623.51085-1-kieran@bingham.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

v4l2_fwnode_endpoint_free() was being called, however we did not call
v4l2_fwnode_endpoint_alloc_parse() prior which would have performed an
allocation of vep->link_frequencies anyway, so the call to kfree()
becomes a no-op.

Remove the extraneous and redundant call.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e170540a5d72..03514bd27f5c 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1176,7 +1176,6 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 
 			priv->csi2_data_lanes =
 				vep.bus.mipi_csi2.num_data_lanes;
-			v4l2_fwnode_endpoint_free(&vep);
 
 			continue;
 		}
-- 
2.25.1

