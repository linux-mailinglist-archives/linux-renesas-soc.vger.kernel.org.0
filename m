Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4625516FB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 14:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiEBMod (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 08:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384839AbiEBMoc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 08:44:32 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF34313E14
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 May 2022 05:41:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:194e:5782:c420:7f87])
        by andre.telenet-ops.be with bizsmtp
        id Roh02700U28fWK501oh0CL; Mon, 02 May 2022 14:41:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlVMK-002mij-Bi; Mon, 02 May 2022 14:41:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlVMJ-002hs5-9R; Mon, 02 May 2022 14:40:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: soc: renesas: Move renesas,prr from arm to soc
Date:   Mon,  2 May 2022 14:40:57 +0200
Message-Id: <5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas Product Register DT binding is not a top-level DT binding,
hence it does not belong under Documentation/devicetree/bindings/arm/.
Move it to Documentation/devicetree/bindings/soc/renesas/.

While at it, change the license from GPL-2.0 (only) to GPL-2.0-only OR
BSD-2-Clause, to match comment practises.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.19.

 .../devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml (85%)

diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,prr.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/arm/renesas,prr.yaml
rename to Documentation/devicetree/bindings/soc/renesas/renesas,prr.yaml
index 1f80767da38ba77a..654c96638e754276 100644
--- a/Documentation/devicetree/bindings/arm/renesas,prr.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,prr.yaml
@@ -1,7 +1,7 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
+$id: http://devicetree.org/schemas/soc/renesas/renesas,prr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas Product Register
-- 
2.25.1

