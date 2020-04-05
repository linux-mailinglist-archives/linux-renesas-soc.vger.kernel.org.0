Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A43719EE9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgDEXj4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:39:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34754 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgDEXjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:39:55 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6C01209;
        Mon,  6 Apr 2020 01:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129993;
        bh=EKxWTBf6NVlv/3/6WhJQSPKtVlxxqgpdlu7JzFIMtio=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WGV0bgwQOGaXKdIvG+/iZ97qZ2xs24v2ogUUQtYfHi1B5SbUcjbCoLkMiAAZrtPAO
         q5xJenYMyvHZsBGh5ExUlBDBHDUPeScROTuwTAbpwp5msK1cypa2Y0ug7pxqI7hS6V
         SmKOqIFqnM2/31PzMMqL5g3i7rBmDzF0k/zUj5aU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH/RFC 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML schema
Date:   Mon,  6 Apr 2020 02:39:34 +0300
Message-Id: <20200405233935.27599-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the reference to the DWC HDMI text DT binding with a reference
to the YAML equivalent.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index 4d6795690ac3..2ab96051ce4f 100644
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

