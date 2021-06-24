Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0066B3B2424
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 02:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFXAF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 20:05:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54096 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhFXAF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 20:05:59 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F50E8B6;
        Thu, 24 Jun 2021 02:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624493020;
        bh=BncIWcBQROS4KJ5IszwpEpV73VjslT1dphe0mrgfHvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RdfXyMRNWB9LKR20rmwbwh4fmlDEbstyuus9C++U0QoJEb8ioldamt+Vlxdkh6M4c
         tycb5TLOMlR2daUH4esZr6aY05cM6M2mmNZoVU5kdUB4esgK2YbpBm9tVfHqDK6JOv
         zL/JZ6uBu6o5LAUu0coW8qi7+UgBsobnOuddSnZE=
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
Subject: [PATCH v2 1/6] dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
Date:   Thu, 24 Jun 2021 03:02:59 +0300
Message-Id: <20210624000304.16281-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
global reset signal, not controllable by the kernel. Make it optional in
those cases.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 12b876a20574..1c2daf7c24cc 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -153,7 +153,6 @@ properties:
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

