Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6740AB9B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 15:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfIFNsy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 09:48:54 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:46399 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405244AbfIFNsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 09:48:54 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CCE5BFF80F;
        Fri,  6 Sep 2019 13:48:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm: rcar-du: kms: Expand comment in vsps parsing routine
Date:   Fri,  6 Sep 2019 15:50:12 +0200
Message-Id: <20190906135012.10285-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Expand comment in the 'vsps' parsing routine to specify the LIF
channel index defaults to 0 in case the second cell of the property
is not specified to remain compatible with older DT bindings.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
This trivial change is a leftover from a series that Geert already
took in. Re-sending as I forgot to add the dri list.

Laurent, could you pick this one please?

Thanks
  j
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index fc30fff0eb8d..cb636637032d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -625,7 +625,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)

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

