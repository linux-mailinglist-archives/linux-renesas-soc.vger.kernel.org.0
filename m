Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A937C343709
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhCVDCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhCVDCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1893BC061574
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 20:02:22 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 040F38CE;
        Mon, 22 Mar 2021 04:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382136;
        bh=sSGYcH7y4MbX4Fa4G8Vpnka+hU9wx5QdipnZiG/buo4=;
        h=From:To:Cc:Subject:Date:From;
        b=ipDYXbyY7qJFH8xqLzIn3hKx6WrExSwFMpjx6vlPCbpiXpmXHQRzgf2kFG9yKWk/N
         9FG7tnDFL5ICKLlX+ctOUM9jy2iocr3K6Wxvm1X5+/H/BbkxdIrttbvyDOfCIOV4l9
         ySDlIC+3CuUZpT6hdoKiL4CBEkqeT4669inJHPjk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode
Date:   Mon, 22 Mar 2021 05:01:17 +0200
Message-Id: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

Despite the SN65DSI86 being a DSI to eDP bridge, it can also operate in
DisplayPort mode. This patch series adds support for this feature to the
ti-sn65dsi86 driver.

The series starts with miscellaneous fixes and improvements in patch
01/11 to 04/11. Patch 05/11 then moves to the panel-bridge helper, and
is followed by patches 06/11 and 07/11 that refactor the code to prepare
for the next steps.

As my goal is to use the sn65dsi86 with the R-Car DU driver, which
requires DRM_BRIDGE_ATTACH_NO_CONNECTOR support, the series continues
with support for this feature. In patch 08/11 the bridge connector
operations are added, and in 09/11 the connector creation is made
optional.

Patch 10/11 then implements supports for DisplayPort mode, enabled
automatically when the next component in the pipeline isn't a panel.
Finally, patch 11/11 adds hotplug detection support, which isn't very
useful for eDP, but is needed for DisplayPort.

This series is an RFC as I haven't been able to test it fully yet. The
platform I'm working on is missing support for three other components in
the display pipeline (I'm on it), which are required in order to run
tests. I would however like to receive feedback on the approach already,
in case problems would need to be solved.

Laurent Pinchart (11):
  dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Unregister AUX adapter in remove()
  drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
  drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
  drm/bridge: ti-sn65dsi86: Group code in sections
  drm/bridge: ti-sn65dsi86: Split connector creation to a function
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations
  drm/bridge: ti-sn65dsi86: Make connector creation optional
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Support hotplug detection

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 266 ++++++++++++------
 2 files changed, 183 insertions(+), 84 deletions(-)

-- 
Regards,

Laurent Pinchart

