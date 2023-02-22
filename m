Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8DF69EE23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 06:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBVFG2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 00:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBVFG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 00:06:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841DB25BAC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 21:06:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 691264E1;
        Wed, 22 Feb 2023 06:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677042385;
        bh=2fUkWqUZ1ev2NS7cgswhfkQRKA3zoZl8RqK48MXGMRA=;
        h=From:To:Cc:Subject:Date:From;
        b=SON0MJi6iGvR2dQ+vxeLD+KXRajL9wgRCMo4zlbPfFZW1TuHKwIiw03Dd6kOmspn1
         wi5b9U2GzclVo2jymJUqNOgbqSO7N7LcZtOqFEBQZASa46ImsndQrSMGxu7fyDtclm
         tAKzHwGZQXw6Tygqf87pJkj8rm1MSHASXCbu2si0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/2] drm: rcar-du: Avoid writing reserved register fields
Date:   Wed, 22 Feb 2023 07:06:21 +0200
Message-Id: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series addresses writes to reserved register fields or
reserved registers.

Depending on the DU variant, some registers or register fields are
marked as reserved, but the rcar-du driver writes them unconditionally.
There is a high chance that those registers and fields are simply
ignored, as shown by the lack of known issue. However, high chances
don't satisfy functional safety requirements when they don't match the
documentation.

As there is no chance of datasheet updates that will document these
reserved fields as safe to be written with non-zero values, update the
driver to comply with the documentation.

Laurent Pinchart (2):
  drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on
    Gen3
  drm: rcar-du: Disable alpha blending for DU planes used with VSP

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart

