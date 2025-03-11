Return-Path: <linux-renesas-soc+bounces-14260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B975A5BF3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 12:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D957173150
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 11:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F3D2343C1;
	Tue, 11 Mar 2025 11:36:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE23724394B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693010; cv=none; b=lBPtakzC+G/4lMo/mcXCews0VSX1oULgSHbmRds6ug8lSqlYjDc3CcWU9qW+Wi1j7+D7bel1nSdxgeT4jQZGM2dC5coIEy9rPFKbuhEwTkkcfTUTZ2CsoZHficvFtsikR1QqqOfGBjOsJnIKlpl5P6ZTYCOsfseyXl16B4Y3jfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693010; c=relaxed/simple;
	bh=BdtPBLDRyw1nAtAYvXFM4Mo5ZEFCuiEd5x/V6VCnhKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwFRXrGLW4o7M+bAABwowT60gIZsgF8e9JxokUwtZ5D2I12E2xvmSUXznF1SxFX6sG2r+/26/dvd9XtB436zci6QsbcbOsrDH5gSWsWeDs2em+AJiDZbLF4KJtW+MU5zrzE6k5YC9xMfYWnk3yYXNPxq5I8jjXQnoZu39QLx4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: imIzrwj/TwqdnWC9ouU9zw==
X-CSE-MsgGUID: TPCMuM4MQPG/CKVJ+j4IMQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2025 20:36:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4255142AA21D;
	Tue, 11 Mar 2025 20:36:46 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 7/9] memory: renesas-rpc-if: Add wrapper functions
Date: Tue, 11 Mar 2025 11:36:13 +0000
Message-ID: <20250311113620.4312-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though XSPI and RPCIF has different register layout, reuse the code
by adding wrapper functions to support both XSPI and RPC-IF.

While at it, replace error check for pm_runtime_resume_and_get() as
it can return positive value as well.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change
---
 drivers/memory/renesas-rpc-if.c | 96 ++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 56b2e944beca..39208767fcd0 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -174,16 +174,11 @@ static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif_priv *rpc)
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
 }
 
-int rpcif_hw_init(struct device *dev, bool hyperflash)
+static int rpcif_hw_init_helper(struct rpcif_priv *rpc, bool hyperflash)
 {
-	struct rpcif_priv *rpc = dev_get_drvdata(dev);
 	u32 dummy;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
 	if (rpc->info->type == RPCIF_RZ_G2L) {
 		ret = reset_control_reset(rpc->rstc);
 		if (ret)
@@ -231,12 +226,26 @@ int rpcif_hw_init(struct device *dev, bool hyperflash)
 	regmap_write(rpc->regmap, RPCIF_SSLDR, RPCIF_SSLDR_SPNDL(7) |
 		     RPCIF_SSLDR_SLNDL(7) | RPCIF_SSLDR_SCKDL(7));
 
-	pm_runtime_put(dev);
-
 	rpc->bus_size = hyperflash ? 2 : 1;
 
 	return 0;
 }
+
+int rpcif_hw_init(struct device *dev, bool hyperflash)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = rpcif_hw_init_helper(rpc, hyperflash);
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
 EXPORT_SYMBOL(rpcif_hw_init);
 
 static int wait_msg_xfer_end(struct rpcif_priv *rpc)
@@ -261,11 +270,9 @@ static u8 rpcif_bit_size(u8 buswidth)
 	return buswidth > 4 ? 2 : ilog2(buswidth);
 }
 
-void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
-		   size_t *len)
+static void rpcif_prepare_helper(struct rpcif_priv *rpc, const struct rpcif_op *op,
+				 u64 *offs, size_t *len)
 {
-	struct rpcif_priv *rpc = dev_get_drvdata(dev);
-
 	rpc->smcr = 0;
 	rpc->smadr = 0;
 	rpc->enable = 0;
@@ -346,18 +353,21 @@ void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 		rpc->enable |= RPCIF_SMENR_SPIDB(rpcif_bit_size(op->data.buswidth));
 	}
 }
-EXPORT_SYMBOL(rpcif_prepare);
 
-int rpcif_manual_xfer(struct device *dev)
+void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
+		   size_t *len)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+
+	rpcif_prepare_helper(rpc, op, offs, len);
+}
+EXPORT_SYMBOL(rpcif_prepare);
+
+static int rpcif_manual_xfer_helper(struct rpcif_priv *rpc)
+{
 	u32 smenr, smcr, pos = 0, max = rpc->bus_size == 2 ? 8 : 4;
 	int ret = 0;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		return ret;
-
 	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT,
 			   RPCIF_PHYCNT_CAL, RPCIF_PHYCNT_CAL);
 	regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
@@ -465,15 +475,29 @@ int rpcif_manual_xfer(struct device *dev)
 			goto err_out;
 	}
 
-exit:
-	pm_runtime_put(dev);
 	return ret;
 
 err_out:
 	if (reset_control_reset(rpc->rstc))
-		dev_err(dev, "Failed to reset HW\n");
-	rpcif_hw_init(dev, rpc->bus_size == 2);
-	goto exit;
+		dev_err(rpc->dev, "Failed to reset HW\n");
+	rpcif_hw_init_helper(rpc, rpc->bus_size == 2);
+	return ret;
+}
+
+int rpcif_manual_xfer(struct device *dev)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = rpcif_manual_xfer_helper(rpc);
+
+	pm_runtime_put(dev);
+
+	return ret;
 }
 EXPORT_SYMBOL(rpcif_manual_xfer);
 
@@ -519,20 +543,15 @@ static void memcpy_fromio_readw(void *to,
 	}
 }
 
-ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
+static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
+					size_t len, void *buf)
 {
-	struct rpcif_priv *rpc = dev_get_drvdata(dev);
 	loff_t from = offs & (rpc->size - 1);
 	size_t size = rpc->size - from;
-	int ret;
 
 	if (len > size)
 		len = size;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		return ret;
-
 	regmap_update_bits(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_MD, 0);
 	regmap_write(rpc->regmap, RPCIF_DRCR, 0);
 	regmap_write(rpc->regmap, RPCIF_DRCMR, rpc->command);
@@ -549,9 +568,24 @@ ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
 	else
 		memcpy_fromio(buf, rpc->dirmap + from, len);
 
+	return len;
+}
+
+ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
+{
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
+	ssize_t length;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	length = rpcif_dirmap_read_helper(rpc, offs, len, buf);
+
 	pm_runtime_put(dev);
 
-	return len;
+	return length;
 }
 EXPORT_SYMBOL(rpcif_dirmap_read);
 
-- 
2.43.0


