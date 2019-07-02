Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDC35C68D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 03:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGBBZc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Jul 2019 21:25:32 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:10490 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfGBBZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jul 2019 21:25:32 -0400
X-Halon-ID: 34ebd39d-9c68-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 34ebd39d-9c68-11e9-8d05-005056917f90;
        Tue, 02 Jul 2019 03:25:24 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Clean up correct notifier in error path
Date:   Tue,  2 Jul 2019 03:24:58 +0200
Message-Id: <20190702012458.31828-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When adding the v4l2_async_notifier_cleanup() callas the wrong notifier
was cleaned up if the parallel notifier registration failed. Fix this by
cleaning up the correct one.

Fixes: 9863bc8695bc36e3 ("media: rcar-vin: Cleanup notifier in error path")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 64f9cf790445d14e..a6efe1a8099a6ae6 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -633,7 +633,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	ret = v4l2_async_notifier_register(&vin->v4l2_dev, &vin->notifier);
 	if (ret < 0) {
 		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_notifier_cleanup(&vin->group->notifier);
+		v4l2_async_notifier_cleanup(&vin->notifier);
 		return ret;
 	}
 
-- 
2.21.0

