Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB75D542C90
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 12:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbiFHKGU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 06:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbiFHKFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 06:05:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DED19592E
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=W4SwFQDUXTB8fPguP8ZWXaS/Ql0
        Js9OqnkQ+wPSETy4=; b=ZMAmN6UPjpG3qlfs7aQvimtHtzcxJi/FVSNsAixQdyu
        neFE5wGo79bS8tFCE1PHHpzdqNsiqi6qZWp+ZumBJCORh/ojmPY4LYEIrGIuS+bB
        wavQ2ZZpXq9nP/6VQCEGf/xOzbMV96n6jGt9riXbZnqdReRMs6D14TG/FV4T0sGY
        =
Received: (qmail 2846080 invoked from network); 8 Jun 2022 11:48:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2022 11:48:38 +0200
X-UD-Smtp-Session: l3s3148p1@rnoJnOzgLhlZD+1N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: R-Car V3U is R-Car Gen4
Date:   Wed,  8 Jun 2022 11:48:31 +0200
Message-Id: <20220608094831.8242-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family.  Hence move its compatible value to the R-Car Gen4 section.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Depends on "[PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8
and generic Gen4 support" which is already in mmc/next.

 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index b46a90eb2063..d5b29728704b 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -56,13 +56,13 @@ properties:
               - renesas,sdhi-r8a77980  # R-Car V3H
               - renesas,sdhi-r8a77990  # R-Car E3
               - renesas,sdhi-r8a77995  # R-Car D3
-              - renesas,sdhi-r8a779a0  # R-Car V3U
               - renesas,sdhi-r9a07g043 # RZ/G2UL
               - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
               - renesas,sdhi-r9a07g054 # RZ/V2L
           - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
       - items:
           - enum:
+              - renesas,sdhi-r8a779a0  # R-Car V3U
               - renesas,sdhi-r8a779f0  # R-Car S4-8
           - const: renesas,rcar-gen4-sdhi # R-Car Gen4
 
-- 
2.35.1

