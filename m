Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044C336C369
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 12:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbhD0K2Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 06:28:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235736AbhD0K2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 710496140C;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=ef7IZ30lWjyFTV9EZRM5TkDA3zgk8AfGs9/mdIqlXQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NnefXPyXnuIWijAghbwvELrHTqlZiXq/Qbhds+I7GeJnKGtoCKf2ygzYDTZNy6YJH
         2luLrgK+JSAXl1nhkLDiBsca1EOO6cDy5SY0dOwxcHCwLS6IB31X3GKE3T5EG+IOAC
         UZOd0/61C+DeJfvW4H+JlCKDxW34nCrPW5kY51imcJFadO5LSDFMeOXnjvxkkQy/6C
         uiCsJ48DrsdwrcUyjBvJSJaKKHfhV6K5AxCB7dFvwwrwWy/hCKIRliym7/4UfefdUp
         I9fQBOjuLGVs1afchnLn2NrNZ0ISkkx9umhOZnksf+PUBatrAPl6u7Y/6aqvxFbsxZ
         PciS3pLnkJ+iA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2z-RN; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 78/79] media: rcar-vin: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:08 +0200
Message-Id: <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
 drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba2..ce8e84f9e3d9 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -408,6 +408,12 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
 
 static void rcsi2_exit_standby(struct rcar_csi2 *priv)
 {
+	/*
+	 * The code at rcsi2_enter_standby() assumes
+	 * inconditionally that PM runtime usage count was
+	 * incremented. So, it shouldn't use pm_runtime_resume_and_get()
+	 * here.
+	 */
 	pm_runtime_get_sync(priv->dev);
 	reset_control_deassert(priv->rstc);
 }
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f30dafbdf61c..f5f722ab1d4e 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	u32 vnmc;
 	int ret;
 
-	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vin->dev);
+	ret = pm_runtime_resume_and_get(vin->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Make register writes take effect immediately. */
 	vnmc = rvin_read(vin, VNMC_REG);
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 457a65bf6b66..b1e9f86caa5c 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -870,11 +870,9 @@ static int rvin_open(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	ret = pm_runtime_get_sync(vin->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vin->dev);
+	ret = pm_runtime_resume_and_get(vin->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = mutex_lock_interruptible(&vin->lock);
 	if (ret)
-- 
2.30.2

