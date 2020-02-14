Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 007CF15D441
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 10:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgBNJB0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 04:01:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgBNJB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 04:01:26 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A64D9559;
        Fri, 14 Feb 2020 10:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581670884;
        bh=USU49e8WY2Zpm0fZiT138xiDwrbWV6LZckXAD/anuyU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MslnslqGE6SuhYSPhqpOc7y5J8i/MqCkPZRKC0IlWLmTRH2mgdeYCGMWMONAcDS8a
         Pf6tCG1kBrT3qWqQsp+ulMWrpwYCHU2c5bdpAKwFY4UQdoL80PyktUSAEUuGbCtyNU
         rDhhDHksL3XDRuqGv0UY2dw/0Zsjrg0kriSObtXg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: i2c: Add RDACM20 driver (squash!)
Date:   Fri, 14 Feb 2020 09:01:20 +0000
Message-Id: <20200214090120.31507-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214090120.31507-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200214090120.31507-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rebasing the GMSL work to the latest media/master branch requires fixing up the
RDACM20 to support the updated i2c apis.

 - Use new i2c_new_dummy_device API

---
 drivers/media/i2c/rdacm20.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 97026ee91898..0cd467378922 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -286,9 +286,10 @@ static int rdacm20_probe(struct i2c_client *client)
 	dev->serializer->client = client;
 
 	/* Create the dummy I2C client for the sensor. */
-	dev->sensor = i2c_new_dummy(client->adapter, OV10635_I2C_ADDRESS);
-	if (!dev->sensor) {
-		ret = -ENXIO;
+	dev->sensor = i2c_new_dummy_device(client->adapter,
+					   OV10635_I2C_ADDRESS);
+	if (IS_ERR(dev->sensor)) {
+		ret = PTR_ERR(dev->sensor);
 		goto error;
 	}
 
-- 
2.20.1

