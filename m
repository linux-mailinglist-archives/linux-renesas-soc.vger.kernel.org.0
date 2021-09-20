Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCA341119B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 11:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbhITJHp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 05:07:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:54426 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236160AbhITJHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 05:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=kelsYgr6SqHCfz
        FaSr+5PxcTB7+QvINlURnRo2qpgTs=; b=WVT+ZD4sJBq7gWM4rlglzY+jwq1feC
        Iv+PxhjP77o6WHe8V1AE1WeSnpTMxxH4gZyg7m78AmfkaUzT11/C8u064DZyslkK
        s1MWTEuxCq4WxVzg6GcQstBpo5kj8gK7k4DuaFdSR3dnjR0AOTw6or9YZYdiICKr
        yjaOJR6+/zymY=
Received: (qmail 2412787 invoked from network); 20 Sep 2021 11:05:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 11:05:28 +0200
X-UD-Smtp-Session: l3s3148p1@zvcMlWnMGIsgAwDPXwlxANIWpbLKE1Uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 9/9] remoteproc: omap_remoteproc: simplify getting .driver_data
Date:   Mon, 20 Sep 2021 11:05:21 +0200
Message-Id: <20210920090522.23784-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/remoteproc/omap_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 43531caa1959..32a588fefbdc 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -901,8 +901,7 @@ static int _omap_rproc_resume(struct rproc *rproc, bool auto_suspend)
 
 static int __maybe_unused omap_rproc_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct rproc *rproc = dev_get_drvdata(dev);
 	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
@@ -938,8 +937,7 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
 
 static int __maybe_unused omap_rproc_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct rproc *rproc = dev_get_drvdata(dev);
 	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
-- 
2.30.2

