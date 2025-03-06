Return-Path: <linux-renesas-soc+bounces-14115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C4A55248
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 18:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E550116D8F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE88B25BAA1;
	Thu,  6 Mar 2025 17:05:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E2B2566F8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280737; cv=none; b=HPrtgzWFRKSLpNFp2o/mg7rW7F2SZVlbBWZYYA6gT2ggZF5+hdWAMvrSfGppmcJ/wDTh8tPDNXeOc7lQl5m6A2uvjIucjayPyE32ROWF/c/poEMFSd2DEUtjAii88wsXP0hcm4duFgbphxaPFcM8Q1dJsbBCLy+0cRGMWPo/76c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280737; c=relaxed/simple;
	bh=ht1VTzUJjt1q4cZ0rDWrYWFTWmBrlzHiUv4Iud2O9zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9d+abiaIEmUkE3178O8V3XHzZtm0tZEcR1AOJAjObjNCMR1tlT5/ox1OrjXIbVHyPM51qWcqYM5ut62NEkfqKDtDWPbQvhs2HkS6hikAU9D5lAJu/J/WH71iFrVGFk3phTqnAuglexTk2z9Kc1QjwafQqVzcMsHPcmjbbH4nzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1UBS+8dQRliw4gM9ppQMOw==
X-CSE-MsgGUID: mmMYJ5WoRoq8aQGPFLTggA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 02:05:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4E209401C948;
	Fri,  7 Mar 2025 02:05:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 6/8] memory: renesas-rpc-if: Add wrapper functions
Date: Thu,  6 Mar 2025 17:05:04 +0000
Message-ID: <20250306170512.241128-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306170512.241128-1-biju.das.jz@bp.renesas.com>
References: <20250306170512.241128-1-biju.das.jz@bp.renesas.com>
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


