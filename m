Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B762821F87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 23:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfEQVU6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 17:20:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53714 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfEQVU5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 17:20:57 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4429B2F3;
        Fri, 17 May 2019 23:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558128055;
        bh=+VAz6nhSz+PL5Syoez/pqa6yJEk2vBBqAJ3QhZ+uFNE=;
        h=From:To:Cc:Subject:Date:From;
        b=a10CaXWHLAXqVCpAwAZ8OQHTEU6f5U/GJXdrNHwE9RA1L09OtORcXfEDPLsbp+W2L
         3dor29IbQkOiCkBnrxRv7WQCmPIYeXNo+7NmiTLMwjo3r+F2DVsG1pTLr+QXTEJaPi
         CoXXGmWu90rZg452O/kQ3LJNqSDm/oMwy3bOsPnk=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: rcar-du: writeback: include interface header
Date:   Fri, 17 May 2019 22:20:49 +0100
Message-Id: <20190517212050.3561-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The new writeback feature is exports functions so that they can
integrate into the rcar_du_kms module.

The interface functions are defined in the rcar_du_writeback header, but
it is not included in the object file itself leading to compiler
warnings for missing prototypes.

Include the header as appropriate.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
index 989a0be94131..ae07290bba6a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
@@ -14,6 +14,7 @@
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_kms.h"
+#include "rcar_du_writeback.h"
 
 /**
  * struct rcar_du_wb_conn_state - Driver-specific writeback connector state
-- 
2.20.1

