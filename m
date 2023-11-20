Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D197F0C37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 08:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjKTHBt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 02:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjKTHB2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 02:01:28 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593E810E3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:19 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32df66c691dso2519242f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463678; x=1701068478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yBkbxKpLkdzu8TroZcwVDsvjYmMySviJb9k2OoKPHc=;
        b=PkY0X6Nv398e4Sr7Kp63amngG5RC2KGwr/I2OyCH1fHCZ1DcSKnCs+E3jO5fdswDtq
         oVzMIoQCtcrWHyW5aFFuv0ZvDCVfVk0DbAal5phsUht+2hYFycFNAtp+C1Y1VlB4hUUO
         bi17dqxWXF1uG2W/rR9J0JI4zUKOoEG+ddp886Ys6xlkzHMaW6L/kbwGywoG1eIkMIlz
         /4fLHoa25dmAdyUGG453Id9oowjrS0Chqfi9AG2ewvxUprzrSk9tjE94pQBS2OnxMwPn
         FKRP/hj5MfDfrbvnE1ACqWGAGIP8RDflgoiDFT1zOPvYwJuqxB34zgMAvtttgy/TKIf1
         OWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463678; x=1701068478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yBkbxKpLkdzu8TroZcwVDsvjYmMySviJb9k2OoKPHc=;
        b=GyTn9zVnkKCKz6b1KKVh+0D3GxhNpuCenmnUPWeuFKAsTSxmfakFgm9LA4FxUF178u
         0Yu7u8cJxGz8iiOREuHt31JAjLnQblLcmIOdrqg6d5WXyfcZ9FcYyJ2ZJjqlAonZwcm4
         3AMR4Y/selGN7ShjBwKnbgzOA1C9Ih9TLfkPwsrUyjtWcI2DTLzuP/qlX3GbN9CJWIPr
         CvJBIroq16fALij1kYIZ1gaFtXnbhMnYyKqFr1MQSE7WkFKbra2qCgp2qU9FyqjNL0h4
         BrEiUdAIEh3GHOf3oFvbXtQfiZ8JqO/kwGTc34uq63zq5HfctUfbXADn6WdyPQqVKoq+
         JRPA==
X-Gm-Message-State: AOJu0Yx5F2m3r5wt5hLlFkAvzL/ZF2dUWcLQaaK/MwiGDqVK5kwbzL4M
        JfdvW8ubNkeZVF5YOtRIl/swCA==
X-Google-Smtp-Source: AGHT+IEPTvrlAu+VvOjBroCtZwfyyx72WyB2QI68c/uyOeVwTN6V2mFBfXCQiOokeZGoyFFtng1FMg==
X-Received: by 2002:a5d:6d0f:0:b0:332:c4b4:2a8c with SMTP id e15-20020a5d6d0f000000b00332c4b42a8cmr2589984wrq.43.1700463677833;
        Sun, 19 Nov 2023 23:01:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:17 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@armlinux.org.uk, geert+renesas@glider.be,
        magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de,
        m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com,
        broonie@kernel.org, alexander.stein@ew.tq-group.com,
        eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, claudiu.beznea@tuxon.dev,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/14] pinctrl: renesas: rzg2l: Add support to select power source for Ethernet pins
Date:   Mon, 20 Nov 2023 09:00:17 +0200
Message-Id: <20231120070024.4079344-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

For Ethernet pins GPIO controller available on RZ/G3S (but also on RZ/G2L)
allows setting the power source. Based on the interface b/w Ethernet
controller and Ethernet PHY and board design specific power source need to
be selected. The GPIO controller allow 1.8V, 2.5V and 3.3V power source
selection for Ethernet pins and this could be selected though ETHX_POC
registers (X={0, 1}).

Commit adjust the driver to support this and does proper instantiation
for RZ/G3S and RZ/G2L SoC. On RZ/G2L only get operation has been tested
at the moment.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 34 +++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 819698dacef0..1401bb215686 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -107,8 +107,10 @@
 #define IEN(off)		(0x1800 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
+#define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
 
+#define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
 #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 
@@ -135,10 +137,12 @@
  * struct rzg2l_register_offsets - specific register offsets
  * @pwpr: PWPR register offset
  * @sd_ch: SD_CH register offset
+ * @eth_poc: ETH_POC register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
+	u16 eth_poc;
 };
 
 /**
@@ -604,6 +608,10 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
 		return SD_CH(regs->sd_ch, 0);
 	if (caps & PIN_CFG_IO_VMC_SD1)
 		return SD_CH(regs->sd_ch, 1);
+	if (caps & PIN_CFG_IO_VMC_ETH0)
+		return ETH_POC(regs->eth_poc, 0);
+	if (caps & PIN_CFG_IO_VMC_ETH1)
+		return ETH_POC(regs->eth_poc, 1);
 	if (caps & PIN_CFG_IO_VMC_QSPI)
 		return QSPI;
 
@@ -615,6 +623,7 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u32 val;
 
 	if (caps & PIN_CFG_SOFT_PS)
 		return pctrl->settings[pin].power_source;
@@ -623,7 +632,16 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	if (pwr_reg < 0)
 		return pwr_reg;
 
-	return (readl(pctrl->base + pwr_reg) & PVDD_MASK) ? 1800 : 3300;
+	val = readl(pctrl->base + pwr_reg);
+	if (val == PVDD_1800)
+		return 1800;
+	if (val == PVDD_2500)
+		return 2500;
+	if (val == PVDD_3300)
+		return 3300;
+
+	/* Should not happen. */
+	return -EINVAL;
 }
 
 static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps, u32 ps)
@@ -631,17 +649,27 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u32 val;
 
 	if (caps & PIN_CFG_SOFT_PS) {
 		pctrl->settings[pin].power_source = ps;
 		return 0;
 	}
 
+	if (ps == 1800)
+		val = PVDD_1800;
+	else if (ps == 2500)
+		val = PVDD_2500;
+	else if (ps == 3300)
+		val = PVDD_3300;
+	else
+		return -EINVAL;
+
 	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
 	if (pwr_reg < 0)
 		return pwr_reg;
 
-	writel((ps == 1800) ? PVDD_1800 : PVDD_3300, pctrl->base + pwr_reg);
+	writel(val, pctrl->base + pwr_reg);
 	pctrl->settings[pin].power_source = ps;
 
 	return 0;
@@ -1891,6 +1919,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.eth_poc = 0x300c,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -1903,6 +1932,7 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.regs = {
 		.pwpr = 0x3000,
 		.sd_ch = 0x3004,
+		.eth_poc = 0x3010,
 	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
-- 
2.39.2

