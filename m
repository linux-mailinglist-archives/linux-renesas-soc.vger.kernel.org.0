Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A421A2CE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 02:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgDIAgw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 20:36:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39476 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgDIAgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 20:36:51 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0F9C2DC;
        Thu,  9 Apr 2020 02:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586392610;
        bh=llMVLB099oOYeZ3D8OnWk599VQrLiuIALgpwEDkkeHs=;
        h=From:To:Cc:Subject:Date:From;
        b=fcAu+wjBiZNy1Xbk7Au1SYIMai5D3Wp2nuVdDRxk1ZJSAJpNhC83AJQw0RwHuM7/i
         8JHgbx2dzkqoEvBSa5dCqUlrfTp4iYlqfcV3ajhjZs+7+ZwathJzmYzErI/0tqIEDb
         +Lz1oRldCZHSpKSxkfJxh3H27wnJCgY5M/irk06c=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM bridge connector helper
Date:   Thu,  9 Apr 2020 03:36:34 +0300
Message-Id: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This small patch series enables usage of the simple-bridge driver with
the DRM bridge connector helper (drm_bridge_connector.c). Patch 1/2
starts by simplifying the driver by delegating DDC handling to the next
bridge in the chain, and patch 2/2 makes the connector creation
optional.

I will continue converting existing bridge drivers to this new model,
starting with the adv7511, rcar-lvds and dw-hdmi bridges. Anyone willing
to give a and converting additional bridge drivers is more than welcome
:-)

Laurent Pinchart (2):
  drm: bridge: simple-bridge: Delegate operations to next bridge
  drm: bridge: simple-bridge: Make connector creation optional

 drivers/gpu/drm/bridge/simple-bridge.c | 107 +++++++++----------------
 1 file changed, 36 insertions(+), 71 deletions(-)

-- 
Regards,

Laurent Pinchart

