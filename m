Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FE441119F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 11:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbhITJHx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 05:07:53 -0400
Received: from www.zeus03.de ([194.117.254.33]:54334 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234800AbhITJHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 05:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=40/A5X1ISICwGc
        +yxpC3FVjdEcLDofeLo02oc4lIiDw=; b=GJO6RKg3hE30a4q9iMo4xd8OeWjJ/c
        /saDcxBsI7Z+kK9DkwlUaYUDfrnIMA6I845F6RtH6J/vvS0ogGth/V8aRjXXyqfG
        0N70znhZvtec5jKt0TlcNs0FopjHdzOIIJx2h8fBb/w6SvkBPthaVcpfG/hBTBjG
        k5mE1U8/QpCYQ=
Received: (qmail 2412696 invoked from network); 20 Sep 2021 11:05:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 11:05:25 +0200
X-UD-Smtp-Session: l3s3148p1@5TfslGnMEIsgAwDPXwlxANIWpbLKE1Uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/panfrost: simplify getting .driver_data
Date:   Mon, 20 Sep 2021 11:05:17 +0200
Message-Id: <20210920090522.23784-6-wsa+renesas@sang-engineering.com>
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

 drivers/gpu/drm/panfrost/panfrost_device.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index bd9b7be63b0f..fd4309209088 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -400,8 +400,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
 #ifdef CONFIG_PM
 int panfrost_device_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
 	panfrost_device_reset(pfdev);
 	panfrost_devfreq_resume(pfdev);
@@ -411,8 +410,7 @@ int panfrost_device_resume(struct device *dev)
 
 int panfrost_device_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
 	if (!panfrost_job_is_idle(pfdev))
 		return -EBUSY;
-- 
2.30.2

