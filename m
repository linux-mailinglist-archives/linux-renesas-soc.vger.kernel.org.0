Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8692336E7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhCKJJf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:09:35 -0500
Received: from www.zeus03.de ([194.117.254.33]:43208 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231871AbhCKJJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=L1ed2zomMI+TARiNMALoHPaEzVg
        e4cxTqlwifdh+5MA=; b=Rw1cAStDoJq9FfjXpQKhmmOSuFMtOG7dY88d1p6Whd7
        98T7jxkCFPNAhqN2td8gOxP28UEHueAx9YF6sQ5FiQ4NQwFkA4ECQCNz3RnaPJ6S
        F0s5LjuV5JgrgsY5MpkWQJ2dd9GGGSsIyAAExVpB9hZd6QsdCSUq80DdOLVJsCFQ
        =
Received: (qmail 4135014 invoked from network); 11 Mar 2021 10:09:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 10:09:26 +0100
X-UD-Smtp-Session: l3s3148p1@mJvdIz+9HswgARa4Rf6LAY0TkMkJSYgM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] dt-bindings: timer: renesas,cmt: add r8a779a0 CMT support
Date:   Thu, 11 Mar 2021 10:09:18 +0100
Message-Id: <20210311090918.2197-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V1:
* none, but additional testing was done which revealed that this CMT
  in deed behaves the same as other Gen3 SoCs. There was one hickup
  which seemed unique to V3U but has been reproduced with M3N meanwhile.
  This is something we need to tackle, but no reason to prevent adding
  V3U support.

 Documentation/devicetree/bindings/timer/renesas,cmt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
index 428db3a21bb9..363ec28e07da 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.yaml
@@ -79,6 +79,7 @@ properties:
               - renesas,r8a77980-cmt0     # 32-bit CMT0 on R-Car V3H
               - renesas,r8a77990-cmt0     # 32-bit CMT0 on R-Car E3
               - renesas,r8a77995-cmt0     # 32-bit CMT0 on R-Car D3
+              - renesas,r8a779a0-cmt0     # 32-bit CMT0 on R-Car V3U
           - const: renesas,rcar-gen3-cmt0 # 32-bit CMT0 on R-Car Gen3 and RZ/G2
 
       - items:
@@ -94,6 +95,7 @@ properties:
               - renesas,r8a77980-cmt1     # 48-bit CMT on R-Car V3H
               - renesas,r8a77990-cmt1     # 48-bit CMT on R-Car E3
               - renesas,r8a77995-cmt1     # 48-bit CMT on R-Car D3
+              - renesas,r8a779a0-cmt1     # 48-bit CMT on R-Car V3U
           - const: renesas,rcar-gen3-cmt1 # 48-bit CMT on R-Car Gen3 and RZ/G2
 
   reg:
-- 
2.30.0

