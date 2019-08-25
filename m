Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75ADE9C43C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 16:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfHYOAU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 10:00:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:46245 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfHYOAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 10:00:20 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BF35EFF808;
        Sun, 25 Aug 2019 14:00:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] drm: rcar-du: kms: Expand comment in vsps parsing routine
Date:   Sun, 25 Aug 2019 16:01:35 +0200
Message-Id: <20190825140135.12150-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Exand comment in the 'vsps' parsing routine to specify why the LIF
channel index is defaulted to 0 in case the second cell of the property
is not specified.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2dc9caee8767..0d59f390de19 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -585,7 +585,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)

 		vsps[j].crtcs_mask |= BIT(i);

-		/* Store the VSP pointer and pipe index in the CRTC. */
+		/*
+		 * Store the VSP pointer and pipe index in the CRTC. If the
+		 * second cell of the 'vsps' specifier isn't present, default
+		 * to 0 to remain compatible with older DT bindings.
+		 */
 		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
 		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
 	}
--
2.23.0

