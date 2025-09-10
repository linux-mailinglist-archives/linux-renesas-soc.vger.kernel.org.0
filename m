Return-Path: <linux-renesas-soc+bounces-21743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9DB5227A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 481187B6EC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA6D3002B5;
	Wed, 10 Sep 2025 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDLYPJTp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052042FB08E;
	Wed, 10 Sep 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536905; cv=none; b=kklt70ZP8o1zreiMo7JkkkyufZh3gTUTp9GzlYXOLhOGtIvUs0R/t3Cl2W3Q6zRtPJ4iL+4TEC6HoTwjJgJup/bVOtJxfL0w1nOleNsePy9F/kBJVHfcrqgxwaoEaa9qGzoqTv5ELL1J59PfxclJMsd082IvxrhbhMXbX58Pv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536905; c=relaxed/simple;
	bh=bEiUpMpfGkjjyaIroFKaX0vERzCrAuQ7TPam5z2TtFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIBZSLUUAzcwEzhpAv7CA9Y/kdTAHPZvBBeI0+pf2E8yD6+M/Pdxkqa4xLbiCb5GHfYUTZV+Y1Agp3NRt2GYMYpHuYJsj3w1eHXpUupgkBVMeKaTDWEhrnBAu3w6mu45dAUhj4qUGRa+4l776Eo4XnbiA9T4NtiM2Gn2PpLfk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDLYPJTp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso296145e9.1;
        Wed, 10 Sep 2025 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536901; x=1758141701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6joIM1hAJCNP1RIY4h3EowIC47T3cJcUnhanfvxGns=;
        b=PDLYPJTpF9c9ySgsCLceTYM28PnE2UYFyHHGDoGu8kwKMPHMkh18zqgHh1flbJLm/v
         1nzUGw1OlNMH2U9RpGDXY1p/1Wwgd/xLX8tS220TfyYX29ogZJN4xCje16fvx6Vllp5v
         dPO/w48MWgu7CfXUs++TMylfM2vRsRxqs4BedfHe170FWZCjZ/uhZiCjsZyfo84m/L8A
         qP9sL71857wwurIKhrTbLT/JIWGoMeTzOCCBII+5PqWeLVJs8z9ezFSIx2Ttk+RQ5f0D
         YkmVWT+4k/OIMfCVX7vBNaQzRkKgzSRc5UIn3K55FERnm9VVgdWd55lM+1TNNyC6esFy
         PzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536901; x=1758141701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6joIM1hAJCNP1RIY4h3EowIC47T3cJcUnhanfvxGns=;
        b=oV/vIOF/uIUN3khwCYhqU3EMPR5AnYSE6Y8oBeIzioWfNQ9MJksTjf6mw0d4FCkHkp
         QwJFZE4CVs8SsnceAXQYytXklpzw9W8CUDy/seNDScH154oMq3au7fzlzHld1C2H1rvd
         VciN0WC0oPpT7/rghhkTtZ+2P1SmuoRkQbJ5HWrcHB1+/34hLlyv3low0WRvnlhe5Uuc
         /yd6u9t035qXcHdThKCRtvuMTY1gP2wTUGI0V320dG3jeqcX4ykWPK2eoaUMCRiYZ5OA
         np9qqmqo755InnbLaEqLvbu81/wSrCo769mDTfHkdghSlQoeujN6ZWEvAOjvRMe/XzhC
         /JIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPzWR38R1QBygKrUM7na+ILDo9AvwlXFiwLhLH74fCtW6sqjC1M87zkWGdKHZmc9R/X3L2BvVp95bj@vger.kernel.org, AJvYcCVuP6niJ6BvrJE6j49KlWDByAn1AKHz1CJxMb9AqDEPOzGsUn/WM3LdpglfObVQ9YwTeYIbTYRk@vger.kernel.org, AJvYcCWgfcWEZ3J1tHiHN14NiaDdKJNjhy/+yOMDmiP7JMP5OsxgvlfBBspL9Ir3o5txMAhIPAdlZ+ki4YybUWzW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UxLhDYqgWHfy7qLT+CJBz/egwVFLj9jcnW5pDhmOXXmgUV3m
	044VT4XQ5vxnWk/bc4id2M70jwEBF/iBPNOciDH9SYuwIb/6owlEdKPA
X-Gm-Gg: ASbGncu10CHVL8rJhYlhVpvlw0gGi6by9/IVdTs0IayHUVEWE7a+eChz6Z5/B0KHbzl
	wD1e4Qi5SPTCib5JBry3+d1llEdHefYk/9KZICHQ08H9gCaoq5cuqjKTC5xY+YxNffIGJ2gJLPH
	JJpE8dPTDY2A847dHdeaNEmbR4bXSS06qKfcgpISBU0K+3a6zNgmR+kqNEJWOAWszfvxMHIzisx
	cCzLweqXsrnskLb8tRmbnZM/sPb09pAaoQR3IAKF3jSmuwi7sw8ipZjgL0FHTdZtNFC/yUfnTZZ
	WxPNf8YAvJ0hNKWe+Vh4RBBskRCqBuNGbdxuIeAWWUXh/wOiLrIUXlpHN6PWTliQqhbtoI50qD8
	ynnSS1deONuoYeih0JybL0QgIwb4Ee2rkf4RgbLsB/e17GF8=
X-Google-Smtp-Source: AGHT+IG84udHfCcHkJ2ZVFW+RMWFz/+CmOTcOY4Mlcn5yW0MzFYkKU8ZWYr02S4SLsLuCmIEWPyEcg==
X-Received: by 2002:a05:600c:8b53:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-45de07ee689mr144669695e9.22.1757536901197;
        Wed, 10 Sep 2025 13:41:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:40 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 4/9] net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
Date: Wed, 10 Sep 2025 21:41:25 +0100
Message-ID: <20250910204132.319975-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move configuration data such as the modctrl matching table, converter
count, and string lookup tables into the SoC-specific miic_of_data
structure. Update the helper functions to use the per-SoC configuration
instead of relying on fixed-size arrays or global tables, and allocate
DT configuration memory dynamically.

This refactoring keeps the existing RZ/N1 support intact while preparing
the driver to handle the different configuration requirements of the
RZ/T2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Added Tested-by tag.

v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 109 ++++++++++++++++++++++----------
 1 file changed, 77 insertions(+), 32 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index adf4b5e4741c..afa0c2ffbd30 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -16,6 +16,7 @@
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 
 #define MIIC_PRCMD			0x0
@@ -50,7 +51,7 @@
 
 #define MIIC_MAX_NR_PORTS		5
 
-#define MIIC_MODCTRL_CONF_CONV_NUM	6
+#define MIIC_MODCTRL_CONF_CONV_MAX	6
 #define MIIC_MODCTRL_CONF_NONE		-1
 
 /**
@@ -58,11 +59,13 @@
  *			  See section 8.2.1 of manual.
  * @mode_cfg: Configuration value for convctrl
  * @conv: Configuration of ethernet port muxes. First index is SWITCH_PORTIN,
- *	  then index 1 - 5 are CONV1 - CONV5.
+ *	  then index 1 - 5 are CONV1 - CONV5 for RZ/N1 SoCs. In case
+ *	  of RZ/T2H and RZ/N2H SoCs, the first index is SWITCH_PORTIN then
+ *	  index 0 - 3 are CONV0 - CONV3.
  */
 struct modctrl_match {
 	u32 mode_cfg;
-	u8 conv[MIIC_MODCTRL_CONF_CONV_NUM];
+	u8 conv[MIIC_MODCTRL_CONF_CONV_MAX];
 };
 
 static struct modctrl_match modctrl_match_table[] = {
@@ -111,7 +114,7 @@ static const char * const conf_to_string[] = {
 	[MIIC_HSR_PORTB]	= "HSR_PORTB",
 };
 
-static const char *index_to_string[MIIC_MODCTRL_CONF_CONV_NUM] = {
+static const char * const index_to_string[] = {
 	"SWITCH_PORTIN",
 	"CONV1",
 	"CONV2",
@@ -125,11 +128,33 @@ static const char *index_to_string[MIIC_MODCTRL_CONF_CONV_NUM] = {
  * @base: base address of the MII converter
  * @dev: Device associated to the MII converter
  * @lock: Lock used for read-modify-write access
+ * @of_data: Pointer to OF data
  */
 struct miic {
 	void __iomem *base;
 	struct device *dev;
 	spinlock_t lock;
+	const struct miic_of_data *of_data;
+};
+
+/**
+ * struct miic_of_data - OF data for MII converter
+ * @match_table: Matching table for convctrl configuration
+ * @match_table_count: Number of entries in the matching table
+ * @conf_conv_count: Number of entries in the conf_conv array
+ * @conf_to_string: String representations of the configuration values
+ * @conf_to_string_count: Number of entries in the conf_to_string array
+ * @index_to_string: String representations of the index values
+ * @index_to_string_count: Number of entries in the index_to_string array
+ */
+struct miic_of_data {
+	struct modctrl_match *match_table;
+	u8 match_table_count;
+	u8 conf_conv_count;
+	const char * const *conf_to_string;
+	u8 conf_to_string_count;
+	const char * const *index_to_string;
+	u8 index_to_string_count;
 };
 
 /**
@@ -398,12 +423,11 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	return 0;
 }
 
-static bool miic_modctrl_match(s8 table_val[MIIC_MODCTRL_CONF_CONV_NUM],
-			       s8 dt_val[MIIC_MODCTRL_CONF_CONV_NUM])
+static bool miic_modctrl_match(s8 *table_val, s8 *dt_val, u8 count)
 {
 	int i;
 
-	for (i = 0; i < MIIC_MODCTRL_CONF_CONV_NUM; i++) {
+	for (i = 0; i < count; i++) {
 		if (dt_val[i] == MIIC_MODCTRL_CONF_NONE)
 			continue;
 
@@ -414,53 +438,59 @@ static bool miic_modctrl_match(s8 table_val[MIIC_MODCTRL_CONF_CONV_NUM],
 	return true;
 }
 
-static void miic_dump_conf(struct device *dev,
-			   s8 conf[MIIC_MODCTRL_CONF_CONV_NUM])
+static void miic_dump_conf(struct miic *miic, s8 *conf)
 {
+	const struct miic_of_data *of_data = miic->of_data;
 	const char *conf_name;
 	int i;
 
-	for (i = 0; i < MIIC_MODCTRL_CONF_CONV_NUM; i++) {
+	for (i = 0; i < of_data->conf_conv_count; i++) {
 		if (conf[i] != MIIC_MODCTRL_CONF_NONE)
-			conf_name = conf_to_string[conf[i]];
+			conf_name = of_data->conf_to_string[conf[i]];
 		else
 			conf_name = "NONE";
 
-		dev_err(dev, "%s: %s\n", index_to_string[i], conf_name);
+		dev_err(miic->dev, "%s: %s\n",
+			of_data->index_to_string[i], conf_name);
 	}
 }
 
-static int miic_match_dt_conf(struct device *dev,
-			      s8 dt_val[MIIC_MODCTRL_CONF_CONV_NUM],
-			      u32 *mode_cfg)
+static int miic_match_dt_conf(struct miic *miic, s8 *dt_val, u32 *mode_cfg)
 {
+	const struct miic_of_data *of_data = miic->of_data;
 	struct modctrl_match *table_entry;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(modctrl_match_table); i++) {
-		table_entry = &modctrl_match_table[i];
+	for (i = 0; i < of_data->match_table_count; i++) {
+		table_entry = &of_data->match_table[i];
 
-		if (miic_modctrl_match(table_entry->conv, dt_val)) {
+		if (miic_modctrl_match(table_entry->conv, dt_val,
+				       miic->of_data->conf_conv_count)) {
 			*mode_cfg = table_entry->mode_cfg;
 			return 0;
 		}
 	}
 
-	dev_err(dev, "Failed to apply requested configuration\n");
-	miic_dump_conf(dev, dt_val);
+	dev_err(miic->dev, "Failed to apply requested configuration\n");
+	miic_dump_conf(miic, dt_val);
 
 	return -EINVAL;
 }
 
-static int miic_parse_dt(struct device *dev, u32 *mode_cfg)
+static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 {
-	s8 dt_val[MIIC_MODCTRL_CONF_CONV_NUM];
-	struct device_node *np = dev->of_node;
+	struct device_node *np = miic->dev->of_node;
 	struct device_node *conv;
+	int port, ret;
+	s8 *dt_val;
 	u32 conf;
-	int port;
 
-	memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(dt_val));
+	dt_val = kmalloc_array(miic->of_data->conf_conv_count,
+			       sizeof(*dt_val), GFP_KERNEL);
+	if (!dt_val)
+		return -ENOMEM;
+
+	memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
 
 	if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
 		dt_val[0] = conf;
@@ -473,7 +503,10 @@ static int miic_parse_dt(struct device *dev, u32 *mode_cfg)
 			dt_val[port] = conf;
 	}
 
-	return miic_match_dt_conf(dev, dt_val, mode_cfg);
+	ret = miic_match_dt_conf(miic, dt_val, mode_cfg);
+	kfree(dt_val);
+
+	return ret;
 }
 
 static int miic_probe(struct platform_device *pdev)
@@ -483,16 +516,18 @@ static int miic_probe(struct platform_device *pdev)
 	u32 mode_cfg;
 	int ret;
 
-	ret = miic_parse_dt(dev, &mode_cfg);
-	if (ret < 0)
-		return ret;
-
 	miic = devm_kzalloc(dev, sizeof(*miic), GFP_KERNEL);
 	if (!miic)
 		return -ENOMEM;
 
-	spin_lock_init(&miic->lock);
+	miic->of_data = of_device_get_match_data(dev);
 	miic->dev = dev;
+
+	ret = miic_parse_dt(miic, &mode_cfg);
+	if (ret < 0)
+		return ret;
+
+	spin_lock_init(&miic->lock);
 	miic->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(miic->base))
 		return PTR_ERR(miic->base);
@@ -529,8 +564,18 @@ static void miic_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 }
 
+static struct miic_of_data rzn1_miic_of_data = {
+	.match_table = modctrl_match_table,
+	.match_table_count = ARRAY_SIZE(modctrl_match_table),
+	.conf_conv_count = MIIC_MODCTRL_CONF_CONV_MAX,
+	.conf_to_string = conf_to_string,
+	.conf_to_string_count = ARRAY_SIZE(conf_to_string),
+	.index_to_string = index_to_string,
+	.index_to_string_count = ARRAY_SIZE(index_to_string),
+};
+
 static const struct of_device_id miic_of_mtable[] = {
-	{ .compatible = "renesas,rzn1-miic" },
+	{ .compatible = "renesas,rzn1-miic", .data = &rzn1_miic_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, miic_of_mtable);
-- 
2.51.0


