Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60E31937B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 06:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgCZF1A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 01:27:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:46738 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726270AbgCZF1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:27:00 -0400
X-IronPort-AV: E=Sophos;i="5.72,307,1580742000"; 
   d="scan'208";a="42883077"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Mar 2020 14:26:58 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8DB614009674;
        Thu, 26 Mar 2020 14:26:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/3] dt-bindings: usb: renesas,usbhs: add r8a77961 support
Date:   Thu, 26 Mar 2020 14:26:49 +0900
Message-Id: <1585200410-28841-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585200410-28841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 469affa..a7ae955 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -40,6 +40,7 @@ properties:
               - renesas,usbhs-r8a774c0 # RZ/G2E
               - renesas,usbhs-r8a7795  # R-Car H3
               - renesas,usbhs-r8a7796  # R-Car M3-W
+              - renesas,usbhs-r8a77961 # R-Car M3-W+
               - renesas,usbhs-r8a77965 # R-Car M3-N
               - renesas,usbhs-r8a77990 # R-Car E3
               - renesas,usbhs-r8a77995 # R-Car D3
-- 
2.7.4

