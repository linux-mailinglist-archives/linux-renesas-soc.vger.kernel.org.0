Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BEC411195
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 11:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhITJHZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 05:07:25 -0400
Received: from www.zeus03.de ([194.117.254.33]:54216 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236086AbhITJHI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 05:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=FMuJqDCHzK4uHq
        kYECDzhFJ9tjA5iJrkLQtxJNEYXpE=; b=M3AVwcQtfiGfOsawZxa6RwHbrXn9r2
        iAUDVtMNqHHXFfUJtfGRkAMd0UzYu6PDSXzvERcwTiqISvjajEWY8jyRw7yHd13b
        QNEmAXzxn7xErxMPYbimcsnxv8I8h8srBTTqHHiL5iuFNdDkBevr5BL9TeUf/Ju8
        tNEKcsR3TkWmI=
Received: (qmail 2412611 invoked from network); 20 Sep 2021 11:05:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 11:05:24 +0200
X-UD-Smtp-Session: l3s3148p1@FeDQlGnMCosgAwDPXwlxANIWpbLKE1Uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: [PATCH 2/9] firmware: meson: simplify getting .driver_data
Date:   Mon, 20 Sep 2021 11:05:14 +0200
Message-Id: <20210920090522.23784-3-wsa+renesas@sang-engineering.com>
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

 drivers/firmware/meson/meson_sm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 77aa5c6398aa..714016e3aab3 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -240,12 +240,11 @@ EXPORT_SYMBOL_GPL(meson_sm_get);
 static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct meson_sm_firmware *fw;
 	uint8_t *id_buf;
 	int ret;
 
-	fw = platform_get_drvdata(pdev);
+	fw = dev_get_drvdata(dev);
 
 	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
 	if (!id_buf)
-- 
2.30.2

