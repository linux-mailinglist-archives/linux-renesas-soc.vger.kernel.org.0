Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253BED9523
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 17:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387766AbfJPPLM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 11:11:12 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59336 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfJPPLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 11:11:12 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id EFBA2100s05gfCL01FBA7l; Wed, 16 Oct 2019 17:11:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkxC-0003wR-P5; Wed, 16 Oct 2019 17:11:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkxC-00080e-NU; Wed, 16 Oct 2019 17:11:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <roscaeugeniu@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: arm: renesas: Add R-Car M3-N ULCB with Kingfisher
Date:   Wed, 16 Oct 2019 17:11:09 +0200
Message-Id: <20191016151109.30747-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the use of the Kingfisher expansion board with the R-Car
Starter Kit Pro equipped with an R-Car M3-N SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
make ARCH=arm dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas.yaml

arch/arm64/boot/dts/renesas/r8a77965-m3nulcb-kf.dt.yaml: compatible: ['shimafuji,kingfisher', 'renesas,m3nulcb', 'renesas,r8a77965'] is not valid under any of the given schemas
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 99b290ca418a8a92..9436124c58090860 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -217,9 +217,11 @@ properties:
           - enum:
               - renesas,h3ulcb
               - renesas,m3ulcb
+              - renesas,m3nulcb
           - enum:
               - renesas,r8a7795
               - renesas,r8a7796
+              - renesas,r8a77965
 
       - description: R-Car M3-N (R8A77965)
         items:
-- 
2.17.1

