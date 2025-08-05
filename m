Return-Path: <linux-renesas-soc+bounces-20005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AFEB1B355
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 860C718A3188
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9BA2741C9;
	Tue,  5 Aug 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd4xb3qh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BCE272E6B;
	Tue,  5 Aug 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396743; cv=none; b=J/IOnOunZFgaBlBuTwoZmPF3tq6TfhJsgpNsbAeUOLQddJTZGrgQtKWIcbuCHJWcnaBBWBmk2VSROFzmXHo+bxB3CkOj1UKkbqU1s8S/guROuULEVw96NVqrirI7jaBNn1+BlVWxhlloclo+bRKbkpSBkQhL/rlFuKo6hV1UiRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396743; c=relaxed/simple;
	bh=1O5zHXh+S/UCKpaxUVHMa73GyulfpyJS1lSJBM2D5zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKM0VpsiiatqGieIAlPNXWI/hP1ppuIJeF+NMcTF6hfqeZe90ygmqT5MGP0Qd0SS2IxUQBdW9Iuz7FSY18ZkN1nqDCpMXg+YQOTQgnC9T4PlvlLk/rMSmlfCjeYE8EE1i8NSfQbzSVSSy+g/hXcrhs02kWRfYgILiL6hjo99nok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd4xb3qh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so3136791f8f.1;
        Tue, 05 Aug 2025 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396740; x=1755001540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lThia6UNIC5cwjXIaCqLK6IgfhMNO2J2y+mXQI59//E=;
        b=Zd4xb3qh4FfkeaJSch5XPeXYzJI/Q9QDGofW47xpEOf+Gmoom5Z4Y5gySlhg7ZTubw
         y6u5VjsCww/ejgQk5SZTcSJKWONVgIdljWEQ44zo++ykWjBWcv/DB6gmyH6Rdz+5Hcno
         xQg0IlzniZ2yeyLzv/Tj2bE2smukTAP9LhNdPVRVVtpVFcIZMZClQvs53meWI3JlSL2y
         hD8pQ8EVMC/UhIWNquAIzLZIwHxwCMVaVJNB5CYxCAqXhe57R75Har39fL2r7jSflEnR
         j2FILI6j4nXFsyX59Bjsr48jOWZLNJZmRROk51+n9QUWwmcW9dp7T8csUf7rzVBfxWYa
         BvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396740; x=1755001540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lThia6UNIC5cwjXIaCqLK6IgfhMNO2J2y+mXQI59//E=;
        b=Pv91BDdY+nJs7TwWYHvhmaVMqLvGb8/o0BKTEM+SB3dETmbTHppZuP+3jb48OpjHKg
         JKvjDf1ZNpMXfJ4W2k8Af92Kw62RThUPo6EsR5Y3yyjCKg7+1eGhnAhBRIGWj+gm4soH
         UaXagLvLhm+ulnZzaXrxAxPbYZwvDpzKDLHZYqYQjKBxz4mNLMzlRWPg0puOXh7zL0R7
         brBrT9fDhUz9SzW5wBUxTrVy8USvAeFldDuwfcnxlVYR8CA2J/n7rXL0SXdMnQEjhBS3
         X+vS0i9hNNDJUkVLIrqLABksB5Qp1V+kRWYLmDRtuFSHD/BRJF/xgLywzvX1jJ65n4ob
         EdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoxrWEBZs8nrWP+F0I0D21q2xJbKkx0I2ZsDd7bUdyBI2kZQyBKxYVVQJkKUw0DigqUh289WoctgdA8vrG@vger.kernel.org, AJvYcCVwK56+nEpn8L7tykD+LxTktD1IPsMnvW7Urq7VoIbStcgv23poROf1er3vYppPmNL7I9mAyxlDSEVky/EtonBY0ag=@vger.kernel.org, AJvYcCX0TDP3D5DubfzLjBTXhyi3w6WaVfdoemLgc4nnDpDYSAcf5aYl4HwjiAZO7TYT1gEfSenxOErd5lTd@vger.kernel.org
X-Gm-Message-State: AOJu0YydwjJAY4EdyhNbQFBvm7S82PJglyFUFh0t0+x7tGytiK4OOXPn
	jk3yXrhFqWveE+np1kM14oNjoIh6Li4audhHS4orNZvLwzi6AHCnmOiQ
X-Gm-Gg: ASbGncu1PSSIkJImx980KB5YOhoRwnPfQfb9civfGZtVFkiipXoGUOYscG4JcFjsfcJ
	PsQ+AmO0bk+VdbeCG/B0B+HTVLzC1IDXVUutmbBP4x+ZXjk36mr8S9BO7zkjFQhkuxIHAXHaGFD
	SbG+Z+JDRHVpLewcEy+sFvm+SZJKDRsjwF3YOU8FJra0DE5aWRIjCq99OG8t3EQ2RAtlxtNraUZ
	GoHVpLNdw2oQvP7eRUMgrkfBMwI9qJU+7HSBrwbOcAOvu5k8+y2usDnzaNu2zEc8lGPd6h2WoY5
	HMwS3DvX0rnzKTt1lx7sqK1iC1zJhqfz1eLcqiz9M1rZcmaCkF/RnlExVO0oK7CMiZHZxTZjY14
	9QYffikWaHSIgxBjPeK+HcDQeWnbZNczCxmYfk2X2fqe5YNfvk3Mqk5J9Xx5qP6jj9LoOh7ie5A
	==
X-Google-Smtp-Source: AGHT+IGXxBUU9vuUvHTKoYKPkNOeZohJuXOS7PEmwNsW0gcCJ8QGrpLu3vrLX/3S0AcGf/z2nw5m1g==
X-Received: by 2002:a05:6000:1445:b0:3b7:8ddc:87a1 with SMTP id ffacd0b85a97d-3b8d946502cmr8692011f8f.4.1754396740034;
        Tue, 05 Aug 2025 05:25:40 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
Date: Tue,  5 Aug 2025 13:25:28 +0100
Message-ID: <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial support for the Renesas RZ/T2H SoC to the R-Car Gen3 USB2 PHY
driver. The RZ/T2H SoC requires configuration of additional
hardware-specific bits for proper VBUS level control and OTG operation.

Introduce the `vblvl_ctrl` flag in the SoC-specific driver data to enable
handling of VBUS level selection logic using `VBCTRL.VBLVL` bits. This is
required for managing the VBUS status detection and drive logic based on
SoC-specific needs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 85 ++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index ea387941c6f7..bc841982a19a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -69,13 +69,20 @@
 #define USB2_COMMCTRL_OTG_PERI		BIT(31)	/* 1 = Peripheral mode */
 
 /* OBINTSTA and OBINTEN */
+#define USB2_OBINTSTA_CLEAR		GENMASK(31, 0)
 #define USB2_OBINT_SESSVLDCHG		BIT(12)
 #define USB2_OBINT_IDDIGCHG		BIT(11)
+#define USB2_OBINT_VBSTAINT		BIT(3)
 #define USB2_OBINT_IDCHG_EN		BIT(0) /*  RZ/G2L specific */
 
 /* VBCTRL */
+#define USB2_VBCTRL_VBSTA_MASK		GENMASK(31, 28)
+#define USB2_VBCTRL_VBSTA_DEFAULT	2
+#define USB2_VBCTRL_VBLVL_MASK		GENMASK(23, 20)
+#define USB2_VBCTRL_VBLVL(m)		FIELD_PREP_CONST(USB2_VBCTRL_VBLVL_MASK, (m))
 #define USB2_VBCTRL_OCCLREN		BIT(16)
 #define USB2_VBCTRL_DRVVBUSSEL		BIT(8)
+#define USB2_VBCTRL_SIDDQREL		BIT(2)
 #define USB2_VBCTRL_VBOUT		BIT(0)
 
 /* LINECTRL1 */
@@ -88,6 +95,7 @@
 /* ADPCTRL */
 #define USB2_ADPCTRL_OTGSESSVLD		BIT(20)
 #define USB2_ADPCTRL_IDDIG		BIT(19)
+#define USB2_ADPCTRL_VBUSVALID		BIT(18)
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
@@ -138,6 +146,7 @@ struct rcar_gen3_phy_drv_data {
 	bool no_adp_ctrl;
 	bool init_bus;
 	bool utmi_ctrl;
+	bool vblvl_ctrl;
 	u32 obint_enable_bits;
 };
 
@@ -201,7 +210,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 val;
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	if (ch->drvdata->no_adp_ctrl) {
+	if (ch->drvdata->no_adp_ctrl || ch->drvdata->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
@@ -284,6 +293,21 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
+	if (ch->drvdata->vblvl_ctrl) {
+		bool vbus_valid = false;
+		bool device = false;
+
+		device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
+		vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
+
+		if (device && vbus_valid)
+			return true;
+		else if (!device && vbus_valid)
+			return false;
+
+		return !(device && !vbus_valid);
+	}
+
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
@@ -419,11 +443,20 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	writel(val, usb2_base + USB2_LINECTRL1);
 
 	if (!ch->drvdata->no_adp_ctrl) {
-		val = readl(usb2_base + USB2_VBCTRL);
-		val &= ~USB2_VBCTRL_OCCLREN;
-		writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
-		val = readl(usb2_base + USB2_ADPCTRL);
-		writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
+		if (ch->drvdata->vblvl_ctrl) {
+			val = readl(usb2_base + USB2_VBCTRL);
+			val = (val & ~USB2_VBCTRL_VBLVL_MASK) | USB2_VBCTRL_VBLVL(2);
+			writel(val, usb2_base + USB2_VBCTRL);
+			val = readl(usb2_base + USB2_ADPCTRL);
+			writel(val | USB2_ADPCTRL_IDPULLUP | USB2_ADPCTRL_DRVVBUS,
+			       usb2_base + USB2_ADPCTRL);
+		} else {
+			val = readl(usb2_base + USB2_VBCTRL);
+			val &= ~USB2_VBCTRL_OCCLREN;
+			writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
+			val = readl(usb2_base + USB2_ADPCTRL);
+			writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
+		}
 	}
 	mdelay(20);
 
@@ -433,6 +466,23 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	rcar_gen3_device_recognition(ch);
 }
 
+static void rcar_gen3_configure_vblvl_ctrl(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val;
+
+	if (!ch->drvdata->vblvl_ctrl)
+		return;
+
+	val = readl(usb2_base + USB2_VBCTRL);
+	if ((val & USB2_VBCTRL_VBSTA_MASK) ==
+	    FIELD_PREP_CONST(USB2_VBCTRL_VBSTA_MASK, USB2_VBCTRL_VBSTA_DEFAULT))
+		val &= ~USB2_VBCTRL_VBLVL_MASK;
+	else
+		val |= USB2_VBCTRL_VBLVL(USB2_VBCTRL_VBSTA_DEFAULT);
+	writel(val, usb2_base + USB2_VBCTRL);
+}
+
 static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
@@ -450,8 +500,12 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 		status = readl(usb2_base + USB2_OBINTSTA);
 		if (status & ch->drvdata->obint_enable_bits) {
 			dev_vdbg(dev, "%s: %08x\n", __func__, status);
-			writel(ch->drvdata->obint_enable_bits, usb2_base + USB2_OBINTSTA);
+			if (ch->drvdata->vblvl_ctrl)
+				writel(USB2_OBINTSTA_CLEAR, usb2_base + USB2_OBINTSTA);
+			else
+				writel(ch->drvdata->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 			rcar_gen3_device_recognition(ch);
+			rcar_gen3_configure_vblvl_ctrl(ch);
 			ret = IRQ_HANDLED;
 		}
 	}
@@ -484,6 +538,13 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	if (rphy->int_enable_bits)
 		rcar_gen3_init_otg(channel);
 
+	if (channel->drvdata->vblvl_ctrl) {
+		/* SIDDQ mode release */
+		writel(readl(usb2_base + USB2_VBCTRL) | USB2_VBCTRL_SIDDQREL,
+		       usb2_base + USB2_VBCTRL);
+		udelay(250);
+	}
+
 	if (channel->drvdata->utmi_ctrl) {
 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
@@ -613,6 +674,12 @@ static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.obint_enable_bits = USB2_OBINT_IDCHG_EN,
 };
 
+static const struct rcar_gen3_phy_drv_data rz_t2h_phy_usb2_data = {
+	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
+	.vblvl_ctrl = true,
+	.obint_enable_bits = USB2_OBINT_IDCHG_EN | USB2_OBINT_VBSTAINT,
+};
+
 static const struct rcar_gen3_phy_drv_data rz_v2h_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
@@ -645,6 +712,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a09g077",
+		.data = &rz_t2h_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,rzg2l-usb2-phy",
 		.data = &rz_g2l_phy_usb2_data,
-- 
2.50.1


