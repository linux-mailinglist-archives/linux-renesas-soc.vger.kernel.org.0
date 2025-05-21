Return-Path: <linux-renesas-soc+bounces-17316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AAFABF776
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0167F8C13A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C40C27CCD3;
	Wed, 21 May 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K895cbOf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249519ADBA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836625; cv=none; b=LEWxq7x+1Jc2yIApRxxoysPKOcr/Vhi042Lb4QxD0AWnM2ZYqKGCrxvcWchbmRuBH9UkEhxQs0prEL7fz5zitzNlhI2jiYpbYzLtmsHcSrsRPmVYmPR7OdUG6ASThYqPoNilS4/BP/407ROEt7wSLRIuQlIJakuuMQ0bF9ywcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836625; c=relaxed/simple;
	bh=pXCGLN/YXB6Sq2vYBIy6JLZmqcn4vVjjvHKT82/yyqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTsD1v5wWiTZvKmMQY/o1jB43sg9FEWTEV49Qyn5v8Jh4N88HEEjGHFIds1csyvdNBmPT5TqowRc0C4ToVU3j7Ki14h4mN6ALgNsZMxEIJnlqgHHMReavwIv9bFfyziUeBqHVHdLM4/KAUc9xM9GLA6CuL52BOzOnMwQjarSy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K895cbOf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so7997378a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836619; x=1748441419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeOpQyWJZiQ+mtu3T4KGOPVHCQb9AMf6UyNQWk0Lyxg=;
        b=K895cbOfGg+JfskXsdXzR3TkqmRVU2n1SSfuh6FBaBRmTftItNwuhRAO2D2LNSCq3F
         Z93xaHaH9NoRgmpHjUTgzHFWEV6lbXlFapBv589uXT69U8bm1Ve+Y62f7fkDmyZy0fiE
         E8u/E0uDIGWjBgDItIzCINd62suA1mvLGLNDPlGHtSMcqYY69Gs3V8khFIDGcdxS/wln
         6WKCB+6jLbNSOdBKFeRFvsKKKY9t8GsHpNiCrdAYGu4oCnvxTt09A55Bgmg0UP0JxBjJ
         o+mQeTOMRitI+es8gfCSM6LELguqv7/k2FkD9dwt9H6hP2zyKdhPOFf4QY/fmkDp14Oa
         CUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836619; x=1748441419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeOpQyWJZiQ+mtu3T4KGOPVHCQb9AMf6UyNQWk0Lyxg=;
        b=C/XBAIVMXeyC0+aUYCKuMjd1PswOqnBAxyhpuRyJw4J9TTDW3e4e9yHbzpKU/wa8qT
         Lm+cLVOg4fbzyjzg4st5T8AMitCq/RaVM0plW0nqHPkmRk7pvjhMNNyxb2OMPemJsGxH
         imCwdx0bSXuUBABmfr1fjPSJNy6PPAk/hUdE99xcFSez7gpcNyw1hxezG8GaUSdgxwj3
         /cLMxq5IHOdMk0k/J8Hcn05HWbUMr7/3GJfIF1NK5diuCaDZ8RAZE0ZyHfKije2VBjFk
         Ud2idBAA7PW7Xn2f82N5cOC11m/kTYw6aB93Nt8uD71ziWEykeVvg+30J5VYRrlAQNNI
         wdbw==
X-Forwarded-Encrypted: i=1; AJvYcCVbYJQSwDrl8VtlMuYPMCp7+3eU6/OMoVhOR33FMxGUGlemuV1idiVYYGFih6lIk7yn9RMS6SUmluoEFbtydlD0Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVReNkMEIjgae6WdGqjNLTIs7oKrjP6xsukbV6nulOplJr9bkU
	Y73Uc8KJEKdRJAnt+uXewSMC/l6DUZnI7CFmRJIrMdgohufrPrsn87lHF8gxSF/qBU8=
X-Gm-Gg: ASbGncvnrOcAh2S+dr6rJ26gw2DvZ5odOwUR01oN2vb6gFBPhGePmp3obklAd61EXW6
	Nio4DmhrteGha88UQpe0rCR+/HJHPpT8354PaQ8jBtE0q+BqcaqUZF2xGgAXZDWko/A2Ft8cL9r
	my6veb8GsosUigN6Je+xbKUw4n+M+krpuyYm5wQMEjlkhhajgxUb7zEmHXHIQkcAt6KZxhEL1ej
	oZ5Jo4Tp1NhxBUZnwMXYHemqFXxmggS8Fd3vXlpVNvZtJkKfEBZ1L6iF44a2OAt6pyjsy/TrXEQ
	Y4hnySiIE9hS5De7CEhk73lCGmAg2dRYZEdBJTphVAbeW9b0vLUlky/Z/E0vOthDAZkZY+9syr7
	G4XJJ
X-Google-Smtp-Source: AGHT+IH5ci41C9yAPMwgOEhfMB1nQtbU71gdxFWm5mN4Is2ufqCQZ9p/teq2mbdaer1yF3Uy/Ak4ng==
X-Received: by 2002:a17:907:f818:b0:ad4:d32e:b571 with SMTP id a640c23a62f3a-ad52d4c8ef5mr1827428966b.24.1747836618730;
        Wed, 21 May 2025 07:10:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:18 -0700 (PDT)
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
Subject: [PATCH v3 07/12] phy: renesas: rcar-gen3-usb2: Add support for USB PWRRDY signal
Date: Wed, 21 May 2025 17:09:38 +0300
Message-ID: <20250521140943.3830195-8-claudiu.beznea.uj@bp.renesas.com>
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
reset-rzg2l-usbphy-ctrl driver (drivers/reset/reset-rzg2l-usbphy-ctrl.c file).
The USB PHY ports are controlled by phy_rcar_gen3_usb2 driver. The
USB PHY ports requests resets from the reset-rzg2l-usbphy-ctrl driver.

The connection b/w the system controller and the USB PHY drivers is
implemented through the renesas,sysc-signals device tree property. This
property specifies the register offset and the bitmask required to control
the signal. The system controller exports the syscon regmap, and the
read/write access to the memory area of the PWRRDY signal is
reference-counted, as the same system controller signal is provided to
both phy_rcar_gen3_usb2 and reset-rzg2l-usbphy-ctrl drivers.

This approach was chosen to avoid any violation of the configuration
sequence b/w PWRRDY, CLK_ON and MSTOP bits specified above.

Add support for PWRRDY in phy_rcar_gen3_usb2 driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- uses struct rz_sysc_signal_map along with rz_sysc_get_signal_map()
  to handle the USB PWRRDY signal
- dropped the check of pwrrdy in rcar_gen3_phy_usb2_set_pwrrdy()
- improved the patch description

Changes in v2:
- none; this patch is new

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d61c171d454f..ca50db84a90b 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -19,8 +19,10 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/soc/renesas/rz-sysc.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
@@ -126,6 +128,7 @@ struct rcar_gen3_chan {
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
 	struct reset_control *rstc;
+	struct rz_sysc_signal_map *pwrrdy;
 	struct work_struct work;
 	spinlock_t lock;	/* protects access to hardware and driver data structure. */
 	enum usb_dr_mode dr_mode;
@@ -142,6 +145,7 @@ struct rcar_gen3_phy_drv_data {
 	bool no_adp_ctrl;
 	bool init_bus;
 	bool utmi_ctrl;
+	bool pwrrdy;
 };
 
 /*
@@ -608,6 +612,7 @@ static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
 	.no_adp_ctrl = true,
 	.init_bus = true,
+	.pwrrdy = true,
 };
 
 static const struct rcar_gen3_phy_drv_data rz_v2h_phy_usb2_data = {
@@ -738,6 +743,35 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	return ret;
 }
 
+static void rcar_gen3_phy_usb2_set_pwrrdy(struct rcar_gen3_chan *channel, bool power_on)
+{
+	struct rz_sysc_signal_map *pwrrdy = channel->pwrrdy;
+
+	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, !power_on);
+}
+
+static void rcar_gen3_phy_usb2_pwrrdy_off(void *data)
+{
+	rcar_gen3_phy_usb2_set_pwrrdy(data, false);
+}
+
+static int rcar_gen3_phy_usb2_init_pwrrdy(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	struct rz_sysc_signal_map *pwrrdy;
+
+	pwrrdy = rz_sysc_get_signal_map(dev);
+	if (IS_ERR(pwrrdy))
+		return PTR_ERR(pwrrdy);
+
+	channel->pwrrdy = pwrrdy;
+
+	/* Power it ON. */
+	rcar_gen3_phy_usb2_set_pwrrdy(channel, true);
+
+	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_pwrrdy_off, channel);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	const struct rcar_gen3_phy_drv_data *phy_data;
@@ -792,6 +826,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
+	if (phy_data->pwrrdy) {
+		ret = rcar_gen3_phy_usb2_init_pwrrdy(channel);
+		if (ret)
+			goto error;
+	}
+
 	if (phy_data->init_bus) {
 		ret = rcar_gen3_phy_usb2_init_bus(channel);
 		if (ret)
-- 
2.43.0


