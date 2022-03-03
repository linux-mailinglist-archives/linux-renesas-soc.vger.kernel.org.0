Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77CC44CBD61
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiCCMOA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:14:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbiCCMN7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:13:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13D78596C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:13:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40D36885;
        Thu,  3 Mar 2022 13:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646309592;
        bh=pQ90ib4nAuhIhCllprOQcATTaJ8vUJbyLFHgmRpx5TM=;
        h=Date:From:To:Cc:Subject:From;
        b=L45WZfKCYx9xZauHM+T016ywL0vt+Dd6jl06e+8w2XW59bpTSk221VRJOU8cfUPbZ
         hwDcymypd3s1Sj8nuXLXHLqgJuIEZOn9Dr0s+kBLbwLZRpGNTuqSNrYlHPyV2sk7Qk
         BATO3NpYc9oo51w7jrEvJn0FA8XXdxF8fYXl9m3M=
Date:   Thu, 3 Mar 2022 14:12:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR v5.18] R-Car DU misc improvements
Message-ID: <YiCwy3FR3gPng4dN@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b2874:

  Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20220303

for you to fetch changes up to 8ba3c7bd4dca7ac358e834eabf840012d9564356:

  drm: rcar-du: Don't restart group when enabling plane on Gen3 (2022-03-03 14:06:04 +0200)

----------------------------------------------------------------
- R-Car LVDS support for M3-W+ (R8A77961) SoC
- R-Car DU misc fixes and cleanups

----------------------------------------------------------------
Laurent Pinchart (3):
      drm: rcar-du: Drop LVDS device tree backward compatibility
      drm: rcar-du: Don't select VSP1 sink on Gen3
      drm: rcar-du: Don't restart group when enabling plane on Gen3

Nikita Yushchenko (2):
      dt-bindings: display: bridge: renesas,lvds: Document r8a77961 bindings
      drm: rcar-du: lvds: Add r8a77961 support

 .../bindings/display/bridge/renesas,lvds.yaml      |   1 +
 drivers/gpu/drm/rcar-du/Makefile                   |   6 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  21 +-
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 323 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 --
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  69 -----
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  43 ---
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  43 ---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            |  12 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |   9 -
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
 13 files changed, 16 insertions(+), 618 deletions(-)
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts

-- 
Regards,

Laurent Pinchart
