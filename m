Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1B4318D79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 15:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhBKOex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 09:34:53 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:40597 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbhBKOck (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 09:32:40 -0500
X-Halon-ID: d759eb02-6c75-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id d759eb02-6c75-11eb-a542-005056917a89;
        Thu, 11 Feb 2021 15:31:47 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Document missing Gen3 SoCs
Date:   Thu, 11 Feb 2021 15:31:02 +0100
Message-Id: <20210211143102.350719-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add missing bindings for Gen3 SoCs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index c54188731a1bd7c1..f0f0f121c355b159 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -28,8 +28,14 @@ properties:
           - renesas,tmu-r8a774e1 # RZ/G2H
           - renesas,tmu-r8a7778  # R-Car M1A
           - renesas,tmu-r8a7779  # R-Car H1
+          - renesas,tmu-r8a7795  # R-Car H3
+          - renesas,tmu-r8a7796  # R-Car M3-W
+          - renesas,tmu-r8a77961 # R-Car M3-W+
+          - renesas,tmu-r8a77965 # R-Car M3-N
           - renesas,tmu-r8a77970 # R-Car V3M
           - renesas,tmu-r8a77980 # R-Car V3H
+          - renesas,tmu-r8a77990 # R-Car E3
+          - renesas,tmu-r8a77995 # R-Car D3
       - const: renesas,tmu
 
   reg:
-- 
2.30.0

