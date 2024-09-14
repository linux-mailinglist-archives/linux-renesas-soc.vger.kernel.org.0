Return-Path: <linux-renesas-soc+bounces-8965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223F97939C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Sep 2024 00:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 506431C2109B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 22:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AC5149E13;
	Sat, 14 Sep 2024 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CDetg4Xz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jeIwqz1G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906451482E7
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 22:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726351769; cv=none; b=KiVIazT1z9uueRHXHNYbxLnI5Jo+zi4V4CPy0v6vV0YwqMxzE3CY4j3ut6RSP1XfjkOguR+APNWDBXjyd4xyaT9vbrAoi6iG9I9ZB8ATG3nBq65qrTvAfuPmlwAlxOEvUo18dJaoZoHcv7fiRuOpRaicG7NtoSSdezZ71DShRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726351769; c=relaxed/simple;
	bh=JrGyu7MGygk2I2MQT71+cTWuCNv+tbwzVSGxWRolJPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9BuHT0tsGyUEooWp4q3rNRq3R++v+T4Qf/Lb+wQQL9a26jorrJFTCC2Z1KcdVemllSXwQ4xMq1OeSb139L4ozsAI9uP6Bw1eIw8HvVgxh5fa0zytpu0dgAAF/mhKDosFkBMsJ26blMNSHgg/QMOsDnLux9MxADGM6px9wjipL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CDetg4Xz; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jeIwqz1G; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4X5lhG6XcFz9stW;
	Sun, 15 Sep 2024 00:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1726351759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HmJQqphtQlEtypYq7uxTvPKW98l/WUTqZWaoRmWspX0=;
	b=CDetg4XzaRnWdfyPCitSPcx6w8M9NVDDFi9H4CS86wpEzGVrYvgmS9qQMtbkr4nQcUIOZl
	77RQWLmk/jbNIdfOl6wnK7rvW8DfoyPIrT/xNH8Ny/T7NdncIzERbb62TzuTKdGxdJZ0fV
	OLrvnCOTBbAH58jhkb/Z9PoLsFcXDsrANfXJRQUQ2DCPS3myMWJJoQfgm67GojAP312Auw
	/FARgfAwtsWgJPmcuHNoRkMFB34rXIC1qP0JXsI54bGqMCZ6hAS7X31P8+RFKE8HDhsG1J
	+LDQQi5RR/MwkzFDnfDONt82scmIBHgcA1JpGIVT/iYuJJbKdXMkNTepiUR7nQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1726351757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HmJQqphtQlEtypYq7uxTvPKW98l/WUTqZWaoRmWspX0=;
	b=jeIwqz1Gt8iviHJ0yplxD1zgCBtervI6OKuo5sdAiCqJxI/AZ6jzfF5cEVv3rP8F6nhXmI
	3d7t+8mNPZu2DftMYPWsYpItpUL4XpIM1UutBtL+kfW2hVc1WSYdiT65b8lf7+87LQhMpN
	aquQxSDd71jTGDYyuFMJodYvyhw+ns2gseHAGacANsfh0eUX2bHCp964TzaAPia/X2kVHm
	f1dgfiV7s/0iqd4Ab/qawUz17O8J1nbqhMtYRLW2h137B8EviGBCMeII6Lq8mE3w5pRFAx
	8hxzAL3/f25ORYHk6sNqI1PtNELSK5pdMmvxvHUEFOwVP+qxxVilKlNw7Gdq4g==
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
Date: Sun, 15 Sep 2024 00:08:16 +0200
Message-ID: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fo8jpe3tzxzz88n6ujidzxnaxeq5qu5c
X-MBO-RS-ID: 115e5983787f55d5ca0
X-Rspamd-Queue-Id: 4X5lhG6XcFz9stW

The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
and 256kiB uniform sectors device configuration, however according to
section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
manufactured devices, which means 64kiB sectors. Since the device does not
support 64kiB uniform sectors in any configuration, parsing SMPT table
cannot find a valid sector map entry and fails.

Fix this up by setting SMPT configuration index bit 0, which is populated
exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
fixup hook and a wrapper function. The only implementation of the hook is
currently specific to S25FS512S.

This fixes the following failure on S25FS512S:
spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
 drivers/mtd/spi-nor/core.h     |  5 +++++
 drivers/mtd/spi-nor/sfdp.c     |  4 ++++
 drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9d6e85bf227b..ca65f36e5638 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
+{
+	int ret;
+
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->post_smpt) {
+		ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
+		if (ret)
+			return ret;
+	}
+
+	if (nor->info->fixups && nor->info->fixups->post_smpt)
+		return nor->info->fixups->post_smpt(nor, smpt);
+
+	return 0;
+}
+
 static int spi_nor_select_read(struct spi_nor *nor,
 			       u32 shared_hwcaps)
 {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1516b6d0dc37..d5294424ab9d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
  *             parameters that could not be extracted by other means (i.e.
  *             when information provided by the SFDP/flash_info tables are
  *             incomplete or wrong).
+ * @post_smpt: update sector map configuration ID selector according to
+ *             chip-specific quirks.
  * @late_init: used to initialize flash parameters that are not declared in the
  *             JESD216 SFDP standard, or where SFDP tables not defined at all.
  *             Will replace the default_init() hook.
@@ -426,6 +428,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	int (*post_sfdp)(struct spi_nor *nor);
+	int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
 	int (*late_init)(struct spi_nor *nor);
 };
 
@@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_parameter_header *bfpt_header,
 			     const struct sfdp_bfpt *bfpt);
 
+int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
+
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5b1117265bd2..542c775918ad 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		map_id = map_id << 1 | !!(*buf & read_data_mask);
 	}
 
+	err = spi_nor_post_smpt_fixups(nor, &map_id);
+	if (err)
+		return ERR_PTR(err);
+
 	/*
 	 * If command descriptors are provided, they always precede map
 	 * descriptors in the table. There is no need to start the iteration
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d6c92595f6bc..d446d12371e1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
 };
 
+static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
+{
+	/*
+	 * The S25FS512S chip datasheet rev.O Table 71 on page 153
+	 * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
+	 * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
+	 * device configuration, however according to section 7.5.5.1
+	 * Configuration Register 3 Non-volatile (CR3NV) page 61, the
+	 * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
+	 * 0 on newly manufactured devices, which means 64kiB sectors.
+	 * Since the device does not support 64kiB uniform sectors in
+	 * any configuration, parsing SMPT table cannot find a valid
+	 * sector map entry and fails. Fix this up by setting SMPT
+	 * configuration index bit 0, which is populated exactly by
+	 * the CR3NV bit 1 being 1.
+	 */
+	*smpt |= BIT(0);
+	return 0;
+}
+
+static const struct spi_nor_fixups s25fs512s_nor_fixups = {
+	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
+	.post_smpt = s25fs512s_nor_post_smpt_fixups,
+};
+
 static const struct flash_info spansion_nor_parts[] = {
 	{
 		.id = SNOR_ID(0x01, 0x02, 0x12),
@@ -829,7 +854,7 @@ static const struct flash_info spansion_nor_parts[] = {
 		.sector_size = SZ_256K,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
-		.fixups = &s25fs_s_nor_fixups,
+		.fixups = &s25fs512s_nor_fixups,
 	}, {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x00),
 		.name = "s25sl12800",
-- 
2.45.2


