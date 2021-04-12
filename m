Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA13035C267
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 12:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239181AbhDLJnl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 05:43:41 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41613 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241058AbhDLJgq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:36:46 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id DC0C5200012;
        Mon, 12 Apr 2021 09:34:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 14/17] media: i2c: rdacm20: Check return values
Date:   Mon, 12 Apr 2021 11:34:48 +0200
Message-Id: <20210412093451.14198-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The camera module initialization routine does not check the return
value of a few functions. Fix that.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index f1819bfa165d..e6fed86a3281 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -466,11 +466,16 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
 	 */
-	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
-						MAX9271_I2CSLVTO_1024US |
-						MAX9271_I2CMSTBT_105KBPS);
+	ret = max9271_configure_i2c(&dev->serializer,
+				    MAX9271_I2CSLVSH_469NS_234NS |
+				    MAX9271_I2CSLVTO_1024US |
+				    MAX9271_I2CMSTBT_105KBPS);
+	if (ret)
+		return ret;
 
-	max9271_configure_gmsl_link(&dev->serializer);
+	ret = max9271_configure_gmsl_link(&dev->serializer);
+	if (ret)
+		return ret;
 
 	ret = max9271_verify_id(&dev->serializer);
 	if (ret < 0)
-- 
2.31.1

