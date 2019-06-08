Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068063A005
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 15:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfFHNrJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Jun 2019 09:47:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39316 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFHNrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Jun 2019 09:47:09 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 396DB5D;
        Sat,  8 Jun 2019 15:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560001627;
        bh=KXADgQcfUvHpSCDJSgOIRJhI/dTPTQ5w60WRpYcs8Gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8rGUDqvv3xAlfBDapMxyUxsoOJrkrNqZeHz6vXYWipRJQiI4bNLcoZBNaisykEnG
         T57KCxOWUKnCbOQ9Uuv/o8crup3DHi4LP1rpmzHG/m4tLU7hw8xqXrtKyXRjKK9uef
         jTvJS8DJh1WUWqmS4Os2xDOElkvwXWhvvNfFKcfI=
Date:   Sat, 8 Jun 2019 16:46:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR v5.3] R-Car DU changes, v2
Message-ID: <20190608134652.GE4786@pendragon.ideasonboard.com>
References: <20190607234743.GD5110@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190607234743.GD5110@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dave,

If you haven't pulled the previous pull request yet, please disregard it
and process this one instead. It contains additional patches that add
support for more plane formats.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20190608-2

for you to fetch changes up to cb5f15b711d3ace7b29369657487f1281a4a5eac:

  drm: rcar-du: Add support for missing 16-bit RGB1555 formats (2019-06-08 16:36:41 +0300)

----------------------------------------------------------------
R-Car DU changes for v5.3:

- R8A774A1 SoC support
- LVDS dual-link mode support
- Support for additional formats
- Misc fixes

----------------------------------------------------------------
Biju Das (4):
      dt-bindings: display: renesas: du: Document the r8a774a1 bindings
      dt-bindings: display: renesas: lvds: Document r8a774a1 bindings
      drm: rcar-du: Add R8A774A1 support
      drm: rcar-du: lvds: Add r8a774a1 support

Kieran Bingham (1):
      drm: rcar-du: writeback: include interface header

Laurent Pinchart (10):
      drm: bridge: Add dual_link field to the drm_bridge_timings structure
      dt-bindings: display: bridge: thc63lvd1024: Document dual-link operation
      drm: bridge: thc63: Report input bus mode through bridge timings
      dt-bindings: display: renesas: lvds: Add renesas,companion property
      drm: rcar-du: lvds: Remove LVDS double-enable checks
      drm: rcar-du: lvds: Add support for dual-link mode
      drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
      drm: rcar-du: Add support for missing 32-bit RGB formats
      drm: rcar-du: Add support for missing 16-bit RGB4444 formats
      drm: rcar-du: Add support for missing 16-bit RGB1555 formats

 .../bindings/display/bridge/renesas,lvds.txt       |  19 ++-
 .../bindings/display/bridge/thine,thc63lvd1024.txt |   6 +
 .../devicetree/bindings/display/renesas,du.txt     |   2 +
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  54 +++++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  30 +++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  12 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  82 ++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   1 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 127 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
 include/drm/drm_bridge.h                           |   8 ++
 11 files changed, 298 insertions(+), 48 deletions(-)

-- 
Regards,

Laurent Pinchart
