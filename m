Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5066414458
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 10:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhIVJAK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 05:00:10 -0400
Received: from www.zeus03.de ([194.117.254.33]:53410 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234097AbhIVJAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 05:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=osqkEL04gXUl8YRqyvybu9tCRfM
        382bMRBjSuF/SsqA=; b=3+X3n8SPMDon+7XqQ1f9lzyDPI3bynZaP0AImlqIcLc
        LgJyitM9jCgtWCGCaSCgID+zDqxN1i8BC8W1nIOkxCavHa8U2KSFtj3Gzt1Z9RWj
        eQCpbLvkZJJ+eLFJ3BZEbtYmNJdrV6yYSR+krzDaIixpG71AYtjCc3E92YEg3Pyg
        =
Received: (qmail 3167013 invoked from network); 22 Sep 2021 10:58:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2021 10:58:38 +0200
X-UD-Smtp-Session: l3s3148p1@yUgTuJHMWKcgAwDPXwr6APB8KsyQBt5d
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: rpc: renesas-rpc-if: Add support for the R8A779A0 RPC-IF
Date:   Wed, 22 Sep 2021 10:58:31 +0200
Message-Id: <20210922085831.5375-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 990489fdd2ac..b15992ad3613 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -33,6 +33,7 @@ properties:
           - renesas,r8a77970-rpc-if       # R-Car V3M
           - renesas,r8a77980-rpc-if       # R-Car V3H
           - renesas,r8a77995-rpc-if       # R-Car D3
+          - renesas,r8a779a0-rpc-if       # R-Car V3U
       - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2 device
 
   reg:
-- 
2.30.2

