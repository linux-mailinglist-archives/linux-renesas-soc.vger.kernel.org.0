Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294BD2926F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Oct 2020 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgJSMGV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgJSMGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 08:06:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509D3C0613CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ho6G2300H4C55Sk01o6GfZ; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WR-ME; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005mG-LL; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/6] dt-bindings: gpio: rcar: Add r8a779a0 support
Date:   Mon, 19 Oct 2020 14:06:12 +0200
Message-Id: <20201019120614.22149-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019120614.22149-1-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the compatible value for the GPIO block in the Renesas R-Car
V3U (R8A779A0) SoC.

While this GPIO block is mostly compatible with GPIO blocks on R-Car
Gen3 SoCs, there are small differences, and one of the new registers
needs to be configured differently from its initial reset state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested on actual hardware.
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e45081b6c..f2541739ee3b9f7c 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -48,6 +48,9 @@ properties:
               - renesas,gpio-r8a77995     # R-Car D3
           - const: renesas,rcar-gen3-gpio # R-Car Gen3 or RZ/G2
 
+      - items:
+          - const: renesas,gpio-r8a779a0  # R-Car V3U
+
   reg:
     maxItems: 1
 
-- 
2.17.1

