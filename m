Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470B22DF794
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 02:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgLUB62 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 20:58:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55548 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgLUB61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 20:58:27 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61B63BA4;
        Mon, 21 Dec 2020 02:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608515861;
        bh=rgrvbWOr1OZJGXj89Vo5MXPcIajftRKKgt7TSjs2pwc=;
        h=From:To:Cc:Subject:Date:From;
        b=nItiHdWgF1D5Qw9MgfYUnv45KKb3h5XSG8Cz6f8/anFmGMwlZoLovZcDx5gdN+TY1
         KkU75WGbkg4127/NR0OkwwKuvAFzPUT26zs2x/YZh00VtmhEzNrMjfT3O/LIAMfA4C
         +6stOw0kZoqdg/juOgilrpOy+6XYpz5GM43pNMjs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Subject: [PATCH 0/4] drm: rcar-du: Add cubic LUT support
Date:   Mon, 21 Dec 2020 03:57:26 +0200
Message-Id: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series adds cubic (3D) look up table support to the CMM and
DU drivers, and extend the KMS userspace API to expose the cubic LUT to
userspace.

The code is fairly straightforward. Patch 1/4 refactors the CMM (color
management module, the Renesas R-Car IP core that handles 1D and 3D
lookup tables for the display) driver, which currently supports the 1D
(a.k.a. gamma) table only, to prepare for 3D LUT support (including a
modification to the API between the CMM and DU drivers). The CMM driver
is then extended in patch 2/4 to support the 3D LUT.

Patch 3/4 adds support for the 3D LUT in the KMS core and the KMS
userspace API, in the form of two new properties. I expect this to be
the most controversial part of the series, not so much for the feature
itself, but for when it is inserted in the color management pipeline.

Finally, patch 4/4 wires the KMS extension to the DU driver.

The R-Car CMM applies the 3D LUT at the output of the display, where
data is transmitted in RGB space (when outputting YUV data to the
display the CMM can't be used according to the documentation, but I
wouldn't be entirely surprised if this limitation could be worked
around), before the 1D LUT. I've located the 3D LUT between the CTM and
the gamma LUT, but it could equally be placed before the degamma LUT or
between the degamma LUT and the CTM in my case, as the R-Car color
management pipeline has no CTM and has a single 1D LUT on the output
side (there's provision for 1D LUT on the input side for some of the
planes, but that's a separate topic).

I however don't expect this to necessarily match all hardware though,
and this feature may require us to give up on a fixed, one size fits
them all, color management pipeline exposed to userspace. Whether this
would mean device-specific APIs (not necessarily in the form of
device-specific properties, but in how they map to hardware features, as
I think helpers to handle a 3D LUT property in the KMS core can save
code duplication in drivers), or the need for a new property to expose
the order in which color management operations are implemented, I don't
know.

I started having a look at userspace to see how this could be handled,
searching for color management support in weston, kwin and wlroots/sway.
All three support setting the gamma table when using the DRM/KMS
backend, weston and kwin through the legacy API, and wlroots through the
atomic API. Weston reads an ICC profile using Little CMS and applies the
gamma table. kwin is a bit more elaborate, it also uses Little CMS to
read an ICC profile, but additionally supports setting the brightness
and color temperature. It however only sets a gamma table in the end.
Wlroots seems to have an API to set the gamma table, but I haven't seen
where sway uses it (I may have missed that though). In any case, there's
limited support there for color management.

Inputs would be appreciated on this, for instance with feedback on how
X.org and Android handle color management, on how 3D LUTs are
implemented on other platforms, or in general on how we would like to
use them. I don't mind doing some work in userspace to prototype this,
but I won't have the bandwidth to design a completely new framework.

Kieran Bingham (3):
  drm: rcar-du: cmm: Provide 3D-CLU support
  drm: Extend color correction to support 3D-CLU
  drm: rcar-du: kms: Configure the CLU

Laurent Pinchart (1):
  drm: rcar-du: cmm: Refactor LUT configuration

 drivers/gpu/drm/drm_atomic_helper.c       |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |   3 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  10 ++
 drivers/gpu/drm/drm_color_mgmt.c          |  41 ++++++--
 drivers/gpu/drm/drm_mode_config.c         |  14 +++
 drivers/gpu/drm/rcar-du/rcar_cmm.c        | 110 +++++++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_cmm.h        |  22 +++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |  45 ++++++---
 include/drm/drm_crtc.h                    |   9 ++
 include/drm/drm_mode_config.h             |  11 +++
 10 files changed, 207 insertions(+), 59 deletions(-)

-- 
Regards,

Laurent Pinchart

