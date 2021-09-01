Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD183FE687
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 02:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhIAXuK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 19:50:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53732 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhIAXuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:50:10 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B87C1516;
        Thu,  2 Sep 2021 01:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540151;
        bh=7X4qZVyk2k7iUjP1MSpsD7QXZUHFl6neQV8CbcJNCeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D3uQGGVrQHs7OUopz27O+Rz6y4z6KhBGHBTv4JLGOqlLxmJ28EK1fXkObz4Dpi40s
         zk5EmuvV90qc5maIVExKr1Mfw1Y7xr31ml5Yez0VIyOCZnmlk2jrIc2aOFD5O3SD5i
         Tq0KmDUgTY7jLRxjhOW+s7a4QJ3Nz1L+4dIsCRMw=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] drm: rcar-du: Sort the DU outputs
Date:   Thu,  2 Sep 2021 00:49:03 +0100
Message-Id: <20210901234907.1608896-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Sort the DU outputs alphabetically, with the exception of the final
entry which is there as a sentinal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 - Collect tag

 drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..440e6b4fbb58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -96,10 +96,10 @@ struct rcar_du_crtc_state {
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
 	RCAR_DU_OUTPUT_DPAD1,
-	RCAR_DU_OUTPUT_LVDS0,
-	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_HDMI0,
 	RCAR_DU_OUTPUT_HDMI1,
+	RCAR_DU_OUTPUT_LVDS0,
+	RCAR_DU_OUTPUT_LVDS1,
 	RCAR_DU_OUTPUT_TCON,
 	RCAR_DU_OUTPUT_MAX,
 };
-- 
2.30.2

