Return-Path: <linux-renesas-soc+bounces-10587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 025559D2DED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F63B1F216A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 18:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926691D26F6;
	Tue, 19 Nov 2024 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Xq7txC//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301301D14FA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732040948; cv=none; b=j/FdAWjVtYgx//dWRXA4NCvZERIpfIEnNRrJCJmEk9zbc7EOpWUL9sOhmHh6T7+KeYJJLYp28vOjxX7XJFhx9ob0y81v0PvMmXrsIJw1E+1VvQD1KPJLqHrL6nGIRVVuOQQr3FtWxKFbn2+sYEkujFkNYBJmSyB2E0xaGP+smZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732040948; c=relaxed/simple;
	bh=7EkmoYAIwgLMOya3DiDGaKKRi9eJcRdqgo7aEZsiTP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mmfcKxWvtvTMIleU6htW9Ii1pNtM4L2+EzRubUGnRhBaFed7nceDJCW39aHx8fWxPvc6Nx0ZsKC5JKqTpspe/pjVpQfaq7C3cLpVM5aRLNIv3QcoPmQFz12qi7CCKlzogEDnYJ3m/xktPsYfHydQHuDskJWmF/VJJ85YBUZArW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Xq7txC//; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so2035088f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 10:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732040943; x=1732645743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TjjEcmv2liyk/XEk1ss5lodHgFTZTAwHIgNTYP/SyTw=;
        b=Xq7txC//hrlB38W1B3QVYa30x6KnEZzMV7r07Pw6nVuQ5Ee5K3Uctfaush223LfmCI
         xnNEEhKE5OTxlZumHK3qIPi0xZJVdShgGtpr7S9IC1B+QGu1OzLo2RyAQHx7x3KugJvr
         ccJ7HWSguPHuwjB18Rwtpew8SlsiTmaKIljWRpuIz70LWIarZtobVYF9oFwtmMqVxuNU
         X3BZRBM1jTHzUX8ABaNZuCmRvTahrTg1mFa55ZmNMbkonkNMkxtN6pvE4DAyZB0MiEJE
         2Lt/HlnTIM99ZlWUrV1giQb88Atuq30xFkeWY/4OPKLRNqU95/0JoPn6LVMVqlDuxWNj
         L2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732040943; x=1732645743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjjEcmv2liyk/XEk1ss5lodHgFTZTAwHIgNTYP/SyTw=;
        b=A1wHHevWfHzkGwy2/GVnt5OkBWrNyYQ2gz8rSUdrIBaeP7WjbeQulzbDqMnOgO2ofx
         G8lhRytdYjQ9RJOpmmggj7f0G0sC62czvkKMv9mZt43t9EnYBHUWpgXlOgVSQvTTj3H7
         ev6/SPmkEliVA5mfvfDbwas5rPvBeX3pB14bBsNMbPEq0L7Nh6KUkwWfIzUdpecDybAC
         cBWiKjPhCoZljItdGPO8235JwUTyg3jYJrSyd/c9Ik7+5m2uq1xPiznCFXySrisESntY
         2jJk0OnIBBMT1ca9tUgPSRRvTY0pyTc7BlNYfL6+GI6aQ9BTuTlUZQDTW3gnSmxXH8io
         eH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjl9MSJge5xK3ucPY7X1EhkQmHNyEdczC3086PmYZVwV0spcRtrCNmkHUCWXrL7zlRLUINoBzZhLUVcP/zRBKD2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTam5FTyWmfuTV3qF+oR69dzVgc2ScTJ8+q54/U457Il/B1B3
	tFTiChHQ5Mas+eYn9F6IxEoLrmHODTk9kNdA/QGTYCERAIqmbSu1fkDy8FxdzYM=
X-Google-Smtp-Source: AGHT+IFnY/REEdmz7YD1WEr3CSS+CDWUtex9JzX1ZdzW4zdq0+PcYDiFyHyYLuR7W7cpAOYMYdli5w==
X-Received: by 2002:a5d:6c62:0:b0:382:40cc:5057 with SMTP id ffacd0b85a97d-38240cc530dmr8023061f8f.8.1732040943004;
        Tue, 19 Nov 2024 10:29:03 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38244220183sm7893379f8f.99.2024.11.19.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:29:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Pedro Sousa <pedrom.sousa@synopsys.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] scsi: ufs: Switch back to struct platform_driver::remove()
Date: Tue, 19 Nov 2024 19:28:56 +0100
Message-ID: <20241119182856.55743-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6400; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=7EkmoYAIwgLMOya3DiDGaKKRi9eJcRdqgo7aEZsiTP4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnPNjp6LSiAa1I5FOmgMRNs6RRlpfp1I+WXQ5Jy kT+1b+r+OmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzzY6QAKCRCPgPtYfRL+ TpXpB/0e48BSclKJNk79t2QAL7ya486g/ZENqVkbV84wvxtryeeYwTupocnq00111eq5K0/DmGn 5N4obnl0Yz0e3KeGMA7JfzxJvPrPYGOGz28YyBN6Sd3hOEd6ySenM2sNKhrDFRa+ryLgbBtM+0r t1goFmLAz1bCbMLKdKob3arBzK0CJUYeBB/jgaipkO2eqyCWlNSt+pteiri4uI2flz9pqWJALQL QXPOzQck5OYwjzyutjQCb/e5xiDGpJriITfqlnsNsdFM2WKgrZ/R+MvqLn6nnyNroBHFtNX80WU 7OIgmZQqPyjlHlnMRJJPpcenrvoEatHfp2PJ/iqzncWGiZ5D
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/ufs to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/ufs. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split. Also if you object the indentation stuff, I can rework
that.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/ufs/host/cdns-pltfrm.c        | 2 +-
 drivers/ufs/host/tc-dwc-g210-pltfrm.c | 2 +-
 drivers/ufs/host/ti-j721e-ufs.c       | 2 +-
 drivers/ufs/host/ufs-exynos.c         | 2 +-
 drivers/ufs/host/ufs-hisi.c           | 2 +-
 drivers/ufs/host/ufs-mediatek.c       | 2 +-
 drivers/ufs/host/ufs-qcom.c           | 2 +-
 drivers/ufs/host/ufs-renesas.c        | 2 +-
 drivers/ufs/host/ufs-sprd.c           | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/cdns-pltfrm.c b/drivers/ufs/host/cdns-pltfrm.c
index 66811d8d1929..c80f770a6285 100644
--- a/drivers/ufs/host/cdns-pltfrm.c
+++ b/drivers/ufs/host/cdns-pltfrm.c
@@ -321,7 +321,7 @@ static const struct dev_pm_ops cdns_ufs_dev_pm_ops = {
 
 static struct platform_driver cdns_ufs_pltfrm_driver = {
 	.probe	= cdns_ufs_pltfrm_probe,
-	.remove_new = cdns_ufs_pltfrm_remove,
+	.remove = cdns_ufs_pltfrm_remove,
 	.driver	= {
 		.name   = "cdns-ufshcd",
 		.pm     = &cdns_ufs_dev_pm_ops,
diff --git a/drivers/ufs/host/tc-dwc-g210-pltfrm.c b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
index a3877592604d..9bfaa36cc898 100644
--- a/drivers/ufs/host/tc-dwc-g210-pltfrm.c
+++ b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
@@ -89,7 +89,7 @@ static const struct dev_pm_ops tc_dwc_g210_pltfm_pm_ops = {
 
 static struct platform_driver tc_dwc_g210_pltfm_driver = {
 	.probe		= tc_dwc_g210_pltfm_probe,
-	.remove_new	= tc_dwc_g210_pltfm_remove,
+	.remove		= tc_dwc_g210_pltfm_remove,
 	.driver		= {
 		.name	= "tc-dwc-g210-pltfm",
 		.pm	= &tc_dwc_g210_pltfm_pm_ops,
diff --git a/drivers/ufs/host/ti-j721e-ufs.c b/drivers/ufs/host/ti-j721e-ufs.c
index 250c22df000d..21214e5d5896 100644
--- a/drivers/ufs/host/ti-j721e-ufs.c
+++ b/drivers/ufs/host/ti-j721e-ufs.c
@@ -83,7 +83,7 @@ MODULE_DEVICE_TABLE(of, ti_j721e_ufs_of_match);
 
 static struct platform_driver ti_j721e_ufs_driver = {
 	.probe	= ti_j721e_ufs_probe,
-	.remove_new = ti_j721e_ufs_remove,
+	.remove = ti_j721e_ufs_remove,
 	.driver	= {
 		.name   = "ti-j721e-ufs",
 		.of_match_table = ti_j721e_ufs_of_match,
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 6548f7a8562f..c4098011c4b4 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2166,7 +2166,7 @@ static const struct dev_pm_ops exynos_ufs_pm_ops = {
 
 static struct platform_driver exynos_ufs_pltform = {
 	.probe	= exynos_ufs_probe,
-	.remove_new = exynos_ufs_remove,
+	.remove = exynos_ufs_remove,
 	.driver	= {
 		.name	= "exynos-ufshc",
 		.pm	= &exynos_ufs_pm_ops,
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 5ee73ff05251..494f593702a3 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -590,7 +590,7 @@ static const struct dev_pm_ops ufs_hisi_pm_ops = {
 
 static struct platform_driver ufs_hisi_pltform = {
 	.probe	= ufs_hisi_probe,
-	.remove_new = ufs_hisi_remove,
+	.remove = ufs_hisi_remove,
 	.driver	= {
 		.name	= "ufshcd-hisi",
 		.pm	= &ufs_hisi_pm_ops,
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 06ab1e5e8b6f..6fc848d0ada8 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1962,7 +1962,7 @@ static const struct dev_pm_ops ufs_mtk_pm_ops = {
 
 static struct platform_driver ufs_mtk_pltform = {
 	.probe      = ufs_mtk_probe,
-	.remove_new = ufs_mtk_remove,
+	.remove = ufs_mtk_remove,
 	.driver = {
 		.name   = "ufshcd-mtk",
 		.pm     = &ufs_mtk_pm_ops,
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3b592492e152..d2b8d97b480e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1897,7 +1897,7 @@ static const struct dev_pm_ops ufs_qcom_pm_ops = {
 
 static struct platform_driver ufs_qcom_pltform = {
 	.probe	= ufs_qcom_probe,
-	.remove_new = ufs_qcom_remove,
+	.remove = ufs_qcom_remove,
 	.driver	= {
 		.name	= "ufshcd-qcom",
 		.pm	= &ufs_qcom_pm_ops,
diff --git a/drivers/ufs/host/ufs-renesas.c b/drivers/ufs/host/ufs-renesas.c
index 3ff97112e1f6..f404019dc5d9 100644
--- a/drivers/ufs/host/ufs-renesas.c
+++ b/drivers/ufs/host/ufs-renesas.c
@@ -404,7 +404,7 @@ static void ufs_renesas_remove(struct platform_device *pdev)
 
 static struct platform_driver ufs_renesas_platform = {
 	.probe	= ufs_renesas_probe,
-	.remove_new = ufs_renesas_remove,
+	.remove = ufs_renesas_remove,
 	.driver	= {
 		.name	= "ufshcd-renesas",
 		.of_match_table	= of_match_ptr(ufs_renesas_of_match),
diff --git a/drivers/ufs/host/ufs-sprd.c b/drivers/ufs/host/ufs-sprd.c
index d8b165908809..b1ffb9b05fa7 100644
--- a/drivers/ufs/host/ufs-sprd.c
+++ b/drivers/ufs/host/ufs-sprd.c
@@ -442,7 +442,7 @@ static const struct dev_pm_ops ufs_sprd_pm_ops = {
 
 static struct platform_driver ufs_sprd_pltform = {
 	.probe = ufs_sprd_probe,
-	.remove_new = ufs_sprd_remove,
+	.remove = ufs_sprd_remove,
 	.driver = {
 		.name = "ufshcd-sprd",
 		.pm = &ufs_sprd_pm_ops,

base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
-- 
2.45.2


