Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF41CDF22
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfJGKXo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:46892 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfJGKXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:44 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id AaPh2100G05gfCL01aPhT6; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00086o-BM; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003Bz-9T; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 04/19] dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
Date:   Mon,  7 Oct 2019 12:23:17 +0200
Message-Id: <20191007102332.12196-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007102332.12196-1-geert+renesas@glider.be>
References: <20191007102332.12196-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for the Pin Function Controller in the
Renesas R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index c1b9eb4c8696d547..fd7034e55e3912f4 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -29,6 +29,7 @@ Required Properties:
     - "renesas,pfc-r8a7794": for R8A7794 (R-Car E2) compatible pin-controller.
     - "renesas,pfc-r8a7795": for R8A7795 (R-Car H3) compatible pin-controller.
     - "renesas,pfc-r8a7796": for R8A7796 (R-Car M3-W) compatible pin-controller.
+    - "renesas,pfc-r8a77961": for R8A77961 (R-Car M3-W+) compatible pin-controller.
     - "renesas,pfc-r8a77965": for R8A77965 (R-Car M3-N) compatible pin-controller.
     - "renesas,pfc-r8a77970": for R8A77970 (R-Car V3M) compatible pin-controller.
     - "renesas,pfc-r8a77980": for R8A77980 (R-Car V3H) compatible pin-controller.
-- 
2.17.1

