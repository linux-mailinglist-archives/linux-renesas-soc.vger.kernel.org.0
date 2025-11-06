Return-Path: <linux-renesas-soc+bounces-24259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E2305C3BD18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 616553514BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B6322557;
	Thu,  6 Nov 2025 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B9mreEv8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A0B217F2E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440115; cv=none; b=IOZd8gEjgAj8hILP6v2mWZ/rkBkSv/osmhQm3FJ7w3UsIFHeOcQ6/7lGdXGBgaftW/8FLr/WDQZTqEeRhZHb6szfX7x9EH08vQH6btYytPdKN6TiWykS+KnWFat6FW7lotb1a3h5nVVQcY2W+jO3fYci5JCopg53m3QwCTanK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440115; c=relaxed/simple;
	bh=nMZ4yTau9IX/RJqS/sKxKzs5iuDiWutFuc3LDB4T/ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGYsLbmAzfyocoPoIDfkxU0o0zo2InBQolxEU69lZ7VZrOZDQ2cHY8pkjdT8DIvxcfJmg8N+kFRfhAhKO4bRmck+wqvbqBPLX+piU/Vi0TQKKj3yr5f3+aJeJrESv4Yf27LsrvqPIiuRWkan73uAPoi0ocflxIEEdW+jjISxrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B9mreEv8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429b895458cso610947f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762440112; x=1763044912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLvBreGMwkIXqaZtfvc2Qx+LalMucsk2m3rxCN5bCz4=;
        b=B9mreEv8th95ZjUKHXGnmBhYMZiL2JAgIdnEYUQJs0wrH2+MAaGMpoF9YHxthwzHLV
         JWx3elomFWenBdhe7/5qw1q3uOlB1cev6EkFoDgJmUBgyekaWMKT3w8g7s5emqDnsXX0
         k9ZL3ivRvK1/LzHqBGFlGhHI6wmIrmrfTv07Uhz5L27yXZEmzW76AtfFJ8DMViOFDEss
         Q2TLJuxHDyjRQZ8bFMI7pdk74lzXhw3l7h5Fl/Ofo7jXNjUxsoAHet4z00Y5A4k6zbHE
         ZjJiaq0qk5CpWAZf7N4E9MIEIZvrLGdUt53rTDriPIh6Sfe9n3M7KHa4c+yEhse2jH1T
         k3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440112; x=1763044912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLvBreGMwkIXqaZtfvc2Qx+LalMucsk2m3rxCN5bCz4=;
        b=wgLHI/JQGzWzehgcaETb1p/iDN4OpVElvrZLR99cKQMHDhat1tfXgMGFa2kSS+y+7r
         ZpO1EpasFLuB+pThrz6VFqsjnIGEXQFMwb5i8xMFq73xxm5vnuzdUALMUgbNrKkwWXvW
         gF8RRirr/Si3PmDCPqa1ukNWlzuftU3OS62DZzkrid3+yy5Fo9oAWr43PK1Kog/hx5m8
         bZq8s7Uh7ChQQ6TBtz0p8kyb8Oo2mlBjyGC7tqfso0txyWJ3BYb38TRVVt4Qhlnips5H
         lI7mhtcMFyFw8/GEIrx10LH6VRMmj6GTyvQ4v/+vPxb8m94lr11D39V8UlUWTjYulb6Z
         SX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBX+6xa9c9W2tf7FxGuMb6Uw3IFsSd1gInm50RKCRlEk1UY5zvBF5ZcO6bBFnWYDBTh1pLVztvUDFhxidBA/Sm+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpewZbQpAhnrz7/dMTcytD9rRDgVkMlzFOlCswUv9Ykh9G4BGd
	ppoIpfVv4azL8+xUT+RSA+qq+T8WK/sEnESXwuE7iZKyDP4ZnKTk0OUiv8/GZ+Rq2fQ=
X-Gm-Gg: ASbGncvqIJwzwwkwQmpbBxWJvxmTGw4z3wY5wzeilhuennEVLQPD/R+eKLwPGbgzjlY
	cg7SkUrOGaStJIIQWFzT+jTL7P/X8/EqjSTOXZlXjSSYrjKwn+BNODOvsRJ2XLFt1yhcQ9tJtlz
	EKXZVsuSiIPXWiguonWRrSk0lzQo78l5iFWc2WyNShTDSw3UMK4y2EIw3Vaym2S+lzmdcTGlg03
	7DduUyHlhlt64TmIuSDsmLzX91p2eFnCsK4WFl7XNYC3Wyoua98fs1qXPC9EraB9i9Y4TrepQNc
	ypykWK5jBhY8ja0NrbnQxCorKxfQDYbAQ6jynDGwoW/EDy635Uow3oVsHIR3H6cnng7vIVsNHba
	rjiqP6B+Jb4bEl7wl/qeEmGALpfh2q2XHUvwgEWCxYF7wJikymRXUWxPnCq22wMZf5LOzexEdL6
	4F8OJYjPUYtEj/2xbQNzJt0gegn6Va4g==
X-Google-Smtp-Source: AGHT+IEQIEtoq2huqYNM973Pi0C7dV27dTRh+KYLOlZZJrYRyqy5q0MDFqLHXSPi+tcIpGgwQC9bug==
X-Received: by 2002:a05:6000:184e:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-429e330ab3dmr6769606f8f.47.1762440111989;
        Thu, 06 Nov 2025 06:41:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb42a2aasm5369892f8f.21.2025.11.06.06.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:41:51 -0800 (PST)
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
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
Date: Thu,  6 Nov 2025 16:41:48 +0200
Message-ID: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

This patch is built on top of patches 1/7, 2/7 at [1]

[1] https://lore.kernel.org/all/20251023135810.1688415-2-claudiu.beznea.uj@bp.renesas.com

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index a38ead7c8055..3c063e4dea41 100644
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
@@ -778,35 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
-	struct reset_control *rstc;
 	int ret;
 	u32 val;
 
-	rstc = devm_reset_control_array_get_shared(dev);
-	if (IS_ERR(rstc))
-		return PTR_ERR(rstc);
+	if (!channel->phy_data->init_bus)
+		return 0;
 
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
@@ -846,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
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
@@ -861,11 +863,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
-	if (channel->phy_data->init_bus) {
-		ret = rcar_gen3_phy_usb2_init_bus(channel);
-		if (ret)
-			goto error;
-	}
+	ret = rcar_gen3_phy_usb2_init_bus(channel);
+	if (ret)
+		goto error;
 
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
@@ -936,10 +936,38 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
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


