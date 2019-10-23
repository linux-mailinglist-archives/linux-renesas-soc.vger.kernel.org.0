Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3261CE1A11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391317AbfJWM3r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:47 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:39176 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391315AbfJWM3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:46 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id H0Vl2100V05gfCL010VlWv; Wed, 23 Oct 2019 14:29:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0000eP-Qu; Wed, 23 Oct 2019 14:29:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0003Dw-Pv; Wed, 23 Oct 2019 14:29:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:38 +0200
Message-Id: <20191023122941.12342-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122941.12342-1-geert+renesas@glider.be>
References: <20191023122941.12342-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for the Clock Pulse Generator / Module
Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
SoC.

Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by,
  - Update R-Car M3-W references.
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt    | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index b5edebeb12b40638..d67f57e0dfd22fbe 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -27,7 +27,8 @@ Required Properties:
       - "renesas,r8a7793-cpg-mssr" for the r8a7793 SoC (R-Car M2-N)
       - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
-      - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
+      - "renesas,r8a7796-cpg-mssr" for the r8a77960 SoC (R-Car M3-W)
+      - "renesas,r8a77961-cpg-mssr" for the r8a77961 SoC (R-Car M3-W+)
       - "renesas,r8a77965-cpg-mssr" for the r8a77965 SoC (R-Car M3-N)
       - "renesas,r8a77970-cpg-mssr" for the r8a77970 SoC (R-Car V3M)
       - "renesas,r8a77980-cpg-mssr" for the r8a77980 SoC (R-Car V3H)
@@ -42,10 +43,10 @@ Required Properties:
   - clock-names: List of external parent clock names. Valid names are:
       - "extal" (r7s9210, r8a7743, r8a7744, r8a7745, r8a77470, r8a774a1,
 		 r8a774b1, r8a774c0, r8a7790, r8a7791, r8a7792, r8a7793,
-		 r8a7794, r8a7795, r8a7796, r8a77965, r8a77970, r8a77980,
-		 r8a77990, r8a77995)
-      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77965, r8a77970,
-		  r8a77980)
+		 r8a7794, r8a7795, r8a77960, r8a77961, r8a77965, r8a77970,
+		 r8a77980, r8a77990, r8a77995)
+      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a77960, r8a77961, r8a77965,
+		  r8a77970, r8a77980)
       - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
 		     r8a7793, r8a7794)
 
-- 
2.17.1

