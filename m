Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0984C44C8C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhKJTTR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:55050 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232831AbhKJTTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=vfBKx2aAd0E1y2
        US/LygY9r+sBEYKlzcy7sO5zf5Flo=; b=0/25ZpLOALa/XqqhaCIZpB8tsa3bPa
        YkMdwTifbXLECvMtO7qTAYKL5NDbgflqnfxn4IUHNzjcF53q+82kwOc9ClkIlpU0
        k3wt5tfuaD6RSn9yi8Whd9tSiqIoz9MYoMu7QCwEREPYWwa9OmUd4H3YW0DKI4op
        BwRfVlNRs4RWo=
Received: (qmail 722514 invoked from network); 10 Nov 2021 20:16:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:21 +0100
X-UD-Smtp-Session: l3s3148p1@D8+uD3TQ3JogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 07/21] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
Date:   Wed, 10 Nov 2021 20:15:56 +0100
Message-Id: <20211110191610.5664-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since RFC v1:
* use 'oneOf' for the clock-names

 .../devicetree/bindings/mmc/renesas,sdhi.yaml    | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 9f1e7092cf44..190a58ae77b5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -132,12 +132,20 @@ allOf:
       properties:
         clocks:
           minItems: 1
-          maxItems: 2
+          maxItems: 3
         clock-names:
-          minItems: 1
-          items:
+          oneOf:
             - const: core
-            - const: cd
+            - items:
+                - const: core
+                - const: cd
+            - items:
+                - const: core
+                - const: clkh
+            - items:
+                - const: core
+                - const: clkh
+                - const: cd
 
   - if:
       properties:
-- 
2.30.2

