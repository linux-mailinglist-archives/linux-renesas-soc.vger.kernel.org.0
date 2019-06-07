Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF9F399C8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 01:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730471AbfFGXr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 19:47:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfFGXr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 19:47:59 -0400
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE6E531A;
        Sat,  8 Jun 2019 01:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559951277;
        bh=/RHszLjp1uQGQ16i2uj7YXjP5Jf0cYTkdbnlD4r0ksM=;
        h=Date:From:To:Cc:Subject:From;
        b=K2ckc+dAVR35dMb6c6vU3G+7IaZWGyHdaHo/kpig1/ZXY+qUTUUB2cN+7EAqLwK6i
         T6Ix9WBdHMVXqXIOYRle7fN1SZqfbgxCZEq2zWJpb95JO+3iS0/eHTYpGHq8oydTo8
         WXp0HzRH5wtm+iB8ZQsbBYPWN/BkQ0LDzXYhQqY8=
Date:   Sat, 8 Jun 2019 02:47:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL FOR v5.3] R-Car DU changes
Message-ID: <20190607234743.GD5110@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dave,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20190608

for you to fetch changes up to 8e8fddab0d0acdefb1ad76852d954b2bbaa3896d:

  drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode (2019-06-08 02:36:04 +0300)

----------------------------------------------------------------
R-Car DU changes for v5.3:

- R8A774A1 SoC support
- LVDS dual-link mode support
- Misc fixes

----------------------------------------------------------------
Biju Das (4):
      dt-bindings: display: renesas: du: Document the r8a774a1 bindings
      dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
      drm: rcar-du: Add R8A774A1 support
      drm: rcar-du: lvds: Add r8a774a1 support

Kieran Bingham (1):
      drm: rcar-du: writeback: include interface header

Laurent Pinchart (7):
      drm: bridge: Add dual_link field to the drm_bridge_timings structure
      dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
      drm: bridge: thc63: Report input bus mode through bridge timings
      dt-bindings: display: renesas: lvds: Add renesas,companion property
      drm: rcar-du: lvds: Remove LVDS double-enable checks
      drm: rcar-du: lvds: Add support for dual-link mode
      drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode

 .../bindings/display/bridge/renesas,lvds.txt       |  19 ++-
 .../bindings/display/bridge/thine,thc63lvd1024.txt |   6 +
 .../devicetree/bindings/display/renesas,du.txt     |   2 +
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  54 +++++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  30 +++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  12 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 127 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
 include/drm/drm_bridge.h                           |   8 ++
 11 files changed, 218 insertions(+), 48 deletions(-)

-- 
Regards,

Laurent Pinchart
