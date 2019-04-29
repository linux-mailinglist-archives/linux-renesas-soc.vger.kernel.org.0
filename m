Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB06DE08C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 12:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfD2KaB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 06:30:01 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:45250 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727560AbfD2KaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 06:30:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,409,1549897200"; 
   d="scan'208";a="14357472"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Apr 2019 19:29:59 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 12CB4401E4FA;
        Mon, 29 Apr 2019 19:29:56 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RESEND] dt-bindings: usb: renesas_usbhs: Add support for r8a77470
Date:   Mon, 29 Apr 2019 11:22:57 +0100
Message-Id: <1556533377-8116-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for RZ/G1C (R8A77470) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on usb-next.

 * Resending the patch to Greg and linux-usb@vger.kernel.org
 (Ref: https://patchwork.kernel.org/patch/10894125/)
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index d93b6a1..b8acc2a 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -6,6 +6,7 @@ Required properties:
 	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
 	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
 	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
+	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
 	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
 	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
-- 
2.7.4

