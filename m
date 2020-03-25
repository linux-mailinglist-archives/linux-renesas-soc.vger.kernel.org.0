Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB4A192102
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 07:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgCYGUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 02:20:09 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15098 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbgCYGUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 02:20:09 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42571770"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Mar 2020 15:20:08 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 525E841AF7E6;
        Wed, 25 Mar 2020 15:20:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: clock: renesas,rcar-usb2-clock-sel: add r8a77961 support
Date:   Wed, 25 Mar 2020 15:20:04 +0900
Message-Id: <1585117204-8469-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index 4bf6f53..cf9221e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -28,6 +28,8 @@ Required properties:
 	      an R8A7795 SoC.
 	      "renesas,r8a7796-rcar-usb2-clock-sel" if the device if a part of
 	      an R8A7796 SoC.
+	      "renesas,r8a77961-rcar-usb2-clock-sel" if the device if a part of
+	      an R8A77961 SoC.
 	      "renesas,rcar-gen3-usb2-clock-sel" for a generic R-Car Gen3
 	      compatible device.
 
-- 
2.7.4

