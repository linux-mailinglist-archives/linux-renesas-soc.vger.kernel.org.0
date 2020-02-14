Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8921A15D440
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 10:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbgBNJBZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 04:01:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33794 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNJBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 04:01:25 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D9E8504;
        Fri, 14 Feb 2020 10:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581670884;
        bh=XFnJcNoFz0APAbEYtvxgM9o71ERg4cBbEU2ebmAhtg0=;
        h=From:To:Cc:Subject:Date:From;
        b=ZwUlNtk64Gxxm8P4JmxzQRhTCIuAkB5wkzkaFa4OiRSJD8Au6JMrDMr6xx9S0iiaR
         Bh/i1cyplm0NHx2Q2vua12pJSO8H7z/ecT7ciXIyiEOPoIGDE39rb9PildSkfjH6J5
         7jhRyw5mpoK80UNF5lGksz+Bhh/PsqgJgbZEGaWA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: i2c: Add driver for RDACM21 camera module (squash!)
Date:   Fri, 14 Feb 2020 09:01:19 +0000
Message-Id: <20200214090120.31507-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rebasing the GMSL work to the latest media/master branch requires fixing up the
RDACM21 to support the updated i2c apis.

 - Use new i2c_new_dummy_device API
---
 drivers/media/i2c/rdacm21.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index d7490371e5c7..229f23432b41 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -291,10 +291,9 @@ static int rdacm21_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	dev->isp = i2c_new_dummy(client->adapter, OV490_I2C_ADDRESS);
-	if (!dev->isp) {
-		return -ENXIO;
-	}
+	dev->isp = i2c_new_dummy_device(client->adapter, OV490_I2C_ADDRESS);
+	if (IS_ERR(dev->isp))
+		return PTR_ERR(dev->isp);
 
 	ret = rdacm21_initialize(dev);
 	if (ret < 0)
-- 
2.20.1

