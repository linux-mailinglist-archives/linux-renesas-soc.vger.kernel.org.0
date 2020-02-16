Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150B31603B0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Feb 2020 11:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBPKsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Feb 2020 05:48:32 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33843 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgBPKsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Feb 2020 05:48:32 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C111A60005;
        Sun, 16 Feb 2020 10:48:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 1/6] media: i2c: max9286: Disable overlap window
Date:   Sun, 16 Feb 2020 11:51:00 +0100
Message-Id: <20200216105105.3751688-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
References: <20200216105105.3751688-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Disable the overlap window. This settings is briefly documented in the
chip manual, but it probably concur in the frame syncronization timing
calculations.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
v7:
  - new patch required to capture from RDACM21
---
 drivers/media/i2c/max9286.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index b5b8d4919c78..ed5dcae6b363 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1015,6 +1015,10 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
 		      MAX9286_FSYNCMETH_AUTO);
 
+	/* Disable overlap window. */
+	max9286_write(priv, 0x63, 0);
+	max9286_write(priv, 0x64, 0);
+
 	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
 	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
 		      MAX9286_HVSRC_D14);
-- 
2.25.0

