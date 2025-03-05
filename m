Return-Path: <linux-renesas-soc+bounces-14007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E2AA500AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 14:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A941892E56
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1A824A076;
	Wed,  5 Mar 2025 13:34:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF3A248898
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Mar 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181674; cv=none; b=gPIX8NpmyjsRSRGPwo8WPc5E2CJbf9KsOeTlvdhE9uHB9b3ejytKlLTEuNQqLEciEIoI9IMJWYW9ko5QlOpuRl40viUVwYmMGJdPpMnb8lyhZ9a6uMJx+1c14+Js3btMroFoeo3BboKvZmoto8IFib6RURCUtjhoXqA2wUNbZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181674; c=relaxed/simple;
	bh=qgagCWP0AByktZ7QKcVCUOvAmGy3T+619wWJGYwW6v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhRm/CmJzWVVIwxerxg9eLIgqwULqkwwhW0dUigVtsn/8oaFotPoKrqiNIOX97ZnQQ5rkZis4wX+IeblRjYReLKtILQ4fmiMFMXu6hklMYoszLF8/+ek0RTcAEOUUB29b4S/koGSIqnTrBayhlq4EMXUxCkE9nuH8JlwJms34F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Z7D6t3mfJz4x1y9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Mar 2025 14:34:30 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fba:8cad:3d23:9db3])
	by xavier.telenet-ops.be with cmsmtp
	id M1aJ2E00L0exi8p011aJlp; Wed, 05 Mar 2025 14:34:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tposn-0000000Cv4F-1kOZ;
	Wed, 05 Mar 2025 14:34:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpot8-00000008woo-2Ewn;
	Wed, 05 Mar 2025 14:34:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 7/7] scsi: ufs: renesas: Add initialization code for R-Car S4-8 ES1.2
Date: Wed,  5 Mar 2025 14:34:15 +0100
Message-ID: <97d83709495c764b2456d4d25846f5f48197cad0.1741179611.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741179611.git.geert+renesas@glider.be>
References: <cover.1741179611.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Add initialization code for R-Car S4-8 ES1.2 to improve transfer
stability.  Using the new code requires downloading firmware and reading
calibration data from E-FUSE.  If either fails, the driver falls back to
the old initialization code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/ufs/host/ufs-renesas.c | 199 ++++++++++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index d9ba766dcd2f4de7..5bf7d0e77ad857c6 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -9,20 +9,31 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/firmware.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sys_soc.h>
 #include <ufs/ufshcd.h>
 
 #include "ufshcd-pltfrm.h"
 
+#define EFUSE_CALIB_SIZE	8
+
 struct ufs_renesas_priv {
+	const struct firmware *fw;
+	void (*pre_init)(struct ufs_hba *hba);
 	bool initialized;	/* The hardware needs initialization once */
+	u8 calib[EFUSE_CALIB_SIZE];
 };
 
+#define UFS_RENESAS_FIRMWARE_NAME "r8a779f0_ufs.bin"
+MODULE_FIRMWARE(UFS_RENESAS_FIRMWARE_NAME);
+
 static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
 {
 	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
@@ -116,6 +127,22 @@ static void ufs_renesas_set_phy(struct ufs_hba *hba, u32 addr16, u32 data16)
 	ufs_renesas_write_phy(hba, addr16, data16);
 }
 
+static void ufs_renesas_reset_indirect_write(struct ufs_hba *hba, int gpio,
+					     u32 addr, u32 data)
+{
+	ufs_renesas_write(hba, 0xf0, gpio);
+	ufs_renesas_write_800_80c_poll(hba, addr, data);
+}
+
+static void ufs_renesas_reset_indirect_update(struct ufs_hba *hba)
+{
+	ufs_renesas_write_d0_d4(hba, 0x0000082c, 0x0f000000);
+	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x0f000000);
+	ufs_renesas_write(hba, 0xd0, 0x0000082c);
+	ufs_renesas_poll(hba, 0xd4, BIT(27) | BIT(26) | BIT(24), BIT(27) | BIT(26) | BIT(24));
+	ufs_renesas_write(hba, 0xf0, 0);
+}
+
 static void ufs_renesas_indirect_write(struct ufs_hba *hba, u32 gpio, u32 addr,
 				       u32 data_800)
 {
@@ -135,15 +162,19 @@ static void ufs_renesas_indirect_poll(struct ufs_hba *hba, u32 gpio, u32 addr,
 	ufs_renesas_write(hba, 0xf0, 0);
 }
 
-static void ufs_renesas_init_step1_to_3(struct ufs_hba *hba)
+static void ufs_renesas_init_step1_to_3(struct ufs_hba *hba, bool init108)
 {
 	ufs_renesas_write(hba, 0xc0, 0x49425308);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000002);
+	if (init108)
+		ufs_renesas_write_d0_d4(hba, 0x00000108, 0x00000002);
 	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000200);
 	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000828, 0x00000000);
 	ufs_renesas_write_d0_d4(hba, 0x00000104, 0x00000001);
+	if (init108)
+		ufs_renesas_write_d0_d4(hba, 0x00000108, 0x00000001);
 	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000001);
 	udelay(1);
 	ufs_renesas_write_d0_d4(hba, 0x00000940, 0x00000000);
@@ -207,12 +238,12 @@ static void ufs_renesas_init_compensation_and_slicers(struct ufs_hba *hba)
 	ufs_renesas_write_phy_10ad_10af(hba, 0x0080, 0x001a);
 }
 
-static void ufs_renesas_pre_init(struct ufs_hba *hba)
+static void ufs_renesas_r8a779f0_es10_pre_init(struct ufs_hba *hba)
 {
 	u32 timer_val;
 
 	/* This setting is for SERIES B */
-	ufs_renesas_init_step1_to_3(hba);
+	ufs_renesas_init_step1_to_3(hba, false);
 
 	ufs_renesas_init_step4_to_6(hba);
 
@@ -283,6 +314,105 @@ static void ufs_renesas_pre_init(struct ufs_hba *hba)
 	ufs_renesas_init_enable_timer(hba, timer_val);
 }
 
+static void ufs_renesas_r8a779f0_init_step3_add(struct ufs_hba *hba, bool assert)
+{
+	u32 val_2x = 0, val_3x = 0, val_4x = 0;
+
+	if (assert) {
+		val_2x = 0x0001;
+		val_3x = 0x0003;
+		val_4x = 0x0001;
+	}
+
+	ufs_renesas_reset_indirect_write(hba, 7, 0x20, val_2x);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x4a, val_4x);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x35, val_3x);
+	ufs_renesas_reset_indirect_update(hba);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x21, val_2x);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x4b, val_4x);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x36, val_3x);
+	ufs_renesas_reset_indirect_update(hba);
+}
+
+static void ufs_renesas_r8a779f0_pre_init(struct ufs_hba *hba)
+{
+	struct ufs_renesas_priv *priv = ufshcd_get_variant(hba);
+	u32 timer_val;
+	u32 data;
+	int i;
+
+	/* This setting is for SERIES B */
+	ufs_renesas_init_step1_to_3(hba, true);
+
+	ufs_renesas_r8a779f0_init_step3_add(hba, true);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x5f, 0x0063);
+	ufs_renesas_reset_indirect_update(hba);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x60, 0x0003);
+	ufs_renesas_reset_indirect_update(hba);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x5b, 0x00a6);
+	ufs_renesas_reset_indirect_update(hba);
+	ufs_renesas_reset_indirect_write(hba, 7, 0x5c, 0x0003);
+	ufs_renesas_reset_indirect_update(hba);
+	ufs_renesas_r8a779f0_init_step3_add(hba, false);
+
+	ufs_renesas_init_step4_to_6(hba);
+
+	timer_val = ufs_renesas_init_disable_timer(hba);
+
+	ufs_renesas_indirect_write(hba, 1, 0x01, 0x001f);
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x0d, 0x0007);
+	ufs_renesas_indirect_write(hba, 7, 0x0e, 0x0007);
+
+	ufs_renesas_indirect_poll(hba, 7, 0x3c, 0, BIT(7));
+	ufs_renesas_indirect_poll(hba, 7, 0x4c, 0, BIT(4));
+
+	ufs_renesas_indirect_write(hba, 1, 0x32, 0x0080);
+	ufs_renesas_indirect_write(hba, 1, 0x1f, 0x0001);
+	ufs_renesas_indirect_write(hba, 1, 0x2c, 0x0001);
+	ufs_renesas_indirect_write(hba, 1, 0x32, 0x0087);
+
+	ufs_renesas_indirect_write(hba, 1, 0x4d, priv->calib[2]);
+	ufs_renesas_indirect_write(hba, 1, 0x4e, priv->calib[3]);
+	ufs_renesas_indirect_write(hba, 1, 0x0d, 0x0006);
+	ufs_renesas_indirect_write(hba, 1, 0x0e, 0x0007);
+	ufs_renesas_write_phy(hba, 0x0028, priv->calib[3]);
+	ufs_renesas_write_phy(hba, 0x4014, priv->calib[3]);
+
+	ufs_renesas_set_phy(hba, 0x401c, BIT(2));
+
+	ufs_renesas_write_phy(hba, 0x4000, priv->calib[6]);
+	ufs_renesas_write_phy(hba, 0x4001, priv->calib[7]);
+
+	ufs_renesas_indirect_write(hba, 1, 0x14, 0x0001);
+
+	ufs_renesas_init_compensation_and_slicers(hba);
+
+	ufs_renesas_indirect_write(hba, 7, 0x79, 0x0000);
+	ufs_renesas_indirect_write(hba, 7, 0x24, 0x000c);
+	ufs_renesas_indirect_write(hba, 7, 0x25, 0x000c);
+	ufs_renesas_indirect_write(hba, 7, 0x62, 0x00c0);
+	ufs_renesas_indirect_write(hba, 7, 0x63, 0x0001);
+
+	for (i = 0; i < priv->fw->size / 2; i++) {
+		data = (priv->fw->data[i * 2 + 1] << 8) | priv->fw->data[i * 2];
+		ufs_renesas_write_phy(hba, 0xc000 + i, data);
+	}
+
+	ufs_renesas_indirect_write(hba, 7, 0x0d, 0x0002);
+	ufs_renesas_indirect_write(hba, 7, 0x0e, 0x0007);
+
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0014);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0017);
+	ufs_renesas_indirect_write(hba, 7, 0x5d, 0x0004);
+	ufs_renesas_indirect_write(hba, 7, 0x5e, 0x0017);
+	ufs_renesas_indirect_poll(hba, 7, 0x55, 0, BIT(6));
+	ufs_renesas_indirect_poll(hba, 7, 0x41, 0, BIT(7));
+
+	ufs_renesas_init_enable_timer(hba, timer_val);
+}
+
 static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
 					 enum ufs_notify_change_status status)
 {
@@ -292,7 +422,7 @@ static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
 		return 0;
 
 	if (status == PRE_CHANGE)
-		ufs_renesas_pre_init(hba);
+		priv->pre_init(hba);
 
 	priv->initialized = true;
 
@@ -310,20 +440,78 @@ static int ufs_renesas_setup_clocks(struct ufs_hba *hba, bool on,
 	return 0;
 }
 
+static const struct soc_device_attribute ufs_fallback[] = {
+	{ .soc_id = "r8a779f0", .revision = "ES1.[01]" },
+	{ /* Sentinel */ }
+};
+
 static int ufs_renesas_init(struct ufs_hba *hba)
 {
+	const struct soc_device_attribute *attr;
+	struct nvmem_cell *cell = NULL;
+	struct device *dev = hba->dev;
 	struct ufs_renesas_priv *priv;
+	u8 *data = NULL;
+	size_t len;
+	int ret;
 
-	priv = devm_kzalloc(hba->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	ufshcd_set_variant(hba, priv);
 
 	hba->quirks |= UFSHCD_QUIRK_HIBERN_FASTAUTO;
 
+	attr = soc_device_match(ufs_fallback);
+	if (attr)
+		goto fallback;
+
+	ret = request_firmware(&priv->fw, UFS_RENESAS_FIRMWARE_NAME, dev);
+	if (ret) {
+		dev_warn(dev, "Failed to load firmware\n");
+		goto fallback;
+	}
+
+	cell = nvmem_cell_get(dev, "calibration");
+	if (IS_ERR(cell)) {
+		dev_warn(dev, "No calibration data specified\n");
+		goto fallback;
+	}
+
+	data = nvmem_cell_read(cell, &len);
+	if (IS_ERR(data)) {
+		dev_warn(dev, "Failed to read calibration data: %pe\n", data);
+		goto fallback;
+	}
+
+	if (len != EFUSE_CALIB_SIZE) {
+		dev_warn(dev, "Invalid calibration data size %zu\n", len);
+		goto fallback;
+	}
+
+	memcpy(priv->calib, data, EFUSE_CALIB_SIZE);
+	priv->pre_init = ufs_renesas_r8a779f0_pre_init;
+	goto out;
+
+fallback:
+	dev_info(dev, "Using ES1.0 init code\n");
+	priv->pre_init = ufs_renesas_r8a779f0_es10_pre_init;
+
+out:
+	kfree(data);
+	if (!IS_ERR_OR_NULL(cell))
+		nvmem_cell_put(cell);
+
 	return 0;
 }
 
+static void ufs_renesas_exit(struct ufs_hba *hba)
+{
+	struct ufs_renesas_priv *priv = ufshcd_get_variant(hba);
+
+	release_firmware(priv->fw);
+}
+
 static int ufs_renesas_set_dma_mask(struct ufs_hba *hba)
 {
 	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
@@ -332,6 +520,7 @@ static int ufs_renesas_set_dma_mask(struct ufs_hba *hba)
 static const struct ufs_hba_variant_ops ufs_renesas_vops = {
 	.name		= "renesas",
 	.init		= ufs_renesas_init,
+	.exit		= ufs_renesas_exit,
 	.set_dma_mask	= ufs_renesas_set_dma_mask,
 	.setup_clocks	= ufs_renesas_setup_clocks,
 	.hce_enable_notify = ufs_renesas_hce_enable_notify,
-- 
2.43.0


