Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F9C577782
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 19:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiGQRpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 13:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiGQRpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 13:45:08 -0400
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8528DDF89
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
        b=TwYWbTiUI9ca6WbppfWDbYpUHgEeRlvSoRO4L/8TJ6sjwZUHNaPhBA5wg1DG8pKit8gptQIt8BGGT
         UQEt9UMGduWyReDA8MQzJH08hfwzY4MVy3clFON8D58EzjqNdVy6RKihmATeWy3ERl+csW/SVMcFlB
         UkGnHaKhDo5v19t0b5Fna2aSebtLAYh0C2dPzTODeXigGmxIZ+T6CMc4v9cEDVsTV73xJ/Lbjq4sL6
         romSc6y4AJ8AAaNcUNL4/cT5x7B7f4WcQ7ZGLLSa7THtFWpDJDL54u+Uw4zGBuVznGrLrcVmy1P/g8
         6EJB1QnjdMltJS8summScIzVZpwDE/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=2vLgyicetFZ8VksYnfIhJHbo2JtPKcWdixiwNKw+SGE=;
        b=inFA86pcq7TWYlZW7Unv1A6XMtZ8tyI7aEwLihkz9RlipuETRMnWpDlNhyhEdp1MbRinHOqfGj9m+
         CjeZxLwDg==
X-HalOne-Cookie: c0c0f26bac3daaf8910f2641e6402cdea6b98545
X-HalOne-ID: 2de56c81-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 2de56c81-05f8-11ed-823f-d0431ea8bb10;
        Sun, 17 Jul 2022 17:45:01 +0000 (UTC)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 0/12] drm bridge updates
Date:   Sun, 17 Jul 2022 19:44:42 +0200
Message-Id: <20220717174454.46616-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is a collection of bridge patches that I had left unfinished
more than a year ago. Now where I have some spare time I dusted them
off for review and testing.

The patches builds, but has seen no run-time testing.

The patches are grouped like this:

1+2:
  - Updates parade-ps8640 for atomic operation thus allowing
    the use of the atomic variants of drm_bridge_chain_pre_enable/
    post_disable.
    There is thus no users left of the non-atomic variants of
    drm_bridge_chain* so drop them all.
    If other drivers needs this functionality they are supposed
    to use the atomic API.
    This is a DSI to eDP converter, and I did not see a need for
    format negotiation - but I may be wrong?

3+4:
  - Drop chain_mode_fixup in mediatek, and as there are no more
    users, drop the implementation of drm_bridge_chain_mode_fixup.
    The crucial part to review is the updated documentation for
    drm_bridge_funcs.atomic_check().

5-11:
  - Convert all bridge drivers from mode_fixup to atomic_check.
    To do so add the necessary hooks to have an atomic state.
    I think the drivers will work using the atomic API,
    but it has seen no testing!
    I did not see any need for format negotiation, but if needed
    let me know so we can fix it.
    The last patch removes the mode_fixup support in drm_bridge.

12:
  - Add a few todo items, in the hope others will jump in and
    convert some of the bridge drivers to the atomic API.

The patch groups are more or less independent, and I may land them out
of order if one group is reviewed before the rest.
A few of the patches has already seen a review, but they need a
bit more exposure as last review was more than a year ago.

	Sam


Sam Ravnborg (12):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
      drm/bridge: cros-ec-anx7688: Use drm_bridge_funcs.atomic_check
      drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
      drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
      drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
      drm/omapdrm: Use drm_bridge_funcs.atomic_check
      drm/bridge: Drop drm_bridge_funcs.mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst               |  20 ++++
 drivers/gpu/drm/bridge/cros-ec-anx7688.c |  28 ++++--
 drivers/gpu/drm/bridge/parade-ps8640.c   |  18 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c     |  17 ++--
 drivers/gpu/drm/bridge/tc358767.c        |  21 ++---
 drivers/gpu/drm/drm_bridge.c             | 154 +------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c      |  19 ----
 drivers/gpu/drm/omapdrm/dss/dpi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/sdi.c        |  31 ++++---
 drivers/gpu/drm/omapdrm/dss/venc.c       |  28 ++++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c      |  12 ++-
 include/drm/drm_bridge.h                 |  91 ++++--------------
 12 files changed, 147 insertions(+), 323 deletions(-)


