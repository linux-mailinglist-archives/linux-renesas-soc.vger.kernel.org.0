Return-Path: <linux-renesas-soc+bounces-13650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD270A43C8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 12:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD16D440159
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E094126773B;
	Tue, 25 Feb 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M+NAZZ3W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045612676F7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740481160; cv=none; b=Bw7qub0gCyIkvJOedB8TVc2mHMJFW2qGhZGjGFMMSnXRU60mFFLLzXemw8+DY98aE5SAc9IRPog8OCkPPZL4kPi234UEKdxq4ie5mP+dOcd4jrX8hM33llFpqG9VS2KyBXGyd2+xN0BjTRbsCEgaVsDFz+zEQvik6l3ScS52Aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740481160; c=relaxed/simple;
	bh=q4+rbjdozfqJae8haxIluthHFrTaZjDmIslxIv4pu6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOCuWVdwqY75OR90DR6LdV0i2T16RudjM4CTihrGjtscf8Dpv0FVpIauIcsFOCkdIM3rg0reJul7tmwI3RcuJxT+7fRxTzJQH5pbWkWOzqfC/ghYt8sNL0mu2DDpi2ffpETKbr1DvB8Y/UlomuDClId86iNektaFlJdS2IxjCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M+NAZZ3W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f22fe8762so2768405f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740481157; x=1741085957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEy8KyELUmcQMIeUv/rU8Wl18U2U4X/a9mtDNA/tmQ=;
        b=M+NAZZ3WgfVCYZzZKpmCmoUaXpCpqPDcKtnW7EfaqpCoNAZigz9xP3Tzmc984FQ+wL
         vtx8uHrFsYcusqdHvbnELh4q1q+DRIR5Eqv+86Rg47LWntdajlhQa1KLVy5zIqqYmx9v
         CF2bixLKWGwW09Ce26J3fva09/DPF5J/IzKT7N9qp2BDfhJzwuwHurUUj1PKRyqbtFR5
         CejYkSoJ7h52onlFn5Wawf5w3ZYNRmoEVtdkJuB7q/H5OdNCTajxkU25AHa4CZ4+olZ3
         g4zynTpdyaXTtEi3LAQ5tlBYoBFdEqgfTDA7dS4OiexeJVQSViJ7xbCgaBJJ8jLVzjfy
         iyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481157; x=1741085957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEy8KyELUmcQMIeUv/rU8Wl18U2U4X/a9mtDNA/tmQ=;
        b=s9R0H+/PZ06Bp7r1Eg0zWpcGCauHA3WkD8kNIXP/RsEVNge8OQlkmpiz/5malYaWpQ
         YeqyHLxdqRXtRIsA2hjhj5Zs6ZHGisnYS0llMXfzaxx42dmORBe/brXuZFIDFjRb6kiK
         VfP4agSrQTY55VxnnOb5rZl32r81H9Hgtu8s1y8yzHyFTAAGVYwPJD4EaWmGejadD/Qu
         fm43F8+6r2AHo5R5i24CqQ2a4/20+GuJUvMFsv9KUgLi+xRQFj5c86T+nMNX5TDGFLKL
         B5qDeZKz6/lteDXsEsFg28c3YlIt7RXY31ZQspHjUnDw48ONmVDjQ79oRitEZimOlID0
         EW3g==
X-Forwarded-Encrypted: i=1; AJvYcCWoQQEpKRzRCxsXbet9cTvRaqdfC/zq5NKKHHB4VSEQ09w35rqy+AmnLani4uswD+iMn0StSBS+7VNCRhJp2kl28Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MMe7eG8JgS0+X+690jr2zIdATWFNzPRUvu64oqs25V85LrEP
	pUgEfqHEjJPyfsyV9Y10famjX8MTEF/ZenG+pPtsTIwiOcbvEFcDVjgpQcbKfPA=
X-Gm-Gg: ASbGncvCxvkqgn6CGjjkg0HiJI5QGQt0AJQO7XTeFtzYN1kEO10cZCQGu/Vbe/WMNzD
	oBKFlZgGw/r3dR/M97J715CZvhbe+GFdMA3IkhhUWTc0faH1b43VKlG7xVKuk2JjzPtY5BVfsTY
	RGhXsqrNhTKoFC+aAnCpHKWv4J62pbHc+JBW4B91OIu2Do9YTX3Xw7cxTthxr9ACjhQ2k/yHwbK
	ybNhkMeDE/7wxDxFdNBh1sBvpw6Gs/NsBBmD1F8AhiJneXtLMy/Opgx/j2fT9VtXWT/iyC2Ijkw
	5MeQzCSTcb9pnxlsTZWP0aPmMZjh6NWWp6SLUML2YaHNNTdX/M1Tylc=
X-Google-Smtp-Source: AGHT+IGg2Tqjf61sKeAO2o+T9GqclFS/489mJaot1ECtYZrKmZ7QXTKiBSZMoZvXY0WSJE1lG6b2Rg==
X-Received: by 2002:a05:6000:4025:b0:38b:d7c3:3768 with SMTP id ffacd0b85a97d-38f6e946edbmr10740765f8f.12.1740481157261;
        Tue, 25 Feb 2025 02:59:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab2c50dcfsm12588815e9.0.2025.02.25.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:59:16 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
Date: Tue, 25 Feb 2025 12:59:04 +0200
Message-ID: <20250225105907.845347-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
to init") moved the IRQ request operation from probe to
struct phy_ops::phy_init API to avoid triggering interrupts (which lead to
register accesses) while the PHY clocks (enabled through runtime PM APIs)
are not active. If this happens, it results in a synchronous abort.

One way to reproduce this issue is by enabling CONFIG_DEBUG_SHIRQ, which
calls free_irq() on driver removal.

Move the IRQ request and free operations back to probe, and take the
runtime PM state into account in IRQ handler. This commit is preparatory
for the subsequent fixes in this series.

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 46 +++++++++++++-----------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 46afba2fe0dc..826c9c4dd4c0 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -120,7 +120,6 @@ struct rcar_gen3_chan {
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
-	int irq;
 	u32 obint_enable_bits;
 	bool extcon_host;
 	bool is_otg_channel;
@@ -428,16 +427,25 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
 	void __iomem *usb2_base = ch->base;
-	u32 status = readl(usb2_base + USB2_OBINTSTA);
+	struct device *dev = ch->dev;
 	irqreturn_t ret = IRQ_NONE;
+	u32 status;
 
+	pm_runtime_get_noresume(dev);
+
+	if (pm_runtime_suspended(dev))
+		goto rpm_put;
+
+	status = readl(usb2_base + USB2_OBINTSTA);
 	if (status & ch->obint_enable_bits) {
-		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
+		dev_vdbg(dev, "%s: %08x\n", __func__, status);
 		writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 		rcar_gen3_device_recognition(ch);
 		ret = IRQ_HANDLED;
 	}
 
+rpm_put:
+	pm_runtime_put_noidle(dev);
 	return ret;
 }
 
@@ -447,17 +455,6 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
 	u32 val;
-	int ret;
-
-	if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >= 0) {
-		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
-		ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
-				  IRQF_SHARED, dev_name(channel->dev), channel);
-		if (ret < 0) {
-			dev_err(channel->dev, "No irq handler (%d)\n", channel->irq);
-			return ret;
-		}
-	}
 
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
@@ -490,9 +487,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 		val &= ~USB2_INT_ENABLE_UCOM_INTEN;
 	writel(val, usb2_base + USB2_INT_ENABLE);
 
-	if (channel->irq >= 0 && !rcar_gen3_is_any_rphy_initialized(channel))
-		free_irq(channel->irq, channel);
-
 	return 0;
 }
 
@@ -698,7 +692,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
-	int ret = 0, i;
+	int ret = 0, i, irq;
 
 	if (!dev->of_node) {
 		dev_err(dev, "This driver needs device tree\n");
@@ -714,8 +708,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(channel->base);
 
 	channel->obint_enable_bits = USB2_OBINT_BITS;
-	/* get irq number here and request_irq for OTG in phy_init */
-	channel->irq = platform_get_irq_optional(pdev, 0);
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
 	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		channel->is_otg_channel = true;
@@ -784,6 +776,20 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		channel->vbus = NULL;
 	}
 
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto error;
+	} else if (irq >= 0) {
+		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
+		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
+				       IRQF_SHARED, dev_name(dev), channel);
+		if (ret < 0) {
+			dev_err(dev, "Failed to request irq (%d)\n", irq);
+			goto error;
+		}
+	}
+
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "Failed to register PHY provider\n");
-- 
2.43.0


