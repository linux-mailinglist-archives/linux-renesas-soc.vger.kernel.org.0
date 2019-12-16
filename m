Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3036112027E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfLPK3p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfLPK3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:45 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C76F13CB;
        Mon, 16 Dec 2019 11:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492177;
        bh=+t6mDqnzHaaK1agWF9IfwPifCVytBgh+BqoIKAH1MAU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AcrfBZFPjEFilOM4kcYqKZGPTaXvb6BPGEH0kBMQ/0NNFipLXUigG3MnMYN4CZfbH
         ZXuhkqL/rBFzh68np7nZ1yzROHZcKgeYjuzJS1vDGJcl184DrWlmg2slDboeLprh8G
         FC458AXDPZFSHIySyvh65OgecgxEQawO5WVs0rRQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 12/13] media: i2c: max9286: [Workaround] Hard delay while waiting to enable the V3M cameras
Date:   Mon, 16 Dec 2019 10:29:29 +0000
Message-Id: <20191216102930.5867-13-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The camera's power regulator is connected to a GPIO on the max9286.
Unfortunately this causes us a circular dependency on the regulator
needing the gpio_chip before the max9286 has probed.

Until we can get the regulator framework to create the regulator device
on demand (at the time of regulator_get(), the gpio_chip is available)
we need to force the gpio line with a gpio-hog, and handle the delay
required with a manual sleep.

This is specific to the Eagle-V3M.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 057258a3c645..090b6c0f81e9 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -964,6 +964,20 @@ static int max9286_init(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * Regulator Workaround:
+	 *
+	 * We must sleep at least 8 seconds to let the cameras power and
+	 * complete their bootstrapping process. This should be handled by the
+	 * call to regulator_enable, but alas on V3M we end up in a circular
+	 * dependency due to the regulator being connected to our own gpio_chip
+	 *
+	 * This sleep is a temporary work-around and should be removed, which
+	 * ensures enough time has passed from the gpio_chip enabling a
+	 * gpio-hog before we enable any reverse channels within max9286_setup.
+	 */
+	usleep_range(8000000, 9000000);
+
 	priv->poc_enabled = true;
 
 	ret = max9286_setup(priv);
-- 
2.20.1

