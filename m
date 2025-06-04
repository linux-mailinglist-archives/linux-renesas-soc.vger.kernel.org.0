Return-Path: <linux-renesas-soc+bounces-17847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A8ACE192
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D20387ADABE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAA819CCF5;
	Wed,  4 Jun 2025 15:29:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B692D18DF8D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050999; cv=none; b=XDpecaGFr0ld1Sp+NRlbe79pLt44E0Yt96uFL/zTiLwgG+bM6+sVHaCh2p26d1QjvfUZTFgfKTW4r3/cO/8yPvWWNMTjmncajEarL5aySBxIQJrEoVAHtTxoUpWj7FLDYAqtkwSxys+b5Gw7ngVtEiAlMCqwf3JoAB3nqD5so9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050999; c=relaxed/simple;
	bh=iuiwhLVhC2vCSVRvNTaQoq82de6Ka0bBjY5ZTNY0W+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbnwEV6onlNV9QEncypPqlQmg5+dOuW+/V9cnagWh/KfycXfXoaA8r+4W8hd24JtKva7VIG+OwSWqM6wWqd6fpK005z0NiRvQo60r3/5R5t1fx9LzoAIER0N/seT4uGvrZGScpRL+x0XsfJ6S3B8l6s2TQ2Qs/vF8Cv3mJvzQdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91739C4CEF0;
	Wed,  4 Jun 2025 15:29:58 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 3/6] dt-bindings: can: renesas,rcar-canfd: Document R-Car V3H2 support
Date: Wed,  4 Jun 2025 17:29:48 +0200
Message-ID: <2bba52107dd0396dce5f92db2c7741a5d9f26770.1749048734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749048734.git.geert+renesas@glider.be>
References: <cover.1749048734.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the CAN-FD Controller in the Renesas R-Car
V3H2 (R8A77980A) SoC, which is similar to CAN-FD on R-Car V3H, but
supports a third channel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As "renesas,r8a77980a-canfd" already uses "renesas,rcar-gen3-canfd" as a
fallback (which lets us use two channels with existing drivers), and the
driver doesn't have special handling for "renesas,r8a77980-canfd", I see
no need to complicate the bindings with "renesas,r8a77980-canfd" as a
second fallback like:

  - items:
      - const: renesas,r8a77980a-canfd # R-Car V3H2
      - const: renesas,r8a77980-canfd  # R-Car V3H
      - const: renesas,rcar-gen3-canfd # R-Car Gen3 and RZ/G2
---
 .../bindings/net/can/renesas,rcar-canfd.yaml   | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index f4ac21c684278b96..481b25d576f850c6 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -24,6 +24,7 @@ properties:
               - renesas,r8a77965-canfd     # R-Car M3-N
               - renesas,r8a77970-canfd     # R-Car V3M
               - renesas,r8a77980-canfd     # R-Car V3H
+              - renesas,r8a77980a-canfd    # R-Car V3H2
               - renesas,r8a77990-canfd     # R-Car E3
               - renesas,r8a77995-canfd     # R-Car D3
           - const: renesas,rcar-gen3-canfd # R-Car Gen3 and RZ/G2
@@ -242,12 +243,21 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - renesas,rcar-gen3-canfd
-              - renesas,rzg2l-canfd
+            const: renesas,r8a77980a-canfd
     then:
       patternProperties:
-        "^channel[2-7]$": false
+        "^channel[3-7]$": false
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,rcar-gen3-canfd
+                - renesas,rzg2l-canfd
+      then:
+        patternProperties:
+          "^channel[2-7]$": false
 
   - if:
       properties:
-- 
2.43.0


