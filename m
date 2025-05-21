Return-Path: <linux-renesas-soc+bounces-17315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3CABF76E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64F6188D9A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EA627FD65;
	Wed, 21 May 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EgLOZ28Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4056927CCD3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836625; cv=none; b=I2qmtPxuCdjdMGuKZhgmXTCdtJ2EOrqmTTTMfBpBEYOVPPyYaLzexcDtYWu/WiHVCaZ+eDKYlUL/BkAuSHMs/6UxUvgnJaI10d5IdICyP8B9wdssYRwU6W955GGmpoiTxAgGV5lUbxD9N8CIZe0jdP7Pf93L/q3SQZV5UgOE2gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836625; c=relaxed/simple;
	bh=Az+WRuJmivDqEeUEdZfnWqsUv68yWzvmzPP0mU0Nl68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nfqos6/YMAItWu6IiCmrAfh6vYgrgZ+ijOVk91DJT81+d7o/cjiehuWmrFhhOuk5QJatajfMJsR1wcYGKqvh94JIck/trUSU1NUsMIvDcQ2xmTGfVCED4TcQ0xpr3V45khBqKG796eKTLtKN9N8h47dMbUXVKxBspJeg9DHnB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EgLOZ28Y; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso12465897a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836620; x=1748441420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMr1c7H4ua8HyQsbUY+52oyXxX9NsTNKh6apnAN2ilQ=;
        b=EgLOZ28Y+DyCcXqZIf0lHUmxRIJRnYazwG3c60AH0Fu4bztF4SndUx6GtcGZnABqR6
         CuP07GXr1x3dUry/VMhVuuMM3nE54urJs0AiOMsrFHafEHtEOK2eO+Odu4mZE00uv7T4
         eSgLnyK6cnS6TNyv+jWfAZKrWerzdU8jTO28zyE/ICSEtxQdRuphT0/ESCxbjfkGyomV
         JmHTv7bHgXLf93q1Lqy33QKfUUqNiMKvQIfAjXqEdQOgVkIg1X1u/dWiPYfd9AiDCG/7
         9+LFetHWzudh62KsHSctA+AuV1YTGuDDSfaDiyR5HD/cLBHcPEuf5DkwMJuZ1IJDxjIe
         L1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836620; x=1748441420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMr1c7H4ua8HyQsbUY+52oyXxX9NsTNKh6apnAN2ilQ=;
        b=CwJ879M6f4NSUiOZv14MoHpStcfCy3TF1hFGAI1XFzy6JAk9doM4VpJYua2lePmRGR
         AaZkO+WLYKWbQNL/uuo5AHqu9lBD+Jpz5jLz87eqvPzZ7k5/zBVa+jTYzkc6aIJamNLi
         IZMcgtt4yhNAKgs9mYL7HW/nwzjEaC4RtUM7v19Dy4NAJruRRhvMjWcQSFDhWDDS2FcC
         FDrh7gWkpI4VnpIpp3zwSh1kDqhH9qUblrN/XIrG8A0ad2ewFjEBsRbVGwta7bcg0mxL
         6LAeECtAOZa4JnMiZh3/2+wrLZn1WPKpRPFmH1oVrN/Y6X5H+xmiBHzTuI2BykJzMYQW
         9yOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQPTt7kxweTHF0N0xdQpnWkQExopXXK1XQn/IpZ6p+0aPJSuuHRu035HwhJfNqK1TR0QpmnNqwI4u/276bjvYKTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM/qFZr+GLHvGSP6r/chpiID4pJqW9k+EaLaFqByQZGkt4dKtN
	iha/p2YIU/G4lcFMH/tny2iJ33HkCWhx04favLgQMztSgYZ8dUcG87RV3jO9aZcaIB4=
X-Gm-Gg: ASbGncshJo42sTkRS9Q7zqGyA4ChbOYornLocXebFBozTDljRgaQrFbJS0lFp6xoOtP
	pvC44pX1kfLQGNWksbJdyPS0tFgB2oKgF34xKuYXjnD7bBOTRgtA/dNWgDay2mToCLLlZ5VUdv0
	M68KTvE4r9SXoFjtL6FGyuW9miwrGfgHLMtTpoyFXNBHhamBALjybQy/BDTTCyJYX73BvBr9F3e
	1eZFlR8tvhPD/IDk0CD9Wdj8Oj3hQFHqEt9U/sBhe8nRPqsObwPHHptCEscRIdPhWhdTCnB8G61
	LHLTE6z3yQfG6wTbYi/7143c5uqzUppLIFFM0yXJdmAeU1kL6jK4/RSrI7VymgIumVP9t8RAC40
	dzP2T
X-Google-Smtp-Source: AGHT+IGBHfefG3/yrGTJ8kHNMTqVntTKHlgdpjxlB1ZufHxNkv2SZGyTl2bOKe8apeXCL9qAsQK9CQ==
X-Received: by 2002:a17:907:7252:b0:ad2:39f2:3aa8 with SMTP id a640c23a62f3a-ad536f9d574mr1954638666b.38.1747836620471;
        Wed, 21 May 2025 07:10:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:19 -0700 (PDT)
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
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 08/12] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY signal
Date: Wed, 21 May 2025 17:09:39 +0300
Message-ID: <20250521140943.3830195-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
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
clock and switching the module to normal state (though MSTOP support). The
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
USB PHY ports requests resets from the reset-rzg2l-usbphy-ctrl driver.

The connection b/w the system controller and the USB PHY drivers is
implemented through the renesas,sysc-signals device tree property. This
property specifies the register offset and the bitmask required to control
the signal. The system controller exports the syscon regmap, and the
read/write access to the memory area of the PWRRDY signal is
reference-counted, as the same system controller signal is provided to
the PHY driver and the reset-rzg2l-usbphy-ctrl.

This approach was chosen to avoid any violation of the configuration
sequence b/w PWRRDY, CLK_ON and MSTOP bits specified above.

Add support for PWRRDY in reset-rzg2l-usbphy-ctrl driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8a7f167e405e..016aae883b2e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/soc/renesas/rz-sysc.h>
 
 #define RESET			0x000
 #define VBENCTL			0x03c
@@ -35,6 +36,7 @@ struct rzg2l_usbphy_ctrl_priv {
 	struct reset_control *rstc;
 	void __iomem *base;
 	struct platform_device *vdev;
+	struct rz_sysc_signal_map *pwrrdy;
 
 	spinlock_t lock;
 };
@@ -91,6 +93,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->base + RESET) & port_mask);
 }
 
+#define RZG2L_USBPHY_CTRL_PWRRDY	1
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
 	{ /* Sentinel */ }
@@ -110,6 +114,40 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
+static void rzg2l_usbphy_ctrl_set_pwrrdy(struct rzg2l_usbphy_ctrl_priv *priv,
+					 bool power_on)
+{
+	struct rz_sysc_signal_map *pwrrdy = priv->pwrrdy;
+
+	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, !power_on);
+}
+
+static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
+{
+	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
+}
+
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
+					 struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	struct rz_sysc_signal_map *pwrrdy;
+	const int *data;
+
+	data = device_get_match_data(dev);
+	if (data != (int *)RZG2L_USBPHY_CTRL_PWRRDY)
+		return 0;
+
+	pwrrdy = rz_sysc_get_signal_map(dev);
+	if (IS_ERR(pwrrdy))
+		return PTR_ERR(pwrrdy);
+
+	priv->pwrrdy = pwrrdy;
+
+	rzg2l_usbphy_ctrl_set_pwrrdy(priv, true);
+
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv);
+}
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -132,6 +170,10 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+	if (error)
+		return error;
+
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
-- 
2.43.0


