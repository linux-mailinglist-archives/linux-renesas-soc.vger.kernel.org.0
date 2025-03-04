Return-Path: <linux-renesas-soc+bounces-13952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD8A4DB4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF08188EA2D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E201FC7F8;
	Tue,  4 Mar 2025 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kdeb2FnC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDB1FAC5A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085317; cv=none; b=AcAmRzFLNswfCNaTRXyhLN4ImbvCjS5n04TSfsXJtCTfNYpljyaINjPBGklLkcWZttOgCMc7FAPvCp8ovEJ/V7HripM+5nynxmEjKVUXH8NBE4+m8HiPT7YXVzCcjtFXxp3hhUGvJJaYwLBd0D3bUaOxY1c3UjGC+HeYzcepVOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085317; c=relaxed/simple;
	bh=6XOq/M+XcFhFyAFXJn5ArmBoZcCZLFmoNv6AJ6fQLYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVQCFIlgrBgqDjzhlRf0X4QuVhIMzSNgP29BlyErmwheFazvJ7J1Haw/Rfa8BTrjVKYWHFX+5rW+FSWoHoCh3GolzThAiwLGSlW6YSXnx8nuTSjfhGOld2vh73Yy9kYg21O2vOP7fmr1isKCK324URlVeCm9sdsUjM24IJa6img=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kdeb2FnC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3910f525165so1430384f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 02:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741085314; x=1741690114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/PMmHSSgrlCrvi+Z+rq9GWww30g00UqAegwGTUTxi4=;
        b=kdeb2FnCuJtkRQLkbsIMBilIv9UeBPDpd1P9yhlw4DFkmE+/uMCj04jKZAq1yrXSXM
         +9Dbdb1qpNNesZrU28R+yIXuBVFdYfUU6Qc2tRsaaOyl0sd5qIDE1Zhod4c2+7lZ6Atd
         NUDoh/MlCyzxFdwUGJD1ySMZeQ7VXszRtajGIgPdMzMTAczEcnYVYIbTG2ja59r4ZulQ
         qbuDSX1Lq8FZQpb9yeWEVh3aCHvOlfEE5u40w+Q8+67AVXpVraKys8yPm/WMhjCXM6zv
         SAs5O9ZOC2qmIuwPLHRB7Yx91dmgCGqccNooyEXt4+B0cIeP4Hkm7melcU8VvKBHyQR4
         yAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085314; x=1741690114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/PMmHSSgrlCrvi+Z+rq9GWww30g00UqAegwGTUTxi4=;
        b=ajmN5cgVMi3TvbgwJSvk//I4Br2wNw+pIwQ7pQ2jYEBosoDOsszgug9g9vucvxr5br
         CIUb+2KUbTYTjmdAKyDSNevGSuthn+jOMnv1wS9XiZ7Z3nc4FM6cbfRmMYKMuwFF8G41
         KL4v5WMiVk8/RS6/wvv5RCRluIrhGFVexVWdRnzu2+bw+Ij03XuKw6zPtBlSn3zd/+Gz
         DBKejPmcqXcilGt6jIAStpJ4o0tGgfpCEa7fShzLEfrBgDd4taJBWV0GyYaCQTwba/lE
         XM+495AbeYJM8FD2yo1PtLet5b7TC6ZlR6HydNXxDBIxg1gvm+9MXl8ypdzHA0s2QFg9
         Zy8w==
X-Forwarded-Encrypted: i=1; AJvYcCWk241/h5t0z81Q+iKv0AtqTzQRQfZ6aUqvUWbbPdaKFi4DizQyV8M6ocYSoakEGS5hLaOFXmT9wjZURPAEOLHbeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5lQfQfzWf5hIywcN0hIuTXl7yLaxONf4gZmMUb3g9Giwsa3s
	Mc9Bp7D1Ms1803W9C1KsqlBzbC3qcE1O/qq1RcWOeuOAnaLlzCnRfwNg6+Tx6Qo=
X-Gm-Gg: ASbGnctx8m+k5yO4lx2LhAsMf2eKpgLP+jb+P46SHhZ/SfxcJXRKJVqeSBnAp/gnM8W
	hiQpJXULp90n7+EE/BiKV+GAVdybGzJR74H1rWwhRm1khkIrVWu15i+3fJ8e1C62Jt7yUHvzCaC
	/QwU1ZuOeVTHnemli7ti+6ZCzpROBNM4SMrG6BXtPP1sTkYdzpWhsW3Y/k59fZC3pstDeQzeCBr
	jHB9DX8Tmg+XfJGtGRxY/gX51jd4Ret7YdsHRzXj3cJr2xwrB1UBTyezX35Aoq6/4nEZqGTEKq9
	WsjnUY7yqSLXPz9dyemELaio+zT2ESSS6JkFC7tr1fTncnhHwvFy3eL8lFPtiRCq8Cc/xBK7VMw
	=
X-Google-Smtp-Source: AGHT+IE9ccipZ/vJcPu505efAkF7yf7WoH8ct+Sjo72HUD2EpUvUGGCqBeJyxUkzLqpZgdAQEy483w==
X-Received: by 2002:a05:6000:2101:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-390f745bc4dmr7682113f8f.26.1741085314058;
        Tue, 04 Mar 2025 02:48:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a38sm17445161f8f.75.2025.03.04.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:48:33 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
Date: Tue,  4 Mar 2025 12:48:23 +0200
Message-ID: <20250304104826.4173394-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
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
index 46afba2fe0dc..aa9f301b5acb 100644
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


