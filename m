Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202FA2C865
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfE1ONJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:13:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbfE1ONJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:13:09 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77279FA6;
        Tue, 28 May 2019 16:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559052788;
        bh=gdwwwY0o+j1PkvsYn2D5j46gEyj2s+UToAhQ0HADWtA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g7pWjWob3wqU74ZUFG5OQLtYmOamO0a4cqtHyelel7teL3MVmIdH7jd0uyngW2cv0
         VgoKjQt/gjkvhWQom+vNrdLQjycW6kP+EMtkSda1z3wl1BJK0l95ncGDgYISCuk77z
         AwWV664/+Ta4HOHnBcRLTozFzubYkmvrgr4sxNTc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v3 01/10] drm: bridge: Add dual_link field to the drm_bridge_timings structure
Date:   Tue, 28 May 2019 17:12:25 +0300
Message-Id: <20190528141234.15425-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend the drm_bridge_timings structure with a new dual_link field to
indicate that the bridge's input bus carries data on two separate
physical links. The first use case is LVDS dual-link mode where even-
and odd-numbered pixels are transferred on separate LVDS links.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/drm/drm_bridge.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d4428913a4e1..aea1fcfd92a7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -265,6 +265,14 @@ struct drm_bridge_timings {
 	 * input signal after the clock edge.
 	 */
 	u32 hold_time_ps;
+	/**
+	 * @dual_link:
+	 *
+	 * True if the bus operates in dual-link mode. The exact meaning is
+	 * dependent on the bus type. For LVDS buses, this indicates that even-
+	 * and odd-numbered pixels are received on separate links.
+	 */
+	bool dual_link;
 };
 
 /**
-- 
Regards,

Laurent Pinchart

