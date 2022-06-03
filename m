Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3F353D3E5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jun 2022 01:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239755AbiFCXiR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 19:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiFCXiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 19:38:16 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50584286F3
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jun 2022 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=NxBY8v7mA+qITBYEQ8zfmIBRmVf
        9ZUKJsR+EyCn4CCw=; b=KlfJVvcWFsTKdweJg3DmXvg++G+Aej1mNNb2CUkN6oK
        /SQiMBscaDL2pQEoXdlRanvXWObitXQ96FLo3/hfA7nviw2TI5T9C02BsSLIQ1Ve
        bh3Gm9u6SzGnTsQlRjaVmKB1WpFDtjyusvA+eYoajaQCY7Qh1NsfIvkJkgyBWIDU
        =
Received: (qmail 1099163 invoked from network); 4 Jun 2022 01:38:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2022 01:38:13 +0200
X-UD-Smtp-Session: l3s3148p1@2EajnZPgxDRZzIm6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8 and generic Gen4 support
Date:   Sat,  4 Jun 2022 01:38:10 +0200
Message-Id: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 9ac4986988c5..b46a90eb2063 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -61,6 +61,10 @@ properties:
               - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
               - renesas,sdhi-r9a07g054 # RZ/V2L
           - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
+      - items:
+          - enum:
+              - renesas,sdhi-r8a779f0  # R-Car S4-8
+          - const: renesas,rcar-gen4-sdhi # R-Car Gen4
 
   reg:
     maxItems: 1
-- 
2.35.1

