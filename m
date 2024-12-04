Return-Path: <linux-renesas-soc+bounces-10926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FF9E4115
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 18:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C600F16144E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 17:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C83219BB1;
	Wed,  4 Dec 2024 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2E1FYFN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606A219BA0;
	Wed,  4 Dec 2024 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331708; cv=none; b=ioLmYVUkpoiKmorxrV4Ozs6FFCOT/MYN9KgMs3zOcauNi2ZX8uMPtMUCsIH60eZyR0FxoZTjxpCCa1zERJ6D0CKKHbE2VW3bhxCnZWIIIPKjjao/srGfQX11evdBVCsGRYcNHHEkW0uDUJwl6UPckKUA8Yd9hJy9S/YOcCP28NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331708; c=relaxed/simple;
	bh=3krexAfqy0Ht6N8hAX+Gid/7tdaS40E+IMw95VFDePo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYnFoE/gKrQrh+k3xpy8aK752QToV9zRvckLBRFijIDIffFizVNW2RQMRGSrmaQibjdXrLTjJJR7tjmBOyv3haCbBVBpnC5d/4vz7PY7pNCNyIRuiPUMNhV2luRXvnSKvCGTT6OUU7P6yJOnuao8uW+ELQYVidFsnJceGaXsTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2E1FYFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B7C4CED6;
	Wed,  4 Dec 2024 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331708;
	bh=3krexAfqy0Ht6N8hAX+Gid/7tdaS40E+IMw95VFDePo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G2E1FYFNjinVy3ukXsE9T0/7Ikv81KFrJmvFzcs/QomVS5CMCMfyv6Um9PsgglWSI
	 SZTCkzwMTrgLIc7+8lbHEZr3S4BOasWlhW2vT+CIphkkGkedNNf92xKR4c+U3u3qJM
	 /97Cm89A4BrNqGrt6mn+LkeltccmLL7YDQvA+mZR93osCAOKu1miHWOlpmxmGBk8bl
	 FLIF4Mx22a9W5A0kzyY850yaciBz16e6kNgf7B0YSfayXBUNvfkJZFizkXMIGLyOjR
	 ruLULkLWKuJqncpuToMiPlsK6232u2n8aWLmHCIGNel57t8aF25H8wsTtswc5jYY/d
	 XTD4dUNopZ1ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <Avri.Altman@wdc.com>,
	Peter Wang <peter.wang@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	yoshihiro.shimoda.uh@renesas.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	avri.altman@wdc.com,
	manivannan.sadhasivam@linaro.org,
	ahalaney@redhat.com,
	beanhuo@micron.com,
	quic_mnaresh@quicinc.com,
	ebiggers@google.com,
	minwoo.im@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 09/24] scsi: ufs: core: Make DMA mask configuration more flexible
Date: Wed,  4 Dec 2024 10:49:29 -0500
Message-ID: <20241204155003.2213733-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204155003.2213733-1-sashal@kernel.org>
References: <20241204155003.2213733-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 78bc671bd1501e2f6c571e063301a4fdc5db53b2 ]

Replace UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS with
ufs_hba_variant_ops::set_dma_mask.  Update the Renesas driver
accordingly.  This patch enables supporting other configurations than
32-bit or 64-bit DMA addresses, e.g. 36-bit DMA addresses.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/r/20241018194753.775074-1-bvanassche@acm.org
Reviewed-by: Avri Altman <Avri.Altman@wdc.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c      | 4 ++--
 drivers/ufs/host/ufs-renesas.c | 9 ++++++++-
 include/ufs/ufshcd.h           | 9 +++------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index db4044358e22d..62fbbd56a86e8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2265,8 +2265,6 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	int err;
 
 	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
-	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
-		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
 
 	/* nutrs and nutmrs are 0 based values */
 	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS) + 1;
@@ -10206,6 +10204,8 @@ EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
  */
 static int ufshcd_set_dma_mask(struct ufs_hba *hba)
 {
+	if (hba->vops && hba->vops->set_dma_mask)
+		return hba->vops->set_dma_mask(hba);
 	if (hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
 		if (!dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(64)))
 			return 0;
diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index cc94970b86c93..ea3da773b1c14 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -364,14 +365,20 @@ static int ufs_renesas_init(struct ufs_hba *hba)
 		return -ENOMEM;
 	ufshcd_set_variant(hba, priv);
 
-	hba->quirks |= UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS | UFSHCD_QUIRK_HIBERN_FASTAUTO;
+	hba->quirks |= UFSHCD_QUIRK_HIBERN_FASTAUTO;
 
 	return 0;
 }
 
+static int ufs_renesas_set_dma_mask(struct ufs_hba *hba)
+{
+	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
+}
+
 static const struct ufs_hba_variant_ops ufs_renesas_vops = {
 	.name		= "renesas",
 	.init		= ufs_renesas_init,
+	.set_dma_mask	= ufs_renesas_set_dma_mask,
 	.setup_clocks	= ufs_renesas_setup_clocks,
 	.hce_enable_notify = ufs_renesas_hce_enable_notify,
 	.dbg_register_dump = ufs_renesas_dbg_register_dump,
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 2a7d6f269d9e3..8b66228645d76 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -295,6 +295,8 @@ struct ufs_pwr_mode_info {
  * @name: variant name
  * @init: called when the driver is initialized
  * @exit: called to cleanup everything done in init
+ * @set_dma_mask: For setting another DMA mask than indicated by the 64AS
+ *	capability bit.
  * @get_ufs_hci_version: called to get UFS HCI version
  * @clk_scale_notify: notifies that clks are scaled up/down
  * @setup_clocks: called before touching any of the controller registers
@@ -332,6 +334,7 @@ struct ufs_hba_variant_ops {
 	int	(*init)(struct ufs_hba *);
 	void    (*exit)(struct ufs_hba *);
 	u32	(*get_ufs_hci_version)(struct ufs_hba *);
+	int	(*set_dma_mask)(struct ufs_hba *);
 	int	(*clk_scale_notify)(struct ufs_hba *, bool,
 				    enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
@@ -613,12 +616,6 @@ enum ufshcd_quirks {
 	 */
 	UFSHCD_QUIRK_SKIP_PH_CONFIGURATION		= 1 << 16,
 
-	/*
-	 * This quirk needs to be enabled if the host controller has
-	 * 64-bit addressing supported capability but it doesn't work.
-	 */
-	UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS		= 1 << 17,
-
 	/*
 	 * This quirk needs to be enabled if the host controller has
 	 * auto-hibernate capability but it's FASTAUTO only.
-- 
2.43.0


