Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A15CDF2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfJGKXq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:46 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:54796 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id AaPh2100C05gfCL01aPh2J; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00086k-9j; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003Bw-7u; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 03/19] dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
Date:   Mon,  7 Oct 2019 12:23:16 +0200
Message-Id: <20191007102332.12196-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for the Clock Pulse Generator / Module
Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index b5edebeb12b40638..b9b0927b7c780699 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -28,6 +28,7 @@ Required Properties:
       - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
       - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
       - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
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
+		 r8a7794, r8a7795, r8a7796, r8a77961, r8a77965, r8a77970,
+		 r8a77980, r8a77990, r8a77995)
+      - "extalr" (r8a774a1, r8a774b1, r8a7795, r8a7796, r8a77961, r8a77965,
+		  r8a77970, r8a77980)
       - "usb_extal" (r8a7743, r8a7744, r8a7745, r8a77470, r8a7790, r8a7791,
 		     r8a7793, r8a7794)
 
-- 
2.17.1

