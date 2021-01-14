Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E5E2F5ADB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 07:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbhANGqQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 01:46:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbhANGqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 01:46:16 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E15DFDB;
        Thu, 14 Jan 2021 07:45:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610606702;
        bh=ir+4oWK+yxsWVlXSTjgRzMMfZHM5FBEY18+d1uFAJ+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZkrIdO4dZegkcu1n1XQXJiWaxbwpyDpcNE+teZoegZvNuIIll9gLbA96dFskrhbQd
         6ZQpWjUI2LjVl6f2vzrPvgG6aFgldsNy4TapkFe3RAvt1kjojsivWQNGowpGO/PYCI
         unvtSWwGa10e5WIJTwv/RwbA3TGLo+HLYu/hOfus=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 6/7] dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML schema
Date:   Thu, 14 Jan 2021 08:44:36 +0200
Message-Id: <20210114064437.5793-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
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

