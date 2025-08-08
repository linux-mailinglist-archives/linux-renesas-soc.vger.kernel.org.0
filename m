Return-Path: <linux-renesas-soc+bounces-20171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C0B1F06C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D72CF3A7EF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D7C28A71B;
	Fri,  8 Aug 2025 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3cOIFfQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA465289E3B;
	Fri,  8 Aug 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689944; cv=none; b=WbLovc1pid4zOxobPr+8n3CHwDCzuJm6SXqD7q4TgfBenWZnjmEuNtPXTMmr3LVTbAjxomdIufenKO/Z1ghel99VGVuJrT5mBxmxjPwewGY2MzkAEAn4QXmZ313pfUJQDxvImfRcN3pIFWSQCB7Gc3qQYn/L5WqwDyo2SimeodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689944; c=relaxed/simple;
	bh=pNI/XlqSfjUqvsOyJuFc2HX76DQF/EEpD/pfQ/mbTzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haMzcc8Xr/vU82JmcluIpSmwvx4TYBeheLDiVBZb7mrTM4p7Szi3s6doW6LktI3MaMYpVJmKrtWbvMJgk9c8gSWsXIn1ZPstHDCGhHBmmhpI+o/PjZaV4Y98zAB9iCIC0R2u1gEc03TUvGlmMe83ZoOKnBAzmjC1gTpWY6Fvv5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3cOIFfQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b7886bee77so1985788f8f.0;
        Fri, 08 Aug 2025 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689940; x=1755294740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvS/66ZRcxV6VQy7PbjyUhwNCw/ZPjnx5EiNbfGEtK0=;
        b=P3cOIFfQOoXx68qicO7npMVbbEYEHXroeaZMB+khzW9PJiZosiK1jj22K6sMs8sOmS
         DqCaQtv6rSx+oNFA9LMhDfDaZs5mrL6Qt9c61hxMt+R2SbflPf7l+W0JePZdIe5Susds
         9RU3elzz9a/tmt3/RfX0yO4pFXJL0U32h2eu2UYW6EgoC5UlBksZfBiD0zBeo6pVaF7x
         uh/ZfKYysyktKhKFzV6M3eHbqji0xdhUHwzSRYoM5AWqdRmLjI8Gd4Eao0LF3eDwRz81
         CA6arzIZAuuyrtDtsZlZzhSVnC8C7dh0PwLiKzPZscHlh0nfDAwkwuEOD+I3Ij8Cu/WZ
         XUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689940; x=1755294740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvS/66ZRcxV6VQy7PbjyUhwNCw/ZPjnx5EiNbfGEtK0=;
        b=HqvvlSKFASatEmVfToOHg7TcpNsFe2b0juBRTKxjmJgW2nj/bPFbd7Aiyb5t5vgW52
         LdQ3anrU3irezVSXJloJNC0IwpF1BvuW5s8ThedWAIpGoT+5mQTp6FDv+hJtybv+Zw5b
         TAhmx57QV4PcrFktCIUordFpVbeVIsazobSPjEFzUBp6bH2MZMq0CE2VDDCq7ChQHJYm
         QADrSSHor75Uyeh9v0ePW41yxijgtn6DW44YWF7i8OtGdBU09heDNurVD+0woCNN91Dc
         Wwtt+DRst+EGODc95LdnyUXVAS6LqrwQBrEVkqDVGIgPGNLjJvAnlyjIFDRsVlAwtTly
         yj7w==
X-Forwarded-Encrypted: i=1; AJvYcCULneF3ghz8ZOGIpT3nGpEeBl28vhJW08B9wDFqcGdjFAAEEXJeMgzTTdJFgFMw4xYRtsmcG+q4zp8Z@vger.kernel.org, AJvYcCVnESu4ovvmftMzXBWxknQrHHZMlonywahXpREn1DJ+7u0u6fTlHYTedFIbuH3FQdlGkWZLRvTJ+8XEBN3E+sw1cNg=@vger.kernel.org, AJvYcCWwAU4jAfxfuv6MBKwPT7J7oI/BH9rJJZKjsYb/BjXeylCbsLUmTvCLTYy64H+3QuDFQAB6yf3jdHSt7Mnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx43jAJcx2ytaKCqGtnzSzwZ9rmWahNfNMhBWh8QUrCWBuIGuNO
	gQOOOw0tqzMURM3fk27qAr/unmUw1iLOlB6bc5DOFrMCRMeM036iMFcw
X-Gm-Gg: ASbGncstyMkHtywFNF3fdMJNEeSPrpERRqz+vOcxO1FoSqlyAM0nN6M+smHVyNLFTWy
	6qBczfkCyqoX+DnG3C6vWT9IWcL97wSF3CPZLNHmWi4Eq0OT8/WUAPbpG4jmbQaV/S5dZx1oXeC
	8vrEnLKiIPB5uSg9wwpHMcUoMdjtGYXzvM6shEnB3ldzZUdM1A8jr7DenhHUw/e4X6oAoc3om8K
	D/cJOzUv2gG2r0imjMp4jD6xJnbEKlnAR4+aza6+m8mGmxccUcFhXs3AZedb22I27JVz+w50TTb
	9vKegCzoIl8nC7Ps4fHdXBRo64k/sXVB5vsHfFtzK8ZzaCGvJSDsd5vu9FB994NLDnMwQInbECZ
	18W2leziAPwaIkkK6veq0VjYy9WW58thnuD/I0/RaXkopv3Gw01IeOxbgMkrT3YRBZD0UbB0KH8
	oniGQJm9Q=
X-Google-Smtp-Source: AGHT+IHJn67PJNHb16cZnDnyn2d6g3QZIB/QBXnk6D7396rvjPN7ueSMbBDzSShRVQWt+LdznmCoVw==
X-Received: by 2002:a05:6000:1785:b0:3b8:d16a:a4a5 with SMTP id ffacd0b85a97d-3b900905a8amr4343286f8f.0.1754689939795;
        Fri, 08 Aug 2025 14:52:19 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:18 -0700 (PDT)
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
Subject: [PATCH v2 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
Date: Fri,  8 Aug 2025 22:52:08 +0100
Message-ID: <20250808215209.3692744-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add initial support for the Renesas RZ/T2H SoC to the R-Car Gen3 USB2 PHY
driver. The RZ/T2H SoC requires configuration of additional
hardware-specific bits for proper VBUS level control and OTG operation.

Introduce the `vblvl_ctrl` flag in the SoC-specific driver data to enable
handling of VBUS level selection logic using `VBCTRL.VBLVL` bits. This is
required for managing the VBUS status detection and drive logic based on
SoC-specific needs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v1->v2:
- Included the necessary header files.
- Simplified device/host detection in rcar_gen3_check_id() as suggested
  by Geert.
- Added Reviewed-by from Neil.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 82 ++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index a37af7d8f2f4..8caef9cb228c 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -9,6 +9,8 @@
  * Copyright (C) 2014 Cogent Embedded, Inc.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/extcon-provider.h>
 #include <linux/interrupt.h>
@@ -69,13 +71,20 @@
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
@@ -88,6 +97,7 @@
 /* ADPCTRL */
 #define USB2_ADPCTRL_OTGSESSVLD		BIT(20)
 #define USB2_ADPCTRL_IDDIG		BIT(19)
+#define USB2_ADPCTRL_VBUSVALID		BIT(18)
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
@@ -138,6 +148,7 @@ struct rcar_gen3_phy_drv_data {
 	bool no_adp_ctrl;
 	bool init_bus;
 	bool utmi_ctrl;
+	bool vblvl_ctrl;
 	u32 obint_enable_bits;
 };
 
@@ -201,7 +212,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 val;
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	if (ch->phy_data->no_adp_ctrl) {
+	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
@@ -284,6 +295,16 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
+	if (ch->phy_data->vblvl_ctrl) {
+		bool vbus_valid;
+		bool device;
+
+		device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
+		vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
+
+		return !(device && !vbus_valid);
+	}
+
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
@@ -419,11 +440,20 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	writel(val, usb2_base + USB2_LINECTRL1);
 
 	if (!ch->phy_data->no_adp_ctrl) {
-		val = readl(usb2_base + USB2_VBCTRL);
-		val &= ~USB2_VBCTRL_OCCLREN;
-		writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
-		val = readl(usb2_base + USB2_ADPCTRL);
-		writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
+		if (ch->phy_data->vblvl_ctrl) {
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
 
@@ -433,6 +463,23 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	rcar_gen3_device_recognition(ch);
 }
 
+static void rcar_gen3_configure_vblvl_ctrl(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val;
+
+	if (!ch->phy_data->vblvl_ctrl)
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
@@ -450,8 +497,12 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 		status = readl(usb2_base + USB2_OBINTSTA);
 		if (status & ch->phy_data->obint_enable_bits) {
 			dev_vdbg(dev, "%s: %08x\n", __func__, status);
-			writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTSTA);
+			if (ch->phy_data->vblvl_ctrl)
+				writel(USB2_OBINTSTA_CLEAR, usb2_base + USB2_OBINTSTA);
+			else
+				writel(ch->phy_data->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 			rcar_gen3_device_recognition(ch);
+			rcar_gen3_configure_vblvl_ctrl(ch);
 			ret = IRQ_HANDLED;
 		}
 	}
@@ -484,6 +535,13 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	if (rphy->int_enable_bits)
 		rcar_gen3_init_otg(channel);
 
+	if (channel->phy_data->vblvl_ctrl) {
+		/* SIDDQ mode release */
+		writel(readl(usb2_base + USB2_VBCTRL) | USB2_VBCTRL_SIDDQREL,
+		       usb2_base + USB2_VBCTRL);
+		udelay(250);
+	}
+
 	if (channel->phy_data->utmi_ctrl) {
 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
@@ -613,6 +671,12 @@ static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
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
@@ -645,6 +709,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
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


