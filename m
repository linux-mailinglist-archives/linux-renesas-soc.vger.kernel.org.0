Return-Path: <linux-renesas-soc+bounces-13367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D1A3C478
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7691718905DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8C91FE460;
	Wed, 19 Feb 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EVnSSoKM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801E1FDE2F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981284; cv=none; b=oCRxtqnhCKMkb5IPxi2RlZh6O4iVD4JjlsqShLTMY8EVtRlXJfIMukCCi0ScxBKsIGvl6W/1ObQjl7MTkw3F2lF7THKi4ckpUyZcEcMffuUXmC2mxYBo54eSS89093fFWe/S4jJTpU6I4CDqfvTBqlWOtWOcTH4TMC7oabdwHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981284; c=relaxed/simple;
	bh=0MUXVyiNYa9K5Dj4ekYjbxuGe1+NWnA9eGzKs/3q5ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0tL9D0iIHuTlt6XVbeE3LKPbOdPTNcARObnbAAzx6kVS3grxmrrSq/yaVn3WqQoAfp9gFSHwB6F1gQjw+d431oZERw+599IoMCe7D83gfkwJwieFQYoK3vPpJNUht7b/4DeRpBRI4sbNnn2y3pPp5G8B4ioBMRnKFiogrP/ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EVnSSoKM; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so5256882a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981281; x=1740586081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp963bQaS09mT/Id9cROqyvlwpVlaGR8uym4PMeifJQ=;
        b=EVnSSoKM88wSiKXK4+gGeYazQ/2vU5iIYQ3nBgptelyqJhkidelHjZooAQNQ3iwwYH
         NB3T/6ZoakVJemqsxmwyQT5uM6S71DgkFx0H8E6BJi0TBLWVKtfvi4JIxZP8k9/udDcZ
         Z8rX1oKd5vh4lc98KPxVzsr/NzuezbzaXhq9mm6pwWTqVEmDEFkZYDAueTJiXeCzijvd
         fMfUNA6SyBYOkbbNWQGmawX8LOoCeo1Qm/muWJYhwnLXNFlLNaDD/9Y1Tq/f8ELP51bK
         eZYHu08A87mOkxx+Eb7qrs5Ku/KdkAqFBqMBxLmopBDz2Qc1j+vVesUJUQ6BNDVX/71H
         e+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981281; x=1740586081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp963bQaS09mT/Id9cROqyvlwpVlaGR8uym4PMeifJQ=;
        b=wUJ3d3V5rOIpILLrHiT4u4oCmxaoJws5T9H1UNJjQrajfNpdE4cNr/mA1kidBEVkSc
         L3uOhJbSqogGsmdnhF0of1WWxa3mTIjKi/DM6UL/qZ7wgCPaOKy0gm3YhHTgeFNDP6ei
         /GJHeqYxrMasVBlLMdP2P9MxHy0lJshf6XlsVkoporxZml2cLOxBsrPHJk3nSX8fRB1J
         6/EOHIdi6FINvTnbusXo/gv9hbs4AXidcq+EeD1Z51lhq32qnUXv7JSiwXwHpHjkMIVx
         lsBJtdO4A9COAavZGotIdG28b582a7atX9Y1CEoQsSpQzvuRrscAmMhwT45wHXLlwnh4
         XR0g==
X-Forwarded-Encrypted: i=1; AJvYcCUtGhXTUM6oCfAufXncO39IDTHbN8AwEUJyG3BumHsd/q1pAuLoxpRXIj857XyslB6sebZmb0PPjB5LYjhqxkbRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04aTK4XtySz5ksmo763IbAB2uMeqtPp0b0KLlC+ZHlqeenpIu
	9vpLmA8Ph2WJhAJ0p1XzpVwNWdLCCY5kVhbIqpfrls2EknaPNnoL4gkT657s+8DrAKpcT0Tgv7p
	+
X-Gm-Gg: ASbGncur9dMRzYsgUUdaBv3jrdASMXJSzfhh5ZPOeX3UIYpzBDSwc9zYQkVG8tWxxfo
	Yp89WKKXvWFA7kmn5UT4rsel7f4DTgUgY1vJ0d2M4htfNrWarEX/uvHfhj9Kta3660ZZFLPbaI8
	W8AXE1kEgcSQ2ekhIXmG1giVWqTXqP7sjy/xctcRMX1FgCBcl2SK8uooN0fj22m0IW4WCc2Q8FM
	QWX7eLJCajmRKJ+CndxNVyDtsl3oDgHGRlg6Gou2Ic7hs3DG6vJoIIKqLVfOE3Eo+htHDehB33t
	AJLdA9l20XlfDKGqigTMUavHd8I/w/Ltib54vULV4iMC
X-Google-Smtp-Source: AGHT+IFAgpZWz/pkyw9SWyVoJ7pk3k0HNU/QFxMAd6EP1GrHppjjqFAwOVcnx9/qFdJFy5HnODJk1w==
X-Received: by 2002:a05:6402:2386:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5e036139cb5mr31203335a12.24.1739981280715;
        Wed, 19 Feb 2025 08:08:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm327791066b.109.2025.02.19.08.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:08:00 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
Date: Wed, 19 Feb 2025 18:07:45 +0200
Message-ID: <20250219160749.1750797-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


