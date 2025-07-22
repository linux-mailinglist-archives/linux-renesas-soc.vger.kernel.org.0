Return-Path: <linux-renesas-soc+bounces-19605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A018B0E094
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 17:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8E03560E3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 15:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DC6265CAC;
	Tue, 22 Jul 2025 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZNH2qLAH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62D25EF89
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198508; cv=none; b=gx7nWSSGmhBmB+EVrkI/GetVtL8HbW84yk/Hs9wbgh3liotJuLvIFV89EtNjHgGBvit9UVe3bwRs/Zo3vwWmGL74+GoOQUW2/IodCMvVj8M0ZOscXjp9FbucuAqt/sd0w6wi8R4ldv5FfPZ0oAIgnyI+zVuT+4AgVc/fpkIiA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198508; c=relaxed/simple;
	bh=UU/YlrKxB/XJPhYESsxQGVWC2+2nRYiGaOeFI6J0OGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jy976CCDd0EQklOYPtzLxxIa9Uo7h5E0kfAKglLQwAH/oymg+kG06DIQG4csT36yyC2rxXS9AUk+7+isASlopvIUAFUhCCrocltHTExcsup77aJL2t70WC+xSFttnk3g60dZF96120kjywUuXRM+A5MRzuL65I9VP9mIqP6ktGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZNH2qLAH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cDl/TzV8jzjaQgaINlzQEa70v82cmXSPmEeYnasBVCc=; b=ZNH2qL
	AH4NCZrk8Tre6cpjRkI/VlYFxL+41/G24fCH7AiHsSMGATEePjVAlk9bK4oAc1Uu
	qzHRbsBL1JrcUd2aKZ+ZSfvnLmctk+ryHG2IjXFEVZ39Bu+9EspsYuyp/5vlDufd
	bGDunYz73ulRL+Sj9xNT3ESQ6vs/RZVfnBJ+n7V/ZQVUhmyLpkn1ZVRhDvXMzeM1
	3GlDYeIFJkxHrlv+Y5Z+3ntLxKlbbSlhjlvSrgvl/ob2kG6o+k44dNaOsUMeWEfA
	/+K6Jf14Ci62IlQeehhdcUD2ichcAVeQao9HokEilMYyoJT5OhRXWX64VyA1eoPU
	8xK7QiuKav/NS/FQ==
Received: (qmail 1374453 invoked from network); 22 Jul 2025 17:34:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 17:34:55 +0200
X-UD-Smtp-Session: l3s3148p1@eI6LVYY6lKggAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 1/4] i3c: Harmonize defines representing specification parameters
Date: Tue, 22 Jul 2025 17:34:39 +0200
Message-ID: <20250722153445.5003-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
References: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before adding new parameters, the old ones need to be fixed to follow a
consistent pattern: I3C_BUS_<PARAM>_<MAX|MIN|TYP>_<UNIT>

Also the entries are sorted to avoid duplications in the future. All
changes were scripted to avoid human errors.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Change since v2:
* new patch

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
index c67922ece617..7b8e7f22f013 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -249,10 +249,11 @@ struct i3c_device {
  */
 #define I3C_BUS_MAX_DEVS		11
 
-#define I3C_BUS_MAX_I3C_SCL_RATE	12900000
-#define I3C_BUS_TYP_I3C_SCL_RATE	12500000
-#define I3C_BUS_I2C_FM_PLUS_SCL_RATE	1000000
-#define I3C_BUS_I2C_FM_SCL_RATE		400000
+/* These values are from the public spec, chapter "Timing specification" */
+#define I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE	1000000
+#define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
+#define I3C_BUS_I3C_SCL_MAX_RATE	12900000
+#define I3C_BUS_I3C_SCL_TYP_RATE	12500000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
 /**
-- 
2.47.2


