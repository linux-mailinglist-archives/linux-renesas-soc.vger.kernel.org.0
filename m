Return-Path: <linux-renesas-soc+bounces-21144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E2B3F12E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4031B21A7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A826D28DF2D;
	Mon,  1 Sep 2025 22:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiOCPAD+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72E028AAE6;
	Mon,  1 Sep 2025 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766633; cv=none; b=oAzHxqObaM3jZn9OMrFDCSQCkwPc9ciGwtPSe+hm3kSbDplH3fH3L7LvFzU7/QDK7jCPTKQHWrcUwWcwzmBvxNUSq7iqd6lEe15F2KLoX251a+XD7AdOrRdYISVkYEuKUKEvOMJPImrQOUJmgqNWW68ap/5viGK8C7EysL50Lw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766633; c=relaxed/simple;
	bh=lMKeb0TCdKK5JLosgCN57J85UwrzJxrP9I4R+kf0uxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIwJ2tMOE5CuofEYAZKx4X9J726RMPg4yqOzbAhMSdGHh/Tpuwp4oXEvpoVnz/2zXRip2HlknfH9JAAyMeQztLoGi5zazM2eAFr3dCpXZdo0p3gMQn80/Gog8+Quj4XLQGtS0nA+6V6xm6DiOlTUx5lwq221sK3BmpyinXzVIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiOCPAD+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so14048455e9.3;
        Mon, 01 Sep 2025 15:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766630; x=1757371430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcQz7HXGNdo+h3s/5EGZrc1fI9Ul+MIvTQII6PFNK+8=;
        b=iiOCPAD+P+yZ4tm2L54T9w10BjN3t+Jahyr9rSbOQectTXbcLURm0pX3vsCSasDi+t
         ScNaNVL86GXmChzszQ8U6o0/7vNvQ8SK0nLCnYQOzUWNCnUihqAQwa1uam3/e7k3Nc1F
         jWd+UCPZYfxSpsqOTZHgtCQg2gFqX4yAbWhbkZ6imwwpfPbFZVDDXkI6fvM1s60e03jw
         VmUS5Ohf5W+ipIZgYKDX4kXpoa9lpupYHh6z4DPYWgXD+2SRBIQJNqdvaIGKke8PHDQW
         ClCDh31IRxRF/8VanhHtfx3z5veq+DJI4A48MXWOqZqUG88Hh+uUGIm7mn/PyybD7+Dg
         cPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766630; x=1757371430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcQz7HXGNdo+h3s/5EGZrc1fI9Ul+MIvTQII6PFNK+8=;
        b=AZhJ01nuaZHGdYZWgiXM6hEbGb/5jCoG+cXEpjA3VKTNO2lrlIwNzKJLJmK6oXpsNm
         NAKSLJtazQQsoFOczFM7T1AY0Ll9EX+zubD3CFkZ37BpJq0vtmiBpt6JRqI6dk2mnw+J
         t4EvP6KDcFiqH8nmxdrPjiWls0mc+BrDe9B4ffr1kw2je2HIDPyyKYGxv0tievXmaqGk
         DnlVvbE/TKFvs7uehwhzXZMXLzMi50lGQXRvORH1koXqj9JT/IQhS+d0umNmsQIhXSVw
         oHolcyc8FSt4z1bpvsgO4UiiLvQCQ3tqyKKTmpAa7Xtz9JMoBSjaW34l50ape8fQbfSz
         XnJw==
X-Forwarded-Encrypted: i=1; AJvYcCVxzVyHbYNmYKt4cHh43xlB80FXlXsmDynTD8FbvajKJZiOwv0T36oogYCcAjFLJgC9DUrj+mo3H1wIEQAg@vger.kernel.org, AJvYcCWagXa0R7fwWyMRiWEMjldGIj5mGVCT4CtwQc4G5O3UYDQLHyhvDX2pX9uyQBaIxWzOIWgJUB7P@vger.kernel.org, AJvYcCXf9WWcszIhH56ejesL3Vy4EZluynFndcPdO5rrHlnqReSq0CFaexdzZ0TjKVBHVoWLV+ReY9EN1z+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlb6gprGd7J3HXq1qPsabeo5Mo9hfKR5Kff8Ya+K9OwfqJH1rz
	JgysqBl0VAObBxufDmXLHStLC/l4XPR8KIqV2i9lX1Npdal0FKS3Z/Ad
X-Gm-Gg: ASbGnctqWHLbgcc4MeGCU+S14t036I3HEv2HysDV3619vq7bfp7NKqEv5aA9v8UWLzb
	tU5MbHGVR11JqfxQb+TWABSUv+x7Li0BZtIBIRBgWM2vqWt7HG2I93myFk9/KH1cnjzdPuRo1kz
	wlyzj599v49FtdDN5OC95AHVblw32xOwS9vI3bYSX92uqJ9WrXunVB844AvRUx9MbDhTLFp/YCx
	IIgGm/D536Uk+QTHqYWJh+bDhhap0ZkvWbzgwoKkPXPdKNixyo5rW+E6Btg4+Vd6RdurJ2L/V6N
	sW4O7iXXACHhE49FK7WIDo6D3vQ8s8pqgpbOdJhDMudShT4h0/+nBdH2w/rhO4+MBq9VxFkp5Ie
	uJ+HF1cp9dJBb4DNf+h8LLigw4GYXTTdfNGEfIr2tkXN6Jg==
X-Google-Smtp-Source: AGHT+IGSrAHB3WYCOXa2RRMfke6j65Rvl36anQvwUOg7mqIyV22kswaYduYAQzHaDdakGyS4eYdodQ==
X-Received: by 2002:a05:600c:8206:b0:45b:7e68:7492 with SMTP id 5b1f17b1804b1-45b8843c122mr66591165e9.1.1756766630003;
        Mon, 01 Sep 2025 15:43:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:49 -0700 (PDT)
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
Subject: [PATCH net-next 07/10] net: pcs: rzn1-miic: Add support to handle resets
Date: Mon,  1 Sep 2025 23:43:20 +0100
Message-ID: <20250901224327.3429099-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


