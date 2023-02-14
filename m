Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB1569556A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 01:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjBNAhm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 19:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjBNAhl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 19:37:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A63F1A496
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 16:37:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4313B3D7;
        Tue, 14 Feb 2023 01:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676335057;
        bh=oK9K1dHY0egTuw0eGZmS4ldHFcwlutfiU1zfyIs4blc=;
        h=From:To:Cc:Subject:Date:From;
        b=UPRbdST860cxRD6yjMX35G6xfTIRVdQFCLIcnBe0mtHpNS3SPnyRVUrn9SofaYm4o
         ws95NaL1tvJ1/5Jroy1uiFnCAl4o4qyHgVPdTTCn0c0s2EGWlFtdwO/7iBg5oYNWFY
         p1tO0Za8jMmqVDXR556mkYX9ILf3x2ScyzJxfTY8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/3] drm: rcar-du: Fix vblank wait timeout when stopping LVDS output
Date:   Tue, 14 Feb 2023 02:37:33 +0200
Message-Id: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
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

This patch series fixes an issue on the R-Car D3 and E3 SoCs, which
causes a vertical blanking wait timeout when stopping an LVDS output.
Patches 1/3 and 2/3 perform preparatory refactoring, and patch 3/3 fixes
the problem. Please see the commit message of the last patch for a
detailed explanation of the issue.

Laurent Pinchart (3):
  drm: rcar-du: lvds: Call function directly instead of through pointer
  drm: rcar-du: lvds: Move LVDS enable code to separate code section
  drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  18 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.c    | 176 ++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_lvds.h    |  12 +-
 3 files changed, 118 insertions(+), 88 deletions(-)


base-commit: 48075a66fca613477ac1969b576a93ef5db0164f
-- 
Regards,

Laurent Pinchart

