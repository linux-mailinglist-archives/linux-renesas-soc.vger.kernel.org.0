Return-Path: <linux-renesas-soc+bounces-21329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC0B43A7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E6A1BC14D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E29E30101A;
	Thu,  4 Sep 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIePWQ5V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE182FFDE0;
	Thu,  4 Sep 2025 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986140; cv=none; b=lERsMsrUBhtacfJn4WDGgJXe4SOHukWo1JZeqv/utqAzdnQ3/v0fkCFbZTdyMPTpSqoEo1GmQ3WplbBKed8gIKCZGbRsMbnmfxX0PB/FVz+obk3G36NtXbf1sh19zfZQAP/zLuBy8iIDfZBdCELdBmycPSFFTwzKsMCe3t6nPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986140; c=relaxed/simple;
	bh=B84gwqS6nv0EEYGOs4F76lmNItDiKC98HhRJtXhquTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OiprvlfvMA4pOA8EAR/mW+9iySP6F+F9LUKG36eAIuWxBHg4rLKkGAxlzKCHioNK26h0THTyrrUJwGK0nLHKlXvmBLeVF0MvFMqPZCm2c6h9EcdHgezhTuMo3xck68H+7b6AIBebg3lgp3vDjYydnOIZ0k0QgLy2FEzMx0SJbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIePWQ5V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b9853e630so8409345e9.0;
        Thu, 04 Sep 2025 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986137; x=1757590937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfzdh/iENN/JZiCLP2w1ErIldr+h6FYbADs6+tNjxpM=;
        b=OIePWQ5VpgaqAr+pVj/HQ8WsXYWHjuVyIKFNcbcWKuCaIqZ9Ev4FeNfbVx4KS100pg
         CcQStajZAhOdwiItGxF/v4J7BWC+IukSKEjvpKu9CNk7m2B1JwtgJ193XUIFix6pmaGu
         IXqLVvp7z8kgcjb9+utI9jo+SY18W4FIkVKoG6XSHd6tUQgVXybh5huuH1EJ2NdkXH+y
         jVG2WHqSf3+zdyxUh9BdXxVy/R/ARNekIzsC8ACr3PNpmIMviXkqH4yUpwjS4UVTE7aI
         gTuLlYsH7s2gepIdaffofZb5C+r8OHXkVHwQwQL9AMq+PW5dtyeIxho6byMulyaBtWoN
         S9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986137; x=1757590937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfzdh/iENN/JZiCLP2w1ErIldr+h6FYbADs6+tNjxpM=;
        b=RGnvL9BQsylZ956vJvMGuXflTfcMohnKLAn2OndvPtwee2uhf6o319Njl0nzTgHo+D
         e4thwAIBn7NBqMkIV+WWI5XWEu/VQokdbxosKYrORAV/K1Hs3vyIhFyr9OEF4YRj3tMn
         OPQ/qb32dYaDH+/4leJq3OoFbG3sbEvmKJSY6hpH1DWs00W+f8asXy9pSNDcmRJYXmq5
         xs1bI/WqrzMM4/7NkwQhwNOofkHIvFID9QEfk/oHXjkOHM70h2BOUS2mYt5ZFFaalwRr
         wdzcimrveZqHcDMvrnteUnuxyR4sFdxZ6cExvlF9Xa0VPGrglGKn2LyQl6nrVwMy6Cob
         LqRg==
X-Forwarded-Encrypted: i=1; AJvYcCUsvly94xBI2qmk+OFi5zGTM9Vgffa30Vg4bfzs7liKE/L7tgtkHmi+mQrQsWvJC9uNHYqKQo5Q23pw/uXC@vger.kernel.org, AJvYcCVZGAXJSnGkBX4GIXxXNW68fO0zXPeT05GmzShHEKknaAOHEmYjNPOLSzxln5VispKBKOMF846a@vger.kernel.org, AJvYcCXbc9O/Nmhr+IED7hkfTzvLnnYjXfQ7tPVhbUZ2U2WUPz+8g9zFICiLNoSvot5J8CrBhrkehaal+3QE@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1xS+96G8lQQp7ZcVlNeL4KcVeEm2Nv0IkJPDR8gn9mnOauOJ
	RRxJS8N080w4lYT96Vtv14EINKUrjeVC3j6oqRRwRAPb2hzazEkmf2NS
X-Gm-Gg: ASbGnctTgHtj6fW9kr3R3uo5bFxYqT+BoK/RNiJN4kfY3VkviKAAcYg4FawnkdOJJ2b
	3pGvqndU5IQGkC/bfzorm5kwI+tJYJZxNMm+/ceJT6yCnhSqUmGyz7XiVfDcvdQDb9cs99s5/8O
	1aDoHqCyPBBdaCf0+gpt19L7ckn1LTcwEr905Ew3iDDGL5kU6eUhA7UNWyieRuyexMAOa2ijm0J
	iySJl5CrV3918hwllpCMXniIfOwqwwi/HBGh1xsChuMO6EBy+rfcFjhn207WKYVTDDLx3RY5loT
	dNmGQXWi6eSjhaDlBRxw9m65pDv+R2bd4Uf0OfNH2zhiByWXNmHUCXlgAG0IpgQ0NySlSPABgKC
	4ZmyeSa6zocAJSxDb6j3yroDBbbYz4VarUV2ri3B4J9KSxfR2HyrhWCP97w==
X-Google-Smtp-Source: AGHT+IExZLYquo9V8QgbEOqAX4vqRnoYJm/bUWT4F0/I6KdGxqxxH03/rGPk5qQvI7Qp5Vm/8OjeJg==
X-Received: by 2002:a05:600c:3115:b0:45b:81b4:1917 with SMTP id 5b1f17b1804b1-45b8555c359mr165608615e9.10.1756986136933;
        Thu, 04 Sep 2025 04:42:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:15 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/9] net: pcs: rzn1-miic: move port range handling into SoC data
Date: Thu,  4 Sep 2025 12:41:59 +0100
Message-ID: <20250904114204.4148520-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Define per-SoC miic_port_start and miic_port_max fields in struct
miic_of_data and use them to validate the device-tree "reg" port number
and to compute the driver's internal zero-based port index as
(port - miic_port_start). Replace uses of the hard-coded MIIC_MAX_NR_PORTS
with the SoC-provided miic_port_max when iterating over ports.

On RZ/N1 the MIIC ports are numbered 1..5, whereas RZ/T2H numbers its MIIC
ports 0..3. By making the port base and range part of the OF data the
driver no longer assumes a fixed numbering scheme and can support SoCs that
enumerate ports from either zero or one and that expose different numbers
of ports.

This change is preparatory work for adding RZ/T2H support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 724bac86cf8c..c119ec66fe95 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -49,8 +49,6 @@
 #define MIIC_SWCTRL			0x304
 #define MIIC_SWDUPC			0x308
 
-#define MIIC_MAX_NR_PORTS		5
-
 #define MIIC_MODCTRL_CONF_CONV_MAX	6
 #define MIIC_MODCTRL_CONF_NONE		-1
 
@@ -146,6 +144,8 @@ struct miic {
  * @conf_to_string_count: Number of entries in the conf_to_string array
  * @index_to_string: String representations of the index values
  * @index_to_string_count: Number of entries in the index_to_string array
+ * @miic_port_start: MIIC port start number
+ * @miic_port_max: Maximum MIIC supported
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -155,6 +155,8 @@ struct miic_of_data {
 	u8 conf_to_string_count;
 	const char * const *index_to_string;
 	u8 index_to_string_count;
+	u8 miic_port_start;
+	u8 miic_port_max;
 };
 
 /**
@@ -330,6 +332,7 @@ static const struct phylink_pcs_ops miic_phylink_ops = {
 
 struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 {
+	const struct miic_of_data *of_data;
 	struct platform_device *pdev;
 	struct miic_port *miic_port;
 	struct device_node *pcs_np;
@@ -342,9 +345,6 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 	if (of_property_read_u32(np, "reg", &port))
 		return ERR_PTR(-EINVAL);
 
-	if (port > MIIC_MAX_NR_PORTS || port < 1)
-		return ERR_PTR(-EINVAL);
-
 	/* The PCS pdev is attached to the parent node */
 	pcs_np = of_get_parent(np);
 	if (!pcs_np)
@@ -363,18 +363,24 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	miic = platform_get_drvdata(pdev);
+	of_data = miic->of_data;
+	if (port > of_data->miic_port_max || port < of_data->miic_port_start) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EINVAL);
+	}
+
 	miic_port = kzalloc(sizeof(*miic_port), GFP_KERNEL);
 	if (!miic_port) {
 		put_device(&pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	miic = platform_get_drvdata(pdev);
 	device_link_add(dev, miic->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
 	put_device(&pdev->dev);
 
 	miic_port->miic = miic;
-	miic_port->port = port - 1;
+	miic_port->port = port - of_data->miic_port_start;
 	miic_port->pcs.ops = &miic_phylink_ops;
 
 	phy_interface_set_rgmii(miic_port->pcs.supported_interfaces);
@@ -410,7 +416,7 @@ static int miic_init_hw(struct miic *miic, u32 cfg_mode)
 	miic_reg_writel(miic, MIIC_MODCTRL,
 			FIELD_PREP(MIIC_MODCTRL_SW_MODE, cfg_mode));
 
-	for (port = 0; port < MIIC_MAX_NR_PORTS; port++) {
+	for (port = 0; port < miic->of_data->miic_port_max; port++) {
 		miic_converter_enable(miic, port, 0);
 		/* Disable speed/duplex control from these registers, datasheet
 		 * says switch registers should be used to setup switch port
@@ -497,6 +503,8 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
 		if (of_property_read_u32(conv, "reg", &port))
 			continue;
 
+		/* Adjust for 0 based index */
+		port += !miic->of_data->miic_port_start;
 		if (of_property_read_u32(conv, "renesas,miic-input", &conf) == 0)
 			dt_val[port] = conf;
 	}
@@ -570,6 +578,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.conf_to_string_count = ARRAY_SIZE(conf_to_string),
 	.index_to_string = index_to_string,
 	.index_to_string_count = ARRAY_SIZE(index_to_string),
+	.miic_port_start = 1,
+	.miic_port_max = 5,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.51.0


