Return-Path: <linux-renesas-soc+bounces-21720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBD1B518BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12F1C7A9527
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F80326D60;
	Wed, 10 Sep 2025 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="i5HM2qCN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2431322DD0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513012; cv=none; b=hrHWY3Aum5FE6qhMxVz4pFj2fOrStDrocEDtktndalpuYPGglT8DdWVgkThggRdSyipNDdftw6Y66xUz/165j2Z6HY4Qy4QXE7EE7yifgGi0T1ivjFOjuo+sugmHeOiosaug4ajzHGdWi66LwBbquglw96Rf+vy0Eeh42k21m1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513012; c=relaxed/simple;
	bh=8c/w6U15zCvX/wrzXc/QykctPWD6qOZa3pqSO0c1jqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zc4SN7W6wQtx+JxlnF3qxo9m/Awgfe2F2PUsbHmNljL/s1dgYYl3LMbLtrCsgkCsYe78CjUDosGo9bpvqIo648rKEHhoUU4pzPaj/3HTPc2WCBAKI8q5xWvn+uFblpe+KPCZlPQ3PhGE0WTkCEV5lZ5Yf4tv9YF3VDcEOmU2JTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=i5HM2qCN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de1084868so21068865e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513009; x=1758117809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFS5WGwWPXNbCDtOnCJOrPVvak3s//W4F+FQv/tO0/g=;
        b=i5HM2qCNLX4ba9NDgYaPIFwROQ9hsL5wfUI7Xrnut7K7m621B6hbHSMTac2x11j+tX
         0Z0fn6EOcofUeQBHJ2Pli1gdMgr6+f0yF0e8FMo8simKo1SmzKL6TsSXP16QHdNkrwVz
         +71tTfvEb/70ZxnXgTMkG2a6NUpqtsxHHk+VGPQKuC/F1QdLSU9sg41aUSLHnX7JIWGk
         vrUF+zO7sd0Hg4olmLPwrwdeZrPP491fUZJGsyxmbNH6T2MdwwkQxIt5eK3kQpzal96O
         oTdP2N9r1ZDRLtt84WSJbwhNPOzZV82AQOX1yOQYeqWjOKueI/zLZAMQd/mcfNivinOp
         HBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513009; x=1758117809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFS5WGwWPXNbCDtOnCJOrPVvak3s//W4F+FQv/tO0/g=;
        b=TISCb+St9Vtn6/VYcfRzOJQ47F7VO4V4CozXy6gmI/5TQzk3Mxnt964VQdz0YvNTly
         UEL+6NouPidD0dCMEmqiagLeTWpb+KAYczEfmLGje98aWrZfdFHOeXNVkl6WCe4DLNkL
         F3uVzG8ncCBo49wM+0J32ZYyPkg+qAJ94JMUqVUO1Gec8oLNJY3jnbTC2NLcJLSWtyxU
         xxyIj7Fn53Blxj/Ns3wOd1y7Y1dbt1hyfBce5SHbDOFVlT7IuUBpxxVZm9XpaOQw8vaz
         1ZNE8safdtxuChW/Lxy2AiY0Shcq3Z4I4nr0pr1TcP4YWHb3c5xZIBcUwko0GhnjYFkq
         HqVg==
X-Forwarded-Encrypted: i=1; AJvYcCW2fCEQQjtbDoiZgvYeJleP5JEh6qGlYCC4k40tVRvxC+aYhO+EsL6X+4HQ7DtpKgCC+heINOB7DH2+6NmlxsSn0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24uN4c7kBBYhTMlOLcY56KwPQuRb/0EzkpqrZThtEBy1MldJX
	F2gWaik9ldKP9/WAYbKAGhg6efuQ+mVxJluIjpHBtmvGnxkxkp8sQN0POTUb3BHa+ZE=
X-Gm-Gg: ASbGncs9yMV6NalbxSK3qTURSBVXFqXw5mkm1cMa/ls4JP+Rl3p19uWk8/30Xet6/Y+
	+rQdVatWHeKBO/Y3yPD7Jd61vHXAsKebXaSrIEKDm5f0Rj6fTn28oKh+bfsPJwJqFfhxUnioZ2g
	iLL/WfgkyOyLBafDWwYqT+t16C3C3LiuoCP4rcCdHYgVX/wrN5schXMy4qtnr2eQh1kKn15AoKE
	YQuuJjGIch07T4xTzv/IiTG4Peb6/JK39jEYP41xDaIiEW4iYBuZAeVsgfCjFh8/hnJftn+5ti2
	mvug0+0EzPeO5Vlq8avsBrluiKo0Fgqfj53Ll9RQNXc88O49TKIb5U0w8hUQxMdyv5tiFbUnIXo
	6Yc6+7D4OfRMtneM+KpS8QobVzTR9b6x7+i16ZViHliRbNxDuKjqr
X-Google-Smtp-Source: AGHT+IE5s2eqxL5ESY4m6HYY5SZYPbPnzuqSSy5OTggf0gfyDfz/El0P6CZkq4NVLmBBSQnvtzsrrg==
X-Received: by 2002:a05:600c:1389:b0:45c:b580:f795 with SMTP id 5b1f17b1804b1-45dddedf80fmr129952235e9.34.1757513009050;
        Wed, 10 Sep 2025 07:03:29 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:28 -0700 (PDT)
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
Subject: [PATCH v6 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
Date: Wed, 10 Sep 2025 17:03:02 +0300
Message-ID: <20250910140305.541961-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 61 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

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
index 8a7f167e405e..c58bf19993c1 100644
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
@@ -110,6 +125,48 @@ static const struct regmap_config rzg2l_usb_regconf = {
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
+	struct regmap *regmap;
+	const int *data;
+	u32 args[2];
+
+	data = device_get_match_data(dev);
+	if (data != (int *)RZG2L_USBPHY_CTRL_PWRRDY)
+		return 0;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+						      "renesas,sysc-pwrrdy",
+						      ARRAY_SIZE(args), args);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pwrrdy = devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
+	if (!pwrrdy)
+		return -ENOMEM;
+
+	pwrrdy->regmap = regmap;
+	pwrrdy->offset = args[0];
+	pwrrdy->mask = args[1];
+
+	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
+}
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -132,6 +189,10 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
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


