Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1221ABE54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505457AbgDPKok (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:44:40 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:58025 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505346AbgDPKiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:38:24 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E20146001A;
        Thu, 16 Apr 2020 10:38:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org
Subject: [v8-rc1 09/20] squash! max9286: Fit max9286_parse_dt print on one line
Date:   Thu, 16 Apr 2020 12:40:41 +0200
Message-Id: <20200416104052.2643098-10-jacopo+renesas@jmondi.org>
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

 - Fit max9286_parse_dt print on one line
---
 drivers/media/i2c/max9286.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 08fd946c25f0..8f7e8928af56 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1061,8 +1061,7 @@ static int max9286_parse_dt(struct max9286_priv *priv)
 			continue;
 
 		if (!of_device_is_available(node)) {
-			dev_dbg(dev, "Skipping disabled I2C bus port %u\n",
-				id);
+			dev_dbg(dev, "Skipping disabled I2C bus port %u\n", id);
 			continue;
 		}
 
-- 
2.26.0

