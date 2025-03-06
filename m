Return-Path: <linux-renesas-soc+bounces-14125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25071A55292
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 18:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04E231897387
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4E425B664;
	Thu,  6 Mar 2025 17:09:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34D425A35F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280994; cv=none; b=IVpw++S/BcilrLkWKbj6OSrbMLFagO6pZyvYxw2CJYQ6iFNw7ifIC5djRRswtKszmFkZMgmaxnaYK3jzMje0deTime2+B6ON76Q1nbFGdMS/voI9qsSeUixX8SZCwRo9aHvsGS9h5o0E0SAle3l6eNJyM+YD/V77wXNdD3Pz1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280994; c=relaxed/simple;
	bh=0/uKLhfha8h7WfxE6G2bthk9A/e8RKOZR4avLTNRRZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eq88i6sBqsQRkbCrEnFm4TL0ie+xiZzjZXyV+aq/FHZ90dpv9itj3kO8laeyzkknbVcMbOX4Oeb0CiI0KKngU0oUJCc423xyNfnLiVbnIHEeVISLUz+Xz0D23gy8dbt5xCIZis+kqbdtZyl48dmRXnWYh0/KZPTDCkDvSrGHAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: duCEQpbnSkSDlFgmOXvGcg==
X-CSE-MsgGUID: mDvzr/ILTxWlazMLlBBQ/g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 02:09:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9FF5B40031E1;
	Fri,  7 Mar 2025 02:09:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 7/8] memory: renesas-rpc-if: Add RZ/G3E xSPI support
Date: Thu,  6 Mar 2025 17:09:17 +0000
Message-ID: <20250306170924.241257-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
References: <20250306170924.241257-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for RZ/G3E xSPI. Compared to RPC-IF, it can support writes on
memory-mapped area.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Fixed the build error reported by bot by dropping 
   EXPORT_SYMBOL(xspi_dirmap_read) and restoring
   EXPORT_SYMBOL(rpcif_dirmap_read)
 * Replaced enum XSPI_RZ->XSPI_RZ_G3E
 * Replaced compatible rz-xspi->r9a09g047-xspi and device data
   xspi_info_rz->xspi_info_r9a09g047
---
 drivers/memory/renesas-rpc-if.c       | 391 +++++++++++++++++++++++++-
 drivers/memory/renesas-xspi-if-regs.h | 105 +++++++
 include/memory/renesas-rpc-if.h       |   4 +
 3 files changed, 494 insertions(+), 6 deletions(-)
 create mode 100644 drivers/memory/renesas-xspi-if-regs.h

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 39208767fcd0..917df7ff269a 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -19,6 +19,7 @@
 #include <memory/renesas-rpc-if.h>
 
 #include "renesas-rpc-if-regs.h"
+#include "renesas-xspi-if-regs.h"
 
 static const struct regmap_range rpcif_volatile_ranges[] = {
 	regmap_reg_range(RPCIF_SMRDR0, RPCIF_SMRDR1),
@@ -31,6 +32,15 @@ static const struct regmap_access_table rpcif_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(rpcif_volatile_ranges),
 };
 
+static const struct regmap_range xspi_volatile_ranges[] = {
+	regmap_reg_range(XSPI_CDD0BUF0, XSPI_CDD0BUF0),
+};
+
+static const struct regmap_access_table xspi_volatile_table = {
+	.yes_ranges	= xspi_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(xspi_volatile_ranges),
+};
+
 struct rpcif_info {
 	const struct regmap_config *regmap_config;
 	enum rpcif_type type;
@@ -49,6 +59,8 @@ struct rpcif_priv {
 	enum rpcif_data_dir dir;
 	u8 bus_size;
 	u8 xfer_size;
+	u8 addr_nbytes;
+	u32 proto;		/* Specified for xSPI */
 	void *buffer;
 	u32 xferlen;
 	u32 smcr;
@@ -149,6 +161,33 @@ static const struct regmap_config rpcif_regmap_config = {
 	.volatile_table	= &rpcif_volatile_table,
 };
 
+static int xspi_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct rpcif_priv *xspi = context;
+
+	*val = readl(xspi->base + reg);
+	return 0;
+}
+
+static int xspi_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct rpcif_priv *xspi = context;
+
+	writel(val, xspi->base + reg);
+	return 0;
+}
+
+static const struct regmap_config xspi_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.reg_read	= xspi_reg_read,
+	.reg_write	= xspi_reg_write,
+	.fast_io	= true,
+	.max_register	= XSPI_INTE,
+	.volatile_table	= &xspi_volatile_table,
+};
+
 int rpcif_sw_init(struct rpcif *rpcif, struct device *dev)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
@@ -156,6 +195,7 @@ int rpcif_sw_init(struct rpcif *rpcif, struct device *dev)
 	rpcif->dev = dev;
 	rpcif->dirmap = rpc->dirmap;
 	rpcif->size = rpc->size;
+	rpcif->xspi = rpc->info->type == XSPI_RZ_G3E;
 	return 0;
 }
 EXPORT_SYMBOL(rpcif_sw_init);
@@ -231,6 +271,33 @@ static int rpcif_hw_init_helper(struct rpcif_priv *rpc, bool hyperflash)
 	return 0;
 }
 
+static int xspi_hw_init(struct rpcif_priv *xspi)
+{
+	int ret;
+
+	ret = reset_control_reset(xspi->rstc);
+	if (ret)
+		return ret;
+
+	regmap_write(xspi->regmap, XSPI_WRAPCFG, 0x0);
+
+	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0,
+			   XSPI_LIOCFG_PRTMD(0x3ff) | XSPI_LIOCFG_CSMIN(0xf) |
+			   XSPI_LIOCFG_CSASTEX | XSPI_LIOCFG_CSNEGEX,
+			   XSPI_LIOCFG_PRTMD(0) | XSPI_LIOCFG_CSMIN(0) |
+			   XSPI_LIOCFG_CSASTEX | XSPI_LIOCFG_CSNEGEX);
+
+	regmap_update_bits(xspi->regmap, XSPI_CCCTL0CS0, XSPI_CCCTL0_CAEN, 0);
+
+	regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+			   XSPI_CDCTL0_TRREQ | XSPI_CDCTL0_CSSEL, 0);
+
+	regmap_update_bits(xspi->regmap, XSPI_INTE, XSPI_INTE_CMDCMPE,
+			   XSPI_INTE_CMDCMPE);
+
+	return 0;
+}
+
 int rpcif_hw_init(struct device *dev, bool hyperflash)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
@@ -240,7 +307,10 @@ int rpcif_hw_init(struct device *dev, bool hyperflash)
 	if (ret)
 		return ret;
 
-	ret = rpcif_hw_init_helper(rpc, hyperflash);
+	if (rpc->info->type == XSPI_RZ_G3E)
+		ret = xspi_hw_init(rpc);
+	else
+		ret = rpcif_hw_init_helper(rpc, hyperflash);
 
 	pm_runtime_put(dev);
 
@@ -250,10 +320,18 @@ EXPORT_SYMBOL(rpcif_hw_init);
 
 static int wait_msg_xfer_end(struct rpcif_priv *rpc)
 {
+	u32 reg, mask;
 	u32 sts;
 
-	return regmap_read_poll_timeout(rpc->regmap, RPCIF_CMNSR, sts,
-					sts & RPCIF_CMNSR_TEND, 0,
+	if (rpc->info->type == XSPI_RZ_G3E) {
+		reg = XSPI_INTS;
+		mask = XSPI_INTS_CMDCMP;
+	} else {
+		reg = RPCIF_CMNSR;
+		mask = RPCIF_CMNSR_TEND;
+	}
+
+	return regmap_read_poll_timeout(rpc->regmap, reg, sts, sts & mask, 0,
 					USEC_PER_SEC);
 }
 
@@ -354,12 +432,70 @@ static void rpcif_prepare_helper(struct rpcif_priv *rpc, const struct rpcif_op *
 	}
 }
 
+static void xspi_prepare(struct rpcif_priv *xspi, const struct rpcif_op *op,
+			 u64 *offs, size_t *len)
+{
+	xspi->smadr = 0;
+	xspi->addr_nbytes = 0;
+	xspi->command = 0;
+	xspi->option = 0;
+	xspi->dummy = 0;
+	xspi->xferlen = 0;
+	xspi->proto = 0;
+
+	if (op->cmd.buswidth)
+		xspi->command = op->cmd.opcode;
+
+	if (op->ocmd.buswidth)
+		xspi->command = (xspi->command << 8) | op->ocmd.opcode;
+
+	if (op->addr.buswidth) {
+		xspi->addr_nbytes = op->addr.nbytes;
+		if (offs && len)
+			xspi->smadr = *offs;
+		else
+			xspi->smadr = op->addr.val;
+	}
+
+	if (op->dummy.buswidth)
+		xspi->dummy = op->dummy.ncycles;
+
+	xspi->dir = op->data.dir;
+	if (op->data.buswidth) {
+		u32 nbytes;
+
+		xspi->buffer = op->data.buf.in;
+
+		if (offs && len)
+			nbytes = *len;
+		else
+			nbytes = op->data.nbytes;
+		xspi->xferlen = nbytes;
+	}
+
+	if (op->cmd.buswidth == 1) {
+		if (op->addr.buswidth == 2 || op->data.buswidth == 2)
+			xspi->proto = PROTO_1S_2S_2S;
+		else if (op->addr.buswidth == 4 || op->data.buswidth == 4)
+			xspi->proto = PROTO_1S_4S_4S;
+	} else if (op->cmd.buswidth == 2 &&
+		   (op->addr.buswidth == 2 || op->data.buswidth == 2)) {
+		xspi->proto = PROTO_2S_2S_2S;
+	} else if (op->cmd.buswidth == 4 &&
+		   (op->addr.buswidth == 4 || op->data.buswidth == 4)) {
+		xspi->proto = PROTO_4S_4S_4S;
+	}
+}
+
 void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 		   size_t *len)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
 
-	rpcif_prepare_helper(rpc, op, offs, len);
+	if (rpc->info->type == XSPI_RZ_G3E)
+		xspi_prepare(rpc, op, offs, len);
+	else
+		rpcif_prepare_helper(rpc, op, offs, len);
 }
 EXPORT_SYMBOL(rpcif_prepare);
 
@@ -484,6 +620,146 @@ static int rpcif_manual_xfer_helper(struct rpcif_priv *rpc)
 	return ret;
 }
 
+static int xspi_manual_xfer(struct rpcif_priv *xspi)
+{
+	u32 pos = 0, max = 8;
+	int ret = 0;
+
+	regmap_update_bits(xspi->regmap, XSPI_CDCTL0, XSPI_CDCTL0_TRNUM(0x3),
+			   XSPI_CDCTL0_TRNUM(0));
+
+	regmap_update_bits(xspi->regmap, XSPI_CDCTL0, XSPI_CDCTL0_TRREQ, 0);
+
+	regmap_write(xspi->regmap, XSPI_CDTBUF0,
+		     XSPI_CDTBUF_CMDSIZE(0x1) | XSPI_CDTBUF_CMD_FIELD(xspi->command));
+
+	regmap_write(xspi->regmap, XSPI_CDABUF0, 0);
+
+	regmap_update_bits(xspi->regmap, XSPI_CDTBUF0, XSPI_CDTBUF_ADDSIZE(0x7),
+			   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
+
+	regmap_write(xspi->regmap, XSPI_CDABUF0, xspi->smadr);
+
+	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
+			   XSPI_LIOCFG_PRTMD(xspi->proto));
+
+	switch (xspi->dir) {
+	case RPCIF_DATA_OUT:
+		while (pos < xspi->xferlen) {
+			u32 bytes_left = xspi->xferlen - pos;
+			u32 nbytes, data[2], *p = data;
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_TRTYPE, XSPI_CDTBUF_TRTYPE);
+
+			nbytes = bytes_left >= max ? max : bytes_left;
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_DATASIZE(0xf),
+					   XSPI_CDTBUF_DATASIZE(nbytes));
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_ADDSIZE(0x7),
+					   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
+
+			memcpy(data, xspi->buffer + pos, nbytes);
+
+			if (nbytes > 4) {
+				regmap_write(xspi->regmap, XSPI_CDD0BUF0, *p++);
+				regmap_write(xspi->regmap, XSPI_CDD1BUF0, *p);
+			} else {
+				regmap_write(xspi->regmap, XSPI_CDD0BUF0, *p);
+			}
+
+			regmap_write(xspi->regmap, XSPI_CDABUF0, xspi->smadr + pos);
+
+			regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+					   XSPI_CDCTL0_TRREQ, XSPI_CDCTL0_TRREQ);
+
+			ret = wait_msg_xfer_end(xspi);
+			if (ret)
+				goto err_out;
+
+			regmap_update_bits(xspi->regmap, XSPI_INTC,
+					   XSPI_INTC_CMDCMPC, XSPI_INTC_CMDCMPC);
+
+			pos += nbytes;
+		}
+		regmap_update_bits(xspi->regmap, XSPI_CDCTL0, XSPI_CDCTL0_TRREQ, 0);
+		break;
+	case RPCIF_DATA_IN:
+		while (pos < xspi->xferlen) {
+			u32 bytes_left = xspi->xferlen - pos;
+			u32 nbytes, data[2], *p = data;
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_TRTYPE,
+					   ~(u32)XSPI_CDTBUF_TRTYPE);
+
+			/* nbytes can be up to 8 bytes */
+			nbytes = bytes_left >= max ? max : bytes_left;
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_DATASIZE(0xf),
+					   XSPI_CDTBUF_DATASIZE(nbytes));
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_ADDSIZE(0x7),
+					   XSPI_CDTBUF_ADDSIZE(xspi->addr_nbytes));
+
+			if (xspi->addr_nbytes)
+				regmap_write(xspi->regmap, XSPI_CDABUF0,
+					     xspi->smadr + pos);
+
+			regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+					   XSPI_CDTBUF_LATE(0x1f),
+					   XSPI_CDTBUF_LATE(xspi->dummy));
+
+			regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+					   XSPI_CDCTL0_TRREQ, XSPI_CDCTL0_TRREQ);
+
+			ret = wait_msg_xfer_end(xspi);
+			if (ret)
+				goto err_out;
+
+			if (nbytes > 4) {
+				regmap_read(xspi->regmap, XSPI_CDD0BUF0, p++);
+				regmap_read(xspi->regmap, XSPI_CDD1BUF0, p);
+			} else {
+				regmap_read(xspi->regmap, XSPI_CDD0BUF0, p);
+			}
+
+			memcpy(xspi->buffer + pos, data, nbytes);
+
+			regmap_update_bits(xspi->regmap, XSPI_INTC,
+					   XSPI_INTC_CMDCMPC, XSPI_INTC_CMDCMPC);
+
+			pos += nbytes;
+		}
+		regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+				   XSPI_CDCTL0_TRREQ, 0);
+		break;
+	default:
+		regmap_update_bits(xspi->regmap, XSPI_CDTBUF0,
+				   XSPI_CDTBUF_TRTYPE, XSPI_CDTBUF_TRTYPE);
+		regmap_update_bits(xspi->regmap, XSPI_CDCTL0,
+				   XSPI_CDCTL0_TRREQ, XSPI_CDCTL0_TRREQ);
+
+		ret = wait_msg_xfer_end(xspi);
+		if (ret)
+			goto err_out;
+
+		regmap_update_bits(xspi->regmap, XSPI_INTC,
+				   XSPI_INTC_CMDCMPC, XSPI_INTC_CMDCMPC);
+	}
+
+	return ret;
+
+err_out:
+	xspi_hw_init(xspi);
+	return ret;
+}
+
 int rpcif_manual_xfer(struct device *dev)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
@@ -493,7 +769,10 @@ int rpcif_manual_xfer(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = rpcif_manual_xfer_helper(rpc);
+	if (rpc->info->type == XSPI_RZ_G3E)
+		ret = xspi_manual_xfer(rpc);
+	else
+		ret = rpcif_manual_xfer_helper(rpc);
 
 	pm_runtime_put(dev);
 
@@ -543,6 +822,61 @@ static void memcpy_fromio_readw(void *to,
 	}
 }
 
+ssize_t xspi_dirmap_write(struct device *dev, u64 offs, size_t len, const void *buf)
+{
+	struct rpcif_priv *xspi = dev_get_drvdata(dev);
+	loff_t from = offs & (xspi->size - 1);
+	u8 addsize = xspi->addr_nbytes - 1;
+	size_t size = xspi->size - from;
+	ssize_t writebytes;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	if (len > size)
+		len = size;
+
+	if (len > MWRSIZE_MAX)
+		writebytes = MWRSIZE_MAX;
+	else
+		writebytes = len;
+
+	regmap_update_bits(xspi->regmap, XSPI_CMCFG0CS0,
+			   XSPI_CMCFG0_FFMT(0x3) | XSPI_CMCFG0_ADDSIZE(0x3),
+			   XSPI_CMCFG0_FFMT(0) | XSPI_CMCFG0_ADDSIZE(addsize));
+
+	regmap_update_bits(xspi->regmap, XSPI_CMCFG2CS0,
+			   XSPI_CMCFG2_WRCMD_UPPER(0xff) | XSPI_CMCFG2_WRLATE(0x1f),
+			   XSPI_CMCFG2_WRCMD_UPPER(xspi->command) |
+			   XSPI_CMCFG2_WRLATE(xspi->dummy));
+
+	regmap_update_bits(xspi->regmap, XSPI_BMCTL0,
+			   XSPI_BMCTL0_CS0ACC(0xff), XSPI_BMCTL0_CS0ACC(0x03));
+
+	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
+			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
+			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
+			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
+			   XSPI_BMCFG_PREEN);
+
+	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
+			   XSPI_LIOCFG_PRTMD(xspi->proto));
+
+	memcpy_toio(xspi->dirmap + from, buf, writebytes);
+
+	/* Request to push the pending data */
+	if (writebytes < MWRSIZE_MAX)
+		regmap_update_bits(xspi->regmap, XSPI_BMCTL1,
+				   XSPI_BMCTL1_MWRPUSH, XSPI_BMCTL1_MWRPUSH);
+
+	pm_runtime_put(dev);
+
+	return writebytes;
+}
+EXPORT_SYMBOL(xspi_dirmap_write);
+
 static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
 					size_t len, void *buf)
 {
@@ -571,6 +905,42 @@ static ssize_t rpcif_dirmap_read_helper(struct rpcif_priv *rpc, u64 offs,
 	return len;
 }
 
+static ssize_t xspi_dirmap_read(struct rpcif_priv *xspi, u64 offs, size_t len,
+				void *buf)
+{
+	loff_t from = offs & (xspi->size - 1);
+	size_t size = xspi->size - from;
+	u8 addsize = xspi->addr_nbytes - 1;
+
+	if (len > size)
+		len = size;
+
+	regmap_update_bits(xspi->regmap, XSPI_CMCFG0CS0,
+			   XSPI_CMCFG0_FFMT(0x3) | XSPI_CMCFG0_ADDSIZE(0x3),
+			   XSPI_CMCFG0_FFMT(0) | XSPI_CMCFG0_ADDSIZE(addsize));
+
+	regmap_update_bits(xspi->regmap, XSPI_CMCFG1CS0,
+			   XSPI_CMCFG1_RDCMD(0xffff) | XSPI_CMCFG1_RDLATE(0x1f),
+			   XSPI_CMCFG1_RDCMD_UPPER_BYTE(xspi->command) |
+			   XSPI_CMCFG1_RDLATE(xspi->dummy));
+
+	regmap_update_bits(xspi->regmap, XSPI_BMCTL0, XSPI_BMCTL0_CS0ACC(0xff),
+			   XSPI_BMCTL0_CS0ACC(0x01));
+
+	regmap_update_bits(xspi->regmap, XSPI_BMCFG,
+			   XSPI_BMCFG_WRMD | XSPI_BMCFG_MWRCOMB |
+			   XSPI_BMCFG_MWRSIZE(0xff) | XSPI_BMCFG_PREEN,
+			   0 | XSPI_BMCFG_MWRCOMB | XSPI_BMCFG_MWRSIZE(0x0f) |
+			   XSPI_BMCFG_PREEN);
+
+	regmap_update_bits(xspi->regmap, XSPI_LIOCFGCS0, XSPI_LIOCFG_PRTMD(0x3ff),
+			   XSPI_LIOCFG_PRTMD(xspi->proto));
+
+	memcpy_fromio(buf, xspi->dirmap + from, len);
+
+	return len;
+}
+
 ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
 {
 	struct rpcif_priv *rpc = dev_get_drvdata(dev);
@@ -581,7 +951,10 @@ ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf)
 	if (ret)
 		return ret;
 
-	length = rpcif_dirmap_read_helper(rpc, offs, len, buf);
+	if (rpc->info->type == XSPI_RZ_G3E)
+		length = xspi_dirmap_read(rpc, offs, len, buf);
+	else
+		length = rpcif_dirmap_read_helper(rpc, offs, len, buf);
 
 	pm_runtime_put(dev);
 
@@ -690,8 +1063,14 @@ static const struct rpcif_info rpcif_info_gen4 = {
 	.strtim = 15,
 };
 
+static const struct rpcif_info xspi_info_r9a09g047 = {
+	.regmap_config = &xspi_regmap_config,
+	.type = XSPI_RZ_G3E,
+};
+
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
+	{ .compatible = "renesas,r9a09g047-xspi", .data = &xspi_info_r9a09g047 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
 	{ .compatible = "renesas,rcar-gen4-rpc-if", .data = &rpcif_info_gen4 },
 	{ .compatible = "renesas,rzg2l-rpc-if", .data = &rpcif_info_rz_g2l },
diff --git a/drivers/memory/renesas-xspi-if-regs.h b/drivers/memory/renesas-xspi-if-regs.h
new file mode 100644
index 000000000000..53f801d591f2
--- /dev/null
+++ b/drivers/memory/renesas-xspi-if-regs.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ xSPI Interface Registers Definitions
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __RENESAS_XSPI_IF_REGS_H__
+#define __RENESAS_XSPI_IF_REGS_H__
+
+#include <linux/bits.h>
+
+/* xSPI Wrapper Configuration Register */
+#define XSPI_WRAPCFG		0x0000
+
+/* xSPI Bridge Configuration Register */
+#define XSPI_BMCFG		0x0008
+#define XSPI_BMCFG_WRMD		BIT(0)
+#define XSPI_BMCFG_MWRCOMB	BIT(7)
+#define XSPI_BMCFG_MWRSIZE(val)	(((val) & 0xff) << 8)
+#define XSPI_BMCFG_PREEN	BIT(16)
+
+/* xSPI Command Map Configuration Register 0 CS0 */
+#define XSPI_CMCFG0CS0		0x0010
+#define XSPI_CMCFG0_FFMT(val)		(((val) & 0x03) << 0)
+#define XSPI_CMCFG0_ADDSIZE(val)	(((val) & 0x03) << 2)
+
+/* xSPI Command Map Configuration Register 1 CS0 */
+#define XSPI_CMCFG1CS0		0x0014
+#define XSPI_CMCFG1_RDCMD(val)	(((val) & 0xffff) << 0)
+#define XSPI_CMCFG1_RDCMD_UPPER_BYTE(val)	(((val) & 0xff) << 8)
+#define XSPI_CMCFG1_RDLATE(val)	(((val) & 0x1f) << 16)
+
+/* xSPI Command Map Configuration Register 2 CS0 */
+#define XSPI_CMCFG2CS0		0x0018
+#define XSPI_CMCFG2_WRCMD(val)	(((val) & 0xffff) << 0)
+#define XSPI_CMCFG2_WRCMD_UPPER(val)	(((val) & 0xff) << 8)
+#define XSPI_CMCFG2_WRLATE(val)	(((val) & 0x1f) << 16)
+
+/* xSPI Link I/O Configuration Register CS0 */
+#define XSPI_LIOCFGCS0		0x0050
+#define XSPI_LIOCFG_PRTMD(val)	(((val) & 0x3ff) << 0)
+#define XSPI_LIOCFG_CSMIN(val)	(((val) & 0x0f) << 16)
+#define XSPI_LIOCFG_CSASTEX	BIT(20)
+#define XSPI_LIOCFG_CSNEGEX	BIT(21)
+
+/* xSPI Bridge Map Control Register 0 */
+#define XSPI_BMCTL0		0x0060
+#define XSPI_BMCTL0_CS0ACC(val)	(((val) & 0x03) << 0)
+
+/* xSPI Bridge Map Control Register 1 */
+#define XSPI_BMCTL1		0x0064
+#define XSPI_BMCTL1_MWRPUSH	BIT(8)
+
+/* xSPI Command Manual Control Register 0 */
+#define XSPI_CDCTL0		0x0070
+#define XSPI_CDCTL0_TRREQ	BIT(0)
+#define XSPI_CDCTL0_CSSEL	BIT(3)
+#define XSPI_CDCTL0_TRNUM(val)	(((val) & 0x03) << 4)
+
+/* xSPI Command Manual Type Buf */
+#define XSPI_CDTBUF0		0x0080
+#define XSPI_CDTBUF_CMDSIZE(val)	(((val) & 0x03) << 0)
+#define XSPI_CDTBUF_ADDSIZE(val)	(((val) & 0x07) << 2)
+#define XSPI_CDTBUF_DATASIZE(val)	(((val) & 0x0f) << 5)
+#define XSPI_CDTBUF_LATE(val)		(((val) & 0x1f) << 9)
+#define XSPI_CDTBUF_TRTYPE	BIT(15)
+#define XSPI_CDTBUF_CMD(val)		(((val) & 0xffff) << 16)
+#define XSPI_CDTBUF_CMD_FIELD(val)	(((val) & 0xff) << 24)
+
+/* xSPI Command Manual Address Buff */
+#define XSPI_CDABUF0		0x0084
+
+/* xSPI Command Manual Data 0 Buf */
+#define XSPI_CDD0BUF0		0x0088
+
+/* xSPI Command Manual Data 1 Buf */
+#define XSPI_CDD1BUF0		0x008c
+
+/* xSPI Command Calibration Control Register 0 CS0 */
+#define XSPI_CCCTL0CS0		0x0130
+#define XSPI_CCCTL0_CAEN	BIT(0)
+
+/* xSPI Interrupt Status Register */
+#define XSPI_INTS		0x0190
+#define XSPI_INTS_CMDCMP	BIT(0)
+
+/* xSPI Interrupt Clear Register */
+#define XSPI_INTC		0x0194
+#define XSPI_INTC_CMDCMPC	BIT(0)
+
+/* xSPI Interrupt Enable Register */
+#define XSPI_INTE		0x0198
+#define XSPI_INTE_CMDCMPE	BIT(0)
+
+/* Maximum data size of MWRSIZE*/
+#define MWRSIZE_MAX		64
+
+/* xSPI Protocol mode */
+#define PROTO_1S_2S_2S		0x48
+#define PROTO_2S_2S_2S		0x49
+#define PROTO_1S_4S_4S		0x090
+#define PROTO_4S_4S_4S		0x092
+
+#endif /* __RENESAS_XSPI_IF_REGS_H__ */
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index b8fa30fd6b50..53663c4e5ae3 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -61,12 +61,14 @@ enum rpcif_type {
 	RPCIF_RCAR_GEN3,
 	RPCIF_RCAR_GEN4,
 	RPCIF_RZ_G2L,
+	XSPI_RZ_G3E,
 };
 
 struct rpcif {
 	struct device *dev;
 	void __iomem *dirmap;
 	size_t size;
+	bool xspi;
 };
 
 int rpcif_sw_init(struct rpcif *rpc, struct device *dev);
@@ -75,5 +77,7 @@ void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 		   size_t *len);
 int rpcif_manual_xfer(struct device *dev);
 ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf);
+ssize_t xspi_dirmap_write(struct device *dev, u64 offs, size_t len,
+			  const void *buf);
 
 #endif // __RENESAS_RPC_IF_H
-- 
2.43.0


