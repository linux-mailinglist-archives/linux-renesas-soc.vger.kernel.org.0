Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A18C34544D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 01:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhCWA5M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 20:57:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhCWA5H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 20:57:07 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57CCA8F0;
        Tue, 23 Mar 2021 01:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616461026;
        bh=cxNXwLl1bpW8Kb5Kd6WkWoYN/NfLRBADz7YLk2AsHdI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m3QRNi4SKs1yaisOlk/sPwFgobMxHmI0jGCNEeurqeXtBjYdAR9G9f8PQPJ+WBKIE
         qcZ4aze8Oo7SY4kBReEjSwt2EifgWfrkcGDHSdXILUQ8X6wTtamOaB5GKUTLQ0hobZ
         i4UVT4SwJho4Oi/oQ6u8oKLPVpkroPRIcvSXlLvM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm: rcar-du: Shutdown the display on remove
Date:   Tue, 23 Mar 2021 02:56:16 +0200
Message-Id: <20210323005616.20110-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the device is unbound from the driver (the DU being a platform
device, this occurs either when removing the DU module, or when
unbinding the device manually through sysfs), the display may be active.
Make sure it gets shut down.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 2a06ec1cbefb..9f1a3aad4dd7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -553,6 +553,7 @@ static int rcar_du_remove(struct platform_device *pdev)
 	struct drm_device *ddev = &rcdu->ddev;
 
 	drm_dev_unregister(ddev);
+	drm_atomic_helper_shutdown(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
 
-- 
Regards,

Laurent Pinchart

