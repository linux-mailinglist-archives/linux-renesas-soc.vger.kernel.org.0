Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE91920F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 07:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbgCYGRK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 02:17:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34160 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726073AbgCYGRK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 02:17:10 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42571449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Mar 2020 15:17:07 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5C72F400C4C1;
        Wed, 25 Mar 2020 15:17:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] dt-bindings: usb: renesas,usb3-peri: add r8a77961 support
Date:   Wed, 25 Mar 2020 15:16:46 +0900
Message-Id: <1585117006-8266-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 92d8631..031452a 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,r8a774c0-usb3-peri # RZ/G2E
           - renesas,r8a7795-usb3-peri  # R-Car H3
           - renesas,r8a7796-usb3-peri  # R-Car M3-W
+          - renesas,r8a77961-usb3-peri # R-Car M3-W+
           - renesas,r8a77965-usb3-peri # R-Car M3-N
           - renesas,r8a77990-usb3-peri # R-Car E3
       - const: renesas,rcar-gen3-usb3-peri
-- 
2.7.4

