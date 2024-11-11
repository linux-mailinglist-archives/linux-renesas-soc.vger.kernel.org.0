Return-Path: <linux-renesas-soc+bounces-10450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA09C4412
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 18:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0649A2828C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 17:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7981A9B54;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0C9bmDU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F31A42C4;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347318; cv=none; b=djBO0gfW8UcUOZBLBpkTbzEGySxiYBrqGn1zkNqeDTWyIUTGp1gPAP87VZh1xnAqK0K+jv8iNE2KWIrWpDKkWKWj2CfLbJN9EecqER5eUCK1yxumz+enfsSk75SZXYtJziE6Aa+fo4B9AoL6fzlyIzDcZLgovJbFUmg2GtMrYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347318; c=relaxed/simple;
	bh=G69FHYexPwpw/irD51I+oJah3BCb6iFaLGhHwlC23Sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYgBrTiAVMRd1S1Cr9K/4VBEWy5AL1e/L7FhxAB0qKCMlBB2UPMwbvqz/8ZjpZpcZ6GTFvUSOYBqD5u+y/ru5f/GxcHD9GyOpP+b//n5nQe0Clfs4CUNjDG8dHIYYo+dHrzbju8oUIdOx6ei81c+Wc6Mh7FbU2SlW21p7IAXOws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0C9bmDU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28C54C4CED5;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=G69FHYexPwpw/irD51I+oJah3BCb6iFaLGhHwlC23Sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C0C9bmDUJRRt3wJShhZ/CieKiCh5u0nABPCkvnDz8pS8l+fmwfewTXgapxgC5xugY
	 ZdOeu2hOBqVt/SQ57N8KR68elYetPbhdOvFDNOTlSVwXKPz+Z1TZiIM6BpINDMp3Sb
	 6CTgY+7UkK2o7yYOpahHvnyPF7eUNuACqUStjDsnYCzLl+VxoySmVeOhv23/MzMgkL
	 fHFL6VDhNIQGjbdARxv4//iGhgeTtJ2KiAQNVbZnY4/a7mWoxy4BlQamWmzJAO5+qb
	 0QlXzFvU3ioPxVKSIrpJ/0Xp+uoJJLgxcpAwCgOzlfcdRLo0GlvV3en2rM5z4R1mvy
	 sjcOmwxV41YUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CA0D3ABD8;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:30 +0530
Subject: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DVIcv3/NWxzqjqTgGie8L2Gx0Ep0Cnv9hngTv71tWI8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNyuWNNeuyqHW6wHJWBMDDSw07Unxl6usmOR
 ufHW4bxRbuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcgAKCRBVnxHm/pHO
 9T95CACMdtOCvpWHJK1lxW2m+V6GbLEuNbAD0lZ2wBw1SXofplwVCWGJdvi40XW/5/caHDa4p3V
 8cl5LFsw29z6p0n6ZwMC4Fl2nQjs3S8M+frDwLyelMKBvzuuhqIKf1bp8oJZC8e8q7I3i/+hBbc
 g0a3GvGZaTFNACN7v88ROg0J9CvhylTTeAWC5gTWLOF/dIr+6AUP+8VTPa9v+zTeGaCibMJvN0e
 P632FxzWqbrUCP6X/NUCeptORHwrSlkmUtMK3pLku6vxzQRpDtM1l/S4o8ktUdVsglUmtXnzCNW
 Ix2pNkxM4jEkVNJqrZ9ceWl40kPLs2qa2Tg09M7wbBDHLane
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Currently, RTC work is only cancelled during __ufshcd_wl_suspend(). When
ufshcd is removed in ufshcd_remove(), RTC work is not cancelled. Due to
this, any further trigger of the RTC work after ufshcd_remove() would
result in a NULL pointer dereference as below:

Unable to handle kernel NULL pointer dereference at virtual address 00000000000002a4
Workqueue: events ufshcd_rtc_work
Call trace:
 _raw_spin_lock_irqsave+0x34/0x8c
 pm_runtime_get_if_active+0x24/0xb4
 ufshcd_rtc_work+0x124/0x19c
 process_scheduled_works+0x18c/0x2d8
 worker_thread+0x144/0x280
 kthread+0x11c/0x128
 ret_from_fork+0x10/0x20

Since RTC work accesses the ufshcd internal structures, it should be cancelled
when ufshcd is removed. So do that in ufshcd_remove(), as per the order in
ufshcd_init().

Cc: stable@vger.kernel.org # 6.8
Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index f5846598d80e..cc2555333512 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10225,6 +10225,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 	ufs_hwmon_remove(hba);
 	ufs_bsg_remove(hba);
 	ufs_sysfs_remove_nodes(hba->dev);
+	cancel_delayed_work_sync(&hba->ufs_rtc_update_work);
 	blk_mq_destroy_queue(hba->tmf_queue);
 	blk_put_queue(hba->tmf_queue);
 	blk_mq_free_tag_set(&hba->tmf_tag_set);

-- 
2.25.1



