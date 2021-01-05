Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1852C2EA548
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 07:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAEGK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 01:10:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33096 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbhAEGK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 01:10:26 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 495DC8A0;
        Tue,  5 Jan 2021 07:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609826927;
        bh=ir+4oWK+yxsWVlXSTjgRzMMfZHM5FBEY18+d1uFAJ+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u8WRzppcNgPfjPUCPpg2r5bOWAx7o5DSWof7SKLQi+1INptlMWSXm2xDVI+Gyr3/W
         v256jQbBb1zUJiaZUeERonsICoJeNSiV45OY+vjyvHVn58r+CkUt12Km7nst0walvT
         R4VcUC3VbxKeImakeFJZE38im8NVamEkHIUJNexs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: [PATCH v3 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML schema
Date:   Tue,  5 Jan 2021 08:08:17 +0200
Message-Id: <20210105060818.24158-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the reference to the DWC HDMI text DT binding with a reference
to the YAML equivalent.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index fa4769a0b26e..5cbf655c3a07 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -12,8 +12,8 @@ description: |
   and CEC.
 
   These DT bindings follow the Synopsys DWC HDMI TX bindings defined
-  in Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with
-  the following device-specific properties.
+  in bridge/synopsys,dw-hdmi.yaml with the following device-specific
+  properties.
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
-- 
Regards,

Laurent Pinchart

