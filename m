Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7552C1A97A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 23:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfEKVHd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 17:07:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58268 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfEKVHd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 17:07:33 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CA112DF;
        Sat, 11 May 2019 23:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557608851;
        bh=dkxdefBzSC6dBOdXnPobIJWH8GAnrhNGaIKdvoVB834=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gyTPGgVCEjZDYk4y2a7u2c4Nn0exlVyz9DiQhl7ZTbKMydQK1pu/UVzkpTF9rKa4O
         18qSxovGQUlOoFC5sbMgHJuWPsda8gwCIoSQe5PZwQ8Qup9be5xkK50EYI4jaGpXcq
         8Zch2SN9jykuB9/NpRgkJ/Pyu2X3Pdt70NmvsI7Q=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 01/10] drm: bridge: Add dual_link field to the drm_bridge_timings structure
Date:   Sun, 12 May 2019 00:06:53 +0300
Message-Id: <20190511210702.18394-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
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

