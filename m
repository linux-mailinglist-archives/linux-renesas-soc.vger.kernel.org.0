Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27602CF687
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgLDWC3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLDWC2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:02:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A782DC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Dec 2020 14:01:48 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13E4399A;
        Fri,  4 Dec 2020 23:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119305;
        bh=P6ebxqaRV9bCymyha5aYaBu0nIi1Oan3Apmv3xvyjts=;
        h=From:To:Cc:Subject:Date:From;
        b=HqqADjrSRmndwfpJyz+UHISwR8j5YD5cBZT5VAnEZjD/2ovCRK3IOYOYTaFP5YxPX
         m2U96Q8DJkf5o49jgqNmnN7nDk53ejK3Ll+9GBy2baWpXT3Tsx0H52NvwFYKiPgWlS
         tvA1NDfBp9pBL0fM1GxJyMpgM67jcHkzJ7mVkMRk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/9] drm: rcar-du: Fix LVDS-related crash
Date:   Sat,  5 Dec 2020 00:01:30 +0200
Message-Id: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series fixes a crash in the LVDS encoder on D3 and E3 SoCs.
See patch 1/9 for details. The next patches are additional cleanups.

Patches 4/9 to 6/9 fix incorrect usage of the devm_* API. They could be
made simpler by using the proposed drmm_* allocators for encoders and
planes ([1]), but those haven't landed yet. Not depending on them also
helps backporting those fixes to stable kernels. I will switch to the
new helpers when they will be available.

[1] https://lore.kernel.org/dri-devel/20200911135724.25833-1-p.zabel@pengutronix.de/

Laurent Pinchart (9):
  drm: rcar-du: Fix crash when using LVDS1 clock for CRTC
  drm: rcar-du: Release vsp device reference in all error paths
  drm: rcar-du: Drop unneeded encoder cleanup in error path
  drm: rcar-du: Use DRM-managed allocation for VSP planes
  drm: rcar-du: Use DRM-managed allocation for encoders
  drm: rcar-du: Embed drm_device in rcar_du_device
  drm: rcar-du: Replace dev_private with container_of
  drm: rcar-du: Skip encoder allocation for LVDS1 in dual-link mode
  drm: rcar-du: Drop local encoder variable

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c      | 12 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c       | 33 +++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h       | 13 ++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c   | 95 +++++++++++----------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h   |  2 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c       | 12 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  8 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c       | 28 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c |  2 +-
 9 files changed, 107 insertions(+), 98 deletions(-)

-- 
Regards,

Laurent Pinchart

