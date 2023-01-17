Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599C266DF76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjAQNxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjAQNxF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:53:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576CE3C2A5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 05:52:14 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BB7610C;
        Tue, 17 Jan 2023 14:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673963532;
        bh=lyUcANRABK69vbSFcbUhit+KV1oo6VY/L0p8cElZ9HM=;
        h=From:To:Cc:Subject:Date:From;
        b=Af/Ez5FiYVvNXJVxTSDbw1AM066zrquKJ45tIjNnvCAYkRbn1EVYFpiv6RQ/oN6QE
         hACg+FOIC3lA3L/95NIHRUQJFGwn3hOiWGFxUw1BV9Vst6uTseRkmasdKPZzq2A8Tn
         dtZRZqSCubLUceoHGcm4MBym3/v1GVWzpEC6RqD0=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/6] drm: rcar-du: Misc patches
Date:   Tue, 17 Jan 2023 15:51:48 +0200
Message-Id: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

Here are some small rcar-du patches based on commits in the Renesas BSP
tree.

 Tomi

Koji Matsuoka (2):
  drm: rcar-du: lvds: Add reset control
  drm: rcar-du: Fix LVDS stop sequence

Tomi Valkeinen (4):
  drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
  drm: rcar-du: Add quirk for H3 ES1 pclk WA
  drm: rcar-du: Fix setting a reserved bit in DPLLCR
  drm: rcar-du: Stop accessing non-existant registers on gen4

 drivers/gpu/drm/rcar-du/Kconfig         |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 28 +++++++------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 52 ++++++++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  6 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  3 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c     | 42 +++++++++++++++++++-
 7 files changed, 118 insertions(+), 17 deletions(-)

-- 
2.34.1

