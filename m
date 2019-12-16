Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A16BF12117A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 18:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfLPROY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 12:14:24 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:45823 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLPROX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 12:14:23 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1B70B4000C;
        Mon, 16 Dec 2019 17:14:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC 09/11] media: i2c: max9286: Expand reverse chanenl amplitude
Date:   Mon, 16 Dec 2019 18:16:18 +0100
Message-Id: <20191216171620.372683-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
References: <20191216171620.372683-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Expand commen on the reverse channel amplitude compensation as its
handling differs between RDACM20 and RDACM21. Keep the current
register configuration as it works for both devices.

While at it, add a delay after reverse channel re-configuration as
suggested by the programming guide.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index f75c97ef87a8..e9d3da72a381 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -857,12 +857,28 @@ static int max9286_setup(struct max9286_priv *priv)
 	 *
 	 * - Enable custom reverse channel configuration (through register 0x3f)
 	 *   and set the first pulse length to 35 clock cycles.
-	 * - Increase the reverse channel amplitude to 170mV to accommodate the
-	 *   high threshold enabled by the serializer driver.
+	 * - FIXME: Set the reverse channel amplitude to 70mV ( + 100 for
+	 *   RDACM20)
+	 *
+	 *   The RDACM21 and RDACM20 camera modules this driver has been
+	 *   tested against would need to be handled differently here.
+	 *
+	 *   RDACM20 has an MCU which performs an initial programming, most
+	 *   probably enabling the reverse channel and high-threshold
+	 *   compensation during startup. It needs then to be interoperated
+	 *   with the deserializer reverse channel amplitude already compensated
+	 *   to 170mV (70mV + 100 mV).
+	 *
+	 *   RDACM21 does not need that and reverse channel could have been
+	 *   compensated after all serializers have probed.
+	 *
+	 *   Without this early compensation RDACM20 fails to probe, but RDACM21
+	 *   shows slightly less reliable communications.
 	 */
 	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
 	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
 		      MAX9286_REV_AMP_X);
+	usleep_range(2000, 2500);
 
 	/*
 	 * Enable GMSL links, mask unused ones and autodetect link
-- 
2.24.0

