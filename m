Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA783106437
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 07:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbfKVGNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 01:13:54 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6348 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727569AbfKVGNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:53 -0500
X-IronPort-AV: E=Sophos;i="5.69,228,1571670000"; 
   d="scan'208";a="32366340"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2019 15:13:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B741A400D0F7;
        Fri, 22 Nov 2019 15:13:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 3/4] mmc: host: renesas_sdhi_sys_dmac: add DMACR setting
Date:   Fri, 22 Nov 2019 15:13:50 +0900
Message-Id: <1574403231-18512-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds DMACR setting which needs to use the 32 bytes
transfer mode of SYS-DMAC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 234551a..d9a69f6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -20,6 +20,7 @@
 
 #include <linux/kernel.h>
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -46,6 +47,12 @@
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
 
+#define DMACR_SDR104		0x192
+#define DMACR_SDR104_32BYTE	0x0004
+#define DMACR_SDR50		0xe4
+#define DMACR_SDR50_32BYTE	0x000a
+#define DMACR_2_OR_4BYTE	0x0000
+
 struct renesas_sdhi_quirks {
 	bool hs400_disabled;
 	bool hs400_4taps;
@@ -604,6 +611,32 @@ static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 	return blk_size;
 }
 
+static void renesas_sdhi_set_dmacr(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u16 val = DMACR_2_OR_4BYTE;
+	u16 reg;
+	enum dma_slave_buswidth width = priv->dma_priv.dma_buswidth;
+
+	switch (sd_ctrl_read16(host, CTL_VERSION)) {
+	case SDHI_VER_GEN2_SDR50:
+		if (width == DMA_SLAVE_BUSWIDTH_32_BYTES)
+			val = DMACR_SDR50_32BYTE;
+		reg = DMACR_SDR50;
+		break;
+	case SDHI_VER_GEN2_SDR104:
+		if (width == DMA_SLAVE_BUSWIDTH_32_BYTES)
+			val = DMACR_SDR104_32BYTE;
+		reg = DMACR_SDR104;
+		break;
+	default:
+		/* nothing to do */
+		return;
+	}
+
+	sd_ctrl_write16(host, reg, val);
+}
+
 static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 {
 	/* Iff regs are 8 byte apart, sdbuf is 64 bit. Otherwise always 32. */
@@ -611,6 +644,8 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 
 	sd_ctrl_write16(host, CTL_DMA_ENABLE, enable ? DMA_ENABLE_DMASDRW : 0);
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
+
+	renesas_sdhi_set_dmacr(host);
 }
 
 static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
-- 
2.7.4

