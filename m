Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644DB30FA55
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237753AbhBDRy0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237901AbhBDRxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:53:02 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93394C0617A7
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id R5qf240054C55Sk065qfy2; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-Si; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5F-006vvs-UO; Thu, 04 Feb 2021 14:54:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/6] dt-bindings: power: renesas,apmu: Document R-Mobile APE6 support
Date:   Thu,  4 Feb 2021 14:54:05 +0100
Message-Id: <20210204135409.1652604-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Mobile APE6 has an Advanced Power Management Unit (APMU) similar to
R-Car Gen2 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/power/renesas,apmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
index 391897d897f241c9..a4717b6561782443 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
@@ -11,13 +11,15 @@ maintainers:
   - Magnus Damm <magnus.damm@gmail.com>
 
 description:
-  Renesas R-Car Gen2 and RZ/G1 SoCs utilize one or more APMU hardware units for
-  CPU core power domain control including SMP boot and CPU Hotplug.
+  Renesas R-Mobile APE6, R-Car Gen2, and RZ/G1 SoCs utilize one or more APMU
+  hardware units for CPU core power domain control including SMP boot and CPU
+  Hotplug.
 
 properties:
   compatible:
     items:
       - enum:
+          - renesas,r8a73a4-apmu  # R-Mobile APE6
           - renesas,r8a7742-apmu  # RZ/G1H
           - renesas,r8a7743-apmu  # RZ/G1M
           - renesas,r8a7744-apmu  # RZ/G1N
-- 
2.25.1

