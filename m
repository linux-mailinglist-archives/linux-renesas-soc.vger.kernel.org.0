Return-Path: <linux-renesas-soc+bounces-23362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8CBF52CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 10:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2314656DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 08:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C8A2EAB7D;
	Tue, 21 Oct 2025 08:07:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3532749D6;
	Tue, 21 Oct 2025 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034050; cv=none; b=RFWGd4lYxfgxSfMNVjSn8lxZtEtA8Y/B5/NUXiPdS7nPIHAH5+sG+SEEe5nmzTN7DKADb5hsifysEefDGF+CdcSW3oTpRSn1JzL0e0sDjdQp/L7nUev5buRHQdY0JSmJ6rrA0nX5pG9pgWKLt8Pj/spMUSlVvlo9ycyOj/tQThs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034050; c=relaxed/simple;
	bh=uov3YlU9mOuzy2FmlphL44IqIYGb+b9pa8YuAVntHM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVpulcZDZo4vfb64ysfCCQgXt+jgh8UZUH9AnB7V9MzGyadf6SmfU2Dj1D9psRs4xYvGsdDl0kDwniUtScDm1UPLlx6qnbgUbyYl8SubFJU8Bm2Bcv0mdJ8xXZLWYo/9lKlzu6QMgMxT0490prJJy/4EvudbDphyIytYd6lOBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: RksKegWRSR2R5GzrZI+NSQ==
X-CSE-MsgGUID: QWizaDllSOKqbB8esf/RBQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Oct 2025 17:07:27 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 47FC04141C94;
	Tue, 21 Oct 2025 17:07:23 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 3/6] rtc: renesas-rtca3: Use OF data for configuration
Date: Tue, 21 Oct 2025 08:07:02 +0000
Message-ID: <20251021080705.18116-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for adding support for the Renesas RZ/V2H SoC RTC IP by making the
driver configuration selectable via OF match data.

For RZ/V2H RTC, the maximum periodic interrupt frequency is 128Hz instead
of 256Hz, so add this info to a SoC-specific struct and retrieve it
during probe.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: none

 drivers/rtc/rtc-renesas-rtca3.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index ab816bdf0d77..90dda04fad33 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -101,6 +101,15 @@ enum rtca3_alrm_set_step {
 	RTCA3_ALRM_SSTEP_INIT = 3,
 };
 
+/**
+ * struct rtca3_of_data - OF data for RTCA3
+ *
+ * @max_periodic_irq_freq: maximum periodic interrupt frequency
+ */
+struct rtca3_of_data {
+	int max_periodic_irq_freq;
+};
+
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
  * @ten_sec: PPB per cycle in 10 seconds adjutment mode
@@ -709,6 +718,7 @@ static void rtca3_action(void *data)
 
 static int rtca3_probe(struct platform_device *pdev)
 {
+	const struct rtca3_of_data *of_data;
 	struct device *dev = &pdev->dev;
 	struct rtca3_priv *priv;
 	struct clk *clk;
@@ -718,6 +728,8 @@ static int rtca3_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	of_data = of_device_get_match_data(dev);
+
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
@@ -772,7 +784,7 @@ static int rtca3_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->rtc_dev);
 
 	priv->rtc_dev->ops = &rtca3_ops;
-	priv->rtc_dev->max_user_freq = 256;
+	priv->rtc_dev->max_user_freq = of_data->max_periodic_irq_freq;
 	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
@@ -875,8 +887,12 @@ static int rtca3_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rtca3_pm_ops, rtca3_suspend, rtca3_resume);
 
+static const struct rtca3_of_data rtca3_of_data = {
+	.max_periodic_irq_freq = 256,
+};
+
 static const struct of_device_id rtca3_of_match[] = {
-	{ .compatible = "renesas,rz-rtca3", },
+	{ .compatible = "renesas,rz-rtca3", .data = &rtca3_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rtca3_of_match);
-- 
2.51.0


