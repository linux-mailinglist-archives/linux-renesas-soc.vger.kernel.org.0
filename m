Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BF618703D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732221AbgCPQjR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:39:17 -0400
Received: from sauhun.de ([88.99.104.3]:54480 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732183AbgCPQjO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:39:14 -0400
Received: from localhost (p54B334BA.dip0.t-ipconnect.de [84.179.52.186])
        by pokefinder.org (Postfix) with ESMTPSA id 7F4EC2C1F53;
        Mon, 16 Mar 2020 17:39:12 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: encoder_slave: use new I2C API
Date:   Mon, 16 Mar 2020 17:39:07 +0100
Message-Id: <20200316163907.13709-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

i2c_new_client() is deprecated, use the replacement
i2c_new_client_device(). Also, we have a helper to check if a driver is
bound. Use it to simplify the code. Note that this changes the errno for
a failed device creation from ENOMEM to ENODEV. No callers currently
interpret this errno, though, so we use this condensed error check.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/drm_encoder_slave.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index d50a7884e69e..e464429d32df 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -61,13 +61,8 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 
 	request_module("%s%s", I2C_MODULE_PREFIX, info->type);
 
-	client = i2c_new_device(adap, info);
-	if (!client) {
-		err = -ENOMEM;
-		goto fail;
-	}
-
-	if (!client->dev.driver) {
+	client = i2c_new_client_device(adap, info);
+	if (!i2c_client_has_driver(client)) {
 		err = -ENODEV;
 		goto fail_unregister;
 	}
@@ -96,7 +91,6 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 	module_put(module);
 fail_unregister:
 	i2c_unregister_device(client);
-fail:
 	return err;
 }
 EXPORT_SYMBOL(drm_i2c_encoder_init);
-- 
2.20.1

