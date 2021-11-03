Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEC24449AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 21:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhKCUsv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 16:48:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:39851 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhKCUsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 16:48:51 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BF54C200008;
        Wed,  3 Nov 2021 20:46:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] media: max9271: Ignore busy loop read errors
Date:   Wed,  3 Nov 2021 21:46:54 +0100
Message-Id: <20211103204654.223699-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Valid pixel clock detection is performed by spinning on a register read,
which if repeated too frequently might fail. As the error is not fatal
ignore it instead of bailing out to continue spinning until the timeout
completion.

Also relax the time between bus transactions and slightly increase the
wait interval to mitigate the failure risk.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index aa9ab6831574..5c4248de64c2 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
 /*
  * max9271_pclk_detect() - Detect valid pixel clock from image sensor
  *
- * Wait up to 10ms for a valid pixel clock.
+ * Wait up to 15ms for a valid pixel clock.
  *
  * Returns 0 for success, < 0 for pixel clock not properly detected
  */
@@ -64,15 +64,15 @@ static int max9271_pclk_detect(struct max9271_device *dev)
 	unsigned int i;
 	int ret;

-	for (i = 0; i < 100; i++) {
+	for (i = 0; i < 10; i++) {
 		ret = max9271_read(dev, 0x15);
 		if (ret < 0)
-			return ret;
+			continue;

 		if (ret & MAX9271_PCLKDET)
 			return 0;

-		usleep_range(50, 100);
+		usleep_range(1000, 1500);
 	}

 	dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
--
2.33.1

