Return-Path: <linux-renesas-soc+bounces-10449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5DC9C441C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 18:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEEDB21029
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 17:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27601A9B3E;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJKSMR23"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A61A2567;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347318; cv=none; b=BSpZvyhmGi0RQCZDQw+HI2TG0Yd2T6Shw6graubM+gDQSYO8foL2pGIi8UfQ12E5hiXFQakTdaB832EGonNkfd17pWmLQG6Ym+R7vcqzvpxk+YuP2nGV+ZYj5ESOH9fDPBkkiS9mC5V3lXy9qOyjo7c8ns1WfIxbshPg9hkOy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347318; c=relaxed/simple;
	bh=fuQ00GAi9j38VTJ+Mk4loS5qcVMhkxws4U8+NkGhafM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ls76DaIBfIJGCLVPBddncNux+7yCykF/6C30CF1SmtZE3IOI8g+u1ZkGdRs1rygkzGyJ4RSbOkdvTU8DFaarGwVyJHG3mQPdJjyfHUQ+myl3xbrhUJYxnB/b8YNCHfOPG9aV3QT+GC42jsvCUi8DzjEkj6DVOEwwDo4PpyWIS4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJKSMR23; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BD31C4CED7;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=fuQ00GAi9j38VTJ+Mk4loS5qcVMhkxws4U8+NkGhafM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IJKSMR23utkGbtJsEmrf3ChMvfo7qg1qtUzv5kPI1oEcHbSDuTrcSy+QB0oN3imyd
	 6V2ZtWKHMYKU52mDsFWkLGTO2sHibSXgRRaEDO9UGrKkb7oK9dc2KIvvX8DO3F5jxC
	 NFUGAluwBDdaE7X1nR1f7tjBBlGuPjUOF1nhPl7mFrQmGQEg0yQ/t7rOMQbt91iQNb
	 ls2MeMG3f0vLOPoVlXcG/66lDtsAJK/2GRLPF5fCO/lXeelnGK3OqIu7Yim9+BUz7Q
	 KQt9E1jg7uP/1EzUQmZrsmx9ml/ahUduvJs9IO+Celr7MBtm/KncaYRp0TPsB8d5gB
	 KamMRcYIOokEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C932D3ABDA;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:31 +0530
Subject: [PATCH 2/5] scsi: ufs: qcom: Only free platform MSIs when ESI is
 enabled
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=EbvyeMTjnnXzYsrb6hiWc8REw/zP3a1kZd0DUfTawxw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNzWH2qACCnRiu+0ZVgDwFBCU0StL7JZgEET
 u7l9pbT9CSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcwAKCRBVnxHm/pHO
 9S7JB/90TEoS/+sDZO0X0MjP4rilFN/QiPGEBYP/qeEnMEreebOIEx2KZBTyGtPoSlH0U11whee
 h/cQ4BaWi8qJs7uxTqoKKez1yUb2SynV7Xdd2KNrBAl1cdbbKsCE0Se33qic7aRVq7Nooh5mcAQ
 hGW6jj2UyKiNeTsdwsaYTIMx2Jde6PpwKv90WjQXQxunrwVt/yv3+o0/CJObO4HXIBZy9n4f0Cv
 OwaEBqBG3UdbwwewFV22V93QQ2gn5pS+WQnQiS3G6aM78r2N50xoSWOLQEN2Q4iIYH5bpMNR4TE
 f1m2EtfA79wWzq2cuV/irM5AZmWRP3LqXGP9NZApfm7jXMzT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Otherwise, it will result in a NULL pointer dereference as below:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
Call trace:
 mutex_lock+0xc/0x54
 platform_device_msi_free_irqs_all+0x14/0x20
 ufs_qcom_remove+0x34/0x48 [ufs_qcom]
 platform_remove+0x28/0x44
 device_remove+0x4c/0x80
 device_release_driver_internal+0xd8/0x178
 driver_detach+0x50/0x9c
 bus_remove_driver+0x6c/0xbc
 driver_unregister+0x30/0x60
 platform_driver_unregister+0x14/0x20
 ufs_qcom_pltform_exit+0x18/0xb94 [ufs_qcom]
 __arm64_sys_delete_module+0x180/0x260
 invoke_syscall+0x44/0x100
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0xdc
 el0t_64_sync_handler+0xc0/0xc4
 el0t_64_sync+0x190/0x194

Cc: stable@vger.kernel.org # 6.3
Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor specific ops")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index ecdfff2456e3..1bcc538ef8af 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1843,10 +1843,12 @@ static int ufs_qcom_probe(struct platform_device *pdev)
 static void ufs_qcom_remove(struct platform_device *pdev)
 {
 	struct ufs_hba *hba =  platform_get_drvdata(pdev);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
 	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_remove(hba);
-	platform_device_msi_free_irqs_all(hba->dev);
+	if (host->esi_enabled)
+		platform_device_msi_free_irqs_all(hba->dev);
 }
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {

-- 
2.25.1



