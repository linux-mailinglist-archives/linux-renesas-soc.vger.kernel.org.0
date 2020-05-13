Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D861D232D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 01:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732707AbgEMXjV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 19:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732523AbgEMXjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 19:39:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE01C061A0C;
        Wed, 13 May 2020 16:39:20 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5B051F;
        Thu, 14 May 2020 01:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589413159;
        bh=Y4DkRn61MRzCqseOA2AvGHrf6l1DWCHhlqOe6q7877g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u6BcbwgkG7abAaZe/WM+2u7yklF6pmVqsjvc9eyIHnljCV9Z8bOsxcS8Ybj2/ANZw
         2zNaHzj0v4GPH2kfSS59VIoDsOywMbSHOFLrdLX5kEadzpxUeJTSjZYiureiTYUOUH
         ON7S/vucRTrFNupM1oG75K3wK1QazlDsgqKhIko4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion too
Date:   Thu, 14 May 2020 02:39:08 +0300
Message-Id: <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document RZ/G2E support for property renesas,companion.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes compared to RFC:

- Rebased on top of YAML conversion
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index 33c06630a2dd..1045f0e33f2c 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -81,9 +81,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the companion LVDS encoder. This property is mandatory
-      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-      the second encoder to be used as a companion in dual-link mode. It
-      shall not be set for any other LVDS encoder.
+      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
+      point to the second encoder to be used as a companion in dual-link mode.
+      It shall not be set for any other LVDS encoder.
 
 required:
   - compatible
-- 
Regards,

Laurent Pinchart

