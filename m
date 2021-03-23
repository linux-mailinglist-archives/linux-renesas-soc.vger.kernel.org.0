Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B85C34544E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 01:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhCWA5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 20:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhCWA5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 20:57:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF3EC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 17:57:08 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E13C885;
        Tue, 23 Mar 2021 01:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616461025;
        bh=33WH+hzN3JgixsFuUMQWQEGuDw/Pl+FQcmhuiHQuRGE=;
        h=From:To:Cc:Subject:Date:From;
        b=FmcXCNPuMhkMtMHjEfDvCjytjtbo2rtCXAWrkcU+TzjOHK5cfZnB4J3BAUNu6+28o
         GE5rghZzmW3j/0MJcbX4hgLQmTcOO8Te2O5jwgvRrWos277jT4U8853DAm4NgoGMQJ
         lLS7ZZtGFhJ5ciuCUld2rPhHxea2El0mKwUFlmEo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] drm: rcar-du: Don't put reference to drm_device in rcar_du_remove()
Date:   Tue, 23 Mar 2021 02:56:15 +0200
Message-Id: <20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The reference to the drm_device that was acquired by
devm_drm_dev_alloc() is released automatically by the devres
infrastructure. It must not be released manually, as that causes a
reference underflow..

Fixes: ea6aae151887 ("drm: rcar-du: Embed drm_device in rcar_du_device")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 43de3d8686e8..2a06ec1cbefb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -556,8 +556,6 @@ static int rcar_du_remove(struct platform_device *pdev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	drm_dev_put(ddev);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

