Return-Path: <linux-renesas-soc+bounces-15256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D860A77DDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825273AC364
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A451203717;
	Tue,  1 Apr 2025 14:36:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71641ACED1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518160; cv=none; b=u72T3W2mHW7pCByDFdaFSPk2Z4O8S82izNdQbWUsgbzOzKIhl8rw3HnyKXxM5HYXCiKT+7sBGL1YyGpCO30log8PewDlfUsc9O5vbe5GEf9KRRVYNIYUvdilZdUIN6E39f8Fg6E0JT33ru+a98plCgr4CgtoXx97GzmNtVRH47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518160; c=relaxed/simple;
	bh=d5ldzYNspLr6MitOi3hk/CymliWHD3ow9NAID/ea/Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOn1r6FF+w0ZngDGTqvH5DGqkVKk6VD/124/5ObEu/vGwPIW82rSHm45L7gQnsNkJXXtsU5Mb/cSUBruYFt4J3Mq3BnM3AsFbOA1k5gwnO0XjaYNWN7puT1bIBy69mtI1DXhXisD4W+PNNVVXw8lcpK1LKaaXu8KJZt/yFqpDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xnjkwUJRSUaEwKoTccqqjA==
X-CSE-MsgGUID: VTcR/jYJQmCWfmSjKnMe0Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Apr 2025 23:35:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.156])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 938E5432BC98;
	Tue,  1 Apr 2025 23:35:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/9] memory: renesas-rpc-if: Move rpc-if reg definitions
Date: Tue,  1 Apr 2025 15:35:21 +0100
Message-ID: <20250401143537.224047-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rpc-if reg definitions to a header file for the preparation of adding
support for RZ/G3E XSPI that has different register definitions.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/memory/renesas-rpc-if-regs.h | 147 +++++++++++++++++++++++++++
 drivers/memory/renesas-rpc-if.c      | 134 +-----------------------
 2 files changed, 148 insertions(+), 133 deletions(-)
 create mode 100644 drivers/memory/renesas-rpc-if-regs.h

diff --git a/drivers/memory/renesas-rpc-if-regs.h b/drivers/memory/renesas-rpc-if-regs.h
new file mode 100644
index 000000000000..e6b33f7c40a8
--- /dev/null
+++ b/drivers/memory/renesas-rpc-if-regs.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * R-Car RPC Interface Registers Definitions
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __RENESAS_RPC_IF_REGS_H__
+#define __RENESAS_RPC_IF_REGS_H__
+
+#include <linux/bits.h>
+
+#define RPCIF_CMNCR		0x0000	/* R/W */
+#define RPCIF_CMNCR_MD		BIT(31)
+#define RPCIF_CMNCR_MOIIO3(val)	(((val) & 0x3) << 22)
+#define RPCIF_CMNCR_MOIIO2(val)	(((val) & 0x3) << 20)
+#define RPCIF_CMNCR_MOIIO1(val)	(((val) & 0x3) << 18)
+#define RPCIF_CMNCR_MOIIO0(val)	(((val) & 0x3) << 16)
+#define RPCIF_CMNCR_MOIIO(val)	(RPCIF_CMNCR_MOIIO0(val) | RPCIF_CMNCR_MOIIO1(val) | \
+				 RPCIF_CMNCR_MOIIO2(val) | RPCIF_CMNCR_MOIIO3(val))
+#define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* documented for RZ/G2L */
+#define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* documented for RZ/G2L */
+#define RPCIF_CMNCR_IO0FV(val)	(((val) & 0x3) << 8)
+#define RPCIF_CMNCR_IOFV(val)	(RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
+				 RPCIF_CMNCR_IO3FV(val))
+#define RPCIF_CMNCR_BSZ(val)	(((val) & 0x3) << 0)
+
+#define RPCIF_SSLDR		0x0004	/* R/W */
+#define RPCIF_SSLDR_SPNDL(d)	(((d) & 0x7) << 16)
+#define RPCIF_SSLDR_SLNDL(d)	(((d) & 0x7) << 8)
+#define RPCIF_SSLDR_SCKDL(d)	(((d) & 0x7) << 0)
+
+#define RPCIF_DRCR		0x000C	/* R/W */
+#define RPCIF_DRCR_SSLN		BIT(24)
+#define RPCIF_DRCR_RBURST(v)	((((v) - 1) & 0x1F) << 16)
+#define RPCIF_DRCR_RCF		BIT(9)
+#define RPCIF_DRCR_RBE		BIT(8)
+#define RPCIF_DRCR_SSLE		BIT(0)
+
+#define RPCIF_DRCMR		0x0010	/* R/W */
+#define RPCIF_DRCMR_CMD(c)	(((c) & 0xFF) << 16)
+#define RPCIF_DRCMR_OCMD(c)	(((c) & 0xFF) << 0)
+
+#define RPCIF_DREAR		0x0014	/* R/W */
+#define RPCIF_DREAR_EAV(c)	(((c) & 0xF) << 16)
+#define RPCIF_DREAR_EAC(c)	(((c) & 0x7) << 0)
+
+#define RPCIF_DROPR		0x0018	/* R/W */
+
+#define RPCIF_DRENR		0x001C	/* R/W */
+#define RPCIF_DRENR_CDB(o)	(((u32)((o) & 0x3)) << 30)
+#define RPCIF_DRENR_OCDB(o)	(((o) & 0x3) << 28)
+#define RPCIF_DRENR_ADB(o)	(((o) & 0x3) << 24)
+#define RPCIF_DRENR_OPDB(o)	(((o) & 0x3) << 20)
+#define RPCIF_DRENR_DRDB(o)	(((o) & 0x3) << 16)
+#define RPCIF_DRENR_DME		BIT(15)
+#define RPCIF_DRENR_CDE		BIT(14)
+#define RPCIF_DRENR_OCDE	BIT(12)
+#define RPCIF_DRENR_ADE(v)	(((v) & 0xF) << 8)
+#define RPCIF_DRENR_OPDE(v)	(((v) & 0xF) << 4)
+
+#define RPCIF_SMCR		0x0020	/* R/W */
+#define RPCIF_SMCR_SSLKP	BIT(8)
+#define RPCIF_SMCR_SPIRE	BIT(2)
+#define RPCIF_SMCR_SPIWE	BIT(1)
+#define RPCIF_SMCR_SPIE		BIT(0)
+
+#define RPCIF_SMCMR		0x0024	/* R/W */
+#define RPCIF_SMCMR_CMD(c)	(((c) & 0xFF) << 16)
+#define RPCIF_SMCMR_OCMD(c)	(((c) & 0xFF) << 0)
+
+#define RPCIF_SMADR		0x0028	/* R/W */
+
+#define RPCIF_SMOPR		0x002C	/* R/W */
+#define RPCIF_SMOPR_OPD3(o)	(((o) & 0xFF) << 24)
+#define RPCIF_SMOPR_OPD2(o)	(((o) & 0xFF) << 16)
+#define RPCIF_SMOPR_OPD1(o)	(((o) & 0xFF) << 8)
+#define RPCIF_SMOPR_OPD0(o)	(((o) & 0xFF) << 0)
+
+#define RPCIF_SMENR		0x0030	/* R/W */
+#define RPCIF_SMENR_CDB(o)	(((o) & 0x3) << 30)
+#define RPCIF_SMENR_OCDB(o)	(((o) & 0x3) << 28)
+#define RPCIF_SMENR_ADB(o)	(((o) & 0x3) << 24)
+#define RPCIF_SMENR_OPDB(o)	(((o) & 0x3) << 20)
+#define RPCIF_SMENR_SPIDB(o)	(((o) & 0x3) << 16)
+#define RPCIF_SMENR_DME		BIT(15)
+#define RPCIF_SMENR_CDE		BIT(14)
+#define RPCIF_SMENR_OCDE	BIT(12)
+#define RPCIF_SMENR_ADE(v)	(((v) & 0xF) << 8)
+#define RPCIF_SMENR_OPDE(v)	(((v) & 0xF) << 4)
+#define RPCIF_SMENR_SPIDE(v)	(((v) & 0xF) << 0)
+
+#define RPCIF_SMRDR0		0x0038	/* R */
+#define RPCIF_SMRDR1		0x003C	/* R */
+#define RPCIF_SMWDR0		0x0040	/* W */
+#define RPCIF_SMWDR1		0x0044	/* W */
+
+#define RPCIF_CMNSR		0x0048	/* R */
+#define RPCIF_CMNSR_SSLF	BIT(1)
+#define RPCIF_CMNSR_TEND	BIT(0)
+
+#define RPCIF_DRDMCR		0x0058	/* R/W */
+#define RPCIF_DMDMCR_DMCYC(v)	((((v) - 1) & 0x1F) << 0)
+
+#define RPCIF_DRDRENR		0x005C	/* R/W */
+#define RPCIF_DRDRENR_HYPE(v)	(((v) & 0x7) << 12)
+#define RPCIF_DRDRENR_ADDRE	BIT(8)
+#define RPCIF_DRDRENR_OPDRE	BIT(4)
+#define RPCIF_DRDRENR_DRDRE	BIT(0)
+
+#define RPCIF_SMDMCR		0x0060	/* R/W */
+#define RPCIF_SMDMCR_DMCYC(v)	((((v) - 1) & 0x1F) << 0)
+
+#define RPCIF_SMDRENR		0x0064	/* R/W */
+#define RPCIF_SMDRENR_HYPE(v)	(((v) & 0x7) << 12)
+#define RPCIF_SMDRENR_ADDRE	BIT(8)
+#define RPCIF_SMDRENR_OPDRE	BIT(4)
+#define RPCIF_SMDRENR_SPIDRE	BIT(0)
+
+#define RPCIF_PHYADD		0x0070	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
+#define RPCIF_PHYWR		0x0074	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
+
+#define RPCIF_PHYCNT		0x007C	/* R/W */
+#define RPCIF_PHYCNT_CAL	BIT(31)
+#define RPCIF_PHYCNT_OCTA(v)	(((v) & 0x3) << 22)
+#define RPCIF_PHYCNT_EXDS	BIT(21)
+#define RPCIF_PHYCNT_OCT	BIT(20)
+#define RPCIF_PHYCNT_DDRCAL	BIT(19)
+#define RPCIF_PHYCNT_HS		BIT(18)
+#define RPCIF_PHYCNT_CKSEL(v)	(((v) & 0x3) << 16) /* valid only for RZ/G2L */
+#define RPCIF_PHYCNT_STRTIM(v)	(((v) & 0x7) << 15 | ((v) & 0x8) << 24) /* valid for R-Car and RZ/G2{E,H,M,N} */
+
+#define RPCIF_PHYCNT_WBUF2	BIT(4)
+#define RPCIF_PHYCNT_WBUF	BIT(2)
+#define RPCIF_PHYCNT_PHYMEM(v)	(((v) & 0x3) << 0)
+#define RPCIF_PHYCNT_PHYMEM_MASK GENMASK(1, 0)
+
+#define RPCIF_PHYOFFSET1	0x0080	/* R/W */
+#define RPCIF_PHYOFFSET1_DDRTMG(v) (((v) & 0x3) << 28)
+
+#define RPCIF_PHYOFFSET2	0x0084	/* R/W */
+#define RPCIF_PHYOFFSET2_OCTTMG(v) (((v) & 0x7) << 8)
+
+#define RPCIF_PHYINT		0x0088	/* R/W */
+#define RPCIF_PHYINT_WPVAL	BIT(1)
+
+#endif /* __RENESAS_RPC_IF_REGS_H__ */
diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index c29bec8327e8..20d1a6e4a500 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -18,139 +18,7 @@
 
 #include <memory/renesas-rpc-if.h>
 
-#define RPCIF_CMNCR		0x0000	/* R/W */
-#define RPCIF_CMNCR_MD		BIT(31)
-#define RPCIF_CMNCR_MOIIO3(val)	(((val) & 0x3) << 22)
-#define RPCIF_CMNCR_MOIIO2(val)	(((val) & 0x3) << 20)
-#define RPCIF_CMNCR_MOIIO1(val)	(((val) & 0x3) << 18)
-#define RPCIF_CMNCR_MOIIO0(val)	(((val) & 0x3) << 16)
-#define RPCIF_CMNCR_MOIIO(val)	(RPCIF_CMNCR_MOIIO0(val) | RPCIF_CMNCR_MOIIO1(val) | \
-				 RPCIF_CMNCR_MOIIO2(val) | RPCIF_CMNCR_MOIIO3(val))
-#define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* documented for RZ/G2L */
-#define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* documented for RZ/G2L */
-#define RPCIF_CMNCR_IO0FV(val)	(((val) & 0x3) << 8)
-#define RPCIF_CMNCR_IOFV(val)	(RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
-				 RPCIF_CMNCR_IO3FV(val))
-#define RPCIF_CMNCR_BSZ(val)	(((val) & 0x3) << 0)
-
-#define RPCIF_SSLDR		0x0004	/* R/W */
-#define RPCIF_SSLDR_SPNDL(d)	(((d) & 0x7) << 16)
-#define RPCIF_SSLDR_SLNDL(d)	(((d) & 0x7) << 8)
-#define RPCIF_SSLDR_SCKDL(d)	(((d) & 0x7) << 0)
-
-#define RPCIF_DRCR		0x000C	/* R/W */
-#define RPCIF_DRCR_SSLN		BIT(24)
-#define RPCIF_DRCR_RBURST(v)	((((v) - 1) & 0x1F) << 16)
-#define RPCIF_DRCR_RCF		BIT(9)
-#define RPCIF_DRCR_RBE		BIT(8)
-#define RPCIF_DRCR_SSLE		BIT(0)
-
-#define RPCIF_DRCMR		0x0010	/* R/W */
-#define RPCIF_DRCMR_CMD(c)	(((c) & 0xFF) << 16)
-#define RPCIF_DRCMR_OCMD(c)	(((c) & 0xFF) << 0)
-
-#define RPCIF_DREAR		0x0014	/* R/W */
-#define RPCIF_DREAR_EAV(c)	(((c) & 0xF) << 16)
-#define RPCIF_DREAR_EAC(c)	(((c) & 0x7) << 0)
-
-#define RPCIF_DROPR		0x0018	/* R/W */
-
-#define RPCIF_DRENR		0x001C	/* R/W */
-#define RPCIF_DRENR_CDB(o)	(((u32)((o) & 0x3)) << 30)
-#define RPCIF_DRENR_OCDB(o)	(((o) & 0x3) << 28)
-#define RPCIF_DRENR_ADB(o)	(((o) & 0x3) << 24)
-#define RPCIF_DRENR_OPDB(o)	(((o) & 0x3) << 20)
-#define RPCIF_DRENR_DRDB(o)	(((o) & 0x3) << 16)
-#define RPCIF_DRENR_DME		BIT(15)
-#define RPCIF_DRENR_CDE		BIT(14)
-#define RPCIF_DRENR_OCDE	BIT(12)
-#define RPCIF_DRENR_ADE(v)	(((v) & 0xF) << 8)
-#define RPCIF_DRENR_OPDE(v)	(((v) & 0xF) << 4)
-
-#define RPCIF_SMCR		0x0020	/* R/W */
-#define RPCIF_SMCR_SSLKP	BIT(8)
-#define RPCIF_SMCR_SPIRE	BIT(2)
-#define RPCIF_SMCR_SPIWE	BIT(1)
-#define RPCIF_SMCR_SPIE		BIT(0)
-
-#define RPCIF_SMCMR		0x0024	/* R/W */
-#define RPCIF_SMCMR_CMD(c)	(((c) & 0xFF) << 16)
-#define RPCIF_SMCMR_OCMD(c)	(((c) & 0xFF) << 0)
-
-#define RPCIF_SMADR		0x0028	/* R/W */
-
-#define RPCIF_SMOPR		0x002C	/* R/W */
-#define RPCIF_SMOPR_OPD3(o)	(((o) & 0xFF) << 24)
-#define RPCIF_SMOPR_OPD2(o)	(((o) & 0xFF) << 16)
-#define RPCIF_SMOPR_OPD1(o)	(((o) & 0xFF) << 8)
-#define RPCIF_SMOPR_OPD0(o)	(((o) & 0xFF) << 0)
-
-#define RPCIF_SMENR		0x0030	/* R/W */
-#define RPCIF_SMENR_CDB(o)	(((o) & 0x3) << 30)
-#define RPCIF_SMENR_OCDB(o)	(((o) & 0x3) << 28)
-#define RPCIF_SMENR_ADB(o)	(((o) & 0x3) << 24)
-#define RPCIF_SMENR_OPDB(o)	(((o) & 0x3) << 20)
-#define RPCIF_SMENR_SPIDB(o)	(((o) & 0x3) << 16)
-#define RPCIF_SMENR_DME		BIT(15)
-#define RPCIF_SMENR_CDE		BIT(14)
-#define RPCIF_SMENR_OCDE	BIT(12)
-#define RPCIF_SMENR_ADE(v)	(((v) & 0xF) << 8)
-#define RPCIF_SMENR_OPDE(v)	(((v) & 0xF) << 4)
-#define RPCIF_SMENR_SPIDE(v)	(((v) & 0xF) << 0)
-
-#define RPCIF_SMRDR0		0x0038	/* R */
-#define RPCIF_SMRDR1		0x003C	/* R */
-#define RPCIF_SMWDR0		0x0040	/* W */
-#define RPCIF_SMWDR1		0x0044	/* W */
-
-#define RPCIF_CMNSR		0x0048	/* R */
-#define RPCIF_CMNSR_SSLF	BIT(1)
-#define RPCIF_CMNSR_TEND	BIT(0)
-
-#define RPCIF_DRDMCR		0x0058	/* R/W */
-#define RPCIF_DMDMCR_DMCYC(v)	((((v) - 1) & 0x1F) << 0)
-
-#define RPCIF_DRDRENR		0x005C	/* R/W */
-#define RPCIF_DRDRENR_HYPE(v)	(((v) & 0x7) << 12)
-#define RPCIF_DRDRENR_ADDRE	BIT(8)
-#define RPCIF_DRDRENR_OPDRE	BIT(4)
-#define RPCIF_DRDRENR_DRDRE	BIT(0)
-
-#define RPCIF_SMDMCR		0x0060	/* R/W */
-#define RPCIF_SMDMCR_DMCYC(v)	((((v) - 1) & 0x1F) << 0)
-
-#define RPCIF_SMDRENR		0x0064	/* R/W */
-#define RPCIF_SMDRENR_HYPE(v)	(((v) & 0x7) << 12)
-#define RPCIF_SMDRENR_ADDRE	BIT(8)
-#define RPCIF_SMDRENR_OPDRE	BIT(4)
-#define RPCIF_SMDRENR_SPIDRE	BIT(0)
-
-#define RPCIF_PHYADD		0x0070	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
-#define RPCIF_PHYWR		0x0074	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
-
-#define RPCIF_PHYCNT		0x007C	/* R/W */
-#define RPCIF_PHYCNT_CAL	BIT(31)
-#define RPCIF_PHYCNT_OCTA(v)	(((v) & 0x3) << 22)
-#define RPCIF_PHYCNT_EXDS	BIT(21)
-#define RPCIF_PHYCNT_OCT	BIT(20)
-#define RPCIF_PHYCNT_DDRCAL	BIT(19)
-#define RPCIF_PHYCNT_HS		BIT(18)
-#define RPCIF_PHYCNT_CKSEL(v)	(((v) & 0x3) << 16) /* valid only for RZ/G2L */
-#define RPCIF_PHYCNT_STRTIM(v)	(((v) & 0x7) << 15 | ((v) & 0x8) << 24) /* valid for R-Car and RZ/G2{E,H,M,N} */
-
-#define RPCIF_PHYCNT_WBUF2	BIT(4)
-#define RPCIF_PHYCNT_WBUF	BIT(2)
-#define RPCIF_PHYCNT_PHYMEM(v)	(((v) & 0x3) << 0)
-#define RPCIF_PHYCNT_PHYMEM_MASK GENMASK(1, 0)
-
-#define RPCIF_PHYOFFSET1	0x0080	/* R/W */
-#define RPCIF_PHYOFFSET1_DDRTMG(v) (((v) & 0x3) << 28)
-
-#define RPCIF_PHYOFFSET2	0x0084	/* R/W */
-#define RPCIF_PHYOFFSET2_OCTTMG(v) (((v) & 0x7) << 8)
-
-#define RPCIF_PHYINT		0x0088	/* R/W */
-#define RPCIF_PHYINT_WPVAL	BIT(1)
+#include "renesas-rpc-if-regs.h"
 
 static const struct regmap_range rpcif_volatile_ranges[] = {
 	regmap_reg_range(RPCIF_SMRDR0, RPCIF_SMRDR1),
-- 
2.43.0


