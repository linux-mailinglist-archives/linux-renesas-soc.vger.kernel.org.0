Return-Path: <linux-renesas-soc+bounces-20126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F94B1E222
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5F758104A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDB62367B2;
	Fri,  8 Aug 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hgzpea4D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54704230981
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633914; cv=none; b=VzY87Qy6DfiDH+5VCWLUzOfC3LDFLtOUB7cABfHt1JZlPscgY8xfWSgufqARWHHqlpzGzJnqAGeu0iZcJDcKln6aZbkaV109e8q/m1uPCHJRXefJWw8ugCqTUdKL3CXesxw3e9pkr1uJ9ZsAPxRC2/0e3m5IJj2pyzqBPUn/8+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633914; c=relaxed/simple;
	bh=XAgJqTi+xocUch4hMijm4OJw8p22LIqhgdGf5SAzVA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcXcnSC0K4PIzwVx3tRmingU3hTenkQWTrF+dXpWs30S6rYPpihU0SyPB4A+hxlrZs3MJvukaeG2cQVocSTU4Mck4QTRlOMIWOLSMGabvpnHjUdoFNwW5MHZLKmlG377GYSMsFIkUuTX20K+VP9PQV1w0PiO5TQIuPWQukt7fZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hgzpea4D; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af910372ab3so475996666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633910; x=1755238710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlVUJVCA5E+NH57NVU2ZeWb+jDLbLNL3sIxsb59oNIs=;
        b=Hgzpea4DdTkd/hUizXiffjbV2DwxzHmF/Bn2eEiOmYqAmgzVbqVEw4/ubImaeiR9ER
         vca+pudyks+CjVx1l7O+J9bkq98cIsGwmlLpHDCgBUreBGgmAuMGRC6RDQHS4lTeZ4Pm
         4B4/ncCsNJnO7t2zif77gAjrx3Cw5sNnAtI0D3KHfqi9z3lbEH1Bg9m6cD6QgCk++MWr
         NWxz+gfKP/wtwxF6isHf9qCnW4cKXV062fEcZgvU4Frb1Exs3sNcOEVcPSilIU2Mh8EU
         Amg0mTs9wYq5JGwuSphWZpUTiWvy7nvUBDQhlpmLCH1Meey+7jpNI9aN4qkrmAlBMNdM
         ok9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633910; x=1755238710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlVUJVCA5E+NH57NVU2ZeWb+jDLbLNL3sIxsb59oNIs=;
        b=hPfe3gdJHzMWoWuoUR7beCh9U9bA4vRLUEev0iPf8/i/srrqBLQmk7ZtNp9BsvoeAE
         LAy4M+B37GCRardFQzwCeTAqAxT9Y/fqkvp8SoHsqOelwPMwlM6eb0+9YO/RevGnyFcB
         0gmz+ka8xr8SC8QzMGjnaG7mkS9NkmA0tDDxBLh0xGcNKzclfwbx1B/tlIOcvPbW5Abb
         mAUOTnvwK90JqOioNrrXz/UeQkfscJmZl3+0XDdNOVOt8OR26vBWl23BcPdrGp8uH43Y
         dRkKW6qVqtBFWVwEJRtXtoyNB3ABzvajlRVoJ6YkpOfnTRxxX743dHpxUiSdkux+gS+w
         cLTw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvG1AoiA3wD1IiqxDcU9CNJ1rgSnb/lE0dzVw0e1LwbfRHGVcvokxZzpCuW6Ct3vvm7FW83deaT8rAyBiJZeAqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW234mPjSrEzDFzJAelpLHKWsx4WCULdXFHa3d9sBUDJIEQpDe
	utdp1Bwzz06+6flbBqgUB6DRLIPB5zLOQ5v0RWdng1zYWHAMj+Dvo5wfpVWtiJBDExY=
X-Gm-Gg: ASbGncvYVxCRUKy8QZElxZShbY7Qe4s1kcSY3bF7eypUV/OVrffJ3ShcJ42gqC/JEaW
	j/uQs/9DvAgepFPVmYwDt2UouJT3YbEb5/plXGKjYn2RDrkbBFVI3qyqiQZ6cQxlNzzQAm3Muh/
	wb/KWmUeJl3TbOKoGQurWnS5Jw4dg/KzmbcLT3FzJr4aTVnGVepddGJ97ObZVrYjULpD3guKEpW
	DxblOFeIGqt/9gJJncnmINol4rvAJxukzYoPnGSrIr2TgfasP08V/RMyI390yg3dyOdAyQAyOea
	3MS9zrFFg8PlPQSZvdDmgAXwTjyNndhPqy5YCZY9AbFYUAT8r/fvQED+ii+L2cKvQPBGpDbvFoV
	FFtnE5rAKGv11lfqXv3yEAhvyogZrYfzh3MxWAx0Wz2WAg7B4O9Fz
X-Google-Smtp-Source: AGHT+IHKJhBC5W1zHHSEO8GQ/O6uPU5JFViR6qbM512GPR/tuQoaCZTYbDiZRLovnGz2SYP/L6FNWg==
X-Received: by 2002:a17:907:d0b:b0:af9:3f99:1422 with SMTP id a640c23a62f3a-af9a3c59269mr632176066b.5.1754633910467;
        Thu, 07 Aug 2025 23:18:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 5/8] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
Date: Fri,  8 Aug 2025 09:18:03 +0300
Message-ID: <20250808061806.2729274-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
PWRRDY. This signal is managed by the system controller and must be
de-asserted after powering on the area where USB PHY resides and asserted
before powering it off.

On power-on the USB PWRRDY signal need to be de-asserted before enabling
clock and switching the module to normal state (through MSTOP support). The
power-on configuration sequence must be:

1/ PWRRDY=0
2/ CLK_ON=1
3/ MSTOP=0

On power-off the configuration sequence should be:

1/ MSTOP=1
2/ CLK_ON=0
3/ PWRRDY=1

The CLK_ON and MSTOP functionalities are controlled by clock drivers.

After long discussions with the internal HW team, it has been confirmed
that the HW connection b/w USB PHY block, the USB channels, the system
controller, clock, MSTOP, PWRRDY signal is as follows:

                               ┌──────────────────────────────┐
                               │                              │◄── CPG_CLKON_USB.CLK0_ON
                               │     USB CH0                  │
┌──────────────────────────┐   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK2_ON
│                 ┌────────┐   ││host controller registers  │ │
│                 │        │   ││function controller registers│
│                 │ PHY0   │◄──┤└───────────────────────────┘ │
│     USB PHY     │        │   └────────────▲─────────────────┘
│                 └────────┘                │
│                          │    CPG_BUS_PERI_COM_MSTOP.MSTOP{6, 5}_ON
│┌──────────────┐ ┌────────┐
││USHPHY control│ │        │
││  registers   │ │ PHY1   │   ┌──────────────────────────────┐
│└──────────────┘ │        │◄──┤     USB CH1                  │
│                 └────────┘   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK1_ON
└─▲───────▲─────────▲──────┘   ││ host controller registers │ │
  │       │         │          │└───────────────────────────┘ │
  │       │         │          └────────────▲─────────────────┘
  │       │         │                       │
  │       │         │           CPG_BUS_PERI_COM_MSTOP.MSTOP7_ON
  │PWRRDY │         │
  │       │   CPG_CLK_ON_USB.CLK3_ON
  │       │
  │  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
  │
┌────┐
│SYSC│
└────┘

where:
- CPG_CLKON_USB.CLK.CLKX_ON is the register bit controlling the clock X
  of different USB blocks, X in {0, 1, 2, 3}
- CPG_BUS_PERI_COM_MSTOP.MSTOPX_ON is the register bit controlling the
  MSTOP of different USB blocks, X in {4, 5, 6, 7}
- USB PHY is the USB PHY block exposing 2 ports, port0 and port1, used
  by the USB CH0, USB CH1
- SYSC is the system controller block controlling the PWRRDY signal
- USB CHx are individual USB block with host and function capabilities
  (USB CH0 have both host and function capabilities, USB CH1 has only
  host capabilities)

The USBPHY control registers are controlled though the
reset-rzg2l-usbphy-ctrl driver. The USB PHY ports are controlled by
phy_rcar_gen3_usb2 (drivers/phy/renesas/phy-rcar-gen3-usb2.c file). The
USB PHY ports request resets from the reset-rzg2l-usbphy-ctrl driver.

The connection b/w the system controller and the USB PHY CTRL driver is
implemented through the renesas,sysc-pwrrdy device tree property
proposed in this patch. This property specifies the register offset and the
bitmask required to control the PWRRDY signal.

Since the USB PHY CTRL driver needs to be probed before any other
USB-specific driver on RZ/G3S, control of PWRRDY is passed exclusively
to it. This guarantees the correct configuration sequence between clocks,
MSTOP bits, and the PWRRDY bit. At the same time, changes are kept minimal
by avoiding modifications to the USB PHY driver to also handle the PWRRDY
itself.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- updated patch description
- updated rzg2l_usbphy_ctrl_pwrrdy_init() to map directly the
  "renesas,sysc-pwrrdy" as the SYSC signal abstraction was dropped
  in this version, along with rz_sysc_get_signal_map()
- dropped priv member of rzg2l_usbphy_ctrl_pwrrdy_init() as it is
  not needed in this version
- shift left !power_on with pwrrdy->mask as this is how the
  regmap_update_bits() needs the last member to be
- selected MFD_SYSCON

Changes in v3:
- none; this patch is new

 drivers/reset/Kconfig                   |  1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 66 +++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 635eef469ab7..3524b760dc1b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -230,6 +230,7 @@ config RESET_RASPBERRYPI
 config RESET_RZG2L_USBPHY_CTRL
 	tristate "Renesas RZ/G2L USBPHY control driver"
 	depends on ARCH_RZG2L || COMPILE_TEST
+	select MFD_SYSCON
 	help
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
 	  controls reset and power down of the USB/PHY.
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8a7f167e405e..fc14c41f5572 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/mfd/syscon.h>
 
 #define RESET			0x000
 #define VBENCTL			0x03c
@@ -41,6 +42,18 @@ struct rzg2l_usbphy_ctrl_priv {
 
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
+/**
+ * struct rzg2l_usbphy_ctrl_pwrrdy - SYSC PWRRDY signal descriptor
+ * @regmap: SYSC regmap
+ * @offset: offset into the SYSC address space for accessing PWRRDY
+ * @mask: mask into the register at offset for accessing PWRRDY
+ */
+struct rzg2l_usbphy_ctrl_pwrrdy {
+	struct regmap *regmap;
+	u32 offset;
+	u32 mask;
+};
+
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
 				    unsigned long id)
 {
@@ -91,6 +104,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->base + RESET) & port_mask);
 }
 
+#define RZG2L_USBPHY_CTRL_PWRRDY	1
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
 	{ /* Sentinel */ }
@@ -110,6 +125,53 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
+static void rzg2l_usbphy_ctrl_set_pwrrdy(struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy,
+					 bool power_on)
+{
+	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask,
+			   !power_on << pwrrdy->mask);
+}
+
+static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
+{
+	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
+{
+	struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy;
+	struct of_phandle_args args;
+	struct regmap *regmap;
+	const int *data;
+	int ret;
+
+	data = device_get_match_data(dev);
+	if (data != (int *)RZG2L_USBPHY_CTRL_PWRRDY)
+		return 0;
+
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "renesas,sysc-pwrrdy", 2,
+					       0, &args);
+	if (ret)
+		return ret;
+
+	regmap = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pwrrdy = devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
+	if (!pwrrdy)
+		return -ENOMEM;
+
+	pwrrdy->regmap = regmap;
+	pwrrdy->offset = args.args[0];
+	pwrrdy->mask = args.args[1];
+
+	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
+}
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -132,6 +194,10 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev);
+	if (error)
+		return error;
+
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
-- 
2.43.0


