Return-Path: <linux-renesas-soc+bounces-19613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B064FB0E3E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 21:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D09EC566CA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 19:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D492836B0;
	Tue, 22 Jul 2025 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hbOMrgzd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277B27FD5B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211284; cv=none; b=Q7DRRoOHPGK1XECrsrpvjx8C3m7rzpjeUjXHbx/5AhMMfnmZOVkYIZLXK2d094qNHKBNa07my8/KFLn4nHnW1zmlE5yis7ro1uSzBMwcBiajdoKh7gb+nYG4QB+ZVq/ybyn7lkSq1DvEUQq+w0xyR0uCOASxP3qpxBe/SLiMdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211284; c=relaxed/simple;
	bh=bFPGY0fyCavn3cCLv3K90igTCYqOPD47/83WxbHvJQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tY4PXFu+BSWTCqXGH9liVzfejaN7OdYDyo1o33/ibCYWahTrli1OF+tOVXeAAjsPoAluw02wUuRu8eaicPfzWAfbGINDJfbO1knSMhBbcZ4T9SmZUXrmpB9foqvJYhpaDD69HCamIGJHppXGGh0ys6AVEzLUa+G143yg5GavbEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hbOMrgzd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=MrYnKem5kBdDFJRMSEYYExcoB2hFdEsaJsl6kGez6Zo=; b=hbOMrg
	zdgZdgkYbyOhURXpdHYbl2dTOTjKP/S6z8jdkeRHvOQ62At1nec9HGZMxDh5rtn4
	LdMBzM9qxuZNFJhX2FJfNL8HY+MX/P7NGtZCxEXImEF+p2CT/xwHYxVbN0ZRDklr
	aqY/Sig9npDrK0UcGtUE+8PYxS9xpUK25ZY38+oncUQS8QFxv0dMol04g7Y1wjpp
	gxgzv5fLsMTYMvoQo9u8zvgzXy9JwTELmABo+3VNa2HnDEZxH4BUk0KXDZeDt+vt
	dR8hun6pMNGAl9SR9mvVzi4xX4l8QTL8jIekoYepHcSh2UnDYVaoo4kwwG+RVk2P
	QP7aUk7r5XqVx3yA==
Received: (qmail 1427044 invoked from network); 22 Jul 2025 21:08:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 21:08:00 +0200
X-UD-Smtp-Session: l3s3148p1@ag2LT4k6gKIgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v4 1/4] i3c: Standardize defines for specification parameters
Date: Tue, 22 Jul 2025 21:07:43 +0200
Message-ID: <20250722190749.6264-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
References: <20250722190749.6264-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align existing defines to follow the consistent pattern:
I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>. Prepare the codebase for adding
new parameters and help avoid duplication.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v3:
* Reworded commit message
* added version of spec and chapter number to the comment

I added the chapter number to the main comment because it is applicable
for all the values here and the next patch. I thought it doesn't make
sense to repeat it all over for each value.

 drivers/i3c/master.c               | 12 ++++++------
 drivers/i3c/master/dw-i3c-master.c |  4 ++--
 include/linux/i3c/master.h         |  9 +++++----
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index ffb734d378e2..6a2594dc29e6 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -728,12 +728,12 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 	switch (i3cbus->mode) {
 	case I3C_BUS_MODE_PURE:
 		if (!i3cbus->scl_rate.i3c)
-			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
+			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
 		break;
 	case I3C_BUS_MODE_MIXED_FAST:
 	case I3C_BUS_MODE_MIXED_LIMITED:
 		if (!i3cbus->scl_rate.i3c)
-			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
+			i3cbus->scl_rate.i3c = I3C_BUS_I3C_SCL_TYP_RATE;
 		if (!i3cbus->scl_rate.i2c)
 			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
 		break;
@@ -755,8 +755,8 @@ static int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
 	 * I3C/I2C frequency may have been overridden, check that user-provided
 	 * values are not exceeding max possible frequency.
 	 */
-	if (i3cbus->scl_rate.i3c > I3C_BUS_MAX_I3C_SCL_RATE ||
-	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_RATE)
+	if (i3cbus->scl_rate.i3c > I3C_BUS_I3C_SCL_MAX_RATE ||
+	    i3cbus->scl_rate.i2c > I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE)
 		return -EINVAL;
 
 	return 0;
@@ -2786,7 +2786,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary)
 {
-	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
+	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
 	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
 	struct i2c_dev_boardinfo *i2cbi;
@@ -2845,7 +2845,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 		}
 
 		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
-			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
+			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_MAX_RATE;
 	}
 
 	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 91429d94a866..dc234efa046d 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -622,14 +622,14 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	core_period = DIV_ROUND_UP(1000000000, core_rate);
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FMP_TLOW_MIN_NS, core_period);
-	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_RATE) - lcnt;
+	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE) - lcnt;
 	scl_timing = SCL_I2C_FMP_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FMP_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FMP_TIMING);
 	master->i2c_fmp_timing = scl_timing;
 
 	lcnt = DIV_ROUND_UP(I3C_BUS_I2C_FM_TLOW_MIN_NS, core_period);
-	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_RATE) - lcnt;
+	hcnt = DIV_ROUND_UP(core_rate, I3C_BUS_I2C_FM_SCL_MAX_RATE) - lcnt;
 	scl_timing = SCL_I2C_FM_TIMING_HCNT(hcnt) |
 		     SCL_I2C_FM_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I2C_FM_TIMING);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c67922ece617..7dfcbe530515 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -249,10 +249,11 @@ struct i3c_device {
  */
 #define I3C_BUS_MAX_DEVS		11
 
-#define I3C_BUS_MAX_I3C_SCL_RATE	12900000
-#define I3C_BUS_TYP_I3C_SCL_RATE	12500000
-#define I3C_BUS_I2C_FM_PLUS_SCL_RATE	1000000
-#define I3C_BUS_I2C_FM_SCL_RATE		400000
+/* Taken from the I3C Spec V1.1.1, chapter 6.2. "Timing specification" */
+#define I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE	1000000
+#define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
+#define I3C_BUS_I3C_SCL_MAX_RATE	12900000
+#define I3C_BUS_I3C_SCL_TYP_RATE	12500000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
 /**
-- 
2.47.2


