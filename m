Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D8F1D3202
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 16:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENOA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 10:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgENOA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 10:00:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65918C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2020 07:00:26 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBC7D26A;
        Thu, 14 May 2020 16:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589464824;
        bh=GPjMv3EGxJluU7KycetZHfc1l6xd1LqgNg93yApJawQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BBTfZht51LGiuEI+hh1bQ/K5ooDwgSL9q5GSwInEqc1wpXSjvelrVkaWcaP8S4wJg
         PLAINWVzEQ1nOTYgfgyGSi+Fijqct5jK0a7aVD/j+Zh4B4al0YJveaU/1M4FA//1Mf
         qaOPAsLskekANE0pPQ6NXSzcApqWaV8+w+dxsGwA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v9 2/3] fixes! [max9286]: Don't provide GPIO names
Date:   Thu, 14 May 2020 15:00:15 +0100
Message-Id: <20200514140016.1445489-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200514140016.1445489-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The GPIO line names are fairly unhelpful, other than describing
them as out lines only ... but otherwise ...

Having multiple gpio devices with the same names reports conflicts.
so lets just remove them.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index c8ca1245df4b..66201dc4b7f7 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1019,11 +1019,6 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	struct gpio_chip *gpio = &priv->gpio;
 	int ret;
 
-	static const char * const names[] = {
-		"GPIO0OUT",
-		"GPIO1OUT",
-	};
-
 	/* Configure the GPIO */
 	gpio->label = dev_name(dev);
 	gpio->parent = dev;
@@ -1034,7 +1029,6 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	gpio->set = max9286_gpio_set;
 	gpio->get = max9286_gpio_get;
 	gpio->can_sleep = true;
-	gpio->names = names;
 
 	/* GPIO values default to high */
 	priv->gpio_state = BIT(0) | BIT(1);
-- 
2.25.1

