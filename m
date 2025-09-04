Return-Path: <linux-renesas-soc+bounces-21331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABBCB43A84
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 830A01BC2C7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CAB302CC2;
	Thu,  4 Sep 2025 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gabkHIIT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89423019CD;
	Thu,  4 Sep 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986144; cv=none; b=iLxGWoQzgnHgCaHX2kYbS5IEZwTXkZeO+eR+3vGnd/ifxcXujEFnzT7RSXA4FV5p0bRGX85Q+JK1qpC0if47IFXWbiFIlaAyS2Vbr+frg2nH58AGNul6JL22K0PopFVp/Swo8ahzC2lG4w6kzdIMpVPVvZWT/1YkiKaP+znaAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986144; c=relaxed/simple;
	bh=y6DApRFj47DjUh7Xkyy2CalS5c0f9uL2mRhHLPlL8PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlcCMXvBOXz02DVVGYAH6fSjjzcq4QxysnSk68qNlElsbxQ63nfVSAzZqgFf+rwqYeyxkfEr+sVBfvEghIE+DQvYUb9DSmxgmrqZkmcbHmNsAxH4ay/kZ0A78oZ7gsLscQeJv6aw7SQKD1vsjAVVk33IV96hd/5Ivz/yAvB36j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gabkHIIT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso6527495e9.3;
        Thu, 04 Sep 2025 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986141; x=1757590941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4CH3/iWgc9FpGVwdcciZa3ZioBnVSrSHTqchBQK2fI=;
        b=gabkHIITcdmLMRxLSWPq8F72QczUlCp5tlOb0dDmN/RuUIYzTnTZn7ylgZZ7LCakmv
         l7YKS/unRpTzkr+8iE5qEzxO367M6womipIYi5GYkJStwjggvv56LEfnSWL5iemYMjCQ
         cy8hCKQaSCbkxgzwig4v1Qnf/RQvTTooV9jawQ/lyqlDmsQFpZEi4lvB6KW77vL4rtJn
         /CMxoyVkeKlcpkxsdvyFJlB0yLYx6tUfKvnoyvvL/euFU+I2StyPi36II3mnGi8cl4so
         gfiF0RYJ4OMgAr5V0vsoE30rC6PGpT9P0niMk7HcTo07qW0A+qg/4kYroJe1US9BZZZo
         G0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986141; x=1757590941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4CH3/iWgc9FpGVwdcciZa3ZioBnVSrSHTqchBQK2fI=;
        b=f2H1YKuVm37p18T2KW9mDK7ffsbPXtejzybv4pODHa5TTU148X9KBjp4GtuoeXgw3h
         Ar/F4IDU0tlkj8AurDWy597l2+zTkPwWfiDQNW2teG9NPAkCXxv51vDOexP2DxT0EdcF
         VtXTvtjAxfHnQk7m0Yb90BU7VzyHlUooIAskm6XED0dTv/C3rpp02LlvLZYFpeauyy+c
         3mbZuyw7e1/1EwXyM1EZIohVgsmsyXyP5RfyUMunTCSJRXp69fnuqheJb1P94ChmQf1C
         JxiwT3U6mwwId9JtIJaYnHEcJPndMxuXLBZYuGan417Y317QiKP1iUBeO5q6bk1U+9yX
         Ub8A==
X-Forwarded-Encrypted: i=1; AJvYcCUfzHhhadosbeQToo/m9wVtSFydYqm9wMuN02HDJO8oyD01nBYUTMsRfXoH1nV6y3rYJFgc0mhZ@vger.kernel.org, AJvYcCV8g/ccmIak9kYmhvIa5GV0MsMm3ijG8U80woVmL8QAjtqnlddlD6I0pkO/Z1sNUZSR26Xltc10Bfuv1dc/@vger.kernel.org, AJvYcCW1DyTUcHH2Hr9VCWUg2KzKIOongqQgMJtbIgeOVsKXSqtB+71cJcUwOWU0TRc7MctxoeOCBDmRwgfS@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMf1/BSDGEg3T4KP8MsZ4cPkk+z74KftWUW/oQII1L3ybTb1v
	3N17F8L1kOCH5G9Gf7lMD0769uahHaoTTg0jtrGDoDE+Lfxk0fU3+r0R
X-Gm-Gg: ASbGncvJRxcZ9jXNLwtPAXbw4Sq9QOIvqn4Vo3lM4tVll9DT9pyDunsrlleXnDurjZx
	TLP0vU3q0W0MRgF6MXI+sb/lnGHgm0bOvwWdNoIwBVBGOBjiM7Yfu/p5SseRvnt88bgd3KblDoa
	sm5h8nd30iTTsyt02PS0OU74ITZnNfeTuyRZlIu7ANoXpNrS18zw/Hek/63mTUEkV7BtjaDokVj
	0q8uIgqgvU+2b6Wh/IznaeSkOwDJtRWKF4VvzJipbWr+X7Ikdnyw4jGRhAvhGIdHkE/S4OeLhcy
	/NbPr2sSHwjQf+TbAMzePkLuM9jd7dEdpW7/u/KIvd119ceEg6L6pCZZhCnIxsXkln2efWiEtFk
	DfXW1GCj1skwCjUVFPEzpfLMEQV30i0WakSPSrDmNcOHgguU=
X-Google-Smtp-Source: AGHT+IGkTD9UmS6np1gg0rMm++OskYYU24xj5k750rxiRVQOMjPVxFqK65v2EzPiU7mHufKOXlH8yA==
X-Received: by 2002:a05:600c:4e8e:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-45cb6016789mr44973285e9.23.1756986140983;
        Thu, 04 Sep 2025 04:42:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 7/9] net: pcs: rzn1-miic: Add support to handle resets
Date: Thu,  4 Sep 2025 12:42:01 +0100
Message-ID: <20250904114204.4148520-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add reset-line handling to the RZN1 MIIC driver and move reset
configuration into the SoC/OF data. Introduce MIIC_MAX_NUM_RSTS (= 2),
add storage for reset_control_bulk_data in struct miic and add
reset_ids and reset_count fields to miic_of_data.

When reset_ids are present in the OF data, the driver obtains the reset
lines with devm_reset_control_bulk_get_exclusive(), deasserts them during
probe and registers a devres action to assert them on remove or on error.

This change is preparatory work to support the RZ/T2H SoC, which exposes
two reset lines for the ETHSS IP. The driver remains backward compatible
for platforms that do not provide reset lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index c0aa93fd7274..d97554e203f0 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/mdio.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -17,6 +18,7 @@
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 
@@ -52,6 +54,8 @@
 #define MIIC_MODCTRL_CONF_CONV_MAX	6
 #define MIIC_MODCTRL_CONF_NONE		-1
 
+#define MIIC_MAX_NUM_RSTS		2
+
 /**
  * struct modctrl_match - Matching table entry for  convctrl configuration
  *			  See section 8.2.1 of manual.
@@ -126,12 +130,14 @@ static const char * const index_to_string[] = {
  * @base: base address of the MII converter
  * @dev: Device associated to the MII converter
  * @lock: Lock used for read-modify-write access
+ * @rsts: Reset controls for the MII converter
  * @of_data: Pointer to OF data
  */
 struct miic {
 	void __iomem *base;
 	struct device *dev;
 	spinlock_t lock;
+	struct reset_control_bulk_data rsts[MIIC_MAX_NUM_RSTS];
 	const struct miic_of_data *of_data;
 };
 
@@ -147,6 +153,8 @@ struct miic {
  * @miic_port_start: MIIC port start number
  * @miic_port_max: Maximum MIIC supported
  * @sw_mode_mask: Switch mode mask
+ * @reset_ids: Reset names array
+ * @reset_count: Number of entries in the reset_ids array
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -159,6 +167,8 @@ struct miic_of_data {
 	u8 miic_port_start;
 	u8 miic_port_max;
 	u8 sw_mode_mask;
+	const char * const *reset_ids;
+	u8 reset_count;
 };
 
 /**
@@ -518,6 +528,16 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 	return ret;
 }
 
+static void miic_reset_control_bulk_assert(void *data)
+{
+	struct miic *miic = data;
+	int ret;
+
+	ret = reset_control_bulk_assert(miic->of_data->reset_count, miic->rsts);
+	if (ret)
+		dev_err(miic->dev, "failed to assert reset lines\n");
+}
+
 static int miic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -541,6 +561,27 @@ static int miic_probe(struct platform_device *pdev)
 	if (IS_ERR(miic->base))
 		return PTR_ERR(miic->base);
 
+	if (miic->of_data->reset_count) {
+		u8 i;
+
+		for (i = 0; i < miic->of_data->reset_count; i++)
+			miic->rsts[i].id = miic->of_data->reset_ids[i];
+
+		ret = devm_reset_control_bulk_get_exclusive(miic->dev,
+							    miic->of_data->reset_count,
+							    miic->rsts);
+		if (ret)
+			return dev_err_probe(miic->dev, ret, "failed to get bulk reset lines\n");
+
+		ret = reset_control_bulk_deassert(miic->of_data->reset_count, miic->rsts);
+		if (ret)
+			return dev_err_probe(miic->dev, ret, "failed to deassert reset lines\n");
+
+		ret = devm_add_action_or_reset(dev, miic_reset_control_bulk_assert, miic);
+		if (ret)
+			return dev_err_probe(miic->dev, ret, "failed to add reset action\n");
+	}
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-- 
2.51.0


