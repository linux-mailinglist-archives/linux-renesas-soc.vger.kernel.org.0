Return-Path: <linux-renesas-soc+bounces-21328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F495B43A78
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7DC3B4527
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C70C3002B0;
	Thu,  4 Sep 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTRx7BmR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE12FF64B;
	Thu,  4 Sep 2025 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986140; cv=none; b=Lfwrd/xUV16f2CKBH0cUAtBkZEOKUKcVVP/PBdTmFE+bNfliTDFNfKCVT8SGKcRKtPeO2k8Yz8Api8ecNoTvaz2sneWdfr/0F1Do2lguAcIMW1XJyFrAasY1ATsgLObuYpdER/zuoF0pnkCDoIm2oz5KSlt5PRmLrGtpfVj/5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986140; c=relaxed/simple;
	bh=hyWYSvFa6tpF4Y2BAIs+YgMyeqZXTqaGk0/0nvLMFAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCnUOUVD+kjs5Jdu/6v52BXZbk92QzdezYOa/j5WAaOJdnN1db2zZmSoY/kZiEF8VwpFP3yh/NQSqPZICvuN6AJuH9Ygk7y4reG4JHGo71zu9MjB97n3wv17MAh2x26QRi0qIJsi+9p/M1p7uyv9p3ij2kIkMMNiCl4s9LBQ1M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTRx7BmR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7c56a987so4381295e9.1;
        Thu, 04 Sep 2025 04:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986135; x=1757590935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8FKmtGi1QakWxx1ut7+vq4SNtntAlPKBe+ilmYSz5c=;
        b=LTRx7BmRwk9BH6rsnE4CpkvTwPXknAXLJpYqp+7kO6//AWHJY0hu/yPZOj79TSpioH
         BeI3wvWJ1LhT7Di9KAFySXZ52nGaYM30Vglz1G4wAKFJ25G5xKm9W5U7UTAJwQ9POraX
         IcFe3jEbaZrtbplFid6YRg1kz/4xvL9+LC85xvttQw/wHBaa3qjrt/Es4d7SRTaksEL5
         nFFiHYlt/e8/Db/VYEkEtqi6IABz51p4UjnXN6bAskTpXAb3eKy4pRshiOAx7tJ7Q8U6
         UW89OodmUp+52v3CKHwCywJ5zzKvclzOXyN8pO9ImRvF+piWaRfTB/Uwl4tAea3UUQnL
         aEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986135; x=1757590935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8FKmtGi1QakWxx1ut7+vq4SNtntAlPKBe+ilmYSz5c=;
        b=Kdfvc+1k85IZ67FNukUN2gYoAiZR/kF3FEw7DBuslV12epoliBGbhuGGGPcIbeL53N
         RFB0LPmCbRdVb0R5tQrtoAE6FJLWIBpK3udqz51ZmfVkV1Z/6V4PZlmZkjSMy4Iy2XT+
         L3wGieEOytNw1+q/2gbNZYXH4gfGZTVOu92uxFyLon2v2n2r5oXq5gjTMzNnuSv58yh5
         wlpmI7wBoRCB+k5xXwQsBYyzDfXhlzOJ9kpIhcggYkvoP3F3ThEfO1zIUT+P1T+y6+YU
         2YB6b5OBSHwlVIpuQprCDZCa/6ihSRioaMQQBDPOz4Ycd2r3qET7G//bNC/O1QEq64JY
         UDuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUmAkDGfwYW/ciiEuqEREbfjjEADo3CSNEtqSUWeQ3dwbp3VSJWWQ0+Xh1VVsWqCcy5SjYYG52Wik9Mfo@vger.kernel.org, AJvYcCWSiE7x+/4qmMZtaQw5uBsH5Gk1X6djJHpGQGWJZv2MmCanOisky7Bsl0RWEjbsmmska6+EB+hSgn/b@vger.kernel.org, AJvYcCXALPJxUKtYW0NMLGoFSsYkMsx9q77D8y7Xj54EhyEMQvqbvRXcSTBH6S3gnOEbBDxd9IS+3KEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7y5MI2NJBXxcMeYTL+KT/GwYfS+qCl+OTbLq+M3iWlEYNMpHX
	IMRxLeqYlPUGir1b/Gm9UI6P4X31qVO8005GNABfqYzo4SP2szO9NpHE
X-Gm-Gg: ASbGncvLi4xnzXBI68muH/AGSwEgHldTKhQkRRI0yg3zIQa244g9qJZZ4bmrRPPJ4fI
	6+CYx8+i49gPsE5n7qUMd1aCx9I3s9ZLkVfV4DI4H2HmzGP+kj9fbqk1VTTedCN5yeCFnHgJvt1
	/uIJqaQ+Y7CCNFuEKzD/s21wDcqMWbYOXUCMvrh+AqGQMy952mT6Eayp+3wod4/cJ9rACKY381V
	Wspxk5DMBbg2Bj83+kxhcdWJrvY8IT+1G7/mBjkwO8/rVshnf0EmBSUrorBX3q9JK+fWmM+IJw+
	0xPQ1BSRHRcrNH6VOkL3oc6hVAG6fv41DAvk7W8Bpyu9YgO2MBfo8O4ShLj+4MBUMXmiA3UseRq
	v8DdAcmmCTSncd2i2m9p02SQUfm0ZtLAyC+AkmFlEav6dxDKM9kjAdld1Fw==
X-Google-Smtp-Source: AGHT+IFO0DQ943JtXSsqZ/NUdlqcpZocW4XYSmFqUsbitkGA04CB8I7rPFOl1bpQsVtrZXMXehkpmA==
X-Received: by 2002:a05:600c:1e8b:b0:45b:8324:d2fc with SMTP id 5b1f17b1804b1-45b8549c384mr162884685e9.0.1756986135347;
        Thu, 04 Sep 2025 04:42:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:14 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/9] net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
Date: Thu,  4 Sep 2025 12:41:58 +0100
Message-ID: <20250904114204.4148520-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move configuration data such as the modctrl matching table, converter
count, and string lookup tables into the SoC-specific miic_of_data
structure. Update the helper functions to use the per-SoC configuration
instead of relying on fixed-size arrays or global tables, and allocate
DT configuration memory dynamically.

This refactoring keeps the existing RZ/N1 support intact while preparing
the driver to handle the different configuration requirements of the
RZ/T2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 107 ++++++++++++++++++++++----------
 1 file changed, 75 insertions(+), 32 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index adf4b5e4741c..724bac86cf8c 100644
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
 
@@ -414,53 +438,57 @@ static bool miic_modctrl_match(s8 table_val[MIIC_MODCTRL_CONF_CONV_NUM],
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
+		dev_err(miic->dev, "%s: %s\n", of_data->index_to_string[i], conf_name);
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
+	dt_val = kmalloc_array(miic->of_data->conf_conv_count, sizeof(*dt_val), GFP_KERNEL);
+	if (!dt_val)
+		return -ENOMEM;
+
+	memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
 
 	if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
 		dt_val[0] = conf;
@@ -473,7 +501,10 @@ static int miic_parse_dt(struct device *dev, u32 *mode_cfg)
 			dt_val[port] = conf;
 	}
 
-	return miic_match_dt_conf(dev, dt_val, mode_cfg);
+	ret = miic_match_dt_conf(miic, dt_val, mode_cfg);
+	kfree(dt_val);
+
+	return ret;
 }
 
 static int miic_probe(struct platform_device *pdev)
@@ -483,16 +514,18 @@ static int miic_probe(struct platform_device *pdev)
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
@@ -529,8 +562,18 @@ static void miic_remove(struct platform_device *pdev)
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


