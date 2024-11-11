Return-Path: <linux-renesas-soc+bounces-10448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D548E9C440F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 18:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648C71F254AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 17:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59B01A76D5;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfD79ezb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877501A0B15;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347318; cv=none; b=NOcqThDy5vuMM1wPQgWcXyDvX8m1UjGJ+88l7oYNcE8wJDGOSRUPKJ6pyl7XVfqVXtApE/dJG4DQ2AhyA6b29hlM2WvpqcdY/TGjMbindVV7y/Q56BUyx1/D1QZHuPalZPfAHzB59RN4c2lDEpvs1kuJfO/910kz1bdrJiZ5lZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347318; c=relaxed/simple;
	bh=Y+khpFiawXKLU/+l8e747ZP6KaaIIh+gTXQA+EIkgkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DPvJemRwQJoQxtD+/E94bhT9QN6+UU1LAdIPV6I7E1YQg/QNDiOQGtiBMWXP/AWvW8M62xESym5SXM1C6xUn12aYWRhLmWobeje5FRusJjdF4dS/5QWxWsJ5vmzUY6/cHF/Be5CAIcX5FpYOiv2aT0Bv2qJHAm6LcgAgFyG0JQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfD79ezb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 143CEC4CECF;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=Y+khpFiawXKLU/+l8e747ZP6KaaIIh+gTXQA+EIkgkY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gfD79ezbyqAT5rvKeu/bcNk+MqWjLhBgv82QIF/tIbz1tWRuHXO2hqhXMblEdVPjh
	 uLWSskpTn0NmbCS8ovAvPJNwmOCD+sEvFuY5H39CXkmtdFWd5YC2nEieNxQRc/I99o
	 U7IQ0t8lfGL6a9x7XtdAvZul3zH6DbCJ4SHk4BNHxN4qMgByWrPQNh+GNmgGwLVMFW
	 5kFUqPoQTKfdsOEBglpmjDw8gP+n70gDwcBkSKANJClp4+04sSwRjT77we8vHjhqgq
	 0YvS2zBf6EmIbdDpX54lBKmW1z/IT8syb8Ns1cZ4VY6Zjr0qNNt+7l5WToJMnaGMYb
	 cYYNgkm1oOPEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3C7D3ABD9;
	Mon, 11 Nov 2024 17:48:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/5] scsi: ufs: Bug fixes for ufs core and platform drivers
Date: Mon, 11 Nov 2024 23:18:29 +0530
Message-Id: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1DMmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINAtTSuOTypNj0/LrNA1SzE0TzO2TExLTDRRAuooKEoFCoNNi46trQU
 ADEBy810AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Y+khpFiawXKLU/+l8e747ZP6KaaIIh+gTXQA+EIkgkY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNyVRymijja4WYsMTq3UufBBioidTEf49F/G
 g6j4UfgEmiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcgAKCRBVnxHm/pHO
 9d0jB/449IToaB9ZcYdJONBd23MdNRpN9XTjoQ3UaKzzkCrBwemdD8ACugH5wLUaPzsStvYYt3C
 6oYkky5KzIlqwZMoQVr4rSs7t0C+05tD/fKah7PQkWE2sWw6qy5weu7aZdzMMLT4eewC1jVW+OJ
 6sDx7OKs23eLysMs5PpefkS/XDYDkowgBvPz0f1E11UQDoA4Ra1Wd84CkcdyqTh0XDMC0EV4D0p
 fGBOBK0Tpegsz2LI686Q6vrLJQBtn6pZNWAx2GHhNxEGbg97Rg5kF/7FtcnvVdgcDc0CDrxeyOu
 HAIwSVg9lV19dgsYP/y7m/iTY4qce8LrwLtHgy5oTwjONKG5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series has several bug fixes that I encountered when the ufs-qcom driver
was removed and inserted back. But the fixes are applicable to other platform
glue drivers as well.

This series is tested on Qcom RB5 development board based on SM8250 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (5):
      scsi: ufs: core: Cancel RTC work during ufshcd_remove()
      scsi: ufs: qcom: Only free platform MSIs when ESI is enabled
      scsi: ufs: pltfrm: Disable runtime PM during removal of glue drivers
      scsi: ufs: pltfrm: Drop PM runtime reference count after ufshcd_remove()
      scsi: ufs: pltfrm: Dellocate HBA during ufshcd_pltfrm_remove()

 drivers/ufs/core/ufshcd.c             |  1 +
 drivers/ufs/host/cdns-pltfrm.c        |  4 +---
 drivers/ufs/host/tc-dwc-g210-pltfrm.c |  5 +----
 drivers/ufs/host/ufs-exynos.c         |  3 +--
 drivers/ufs/host/ufs-hisi.c           |  4 +---
 drivers/ufs/host/ufs-mediatek.c       |  5 +----
 drivers/ufs/host/ufs-qcom.c           |  7 ++++---
 drivers/ufs/host/ufs-renesas.c        |  4 +---
 drivers/ufs/host/ufs-sprd.c           |  5 +----
 drivers/ufs/host/ufshcd-pltfrm.c      | 16 ++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h      |  1 +
 11 files changed, 29 insertions(+), 26 deletions(-)
---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241111-ufs_bug_fix-6d17f39afaa4

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



