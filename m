Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98B4737D5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 10:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjFUIKu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 04:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjFUIKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 04:10:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF2810DA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 01:10:48 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D77F510A;
        Wed, 21 Jun 2023 10:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687335010;
        bh=Hbr+RKqfhbJQ+nkVEm6ASUtLSzb4vRzDpeqBiTu74Uc=;
        h=From:To:Cc:Subject:Date:From;
        b=Ka47U7sYq8LTI/9eb8Yld6aGmYH+a8HD3wvnJXNKCpQi0PdaF53FmBP2lwSvkrEOt
         Xr3PSqCYvdCVdb4KR/6Atiq+4LI+2UXoa8UUs/q/+YPHR1slAymZV6Ix1Ud9jvlJyq
         sLZ06sNCZ5BAUnx0RIVHudF1lR26hRyL/MITQ+CM=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Simon Ser <contact@emersion.fr>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
        xaver.hugl@gmail.com, Melissa Wen <mwen@igalia.com>,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        mdaenzer@redhat.com, Uma Shankar <uma.shankar@intel.com>,
        Victoria Brekenfeld <victoria@system76.com>, aleixpol@kde.org,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Joshua Ashton <joshua@froggi.es>, airlied@gmail.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        daniel@ffwll.ch, harry.wentland@amd.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, tzimmermann@suse.de,
        Xinhui.Pan@amd.com,
        DRI Development <dri-devel@lists.freedesktop.org>,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 0/9] drm: rcar-du: cmm: Enable 3D LUT support
Date:   Wed, 21 Jun 2023 10:10:22 +0200
Message-Id: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

Hello, this series is based on the RFC sent by Melssa Wen:
"[RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface"
https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.com/
that introduces CRTC properties to control 3D LUT operations.

The R-Car DU peripheral has a post-blending color management pipeline (CMM)
composed by (in order of processing) a 3D LUT a 1D LUT and a Color conversion
unit.

The CMM driver already supported operating the 1D LUT, this series add support
for the cubic LUT (named CLU).

I've been made aware by Melissa and Pekka that the focus of upstream for
color management properties is now on the definition of the "Plane color
pipeline" properties
https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/

Unfortunately the model there proposed doesn't match the R-Car DU hardware which
has color management at the post-blending level and not per plane (I've cc-ed
all the receivers of that series, just in case).

The user-space interface has been validated with dedicated unit tests for
the R-Car DU test suite (kms-test) which are available at:
https://git.sr.ht/~jmondi_/kms-test

The series validates the usage of the HW interface in the hope of re-starting
discussions and interests in the definition of CRTC color management
properties.

Thanks
   j

Alex Hung (1):
  drm: Add 3D LUT mode and its attributes

Jacopo Mondi (1):
  drm: rcar-du: crtc: Enable 3D LUT

Kieran Bingham (2):
  drm: rcar-du: cmm: Provide 3D-CLU support
  drm: rcar-du: kms: Configure the CLU

Laurent Pinchart (1):
  drm: rcar-du: cmm: Refactor LUT configuration

Melissa Wen (4):
  drm/drm_color_mgmt: add shaper LUT to color mgmt properties
  drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
  drm/drm_color_mgmt: add function to create 3D LUT modes supported
  drm/drm_color_mgmt: add function to attach 3D LUT props

 drivers/gpu/drm/drm_atomic_state_helper.c |   7 ++
 drivers/gpu/drm/drm_atomic_uapi.c         |  24 ++++
 drivers/gpu/drm/drm_color_mgmt.c          | 113 +++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c           |   5 +
 drivers/gpu/drm/drm_mode_config.c         |  21 ++++
 drivers/gpu/drm/rcar-du/rcar_cmm.c        | 127 ++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_cmm.h        |  36 +++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  68 +++++++++---
 include/drm/drm_color_mgmt.h              |   7 ++
 include/drm/drm_crtc.h                    |  32 +++++-
 include/drm/drm_mode_config.h             |  25 +++++
 include/drm/drm_mode_object.h             |   2 +-
 include/uapi/drm/drm_mode.h               |  17 +++
 13 files changed, 428 insertions(+), 56 deletions(-)

--
2.40.1

