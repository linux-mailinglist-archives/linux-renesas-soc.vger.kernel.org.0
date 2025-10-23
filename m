Return-Path: <linux-renesas-soc+bounces-23517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CEC01A66
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298CF3B90ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D015328B68;
	Thu, 23 Oct 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HS4ZHeA4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148AC31DDBA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227917; cv=none; b=e/v68eCUoLuRT+QBL4coLw9u/OOxTZAXDjmXoAUhgVjiTw4HyyHpI6gVWu8tyKCU0Sekna1hrThB6KY8Mrbw2paDoPMA9VO31DYjBufHsVK1hauRWTf7XPmilyMyGBqkGLusCNZx5gbxQ5uItPD3KvpivuzQrEfH2q9pRM5vUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227917; c=relaxed/simple;
	bh=292vCK5mpBOx2Tupx64vngytF4gnLualvVUEwBWU/to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ppm1UJj9TYecqmVSB+kBaGyQBgTeRbaDMb2w+WoOi7Q4hAv91Vr7lzLLN/iUg9cU80wvpUEGuFO3CoxHoqefF9g5y1Q3ND33T5weHYdZegZIC/B7B7DRcw24h7kE0kQx7ZpCG/QVka19wAzeqd6j5kW8WMcjbjhF8YXkdDhLYEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HS4ZHeA4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c4c346bd9so1743962a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227913; x=1761832713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECxRdi5HH+Y1BbJYjbyAcCHCuJXoR1zvOVp1BwxUGOM=;
        b=HS4ZHeA42MD6JHFB6QAwiA20GxlI8O2DXQqo+tRV6VMpgtyYn5BK2lZszq9fQUlt2w
         A50r9G0OLGqr7xyKtq+ln+zwItHV0k1VczfMzkEGYH0gDYNiDukBmbSADJzoM1YwIhHd
         plHJ3Rlwx6Y3jVo1r4FNPOuPZT857bx7PAN5XTBqpEYs6yNDpz7rQD8WDHYJbnjswtP2
         QOhzuFyg9xmSfsAPe0jRKNMa5T/stRh3Obko11+dTB9CGg7dHf6xr/nPy8H8DWeFxCbO
         u9sRhGD7ntj6cQ6LNZ28K6k0UR0CzZGLaAQJ+lKUU4H/7qhoJaUnH/QTnsWbkAazyPn1
         Z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227913; x=1761832713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECxRdi5HH+Y1BbJYjbyAcCHCuJXoR1zvOVp1BwxUGOM=;
        b=ektHfZu9YT+69TnISLRuzXq1oCKSnqw0t9Njz5DjARWNcXUcn4FBlXvQeEzTpzzDPu
         pqpiGCaxRQtfub3l7rSpy3fDqOM9CaElzr2/LexmnKK7RIFtoOhZ0Bt3bP6RnH5mWQcr
         Ts7Tg6J20gu8OgYOKCzvFRyYPdjRE5JmJujkwk7VxetNdDR07FUdTtFk9/lsJjWPDokF
         giI/le6pv3fE46tSsCGVgLc4a8DA05HZjkHbQTKO+8B0dJpCu/wD5nRi5MGSUP9QvCU8
         3YjF3hiGJ5CMLDuCxH+OEb2eEbdon/SjUefQEsvl1llNg05splJbnX/qcvuYuWCJ/3nc
         7YoA==
X-Forwarded-Encrypted: i=1; AJvYcCUbEk0Ts/X3ouYsCE9cZjFd4kl1UE+p0KsIJZLNmMVabvbvhxwMNUs5Cq7k+kQGX0pNZN536quArNi9tFOVfAg+Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzq/xYV0xkn/NpfL4gZytTvViw/8RN4ygQqs1R1D/+tsPqtZwh
	wJ8aYKJKN5CBmLfSxt0db5msOraimIvP8gg5TgdzQFr07Ps67AXPqH81tWUyVoOL0ug=
X-Gm-Gg: ASbGncsor4NEDM4Bl/o5i8/WlhTphwYVpk5tf8LP0wJSxgg+9Yj9F6bz2ntC70UvNUu
	VDdxqi+EkGTGMqtqdy7u3QYR+TNwQGXKVmIFoBYMdu2PC6w+DJ84fSBbWgzBBXNTkXAEskfN/p6
	JHIIt2JRBBEVXhAl5/mkg9ANMCMClCNMOjecjPkjBPFcs+/z7KW1254NdsQZ2LiSD9pjerSgGE6
	7tiKTK3edOBgVzwU0WvZT616ZAIyTPlWGEtOVvaWqSAqmaTdBtkCo8CKbhOmgGKY45YaBQ5vdrF
	dYbQPNO9AoGGSYiiBEbhLSP9kifI4enTSXicQrZmgKc8wiHcuBMsem57DQTVQF1QbuK/Fg9n4F0
	JPKebwMAQv3VOz4O5GZtsHfnyTDKMeKHPQxyCksUSEb9m7l7mJtdTu3S3eNBvBd99aY0JSriUv2
	CTtEs9bemqg45SU/lkKj9cU5pVjeQntC1Mer8Uj8JC
X-Google-Smtp-Source: AGHT+IG0iSZWhMAUuwbkA8pJHid1t/y13SCmKcaPc9WJrK8PETA/yNl+KAMDTotEEe14viSY2gGdKA==
X-Received: by 2002:a17:907:86a2:b0:b3d:9c3c:9ab6 with SMTP id a640c23a62f3a-b6473842ea5mr2737367466b.29.1761227913211;
        Thu, 23 Oct 2025 06:58:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:32 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v8 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
Date: Thu, 23 Oct 2025 16:58:07 +0300
Message-ID: <20251023135810.1688415-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
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

On power-on/resume the USB PWRRDY signal need to be de-asserted before
enabling clock and switching the module to normal state (through MSTOP
support). The power-on/resume configuration sequence must be:

1/ PWRRDY=0
2/ CLK_ON=1
3/ MSTOP=0

On power-off/suspend the configuration sequence should be:

1/ MSTOP=1
2/ CLK_ON=0
3/ PWRRDY=1

The CLK_ON and MSTOP functionalities are controlled by clock drivers.
The suspend/resume support will be handled by different patches.

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
MSTOP bits, and the PWRRDY bit on probe/resume and remove/suspend. At the
same time, changes are kept minimal by avoiding modifications to the USB
PHY driver to also handle the PWRRDY itself.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v8:
- updated the patch description to emphasize that PWRRDY need to be
  controlled on suspend/resume path, as well (when support will be
  proposed)
- dropped struct rzg2l_usbphy_ctrl_pwrrdy and used regmap_field
  instead
- simplified the logic in rzg2l_usbphy_ctrl_set_pwrrdy() by relying
  on the fact that PWRRDY mask provided though device tree will
  always be 1 bit long
- in rzg2l_usbphy_ctrl_pwrrdy_init() cast data to uintptr_t before
  comparing it with a constant

Changes in v7:
- used proper regmap update value on rzg2l_usbphy_ctrl_set_pwrrdy()

Changes in v6:
- used syscon_regmap_lookup_by_phandle_args() to simplify the code
- collected tags

Changes in v5:
- none

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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 56 +++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 78b7078478d4..329730cbcfb9 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -237,6 +237,7 @@ config RESET_RASPBERRYPI
 config RESET_RZG2L_USBPHY_CTRL
 	tristate "Renesas RZ/G2L USBPHY control driver"
 	depends on ARCH_RZG2L || COMPILE_TEST
+	select MFD_SYSCON
 	help
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
 	  controls reset and power down of the USB/PHY.
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8a7f167e405e..57350764be25 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/mfd/syscon.h>
 
 #define RESET			0x000
 #define VBENCTL			0x03c
@@ -91,6 +92,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->base + RESET) & port_mask);
 }
 
+#define RZG2L_USBPHY_CTRL_PWRRDY	1
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
 	{ /* Sentinel */ }
@@ -110,6 +113,55 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
+static void rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
+					 bool power_on)
+{
+	u32 val = power_on ? 0 : 1;
+
+	/* The initialization path guarantees that the mask is 1 bit long. */
+	regmap_field_update_bits(pwrrdy, 1, val);
+}
+
+static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
+{
+	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
+{
+	struct regmap_field *pwrrdy;
+	struct reg_field field;
+	struct regmap *regmap;
+	const int *data;
+	u32 args[2];
+
+	data = device_get_match_data(dev);
+	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
+		return 0;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+						      "renesas,sysc-pwrrdy",
+						      ARRAY_SIZE(args), args);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Don't allow more than one bit in mask. */
+	if (hweight32(args[1]) != 1)
+		return -EINVAL;
+
+	field.reg = args[0];
+	field.lsb = __ffs(args[1]);
+	field.msb = __fls(args[1]);
+
+	pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
+	if (!pwrrdy)
+		return -ENOMEM;
+
+	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
+}
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -132,6 +184,10 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
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


