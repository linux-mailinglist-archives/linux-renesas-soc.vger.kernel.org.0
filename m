Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE8C2F6F6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 01:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731246AbhAOAXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 19:23:02 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:48090 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731232AbhAOAXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 19:23:02 -0500
X-Halon-ID: bb380a3c-56c7-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bb380a3c-56c7-11eb-b73f-0050569116f7;
        Fri, 15 Jan 2021 01:22:21 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/4] rcar-vin: Do not try to stop stream if not running
Date:   Fri, 15 Jan 2021 01:21:45 +0100
Message-Id: <20210115002148.4079591-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Do not attempt to stop the streaming if the stream is not running.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 48280ddb15b9b0ee..f30dafbdf61ca15f 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1301,6 +1301,11 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
+	if (vin->state == STOPPED) {
+		spin_unlock_irqrestore(&vin->qlock, flags);
+		return;
+	}
+
 	vin->state = STOPPING;
 
 	/* Wait until only scratch buffer is used, max 3 interrupts. */
-- 
2.30.0

