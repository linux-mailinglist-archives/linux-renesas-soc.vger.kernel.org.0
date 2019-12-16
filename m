Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDE3121173
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfLPROP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:15 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59347 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPROP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:15 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B51C44000D;
        Mon, 16 Dec 2019 17:14:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 01/11] fixup! DNI: Debug
Date:   Mon, 16 Dec 2019 18:16:10 +0100
Message-Id: <20191216171620.372683-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index cb327c030081..ab84f0fa66dc 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -912,7 +912,7 @@ static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct max9286_priv *priv = gpiochip_get_data(chip);
 
 	dev_err(&priv->client->dev,
-		"GPIOSET: Offset %d, Value %d gpio_state = 0x%lx",
+		"GPIOSET: Offset %d, Value %ld gpio_state = 0x%lx",
 		offset, priv->gpio_state & BIT(offset),
 		MAX9286_0X0F_RESERVED | priv->gpio_state);
 
-- 
2.24.0

