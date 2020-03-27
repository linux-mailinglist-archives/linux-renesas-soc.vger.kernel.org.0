Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08619540C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2020 10:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0JeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Mar 2020 05:34:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:25118 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726465AbgC0JeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 05:34:07 -0400
X-IronPort-AV: E=Sophos;i="5.72,311,1580742000"; 
   d="scan'208";a="42803710"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Mar 2020 18:34:05 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2EBD6420E964;
        Fri, 27 Mar 2020 18:34:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 2/4] dt-bindings: phy: renesas: usb2-phy: add r8a77961 support
Date:   Fri, 27 Mar 2020 18:33:54 +0900
Message-Id: <1585301636-24399-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585301636-24399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 7681e47..440f09f 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - renesas,usb2-phy-r8a774c0 # RZ/G2E
               - renesas,usb2-phy-r8a7795  # R-Car H3
               - renesas,usb2-phy-r8a7796  # R-Car M3-W
+              - renesas,usb2-phy-r8a77961 # R-Car M3-W+
               - renesas,usb2-phy-r8a77965 # R-Car M3-N
               - renesas,usb2-phy-r8a77990 # R-Car E3
               - renesas,usb2-phy-r8a77995 # R-Car D3
-- 
2.7.4

