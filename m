Return-Path: <linux-renesas-soc+bounces-21746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05087B52285
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38FD583C21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D7530748C;
	Wed, 10 Sep 2025 20:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+RYOspT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10F302752;
	Wed, 10 Sep 2025 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536909; cv=none; b=gRCL5Y46zHSM47yapCZ3NfwbA58FeazSO+agT5614DaBnr9iyvFwyPlTBqJNMFFc/RQFiUQaeOPG6y0YD6DMgWu3U7nI/ika5b2zbsFYUT4FSMYRZYHWWHyJTSdGJNWxq2aui+DKJkL0u2xqYwc52gboPUGFl7hR9HAqi4UN8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536909; c=relaxed/simple;
	bh=HBE6z2+V4MzHiy0b7EWLpWdqDKyzM7PtVx9CadNJmGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhCf2D2GcJPHcfon2n51+bjULNlT3iomINKE8X+Dgk4ERMBkyrFPkQkQc5ued2WJBSNUHX5qXVFXt6DQP7+BQGCaeOKXOUdcGTC67lHfW/1QBAC8PbM+xTbNJggsZFGhCxuL1Uols+YJb6HqFQzh29POGteyPiAAfDctMVUM0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+RYOspT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dfb6cadf3so178815e9.2;
        Wed, 10 Sep 2025 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536905; x=1758141705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8H4+ZFnlz0zleMTBEEtXiEZInOyMd5QvdNq4Jbd6kkU=;
        b=J+RYOspTYqPca8B6C+W0Nyss6BdEw6VNmaT5EU+EpPOt/8JX7hAynAIe467KSJz/tX
         6eETY2d9jZTQswGqavHG9lBLxu3vxKDvg2dGh+OBrKKvBLllA+UoVnZjEXv6D+KdNkwi
         UxylaVDqjxG4rbZbK1kCMIjpLyRYETCVvwKTcdHNDHMasM5KdDVaQCtRc4zGvZtbvL4H
         xV3ADvvYqC3gJWeKFYVG32ZXlH6RLTnCDws3PD96rnDXTiWJtHLqTNmL4H1iFC2R41fg
         m4jQSRKiSIv2nXFGzljZCQiFeu6bjMMIqKoj8+xl3VL08vtE9IChy/QaztfUh04Xdns9
         EClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536905; x=1758141705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8H4+ZFnlz0zleMTBEEtXiEZInOyMd5QvdNq4Jbd6kkU=;
        b=OndjchQdzCYHEB6SCgTERuYV7NYR9BdaJ+ihB54gkrZbkgFh8DogN17ghlBMdG2Dhd
         Y0cqc1PYwmDqe+nfYyDZdwViM5qV6Gspkiu69OtKu3q1hD9Ep/+VWwnACjsygwhmz9hu
         nFAS9VorgPLJCLI2NIYUYCwzQfj4tu4taHu9u90qjN6wBrrlFCMkv9xwhJKJN5yo4xQM
         H2Sjg2oqgAxKBP2425RNbXqVKp6jK87Q2jlNm7YDphKtld5o71cog5ZlncPOx2v45+es
         LV/IZE55ziL6uZfnlVSOPCF45psL9FKPkLbDHw44gJUO4tIOdpytBqui1LC8aLlejoB7
         bG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTv+CiIQ0LjLzZhWej9vGs29tc/s8l/ObU+S2iOteei2r4qI00YfTf9onKe+SowIcwgvR5V+D+JU1nEtTV@vger.kernel.org, AJvYcCWlk5C2Qp+qrhClo/F4Hl5pZ/iJjTM1zhGqXWtHPB353Rk6XzfGI8UT2RxX5I/t2ep68CbK8bdI03WF@vger.kernel.org, AJvYcCXIYt2rPdLKCzqcJXKMhwj6VRPIn2OLm+4jG7C4s8T5X9KVJGxypSYEBRu1Y3RahB5LGQMFC39W@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwfpM7NiYKW/sHlXTQZmAZUlVo4ufu1CnkYMvmiU025V+jigM
	ChBH9PCVpzQRHrP146JR/l8fPnhllxEXRn7988NokyE1CM0rCnG57K94
X-Gm-Gg: ASbGnctUIoBxAURHU4jOVoiibq2j34d8HAsU9oKRRZQOkl5Y044IRMoUiFG2RUVNmbT
	ksfm6km9s7mCicXaI21mrxcJ7nZCjVaBRd6UyRZxrCE3YNxCpHU95ojHcjA70Ij42i6cWIsIp4t
	+ExhI+Cx6WYEr5jG448wjgoLUf46w3PKUoOujjU5/bD4XWBUJ/968UTkYQAG42RDErUUsME9mJC
	WTBpOI/PKMSItLGYYPm9RgaJibrPD899bPT/UW2Y3H8JQB9jXkocsoXUarL/bljD9bode9WpX/v
	FQQLZtR4zq9vXkeGAvkBhZdjS+mFUDjrz5SyQMwo6MOiMgmLHyrzvl44PJm8EDYOnpQnzzTtqbF
	cNgenr2VWAzffoPOxarcyRyHIoOgfCwkbKrjGl5Wym/qYTfKtq9QTTBuD2A==
X-Google-Smtp-Source: AGHT+IH7YjjU487JKi2uQaArNDXR2qh0IES/ThPmOHuuzc1hzJ3je+2U2+vaNUSgy7/gg3R1pVqqgQ==
X-Received: by 2002:a05:600c:1c25:b0:45e:8e:28bf with SMTP id 5b1f17b1804b1-45e014bb63cmr882415e9.28.1757536904685;
        Wed, 10 Sep 2025 13:41:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:44 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v3 7/9] net: pcs: rzn1-miic: Add support to handle resets
Date: Wed, 10 Sep 2025 21:41:28 +0100
Message-ID: <20250910204132.319975-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Moved reset handling from probe to a separate function
  miic_reset_control_init() to avoid checkpatch warnings.
- Restored Reviewed-by and Tested-by tags.

v1->v2:
- No change.
---
 drivers/net/pcs/pcs-rzn1-miic.c | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index f6d9c03d10f0..75009b30084a 100644
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
@@ -523,6 +533,48 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
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
+static int miic_reset_control_init(struct miic *miic)
+{
+	const struct miic_of_data *of_data = miic->of_data;
+	struct device *dev = miic->dev;
+	int ret;
+	u8 i;
+
+	if (!of_data->reset_count)
+		return 0;
+
+	for (i = 0; i < of_data->reset_count; i++)
+		miic->rsts[i].id = of_data->reset_ids[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, of_data->reset_count,
+						    miic->rsts);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get bulk reset lines\n");
+
+	ret = reset_control_bulk_deassert(of_data->reset_count, miic->rsts);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to deassert reset lines\n");
+
+	ret = devm_add_action_or_reset(dev, miic_reset_control_bulk_assert,
+				       miic);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add reset action\n");
+
+	return 0;
+}
+
 static int miic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -546,6 +598,10 @@ static int miic_probe(struct platform_device *pdev)
 	if (IS_ERR(miic->base))
 		return PTR_ERR(miic->base);
 
+	ret = miic_reset_control_init(miic);
+	if (ret)
+		return ret;
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
 		return ret;
-- 
2.51.0


