Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D108677AA70
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Aug 2023 20:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjHMSFV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Aug 2023 14:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjHMSFV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Aug 2023 14:05:21 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE6861707
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Aug 2023 11:05:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; 
   d="scan'208";a="172836546"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Aug 2023 03:05:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0F564405D103;
        Mon, 14 Aug 2023 03:05:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Adam Ford <aford173@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/7] ADV7511 driver enhancements
Date:   Sun, 13 Aug 2023 19:05:05 +0100
Message-Id: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to improve ADV7511 driver by adding
feature bits and data instead of comparing enum adv7511_type for
various hardware differences between ADV7511, ADV7533 and ADV7535.

This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
ADV7535.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762260

Biju Das (7):
  drm: adv7511: Add struct adv7511_chip_info and use
    i2c_get_match_data()
  drm: adv7511: Add max_mode_clock variable to struct adv7511_chip_info
  drm: adv7511: Add max_lane_freq variable to struct adv7511_chip_info
  drm: adv7511: Add supply_names and num_supplies variables to struct
    adv7511_chip_info
  drm: adv7511: Add has_dsi feature bit to struct adv7511_chip_info
  drm: adv7511: Add link_config feature bit to struct adv7511_chip_info
  drm: adv7511: Add hpd_override_enable feature bit to struct
    adv7511_chip_info

 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 19 ++--
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 98 +++++++++++---------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  7 +-
 3 files changed, 69 insertions(+), 55 deletions(-)

-- 
2.25.1

