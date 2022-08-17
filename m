Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC88596FFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Aug 2022 15:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239497AbiHQNdc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Aug 2022 09:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239421AbiHQNdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Aug 2022 09:33:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A13EB4A2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Aug 2022 06:28:22 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDDC551C;
        Wed, 17 Aug 2022 15:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660742900;
        bh=pPG9xR2VADrihQ1QjDgkkr+NbyjXGQGSM3nnQs0bztw=;
        h=From:To:Cc:Subject:Date:From;
        b=dUlUwwXFD+wtkk30lpD+KOTwykFv4TZLzfT030tF4ZUstDV3BYbQU6Pe69bqAD1uC
         77m7HTZna4bLiFLDjkNsaTCpA5xDChMyukzcBWIBCmoiwgepa3ADMJE8HfpDV9mEFw
         Rr0yvPkMuqVy/bqAzTYoJuKyOpUqU/d4WsuLjqfI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 1/3] drm: rcar-du: remove unnecessary include
Date:   Wed, 17 Aug 2022 16:28:01 +0300
Message-Id: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

rcar_du_regs.h is not needed by rcar_du_drv.c so drop the include.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 00ac233a115e..541c202c993a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -27,7 +27,6 @@
 
 #include "rcar_du_drv.h"
 #include "rcar_du_kms.h"
-#include "rcar_du_regs.h"
 
 /* -----------------------------------------------------------------------------
  * Device Information
-- 
2.34.1

