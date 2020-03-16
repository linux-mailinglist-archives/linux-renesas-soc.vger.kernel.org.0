Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBBF18703C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 17:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgCPQjO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 12:39:14 -0400
Received: from sauhun.de ([88.99.104.3]:54460 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732092AbgCPQjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 12:39:13 -0400
Received: from localhost (p54B334BA.dip0.t-ipconnect.de [84.179.52.186])
        by pokefinder.org (Postfix) with ESMTPSA id D625D2C1EFA;
        Mon, 16 Mar 2020 17:39:11 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Francisco Jerez <currojerez@riseup.net>,
        Dave Airlie <airlied@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm: encoder_slave: fix refcouting error for modules
Date:   Mon, 16 Mar 2020 17:39:06 +0100
Message-Id: <20200316163907.13709-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
References: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

module_put() balances try_module_get(), not request_module(). Fix the
error path to match that.

Fixes: 2066facca4c7 ("drm/kms: slave encoder interface.")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/drm_encoder_slave.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index cf804389f5ec..d50a7884e69e 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -84,7 +84,7 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 
 	err = encoder_drv->encoder_init(client, dev, encoder);
 	if (err)
-		goto fail_unregister;
+		goto fail_module_put;
 
 	if (info->platform_data)
 		encoder->slave_funcs->set_config(&encoder->base,
@@ -92,9 +92,10 @@ int drm_i2c_encoder_init(struct drm_device *dev,
 
 	return 0;
 
+fail_module_put:
+	module_put(module);
 fail_unregister:
 	i2c_unregister_device(client);
-	module_put(module);
 fail:
 	return err;
 }
-- 
2.20.1

