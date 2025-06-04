Return-Path: <linux-renesas-soc+bounces-17845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E3ACE191
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 592257ADA97
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B509D1DB34B;
	Wed,  4 Jun 2025 15:29:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73518DF8D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050997; cv=none; b=GmlNBBbbF6Bqjtp6v44ItCSXbYHz2Fo9eCrTmpkq7D5LO5E4gMjbBvuhLDRBUDgg8XdKUM7S6J5fezUsp27syDiIJR7kw249fl1sBlb1r1QyYj98z0uOc/ilakzUrqKqTnKNbKfQoXn6C6tM2e6hkV1amJxA7g5uSTl5eA/vz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050997; c=relaxed/simple;
	bh=BcMxLJzDop7Ar6MPED708Ksib48OzCA8grFddTpbm0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJjxEKW2Uj2v2AZBR1Z6RjtA+9ywnrkcvTnZbmoP+jKJ/2LdIO7J2y2AoYnIiXNOlUWD/bqwpj9rhysDJ7hAzx414BznLoy0lNjRVAPI/gze1QrnQKDU/kC0M4ZUv6lNggyCUINgAfjuD5B7FB6HKszps378JKGySWlMkT1I/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C5AC4CEE4;
	Wed,  4 Jun 2025 15:29:56 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 1/6] dt-bindings: pinctrl: renesas: Document R-Car V3H2 support
Date: Wed,  4 Jun 2025 17:29:46 +0200
Message-ID: <cb646f9492166608bea3a58b257f3b4ade4e21ae.1749048734.git.geert+renesas@glider.be>
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

Document support for the Pin Function Controller in the Renesas R-Car
V3H2 (R8A77980A) SoC, which is an extension of the PFC in R-Car V3H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/pinctrl/renesas,pfc.yaml         | 72 ++++++++++---------
 1 file changed, 38 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index cfe004573366127c..de5de568887d563f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -15,40 +15,44 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,pfc-emev2       # EMMA Mobile EV2
-      - renesas,pfc-r8a73a4     # R-Mobile APE6
-      - renesas,pfc-r8a7740     # R-Mobile A1
-      - renesas,pfc-r8a7742     # RZ/G1H
-      - renesas,pfc-r8a7743     # RZ/G1M
-      - renesas,pfc-r8a7744     # RZ/G1N
-      - renesas,pfc-r8a7745     # RZ/G1E
-      - renesas,pfc-r8a77470    # RZ/G1C
-      - renesas,pfc-r8a774a1    # RZ/G2M
-      - renesas,pfc-r8a774a3    # RZ/G2M v3.0
-      - renesas,pfc-r8a774b1    # RZ/G2N
-      - renesas,pfc-r8a774c0    # RZ/G2E
-      - renesas,pfc-r8a774e1    # RZ/G2H
-      - renesas,pfc-r8a7778     # R-Car M1
-      - renesas,pfc-r8a7779     # R-Car H1
-      - renesas,pfc-r8a7790     # R-Car H2
-      - renesas,pfc-r8a7791     # R-Car M2-W
-      - renesas,pfc-r8a7792     # R-Car V2H
-      - renesas,pfc-r8a7793     # R-Car M2-N
-      - renesas,pfc-r8a7794     # R-Car E2
-      - renesas,pfc-r8a7795     # R-Car H3
-      - renesas,pfc-r8a7796     # R-Car M3-W
-      - renesas,pfc-r8a77961    # R-Car M3-W+
-      - renesas,pfc-r8a77965    # R-Car M3-N
-      - renesas,pfc-r8a77970    # R-Car V3M
-      - renesas,pfc-r8a77980    # R-Car V3H
-      - renesas,pfc-r8a77990    # R-Car E3
-      - renesas,pfc-r8a77995    # R-Car D3
-      - renesas,pfc-r8a779a0    # R-Car V3U
-      - renesas,pfc-r8a779f0    # R-Car S4-8
-      - renesas,pfc-r8a779g0    # R-Car V4H
-      - renesas,pfc-r8a779h0    # R-Car V4M
-      - renesas,pfc-sh73a0      # SH-Mobile AG5
+    oneOf:
+      - enum:
+          - renesas,pfc-emev2       # EMMA Mobile EV2
+          - renesas,pfc-r8a73a4     # R-Mobile APE6
+          - renesas,pfc-r8a7740     # R-Mobile A1
+          - renesas,pfc-r8a7742     # RZ/G1H
+          - renesas,pfc-r8a7743     # RZ/G1M
+          - renesas,pfc-r8a7744     # RZ/G1N
+          - renesas,pfc-r8a7745     # RZ/G1E
+          - renesas,pfc-r8a77470    # RZ/G1C
+          - renesas,pfc-r8a774a1    # RZ/G2M
+          - renesas,pfc-r8a774a3    # RZ/G2M v3.0
+          - renesas,pfc-r8a774b1    # RZ/G2N
+          - renesas,pfc-r8a774c0    # RZ/G2E
+          - renesas,pfc-r8a774e1    # RZ/G2H
+          - renesas,pfc-r8a7778     # R-Car M1
+          - renesas,pfc-r8a7779     # R-Car H1
+          - renesas,pfc-r8a7790     # R-Car H2
+          - renesas,pfc-r8a7791     # R-Car M2-W
+          - renesas,pfc-r8a7792     # R-Car V2H
+          - renesas,pfc-r8a7793     # R-Car M2-N
+          - renesas,pfc-r8a7794     # R-Car E2
+          - renesas,pfc-r8a7795     # R-Car H3
+          - renesas,pfc-r8a7796     # R-Car M3-W
+          - renesas,pfc-r8a77961    # R-Car M3-W+
+          - renesas,pfc-r8a77965    # R-Car M3-N
+          - renesas,pfc-r8a77970    # R-Car V3M
+          - renesas,pfc-r8a77980    # R-Car V3H
+          - renesas,pfc-r8a77990    # R-Car E3
+          - renesas,pfc-r8a77995    # R-Car D3
+          - renesas,pfc-r8a779a0    # R-Car V3U
+          - renesas,pfc-r8a779f0    # R-Car S4-8
+          - renesas,pfc-r8a779g0    # R-Car V4H
+          - renesas,pfc-r8a779h0    # R-Car V4M
+          - renesas,pfc-sh73a0      # SH-Mobile AG5
+      - items:
+          - const: renesas,pfc-r8a77980a # R-Car V3H2
+          - const: renesas,pfc-r8a77980  # Fallback
 
   reg:
     minItems: 1
-- 
2.43.0


