Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC3648CA2D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344008AbiALRqr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:46:47 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59315 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355942AbiALRqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:43 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824710"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D29CB4005E1F;
        Thu, 13 Jan 2022 02:46:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible variable
Date:   Wed, 12 Jan 2022 17:45:54 +0000
Message-Id: <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase buff size for compatible variable to avoid stack corruption
with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
more than the current allocated size.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
index afef69669bb4..84e73f8df686 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
@@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
 	struct device_node *lvds_node;
 	struct device_node *soc_node;
 	struct device_node *du_node;
-	char compatible[22];
+	char compatible[24];
 	const char *soc_name;
 	unsigned int i;
 	int ret;
-- 
2.17.1

