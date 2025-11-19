Return-Path: <linux-renesas-soc+bounces-24787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A173C6E5EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 218704E2C4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1940735770D;
	Wed, 19 Nov 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bCGqh6G7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E383254B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553868; cv=none; b=umckwnnwmAszYgcj5EBG6KnHfa46WGuOespgQDcQYA4vURf0Zlded0mt553ncJ8MoM66Sv4n6J0+forhoUYr+S9o4mD/niMBygc5ppU8EeNuAdp+KPXm5WoLb+s9p6/6VrpFI9RsRsja2v5pfVTN0T+0lFld8WtlU7Y6yHKoo+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553868; c=relaxed/simple;
	bh=ScX7aNG3Yn6BF5Fit9YEuAm9dWTD7Qc+POSQ7oChQKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7MCcAZd7ah0RA2JbxyUtHi/5GwiiegNd+PUvvUW20FveAQGSablWxJv6/OLFplywD5ZmecgR4UfiDxuuFcHA3tzZXcMUbS9WIW6Bu4iLL85bTg6TGvQ6XLAek3+gh+8JAl2tyexgGtkhctq01iX0sAXTxB9OcG/RLNAzU1hdHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bCGqh6G7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47778b23f64so44607715e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763553864; x=1764158664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kwbvw6xT/0cK8yOWBaAQdvYuRJNVtp1fhMHHc54Yto=;
        b=bCGqh6G7jFwUVEg4IJtAgHkD4cSK6pZ2zImN6F20DkZ9LUMDcB10nUqlF9abGVVwVD
         APXiPqKSMVyi+636Rl0mTa5NiTWgwu7qblyyLG3EIgZcRKTziGQjmS8nzSx8s/trQIHp
         doZEa+kcT0yKcS3ANhp8cHzZWKNZ9WmDhH80nZZ3NBp91efGxrs8PWNFL8uRdoqrdyUf
         nOO/phxIY/ESGsIvuGdbTQ7+ixoctZWDearKyFEfe1LujQbIH+YnZq2Uar3SmlpPyvCg
         RPy9kc5oXIxOr8SHXW/qvZe5MSr2X2OgACtvO+hgOfQyTiPjVGCUoHctuTbLUCVa7iVE
         cJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553864; x=1764158664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7kwbvw6xT/0cK8yOWBaAQdvYuRJNVtp1fhMHHc54Yto=;
        b=Qxw6X4oUOiUWRI+lWmKcpZBE5JlBds9yFcwnYy2GPZdZxFfNZf1JOSPsLhPjqBYD9A
         e6TQA4mRVWCPdjCUvuLQ02vvKqKGmafz+Y8RpVLk+RYhncpl6JhXibC3aNqjm4XCEuwE
         V2g+RjZ6gRiLrumln4i3kuY6wS9bx5vQ3pp1zSN4S8ybZcLFyhlQwSs2h1YAgY+ejiB1
         NkQnsX06pyfZxljskbzJzlRxSgJYf8mEqxswBuWI+KbyghW9DZV2YUsa7zV4Cv+wNsco
         L1NGn9g8egoz94OZytR1KDiHvNdjE/cgLjRmKfPIM70XIVGyiPE/crMu7vX3i33wkL0f
         c/dA==
X-Forwarded-Encrypted: i=1; AJvYcCVfomv6LtToo1YsE8+A5ZY+NE9FGlEvXT81HgvWI/aOFkfZQW7Or6t3rpaNMtvEJqzfYGZxA6aPoqBDJSpJ0KHgxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyudzXN4wt1Ikdmc5Q2bv20BjiN01+yob+ZGWvJjLCV9cqFvbNm
	D9CsKVBE7eVo1JFMhccazixY4aHCgMePfS+iysCHtdRZsz5JFQRDMSBIlysZY+4aBak=
X-Gm-Gg: ASbGncs/cmxIt/tpPn99u7CwDr8gMOkn804IJHeXQLsBRaFz0yluWia2IPJrwzDo+Hi
	jHbSq0OPWCd5kgFtvVk/O/s1W2TKLDGH18Noo3L1ZOhJIOsEu08441SgOQ8hd7trnDT+Esmw42l
	E+DfCewbY+59GoXh6yaZVh4wK1X1rwFDlfWyRwOSSnqnARzxmLPKlolYnMF+N7xC+2NzetT2S3B
	8cVdo1KfsZtQUTuN2U3VUs6WcinZnpCP4WW/4EXBpiXnZFxrEF85Hk0/PqB1uAS2ovqe49977GR
	IttrXBFWFoW4+RPs1AncADvBOmpyVkHxXH7pnRz5SLptAzIrtWzh3cmxO/j79CXvWsHGEfG+CND
	iPfYDwYUwn0cs55TQijccLZO4DRZyRVt5b11r3cFTdU4GIFILb770EG8B3/fDZUTAK+D6NR3SV/
	vYIlOsL05+pv52luaUID4/BiQHhqmDSXEGls9rCEeTaeHMm6htj+Xm1JhshV9KBg==
X-Google-Smtp-Source: AGHT+IEmXDrq9U/gnjMPnQaZ2zqrfwsQlLLhP0qnBZZKkxXXUtOmxvmAkh4F6KqAQGo+GJlfdl6iXA==
X-Received: by 2002:a05:600c:8b4b:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-4778fe50df1mr184268975e9.2.1763553864413;
        Wed, 19 Nov 2025 04:04:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm38431132f8f.42.2025.11.19.04.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:04:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/2] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
Date: Wed, 19 Nov 2025 14:04:18 +0200
Message-ID: <20251119120418.686224-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251119120418.686224-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S supports a power saving mode where power to most of the
SoC components is turned off. The USB PHY is among these components.
Because of this the settings applied in driver probe need to be executed
also on resume path. On suspend path only reset signal need to be asserted.
Add suspend/resume support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- dropped the changes that were integrated in patch 1/2

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 57 +++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b9d5bb52e02c..3c063e4dea41 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -132,6 +132,7 @@ struct rcar_gen3_chan {
 	struct device *dev;	/* platform_device's device */
 	const struct rcar_gen3_phy_drv_data *phy_data;
 	struct extcon_dev *extcon;
+	struct reset_control *rstc;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct work_struct work;
@@ -778,38 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
-	struct reset_control *rstc;
 	int ret;
 	u32 val;
 
 	if (!channel->phy_data->init_bus)
 		return 0;
 
-	rstc = devm_reset_control_array_get_shared(dev);
-	if (IS_ERR(rstc))
-		return PTR_ERR(rstc);
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(rstc);
-	if (ret)
-		goto rpm_put;
-
-	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
-	if (ret)
-		goto rpm_put;
-
 	val = readl(channel->base + USB2_AHB_BUS_CTR);
 	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
 	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
 	writel(val, channel->base + USB2_AHB_BUS_CTR);
 
-rpm_put:
 	pm_runtime_put(dev);
 
-	return ret;
+	return 0;
 }
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
@@ -849,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	channel->rstc = devm_reset_control_array_get_optional_shared(dev);
+	if (IS_ERR(channel->rstc))
+		return PTR_ERR(channel->rstc);
+
+	ret = reset_control_deassert(channel->rstc);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel->rstc);
+	if (ret)
+		return ret;
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
@@ -937,10 +936,38 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 };
 
+static int rcar_gen3_phy_usb2_suspend(struct device *dev)
+{
+	struct rcar_gen3_chan *channel = dev_get_drvdata(dev);
+
+	return reset_control_assert(channel->rstc);
+}
+
+static int rcar_gen3_phy_usb2_resume(struct device *dev)
+{
+	struct rcar_gen3_chan *channel = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(channel->rstc);
+	if (ret)
+		return ret;
+
+	ret = rcar_gen3_phy_usb2_init_bus(channel);
+	if (ret)
+		reset_control_assert(channel->rstc);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rcar_gen3_phy_usb2_pm_ops,
+				rcar_gen3_phy_usb2_suspend,
+				rcar_gen3_phy_usb2_resume);
+
 static struct platform_driver rcar_gen3_phy_usb2_driver = {
 	.driver = {
 		.name		= "phy_rcar_gen3_usb2",
 		.of_match_table	= rcar_gen3_phy_usb2_match_table,
+		.pm		= pm_ptr(&rcar_gen3_phy_usb2_pm_ops),
 	},
 	.probe	= rcar_gen3_phy_usb2_probe,
 	.remove = rcar_gen3_phy_usb2_remove,
-- 
2.43.0


