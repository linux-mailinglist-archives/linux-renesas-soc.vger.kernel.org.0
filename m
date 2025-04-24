Return-Path: <linux-renesas-soc+bounces-16311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A6A9A741
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F05EF1889E9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 09:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCBF204F83;
	Thu, 24 Apr 2025 09:00:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27731EA7C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485224; cv=none; b=Lyl2rslyAdT0fXWSyz1LH1cxJly53Os3eBtdVmBDCxjdn/ZGsgOhQkwaK0Z2ilKtF83a31rQT/Ykx2nlp2fOLqZ3CuA+3MV07L07Az9dBxJte5Hme2f2ry192b+ILIcONRP3eUYPacEQwfWqjUle+QnHXLH7vWhud/lkX6M/Nus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485224; c=relaxed/simple;
	bh=ZobFT2cMiw6UT4v/AqQ7dDvJa5pzJfOLYgfptRZJOvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt+/66JaYYFcWdu4MVMw7ZuKfLJCYpvLDQk0sB9XuwmfvEBtFQ5T1Cb+4UXrjxBU7rZ8WjwlLMbeo/5GJmAoQlm4jStvMNWoK4zHjrt7eBM1my8zmqHFWxYSbDc+4OUDPx2dunjcjcnDNbosHKaBIkm4+ZTfru16Ert15/OgTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QG41K7WbTQedswEcb9niQQ==
X-CSE-MsgGUID: 1dItqkscQIezjPLwRZPmyg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 18:00:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E1144005B3F;
	Thu, 24 Apr 2025 18:00:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 5/7] memory: renesas-rpc-if: Add wrapper functions
Date: Thu, 24 Apr 2025 09:59:53 +0100
Message-ID: <20250424090000.136804-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though XSPI and RPCIF has different register layout, reuse the code
by adding wrapper functions to support both XSPI and RPC-IF.

While at it, replace error check for pm_runtime_resume_and_get().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated commit description.
 * Renamed the functions *_helper()->*_impl().
 * Replaced ssize_t->size_t as the return data type for
   rpcif_dirmap_read_impl().
 * Renamed the local variable length->read and it's data type
   ssize_t->size_t.
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change
---
 drivers/memory/renesas-rpc-if.c | 96 ++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 56b2e944beca..eea38f448e03 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -174,16 +174,11 @@ static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif_priv *rpc)
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
 }
 
-int rpcif_hw_init(struct device *dev, bool hyperflash)
+static int rpcif_hw_init_impl(struct rpcif_priv *rpc, bool hyperflash)
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
+	ret = rpcif_hw_init_impl(rpc, hyperflash);
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
+static void rpcif_prepare_impl(struct rpcif_priv *rpc, const struct rpcif_op *op,
+			       u64 *offs, size_t *len)
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
+	rpcif_prepare_impl(rpc, op, offs, len);
+}
+EXPORT_SYMBOL(rpcif_prepare);
+
+static int rpcif_manual_xfer_impl(struct rpcif_priv *rpc)
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
+	rpcif_hw_init_impl(rpc, rpc->bus_size == 2);
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
+	ret = rpcif_manual_xfer_impl(rpc);
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
+static size_t rpcif_dirmap_read_impl(struct rpcif_priv *rpc, u64 offs,
+				     size_t len, void *buf)
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
+	size_t read;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	read = rpcif_dirmap_read_impl(rpc, offs, len, buf);
+
 	pm_runtime_put(dev);
 
-	return len;
+	return read;
 }
 EXPORT_SYMBOL(rpcif_dirmap_read);
 
-- 
2.43.0


