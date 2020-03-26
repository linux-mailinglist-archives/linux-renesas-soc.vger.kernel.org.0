Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A0E1937C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 06:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbgCZF3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 01:29:35 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:32256 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727560AbgCZF3a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:29:30 -0400
X-IronPort-AV: E=Sophos;i="5.72,307,1580742000"; 
   d="scan'208";a="42669331"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Mar 2020 14:29:27 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8D73F40083FB;
        Thu, 26 Mar 2020 14:29:27 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/4] dt-bindings: phy: renesas: usb3-phy: add r8a77961 support
Date:   Thu, 26 Mar 2020 14:29:19 +0900
Message-Id: <1585200559-30033-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585200559-30033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
index dcd1cd5..d5defac 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
@@ -17,6 +17,7 @@ properties:
           - renesas,r8a774b1-usb3-phy # RZ/G2N
           - renesas,r8a7795-usb3-phy  # R-Car H3
           - renesas,r8a7796-usb3-phy  # R-Car M3-W
+          - renesas,r8a77961-usb3-phy # R-Car M3-W+
           - renesas,r8a77965-usb3-phy # R-Car M3-N
       - const: renesas,rcar-gen3-usb3-phy
 
-- 
2.7.4

