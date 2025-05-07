Return-Path: <linux-renesas-soc+bounces-16754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FEAADFBB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1295D9C0724
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07F12820CA;
	Wed,  7 May 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="abPQSpiR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC3281355
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622242; cv=none; b=C2sR5L3K8MQCYGJWJHMiDUErc5ZWFyxdqNvq5vQLutmgLxjIvecyBHmRdbqic3cN0hnypHW+bUb6d0558EN8IlWOuTqSIqUK6jg6f0aH1njW3XT1V+xYJ98GhtHF9RbliDfxra4J9uqflk8L4lbhzUBeMOquz0VAygO/r4PxIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622242; c=relaxed/simple;
	bh=fXWAFfM6xGQH5vtg2vnG2G4Rm9Srbao7e5lC4KEsF5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpJ8KxJBFdt0ZdOeSo7XnS4cvFCVsCsJR5G6Dpq2OaoBTn3n9Z/1zBj/qkYTySktcC2CLbSUx/WFzVyOxFdxIRappEgjXTuLnFQycgxdEjQ8qOOQr3kvaAyIX7icdACIjnIBKddJm4DLwQyqKNAwcycT+9HJY3Uip8WO1O9vvnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=abPQSpiR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so1105908166b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622239; x=1747227039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxQTUgTe7v6lzhxqGuewV0dNwPB+Lcd+avBxe9zfMDc=;
        b=abPQSpiR+Wto6h/MgLgeH7JJqHb6AeKVuTseK95gAYZmb7YsMwEswf541OL15fsEYg
         oY2SzB6U/eZQ0Kur5hqS0v8AsbL0yXTUq4tQwgvmuJp6uOa9pZrYNjN85ftazeFdWYfN
         XhUmbBE6GOly8A8w+KEhVKP7rCsFu+XV6qotAdwAXemas8aDBI7nbRRMU5yo9TRqcEZO
         meoGX2keeAKBmFUlCduV91za0QEAxuJbr3ZZLID39Wq0tsDedJnr9vXWYQZd5YcJTWQ8
         oOXSCH3GuuNS+VQqoY8LkcnRbF4Hc4scoxPGX6MS2nUWf7bH9D4rxYb6P/XSKG5f3wPb
         CrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622239; x=1747227039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxQTUgTe7v6lzhxqGuewV0dNwPB+Lcd+avBxe9zfMDc=;
        b=FPtp6ozA2b3iM4oo85CzNnkLYgA/RvKlSv8Qh6EAiztE2cBlyq2QZc/gqCGB4+7UP4
         db8VgAAZPMZvhQtz+ZwAAVG5FDjGzoan2OF2XXf+iWeyH7y9ViJ6YKhfZPROTRSUX9O4
         17tOTMiATPGoAFsW7SfxidPkQIrHdJNtJhgxEpaKvlyHmjGiQr3juLtmhuGXH0/4bTZb
         m5PO5NHLd6IaxZ5r0HYU9C8tfnxc5KBN3ay90lBItkAxoy+qv057C9a7knFnEdt4PMhU
         mHTYAhR2RYlcT6XfVyRuh+UvE/4Fmdl2fhK8C9hrSrzDoPeyTjDe8LYTqUx8BQi41WyA
         jSFA==
X-Forwarded-Encrypted: i=1; AJvYcCVxqKEZUvcfFgoLKAYU/8q00y1VfzfIT3roVHsmO5GAlHgKB+rL0VUa0qeMGHxQiR8273IpGvtWFfX8Z7Krn174yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/awNzEX3lbWzazqw7t8wVjbG43gVIF2m6XpSUqLn6kURD+AFk
	IZScOp+unnYTsNMJj3wSO7p4625DkCe7DXPUOQtZgJZRoH3VPKC5rTK3gGpbgsw=
X-Gm-Gg: ASbGncsBCy69xVyGOIxb4nyDz/epxHrF7y0a2GUhjUztaLW1a1cagwgPvhW+dV+tbnY
	SNKIa6iQBYWZxqSJwwOdSUayJJUkcgAsBvMFZtk2CQ/J6qJx2OO4KCr5XSoYLmSlIwE/MM6PJ55
	HPuZXosahUatE0GYcMDG4fcbFTBiSw2omThNT3qurvOZwrW4EQkpCpy8Vl3sGu+eAx09nS8Ky5P
	NbSH2bVqlfbSb9t+cfTISJxPtr6nOkTlDKrV4vEKGLAePxdK9+rK8ztLn+YaxhW+IkyH4xHZ8jN
	8e5y3VbDTFENThLYqhuZiPf3bA/B2j5zHJIilWrz3v3s81MjNRVCJ4ylZ6YUL3HWqoUgpg0=
X-Google-Smtp-Source: AGHT+IFfsvW3/hnEPeIc/j2uIPUA7et6tDXubR245UWFhKei3VhQaP8pS15fFAz6cgAd8k7V193d5A==
X-Received: by 2002:a17:907:998e:b0:aca:d83b:611b with SMTP id a640c23a62f3a-ad1e8dbc866mr330662166b.43.1746622238928;
        Wed, 07 May 2025 05:50:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
Date: Wed,  7 May 2025 15:50:29 +0300
Message-ID: <20250507125032.565017-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- improve the validation on the value returned by
  platform_get_irq_optional()

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 46 +++++++++++++-----------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 46afba2fe0dc..bb05fd26eb7f 100644
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
+	if (irq < 0 && irq != -ENXIO) {
+		ret = irq;
+		goto error;
+	} else if (irq > 0) {
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


