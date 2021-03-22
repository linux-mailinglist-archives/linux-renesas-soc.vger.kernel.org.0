Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55803343706
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 04:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhCVDCu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 23:02:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbhCVDCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 23:02:19 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6F1BAD6;
        Mon, 22 Mar 2021 04:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616382137;
        bh=oe1/Wdj5FWpelYYwipukb7KrPvZJeboz8t2tMJQq0V8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JeMvkBuUlkSYTdqIf575bAVcxz7npokYKm6lC8guDCrnkovUfqwxfIcvMuaFhbpP2
         kHV9nNxRL99mKvu5Y1tYC+8JwGcqt0J1Jihf3rbRcO6CNAWRHoyhVT7/gyMDvIvKNu
         VmIH8Ik9xepVKKjh5YFQQDJASjgxK9LNOXwFg1ts=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
Date:   Mon, 22 Mar 2021 05:01:18 +0200
Message-Id: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
global reset signal, not controllable by the kernel. Make it optional in
those cases.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..2506765cb338 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -150,7 +150,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - vccio-supply
   - vpll-supply
   - vcca-supply
-- 
Regards,

Laurent Pinchart

