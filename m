Return-Path: <linux-renesas-soc+bounces-10451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B269E9C442D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 18:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE0F3B224B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 17:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78FE1AA1DF;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5CWUkTP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20D1A4F0A;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347318; cv=none; b=RxoCU0KuIApcikqdjwN4Zjcs5bkAVXHYw/NRG7Rub7ni1L4fbpwDaqeVZfcPVbf8SgrKSZQMNAX96RDYMl178mGRwqIcGk/ywsTmn/ajtThYslmPqu2zyh811HaINIuMLYn0L9BmhQChYg7IMCX1PPYrc9WYlUtYl0s56bVDMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347318; c=relaxed/simple;
	bh=SOb/svMnfBE70UmgHVHZ83yrAm9N4yanjEVLe7239+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIV37gLJ4fNfRITCW2tPvSpxqMng8C2Kh6kL+hZ7TY962msmxWJKoJECORQYBqLlXkoSlemUSe9J9r2BzWhnBXJ6OQAH1sIwkj7YlpgTsssjbvFFO5FD5qp8y1vIN4omWPrnanFt84yuC9x6V8i4RMl6C2ZtJ/gOuMiYWphH+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5CWUkTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A457C4CED8;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=SOb/svMnfBE70UmgHVHZ83yrAm9N4yanjEVLe7239+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M5CWUkTPz6OCGVKJrWrNKk807OEF7xTW55Hzjum0MoXapsNyhMtWBgyfaQAM9zbia
	 Pc85xmSY+LdvIsx4joB7hU0G9CHWpjFrblQUw3B10SC2lKsuxjt3AgyMkgh+ZRa3I5
	 ZRCXOfupZIW9ImxPU7fv+k2ILaZtquhUWx0RH3zzUbogxMq5qLtrvHZqr0KQg99HOp
	 h8un79+lAFofx6e5DGK8p5XlNJCJL0AnIZsxegWSB4WR41cZUud+99s2UuH71DZMc9
	 YFNhuYvtpnv2M8bWe07UCV9L9FhqbcaZuvadMykzp0Ygu+uhinSxok0VOQBHywANcq
	 3x3//wvZfh2Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F521D3ABDC;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:32 +0530
Subject: [PATCH 3/5] scsi: ufs: pltfrm: Disable runtime PM during removal
 of glue drivers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Mike Bi <mikebi@micron.com>, Bean Huo <beanhuo@micron.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Luca Porzio <lporzio@micron.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
 Can Guo <quic_cang@quicinc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6985;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Sy95crq9tnc13krDmPxLc+XJOqVK0Wt1rbOYDput31Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNzB9iz8QMXyNpVEgtQ5ZelZO076jLLXfkRg
 asZo5G3GWeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcwAKCRBVnxHm/pHO
 9RINB/4kKYhPEGlh+z0oVskBAUcdG9Do5O49lzzdpQb16Q/tr4H5kvW/5giR5D8w2zt3YsvXW/x
 p5impfVanaunnhCfFnIqm6yQJFWS0xmUbA67bZU7f60uMmSBnU8pRYH7w1gagJ7KygOGopeOrDL
 JsCxxoWOy6rJWkYDOw0syS0hs/GhzQa3wptkQ6aarRLAfHwVNq7yzOt09V/GXcgBxCz3BXjE9mG
 hI8H7Vsz3A3z6iqmNYp+H9Jngpy5EJUk7fccNVJqA1lUegiCAow+2pKXjCEjgKXv41S5pbHFUlT
 wRSw+JWjdzoHJ2DETem066mlrMXITAspkAfuXdcDbcyF9JgO
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

When the UFSHCD platform glue drivers are removed, runtime PM should be
disabled using pm_runtime_disable() to balance the enablement done in
ufshcd_pltfrm_init(). This is also reported by PM core when the glue driver
is removed and inserted again:

ufshcd-qcom 1d84000.ufshc: Unbalanced pm_runtime_enable!

So disable runtime PM using a new helper API ufshcd_pltfrm_remove(), that
also takes care of removing ufshcd. This helper should be called during the
remove() stage of glue drivers.

Cc: stable@vger.kernel.org # 3.12
Fixes: 62694735ca95 ("[SCSI] ufs: Add runtime PM support for UFS host controller driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/cdns-pltfrm.c        |  4 +---
 drivers/ufs/host/tc-dwc-g210-pltfrm.c |  4 +---
 drivers/ufs/host/ufs-exynos.c         |  2 +-
 drivers/ufs/host/ufs-hisi.c           |  4 +---
 drivers/ufs/host/ufs-mediatek.c       |  4 +---
 drivers/ufs/host/ufs-qcom.c           |  2 +-
 drivers/ufs/host/ufs-renesas.c        |  4 +---
 drivers/ufs/host/ufs-sprd.c           |  4 +---
 drivers/ufs/host/ufshcd-pltfrm.c      | 13 +++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h      |  1 +
 10 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/cdns-pltfrm.c b/drivers/ufs/host/cdns-pltfrm.c
index 66811d8d1929..b31aa8411151 100644
--- a/drivers/ufs/host/cdns-pltfrm.c
+++ b/drivers/ufs/host/cdns-pltfrm.c
@@ -307,9 +307,7 @@ static int cdns_ufs_pltfrm_probe(struct platform_device *pdev)
  */
 static void cdns_ufs_pltfrm_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 static const struct dev_pm_ops cdns_ufs_dev_pm_ops = {
diff --git a/drivers/ufs/host/tc-dwc-g210-pltfrm.c b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
index a3877592604d..113e0ef7b2cf 100644
--- a/drivers/ufs/host/tc-dwc-g210-pltfrm.c
+++ b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
@@ -76,10 +76,8 @@ static int tc_dwc_g210_pltfm_probe(struct platform_device *pdev)
  */
 static void tc_dwc_g210_pltfm_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-
 	pm_runtime_get_sync(&(pdev)->dev);
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 static const struct dev_pm_ops tc_dwc_g210_pltfm_pm_ops = {
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 5867e6338562..953103b69e2c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1961,7 +1961,7 @@ static void exynos_ufs_remove(struct platform_device *pdev)
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
 	pm_runtime_get_sync(&(pdev)->dev);
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 5ee73ff05251..501609521b26 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -576,9 +576,7 @@ static int ufs_hisi_probe(struct platform_device *pdev)
 
 static void ufs_hisi_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 static const struct dev_pm_ops ufs_hisi_pm_ops = {
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 9a5919434c4e..512b4e43787c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1869,10 +1869,8 @@ static int ufs_mtk_probe(struct platform_device *pdev)
  */
 static void ufs_mtk_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-
 	pm_runtime_get_sync(&(pdev)->dev);
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1bcc538ef8af..38732dd48331 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1846,7 +1846,7 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
 	pm_runtime_get_sync(&(pdev)->dev);
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 	if (host->esi_enabled)
 		platform_device_msi_free_irqs_all(hba->dev);
 }
diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 8711e5cbc968..b3a5fc2d44e7 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -390,9 +390,7 @@ static int ufs_renesas_probe(struct platform_device *pdev)
 
 static void ufs_renesas_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba = platform_get_drvdata(pdev);
-
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 static struct platform_driver ufs_renesas_platform = {
diff --git a/drivers/ufs/host/ufs-sprd.c b/drivers/ufs/host/ufs-sprd.c
index d8b165908809..e455890cf7d4 100644
--- a/drivers/ufs/host/ufs-sprd.c
+++ b/drivers/ufs/host/ufs-sprd.c
@@ -427,10 +427,8 @@ static int ufs_sprd_probe(struct platform_device *pdev)
 
 static void ufs_sprd_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-
 	pm_runtime_get_sync(&(pdev)->dev);
-	ufshcd_remove(hba);
+	ufshcd_pltfrm_remove(pdev);
 }
 
 static const struct dev_pm_ops ufs_sprd_pm_ops = {
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index 1f4f30d6cb42..bad5b1303eb6 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -524,6 +524,19 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(ufshcd_pltfrm_init);
 
+/**
+ * ufshcd_pltfrm_remove - Remove ufshcd platform
+ * @pdev: pointer to Platform device handle
+ */
+void ufshcd_pltfrm_remove(struct platform_device *pdev)
+{
+	struct ufs_hba *hba =  platform_get_drvdata(pdev);
+
+	ufshcd_remove(hba);
+	pm_runtime_disable(&pdev->dev);
+}
+EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
+
 MODULE_AUTHOR("Santosh Yaragnavi <santosh.sy@samsung.com>");
 MODULE_AUTHOR("Vinayak Holikatti <h.vinayak@samsung.com>");
 MODULE_DESCRIPTION("UFS host controller Platform bus based glue driver");
diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
index df387be5216b..3017f8e8f93c 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.h
+++ b/drivers/ufs/host/ufshcd-pltfrm.h
@@ -31,6 +31,7 @@ int ufshcd_negotiate_pwr_params(const struct ufs_host_params *host_params,
 void ufshcd_init_host_params(struct ufs_host_params *host_params);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
+void ufshcd_pltfrm_remove(struct platform_device *pdev);
 int ufshcd_populate_vreg(struct device *dev, const char *name,
 			 struct ufs_vreg **out_vreg, bool skip_current);
 

-- 
2.25.1



