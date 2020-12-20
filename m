Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED942DF6B9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Dec 2020 20:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgLTTzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Dec 2020 14:55:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgLTTzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Dec 2020 14:55:40 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB7F9DAD;
        Sun, 20 Dec 2020 20:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608493822;
        bh=STuzjLKPcbHI+Ao3VzAIjMrUQjafAWs6lL7pf4KP1l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NZb+wM6+lvVNKT8UBX3n1Wt7msKDgd7zw3Dv3OibKYD0Ybcir24GBrMeKvW44N5oP
         jJ7+ln+PXrt08bGa5xTH7Qpk4GKDbNTDyuKk2x4se0GgU5DxcDSpuEEOaucrNNmGmy
         MIQrCQS/KJrFjAcUlghovsiM0zmHkfY8LeaCC/6A=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Herring <robh+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML schema
Date:   Sun, 20 Dec 2020 21:50:04 +0200
Message-Id: <20201220195005.26438-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the reference to the DWC HDMI text DT binding with a reference
to the YAML equivalent.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
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

