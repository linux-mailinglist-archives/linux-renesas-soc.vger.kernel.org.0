Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E391ABE22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505384AbgDPKkK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:40:10 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37127 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505347AbgDPKiZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 308B26001C;
        Thu, 16 Apr 2020 10:38:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 11/20] squash! max9286: Remove I2C mod-table
Date:   Thu, 16 Apr 2020 12:40:43 +0200
Message-Id: <20200416104052.2643098-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

'Technically' this table is still required for module autoloading, until
some solution such as [0] is merged:

[0] [PATCH RFC] modpost: Support I2C Aliases from OF tables

https://lore.kernel.org/lkml/20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com/

However in practice, I think the only restriction that gets lost is
device instantiation from sysfs, which wouldn't really work for this
driver anyway, because it requires a description of connected endpoints.

So - it should be quite safe to drop it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 3fd70ddbcce8..84173b8c2706 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1252,12 +1252,6 @@ static const struct of_device_id max9286_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, max9286_dt_ids);
 
-static const struct i2c_device_id max9286_id[] = {
-	{ "max9286", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, max9286_id);
-
 static struct i2c_driver max9286_i2c_driver = {
 	.driver	= {
 		.name		= "max9286",
@@ -1265,7 +1259,6 @@ static struct i2c_driver max9286_i2c_driver = {
 	},
 	.probe_new	= max9286_probe,
 	.remove		= max9286_remove,
-	.id_table	= max9286_id,
 };
 
 module_i2c_driver(max9286_i2c_driver);
-- 
2.26.0

