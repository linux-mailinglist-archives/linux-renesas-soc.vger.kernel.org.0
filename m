Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892E73B2423
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 02:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFXAF6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 20:05:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54082 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFXAF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 20:05:58 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A83D087F;
        Thu, 24 Jun 2021 02:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624493019;
        bh=o4A7rz7rZoYsx099yX5YSknU3/LXn07VWHPMapBxwNc=;
        h=From:To:Cc:Subject:Date:From;
        b=fcJBJegdDFu3Lba+IrpBjotJsbB6liCfSxflXt+t0i8t8YqYuEpfAMvU2XG3WQues
         vs12sQ9hq4bWrxxJY/5KMudZZQoLaMXwQGiV6oaaFRM7qwXpcnce483wtoD8Ln9aSE
         8V1a7WGUFjwOCAeU042iGE3mpVJcjhAFvXsgUdW4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/6] drm/bridge: ti-sn65dsi86: Misc improvements
Date:   Thu, 24 Jun 2021 03:02:58 +0300
Message-Id: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series contains miscellaneous improvements to the
ti-sn65dsi86 driver, and prepares it for optional connector creation and
DisplayPort (non-eDP) support.

The patches have been posted previously as part of the "[RFC PATCH
00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode" series. The
last four patches have been left out as discussions are ongoing, this
series focusses on the base work that has mostly been approved during
the review of the RFC.

The code has been rebased on top of the latest drm-misc-next, and while
some changes to the ti-sn65dsi86 driver made conflict resolution
painful in patch 5/6, there was no big functional conflict.

Laurent Pinchart (6):
  dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
  drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
  drm/bridge: ti-sn65dsi86: Group code in sections
  drm/bridge: ti-sn65dsi86: Split connector creation to a function

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 703 ++++++++++--------
 2 files changed, 374 insertions(+), 330 deletions(-)


base-commit: 7601d53c2c49e3a7e8150e8cf332b3c17943f75a
-- 
Regards,

Laurent Pinchart

