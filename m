Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630434A1CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfFRNNw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:13:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfFRNNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:13:52 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 449C9D5;
        Tue, 18 Jun 2019 15:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560863630;
        bh=8lTmOFsGGCcA400emQjhecMfjJyqMv++H6+9NE85nd8=;
        h=From:To:Cc:Subject:Date:From;
        b=ROpD0Tf34YWgv+A5lKnd15jRpj09ocpJnvak2GVcsfXftNtgcEqPyeeYr962Rzzvn
         XKZqTRzFwl9stOPCy/CHAqPHWb3u2akY/8pRNQT1ER6LHbSoVksgjai46WouTlGqG/
         QVTgyAUdO97zqblNDJq/PqOPMG8PIin8KgFIaBSw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object functions
Date:   Tue, 18 Jun 2019 16:13:29 +0300
Message-Id: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The recommended way to specify GEM object functions is to provide a
drm_gem_object_funcs structure instance and set the GEM object to point
to it. The drm_cma_gem_create_object_default_funcs() function provided
by the GEM CMA helper does so when creating the GEM object, simplifying
the driver implementation. Switch to it, and remove the then unneeded
GEM-related opertions from rcar_du_driver.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

Daniel, is this what you had in mind ?

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 3e5e835ea2b6..4cbb82009931 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
 static struct drm_driver rcar_du_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
 				| DRIVER_ATOMIC,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops		= &drm_gem_cma_vm_ops,
+	.gem_create_object      = drm_cma_gem_create_object_default_funcs,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_import	= drm_gem_prime_import,
-	.gem_prime_export	= drm_gem_prime_export,
-	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
-	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
-	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
 	.dumb_create		= rcar_du_dumb_create,
 	.fops			= &rcar_du_fops,
-- 
Regards,

Laurent Pinchart

