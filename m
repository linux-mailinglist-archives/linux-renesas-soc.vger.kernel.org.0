Return-Path: <linux-renesas-soc+bounces-18913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75FFAED6CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 10:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA5716D0FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 08:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A712238C3A;
	Mon, 30 Jun 2025 08:13:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078CA238C1F;
	Mon, 30 Jun 2025 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271208; cv=none; b=hkQsz8OVCpRarDvLH/JHC87M48StLcUM/I3/fRPCvh7fnHIXdo1ohPAewVCv0ejxei0Ex+MRQk2XAh39ddCkl/g1P5YCl21PEnm4QC9Sy/cRPU6b5VMPkKm1EAf5TUtZE3VRF/pQ8b3rIGfJHiz2+IWR6qPkIlO8sET3/CNbNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271208; c=relaxed/simple;
	bh=Q+zhN1f3+GjWSGnaZs9Okdj/Q3hJQ5reewbR0SxRuo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIzl2NO+JyhtdGw3D8o1o0RctwuAtakq8AqC7NCmtWH46EmNJzTNDOASRTjETh3BXBY4XwRuMrVryYK6YokhgbmhN2HXLwC3mGX5t64CVfzPK5l085Vnh8mXI//oJYdib4PYxr3LCX1UDvmizt0X7i04IrRR4/wuE/bbTUfyiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: wJxop9GOR/+T+6mH19MSjA==
X-CSE-MsgGUID: MxXX6H6aTY+hIlKSNocC/w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2025 17:13:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.44])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3B28941BF1FF;
	Mon, 30 Jun 2025 17:13:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFC/RFT 1/2] mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
Date: Mon, 30 Jun 2025 09:13:10 +0100
Message-ID: <20250630081315.33288-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
During testing it is found that, if the DMA buffer is not aligned to 128
bit it fallback to PIO mode. In such cases, 64-bit access is much more
efficient than the current 16-bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/tmio_mmc.h        | 12 +++++++++++
 drivers/mmc/host/tmio_mmc_core.c   | 32 ++++++++++++++++++++++++++++++
 include/linux/platform_data/tmio.h |  3 +++
 3 files changed, 47 insertions(+)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index d730b7633ae1..823143a98941 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -242,6 +242,18 @@ static inline void sd_ctrl_read32_rep(struct tmio_mmc_host *host, int addr,
 	ioread32_rep(host->ctl + (addr << host->bus_shift), buf, count);
 }
 
+static inline void sd_ctrl_read64_rep(struct tmio_mmc_host *host, int addr,
+				      u64 *buf, int count)
+{
+	ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
+}
+
+static inline void sd_ctrl_write64_rep(struct tmio_mmc_host *host, int addr,
+				       const u64 *buf, int count)
+{
+	iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
+}
+
 static inline void sd_ctrl_write16(struct tmio_mmc_host *host, int addr,
 				   u16 val)
 {
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2cec463b5e00..c4eacf9545ba 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -350,6 +350,38 @@ static void tmio_mmc_transfer_data(struct tmio_mmc_host *host,
 	/*
 	 * Transfer the data
 	 */
+
+	if (host->pdata->flags & TMIO_MMC_64BIT_DATA_PORT) {
+		u64 *buf64 = (u64 *)buf;
+		u64 data = 0;
+
+		if (count >= 8) {
+			if (is_read)
+				sd_ctrl_read64_rep(host, CTL_SD_DATA_PORT,
+						   buf64, count >> 3);
+			else
+				sd_ctrl_write64_rep(host, CTL_SD_DATA_PORT,
+						    buf64, count >> 3);
+		}
+
+		/* if count was multiple of 8 */
+		if (!(count & 0x7))
+			return;
+
+		buf64 += count >> 3;
+		count %= 8;
+
+		if (is_read) {
+			sd_ctrl_read64_rep(host, CTL_SD_DATA_PORT, &data, 1);
+			memcpy(buf64, &data, count);
+		} else {
+			memcpy(&data, buf64, count);
+			sd_ctrl_write64_rep(host, CTL_SD_DATA_PORT, &data, 1);
+		}
+
+		return;
+	}
+
 	if (host->pdata->flags & TMIO_MMC_32BIT_DATA_PORT) {
 		u32 data = 0;
 		u32 *buf32 = (u32 *)buf;
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index b060124ba1ae..426291713b83 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -47,6 +47,9 @@
 /* Some controllers have a CBSY bit */
 #define TMIO_MMC_HAVE_CBSY		BIT(11)
 
+/* Some controllers have a 64-bit wide data port register */
+#define TMIO_MMC_64BIT_DATA_PORT	BIT(12)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


