Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC9441119A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 11:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhITJHl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 05:07:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:54416 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234740AbhITJHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 05:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=f/zxZRGlnJpbe6
        H96Hzt8uxtwQGLc86qedocs3VWYGA=; b=lj832Axr2/AczctzUdmCMQrrBZaEpb
        sgQBzYMsw7XFq7QQHC62sWqHBwWEQKrB8V6+9dziQacstGjHZpmiejLLeEsQVijJ
        Mo3gDWHErBHl98DFkBDwrD6Wjsvs98/tGsOVbrWgOlyNz/4SAHebWKTK4ic810dk
        3jLN634vo/uRw=
Received: (qmail 2412762 invoked from network); 20 Sep 2021 11:05:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 11:05:27 +0200
X-UD-Smtp-Session: l3s3148p1@D7kElWnMFosgAwDPXwlxANIWpbLKE1Uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 8/9] platform: chrome: cros_ec_sensorhub: simplify getting .driver_data
Date:   Mon, 20 Sep 2021 11:05:20 +0200
Message-Id: <20210920090522.23784-9-wsa+renesas@sang-engineering.com>
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

 drivers/platform/chrome/cros_ec_sensorhub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 9c4af76a9956..31fb8bdaad5a 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -224,8 +224,7 @@ static int cros_ec_sensorhub_probe(struct platform_device *pdev)
  */
 static int cros_ec_sensorhub_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct cros_ec_sensorhub *sensorhub = platform_get_drvdata(pdev);
+	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
 	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
@@ -235,8 +234,7 @@ static int cros_ec_sensorhub_suspend(struct device *dev)
 
 static int cros_ec_sensorhub_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct cros_ec_sensorhub *sensorhub = platform_get_drvdata(pdev);
+	struct cros_ec_sensorhub *sensorhub = dev_get_drvdata(dev);
 	struct cros_ec_dev *ec = sensorhub->ec;
 
 	if (cros_ec_check_features(ec, EC_FEATURE_MOTION_SENSE_FIFO))
-- 
2.30.2

