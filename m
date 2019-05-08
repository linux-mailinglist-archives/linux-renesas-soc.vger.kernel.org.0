Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE29617F24
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbfEHRdz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:55 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54847 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfEHRdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:53 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DF0F41BF205;
        Wed,  8 May 2019 17:33:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 7/9] drm: rcar-du: group: Enable CMM unit
Date:   Wed,  8 May 2019 19:34:26 +0200
Message-Id: <20190508173428.22054-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the CMM units present in the group through the display unit
extensional function control group register DEFR7.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 9eee47969e77..ce25e41b04bc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 
 	rcar_du_group_setup_pins(rgrp);
 
+	if (rgrp->cmms_mask) {
+		u32 defr7 = DEFR7_CODE;
+		defr7 |= rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0;
+		defr7 |= rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0;
+
+		rcar_du_group_write(rgrp, DEFR7, defr7);
+	}
+
 	if (rcdu->info->gen >= 2) {
 		rcar_du_group_setup_defr8(rgrp);
 		rcar_du_group_setup_didsr(rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index bc87f080b170..fb9964949368 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -197,6 +197,11 @@
 #define DEFR6_MLOS1		(1 << 2)
 #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
 
+#define DEFR7			0x000ec
+#define DEFR7_CODE		(0x7779 << 16)
+#define DEFR7_CMME1		BIT(6)
+#define DEFR7_CMME0		BIT(4)
+
 /* -----------------------------------------------------------------------------
  * R8A7790-only Control Registers
  */
-- 
2.21.0

