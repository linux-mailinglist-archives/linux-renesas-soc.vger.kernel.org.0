Return-Path: <linux-renesas-soc+bounces-20168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4FB1F064
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC4BA058A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B0E289E2C;
	Fri,  8 Aug 2025 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2I0/EKx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59C289832;
	Fri,  8 Aug 2025 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689942; cv=none; b=hmb7X44h4v2JQXUJxio9y/smEzYJv6n065o4zbqER3WdAXceIpnabBzSYwyeCni9YkaTklrkyfszeA3Waat7ibqfg1cQRhG0ISywZIoAQgiEYZbjHuBca8Tm+rl9QHIPKHhUiNd7Xrz4Nm320SsiH93mTsZCWITq4eRFo57FjLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689942; c=relaxed/simple;
	bh=GfU3HnzDGt8Jz7iKB7PPuh0HE7dixYkQW8lQDV/5u6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFIqeBZ3EhvmZgYSdVvJxB2SyEyLezhbFamA/oLVsDwrL/aCYY6axGQBWVcDTG82+NLqaygdp+7TPdY1Q7OqyJfwJodQs5vgtdcjytfz7NuXKCTFepCib4R8m7O3e4Di8ucqPr3M6ONcsrIcNDhMUyRkXASdlqXRwwVCgnGq4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2I0/EKx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so1526683f8f.1;
        Fri, 08 Aug 2025 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689939; x=1755294739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4eso6q1Ql4hiLYxYhXhY6ZR8ZJDF1IdVnxzdPMfBWU=;
        b=U2I0/EKxaemGFrDSObzJkj4pjIMKQuty0XCA9gxpd+jsYLToy9c0BbB/LDZwupdj2h
         tz80cXh4zmJ0A6akL44MuWqjqZDTNo/ziKhxMAn5m6a9rEK6Tw6RVWLUEUIgeemX7OJK
         VPytiL6TZo80yBYIP/3i1QzBgZe28INy04Bgi5gL74QFQVXU/k8KXp5W5+h3Su4OE3zL
         +3a2YjHLczhu4PXZqq+Ec84G+5DZZsF5LPkKedUMXLbF83R/qRc7kMoIA7UJCA7mENQY
         Fed6SS41e/fWjgV/mAl2eIjWNHKa8VtfTxiV4cICAwN2So5/iMG0qW9qr0ayhMW9ESN5
         X4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689939; x=1755294739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4eso6q1Ql4hiLYxYhXhY6ZR8ZJDF1IdVnxzdPMfBWU=;
        b=DRA3Ilk7eSbsuXQem24P3K8mnj02t7yVU8pji8b3vHoobPMBqaOSf2WtHRYMl7cSix
         lQS9qdKH4ZpbbzdTySamjVgLiVcVI7/dTc5p+957e9bB+IVpf1KPB14+C3cQVCyXYCeX
         anfQbn04DdMIbrgh8VfYJtJIHjOWW1xIxmyEKp/P/gOoyV4IIP7dm0WYbZaQXkZ02bMf
         9AyvS9+//0Nau/XmmavDSBQyXlAQFmgTjyWakzsnXD4oKVH3cKmplaA+NW/Vp601k8Xw
         TdI05tp7moPpsLnZDO90Tbh0MulSrZVxWlrDFDE8XMOQ1FVKAhMyhi5aRk6+x+pT2dPF
         gBhg==
X-Forwarded-Encrypted: i=1; AJvYcCU5SNK6ncvlRM5SbTFDPVc2Jm/UM+kYm6/3o07sPsFKoDEx3E8724EbI067Ii6TkkRNL6GW5FLi9WQu@vger.kernel.org, AJvYcCW6UWIu43BGxv1CLJwJ65HTvWdnIS1nWO557TpIFo7COVm9x1XhXw8tutJzfUYHxhAo5yTgq1ixC5VZNXIp@vger.kernel.org, AJvYcCXcoL0Jtr4Si0IvXRgMuKGZeMzuvKtR6XvIw69pzF+89CAio8xOHRtGII4QAwZh9Y5HSwJVCnGoQ0eTtu3t3UdA88Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLqc8yX9rdM/xrSBrCogGRXSFC5/SUicQy73cMTvj296DBxDzP
	71kBCcL5iL1+WSIN7RaMyOkeD6CbBAgsr5WSgcYZ7xRr0uLmax5b9sbS
X-Gm-Gg: ASbGnctJtDbj4RTwJcpP7YJoOBmxPqusg4BjQ+HvgT9xNQdKz0I0SFaVE5l+/uKYOE8
	XnZYcA0uyZMv+u+RVLcXfhMyYNDn5p7rXWIDaJzo98jGNINaJrZ92tds24moO1H/SC68rhCWsWl
	IBs0iiEa4APLgPqW3juLHltHOUwtvD6JhfYryd9IS2dZausgpuSrNSaA1O0+RowbDSWkiCzG/Wf
	mildm1QCh4dZcuNtAIT6BYQ04rF/ENzejT3AYQWyD2PMvwA6Jgg3DiafPGqpvb3V/oNsqPCblT6
	gwv4xkPkic6tKPfTiOSTSukgz7PeWBjRFf0hFh7gEbSubhmXcIDgG+s9KbxYWCuz+PbGU+DjMmF
	/Q/NgIW/ZzdvXYwo4a1B5Fxabrcszj338FxMZil5REWVJlh+WuzRwgg9eCe9lgrsiAnlkRbjJi1
	WdwdHwGd4=
X-Google-Smtp-Source: AGHT+IFwCjDrfEQICalf5NxwHTcZ88cI3WyfLffrmreA57STBVTNRiDMr27sd6w5OkjIo6Mai2gOEg==
X-Received: by 2002:a5d:5d0d:0:b0:3b7:fbe3:66bb with SMTP id ffacd0b85a97d-3b900b5551fmr3431850f8f.50.1754689938538;
        Fri, 08 Aug 2025 14:52:18 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] phy: renesas: rcar-gen3-usb2: Allow SoC-specific OBINT bits via phy_data
Date: Fri,  8 Aug 2025 22:52:07 +0100
Message-ID: <20250808215209.3692744-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the PHY driver to support SoC-specific OBINT enable bits by
introducing the `obint_enable_bits` field in the `rcar_gen3_phy_drv_data`
structure. This allows each SoC to specify bits required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v1->v2:
- Added Reviewed-by from Neil.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 27 ++++++++++++------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 7ac56102aed0..a37af7d8f2f4 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -71,8 +71,7 @@
 /* OBINTSTA and OBINTEN */
 #define USB2_OBINT_SESSVLDCHG		BIT(12)
 #define USB2_OBINT_IDDIGCHG		BIT(11)
-#define USB2_OBINT_BITS			(USB2_OBINT_SESSVLDCHG | \
-					 USB2_OBINT_IDDIGCHG)
+#define USB2_OBINT_IDCHG_EN		BIT(0) /*  RZ/G2L specific */
 
 /* VBCTRL */
 #define USB2_VBCTRL_OCCLREN		BIT(16)
@@ -93,7 +92,6 @@
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
 /*  RZ/G2L specific */
-#define USB2_OBINT_IDCHG_EN		BIT(0)
 #define USB2_LINECTRL1_USB2_IDMON	BIT(0)
 
 #define NUM_OF_PHYS			4
@@ -130,7 +128,6 @@ struct rcar_gen3_chan {
 	struct work_struct work;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
-	u32 obint_enable_bits;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
@@ -141,6 +138,7 @@ struct rcar_gen3_phy_drv_data {
 	bool no_adp_ctrl;
 	bool init_bus;
 	bool utmi_ctrl;
+	u32 obint_enable_bits;
 };
 
 /*
@@ -225,9 +223,9 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	u32 val = readl(usb2_base + USB2_OBINTEN);
 
 	if (ch->uses_otg_pins && enable)
-		val |= ch->obint_enable_bits;
+		val |= ch->phy_data->obint_enable_bits;
 	else
-		val &= ~ch->obint_enable_bits;
+		val &= ~ch->phy_data->obint_enable_bits;
 	writel(val, usb2_base + USB2_OBINTEN);
 }
 
@@ -430,7 +428,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	mdelay(20);
 
 	writel(0xffffffff, usb2_base + USB2_OBINTSTA);
-	writel(ch->obint_enable_bits, usb2_base + USB2_OBINTEN);
+	writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTEN);
 
 	rcar_gen3_device_recognition(ch);
 }
@@ -450,9 +448,9 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 
 	scoped_guard(spinlock, &ch->lock) {
 		status = readl(usb2_base + USB2_OBINTSTA);
-		if (status & ch->obint_enable_bits) {
+		if (status & ch->phy_data->obint_enable_bits) {
 			dev_vdbg(dev, "%s: %08x\n", __func__, status);
-			writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
+			writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 			rcar_gen3_device_recognition(ch);
 			ret = IRQ_HANDLED;
 		}
@@ -591,28 +589,35 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
 static const struct rcar_gen3_phy_drv_data rcar_gen3_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = false,
+	.obint_enable_bits = USB2_OBINT_SESSVLDCHG |
+			     USB2_OBINT_IDDIGCHG,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g1c_phy_usb2_data = {
 	.phy_usb2_ops = &rz_g1c_phy_usb2_ops,
 	.no_adp_ctrl = false,
+	.obint_enable_bits = USB2_OBINT_SESSVLDCHG |
+			     USB2_OBINT_IDDIGCHG,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g2l_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.init_bus = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_v2h_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.utmi_ctrl = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
@@ -747,7 +752,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
-	channel->obint_enable_bits = USB2_OBINT_BITS;
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
 	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		channel->is_otg_channel = true;
@@ -786,9 +790,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 			goto error;
 	}
 
-	if (channel->phy_data->no_adp_ctrl)
-		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
-
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
-- 
2.50.1


