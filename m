Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BC928FBB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 01:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389067AbgJOXVG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 19:21:06 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:13921 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389046AbgJOXUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 19:20:35 -0400
X-Halon-ID: 24f6fac1-0f3c-11eb-9f83-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2fef.dip0.t-ipconnect.de [79.202.47.239])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 24f6fac1-0f3c-11eb-9f83-005056917a89;
        Fri, 16 Oct 2020 01:14:16 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/5] rcar-vin: Cache the CSI-2 channel selection value
Date:   Fri, 16 Oct 2020 01:14:06 +0200
Message-Id: <20201015231408.2399933-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In preparation of suspend/resume support cache the chsel value when
written to the register so it can be restored on resume if needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 2 ++
 drivers/media/platform/rcar-vin/rcar-vin.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 680160f9f851d8a3..f65deac4c2dbed54 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1456,6 +1456,8 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 
 	vin_dbg(vin, "Set IFMD 0x%x\n", ifmd);
 
+	vin->chsel = chsel;
+
 	/* Restore VNMC. */
 	rvin_write(vin, vnmc, VNMC_REG);
 
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 8396e0e45478fe4f..2fef23470e3ddfe3 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -189,6 +189,7 @@ struct rvin_info {
  * @state:		keeps track of operation state
  *
  * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
+ * @chsel		Cached value of the current CSI-2 channel selection
  *
  * @mbus_code:		media bus format code
  * @format:		active V4L2 pixel format
@@ -232,6 +233,7 @@ struct rvin_dev {
 	enum rvin_dma_state state;
 
 	bool is_csi;
+	unsigned int chsel;
 
 	u32 mbus_code;
 	struct v4l2_pix_format format;
-- 
2.28.0

