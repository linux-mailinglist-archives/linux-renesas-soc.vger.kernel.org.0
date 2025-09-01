Return-Path: <linux-renesas-soc+bounces-21142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B6B3F127
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3A91B2192C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E20128A1D5;
	Mon,  1 Sep 2025 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NufEPrnG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D452874F9;
	Mon,  1 Sep 2025 22:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766631; cv=none; b=IWEMZFrMENgEWRUAlaNVuOoX51X6PNnMsLqMOJ0WoVjiw6iNKhUdgadxUK8lkl0Unv5NzObNq8d9cTAnlB0BYWrzNa1rhBOC9vltNMPsXNAIlpqFDnuDDg/nNDBjfB26G2d8c5b5gDTRndnsULl9lHO3/sP1DdQ6UGfjX5I4098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766631; c=relaxed/simple;
	bh=HKzlJfBwtYMiPWoKVvJXrcSUcjr8IuCkD7uXCY6Rq6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C52bz+QVAM7Cw44+sBwSoMwEbM9OcYpbZJUpSfZz8m0zdirC4IJXtWhKsblI+0Y16ziRYo77StKyW9Ij5UjZ7/JLEMX/x9np2xGG1GWKACMJgVIsPg6yZrE6LwV7cxoujCzcmJmPFKsBPIX0ghq8tOv4Khpct7GNyo9NKf0fW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NufEPrnG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3cf48ec9fa4so2459563f8f.0;
        Mon, 01 Sep 2025 15:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766628; x=1757371428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPcl2S44WD8tgUmGsmxJ2F4rL8Qbeu2knIPNC9oF8oQ=;
        b=NufEPrnGaom0ITl4W7smHuTvTMr+hCd+sgy9zj/Rp/gDd6IVqqO5jEdE4xOeNsn05s
         Jyq5vCWxCpy/nfmJ6HqTbD5HpB/NRmtMdHRV7Zz3sPdTw0Ypviwj1R19TLQMdE0T+nuY
         kGjwaodkc6LA9fbfNCLVpEBMtlI7mX2Yz3+e24cAixM18zWlmM23R0BXTLSM8svQKiHe
         0ImMJp2Oh8ihb7hQHxPl77b2z0FHFGvfexunjZHc750Cq/bmXzbXODSQnDlYES2RZ89x
         C83ATQoPneOS1cxQSANeFngFCvOmKRLxpm4+iqIZ+iQqgyPu7iQ3BZT6uJRHBHRgdoji
         8UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766628; x=1757371428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPcl2S44WD8tgUmGsmxJ2F4rL8Qbeu2knIPNC9oF8oQ=;
        b=cWiCPITs0PE7OlOxSUAQCJXctXGejKUvWDjUbfpvzkSpcngQ0vG0JuXN/u+l4bncrk
         Wyf4sd/ZluVrw9GEleJlu/ij1Z3BwjD3dWELNXw67ZRzvqEZzXDRxDKdT2KS4rcUHZ3c
         Ot0BIZSkOOJ8hRO5uDtgV+VN9S57WX8nkT6dbJ0Z4kT65Asjk//rk6ftjx6SxEJ8hYFC
         WSk6kxLrHcmI5q/tVbdRlrEiV5dXmcqNx9pMl/WV7orvDRhK2OA7SOGDf7R7yJON2RE8
         Z5j+A8PeYfLIOmv28oWiC/q3nOOqyShEA4tnhMkBslUnkNkkwcBlbWMDBiKIcNb5aWic
         aItw==
X-Forwarded-Encrypted: i=1; AJvYcCUzkOZfBm/Ss1SOWwKnsSfsHpiVNfdh4ahxUED9qzg72qJ5iJQLrwU/gXSFf3RR9YTTpvAV5YpZp9q/@vger.kernel.org, AJvYcCV0ruZA8dORZo2Ihd/DGC5b2zUBH+jXMPxJ41ravfZDfXwRC388W2+E2pYzTGB4iTUmoYbAkJSr5g/4Xodk@vger.kernel.org, AJvYcCV76k0a/O8UITsnhhEstHLjXggzmEzbqSvkQj8tpdCAqHqNFi7WKozx1ne3SqP2NJ/X0LK0ykNm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hYNIOAREvLcaQdI9mTNp3wbr4K7i0jrSRx4vYFjr9s9jvkh2
	s8Vzqx0Zp28x28xg33tFE+gYkR1JK+3n/bp+/RuCa9PnHcGZ8SIlRdtg04FtfL+N
X-Gm-Gg: ASbGncu4j7Z93a09J6F0/hTzDvaV7EclawpWDu1xgNgC0Zdj1JrWIzGCm7qyKNKmfkz
	GWNQO/yisn7VbI0Zqxj5lgZCqiRxFRs803f16GShIlRS+jZCBwgdwHZDDup8Fy3hw1hN7ys6YHr
	H4B/mVxKy0R9mzFXYLPHyVuQ52mioM1EdvuXzTxX9t3Psw5NRp9FsTmKI5NlQC02GYNk/jqHtc0
	zO88X+leSVUMTtilphMRSEP/j5jMH6U2V6b2NmeDK/F5I9WbIyymTRM6Tb7MU7THo4TVUiUHONu
	JXJQxZUYg2z7jwk/zXwPjGOJkpwTpQwe3cJWYckxYwstutERFuPB4lZo6YF1SQ3wVvAKzlMTkqe
	dctrPoHFfQN18O1QuCfZDqbUr1dbp98khyafWCw+dw6A8ivemkm9encB8
X-Google-Smtp-Source: AGHT+IHWRxSFD5WV54k9OOb2rpOfeI4MHEy08wVe5dfiwl68eztWh4lagC9+eIKkm0ucFoeBJgrO9w==
X-Received: by 2002:a5d:5889:0:b0:3b8:dabe:bd78 with SMTP id ffacd0b85a97d-3d1df156527mr6757599f8f.54.1756766627778;
        Mon, 01 Sep 2025 15:43:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:46 -0700 (PDT)
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
Subject: [PATCH net-next 05/10] net: pcs: rzn1-miic: move port range handling into SoC data
Date: Mon,  1 Sep 2025 23:43:18 +0100
Message-ID: <20250901224327.3429099-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


