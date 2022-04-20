Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BE75083B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376866AbiDTIpq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376853AbiDTIpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:44 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB6C73B2AF;
        Wed, 20 Apr 2022 01:42:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="117435974"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:58 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EB56B40062B6;
        Wed, 20 Apr 2022 17:42:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 02/15] dt-bindings: arm: renesas: Document Renesas White Hawk boards
Date:   Wed, 20 Apr 2022 17:42:42 +0900
Message-Id: <20220420084255.375700-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for Renesas R-Car V4H
White Hawk CPU and BreakOut boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index bbb7c63ce2a8..5408b154d05e 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -329,6 +329,14 @@ properties:
 
       - description: R-Car V4H (R8A779G0)
         items:
+          - enum:
+              - renesas,white-hawk-cpu # White Hawk CPU board (RTP8A779G0ASKB0FC0SA000)
+          - const: renesas,r8a779g0
+
+      - items:
+          - enum:
+              - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
+          - const: renesas,white-hawk-cpu
           - const: renesas,r8a779g0
 
       - description: R-Car H3e (R8A779M0)
-- 
2.25.1

