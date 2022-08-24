Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BB859FABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 15:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237731AbiHXNA4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 09:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbiHXNAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 09:00:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00E597B16
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:00:52 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8885D2B3;
        Wed, 24 Aug 2022 15:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661346051;
        bh=59Xff2YFnThO6eo60JL/kHbSiyR81mzMA4LGd48D2k4=;
        h=From:To:Cc:Subject:Date:From;
        b=Q8vhgLC/tyNaBwZIkY50eqlLMxwMOHVeQ3H5427HmnN7WQNFXdI6BaMk/avEXWsgj
         31BjXzUZqv0vdiTSvEgRXeZDIe7DpO55uVC/maCU7QFne69pD4IGxWmkqcTK5/Dbxi
         9FBD2fpDUvd8UCc9cwKZl4zD2DhUE7TqlTpodqJU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/4] drm/bridge: ti-sn65dsi86: Basic DP support
Date:   Wed, 24 Aug 2022 16:00:30 +0300
Message-Id: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

This is possibly v5 of the series. I couldn't find v4, but the change
logs suggested changes to v3, so I presumed there's v4. However, it
might be v4 was never sent.

In any case, this series introduces basic DP support for sn65dsi86. So
far the driver has only supported eDP.

With basic I mean that there's no support for real HPD, although we do
implement detect callback. Link training is only done at
atomic-enable-time, which is not really correct for DP.

However, this series does give us a working display on a DP monitor. Due
to physical restrictions I'm not able to actually test plug/unplug,
changing monitors, and things like that, so the only "officially"
supported scenario is a DP monitor that's always plugged in, although I
think changing monitors should work.

 Tomi

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations

Tomi Valkeinen (2):
  drm/bridge: ti-sn65dsi86: check AUX errors better
  drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 77 +++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

-- 
2.34.1

