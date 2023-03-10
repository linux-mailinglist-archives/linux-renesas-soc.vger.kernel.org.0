Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFDE56B37DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 08:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCJHzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 02:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCJHzy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 02:55:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D147DDF15;
        Thu,  9 Mar 2023 23:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434954; x=1709970954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sk2ehzY5SqSGQmIsWqiG2UQo6TQemqH+4nJ10PBQLLg=;
  b=RbuYuPoGevGdmBDWSCz09819SW1EluaWWnpSrETGNKjl+iPb2MbnB1JM
   7N/SRMj1DCpWv4flgAHCduowKV6J2TmT9+FNuzCCPsZF1Z9PD1Rb1aBfp
   SgAmMWW/iBS5BmEV/m/ulfWTmb/cvLgZ5ZZmnZmp/z5sGHxwTWrbXX8jM
   lrWUODlKxPzHHloA+P66SZEbg0tKH2ba5evQ5McpUiNy8+mP3qVDo4OoY
   M62q1FPPdUoHQAboZ/vw3ZheAyRxEFWlsebIzuN+wp7DTzsN9bUg5Dmrq
   Pq/h9HkkIVHrQn+WPrK9jZ9PEoQjVqTBiQ3TfOT6xOnKeP43SkUhp4dR5
   A==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597124"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 10 Mar 2023 08:55:44 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 10 Mar 2023 08:55:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678434944; x=1709970944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sk2ehzY5SqSGQmIsWqiG2UQo6TQemqH+4nJ10PBQLLg=;
  b=npedJpPzWELeShKmf9yn3Vk3Rc51F6SnKiREkYjCc8PJEGRucFGbtUyQ
   HDHa28w3iohwb+YHGzdv+YRrgMG3flzhorquhukQZgTYxlv6v0C9Mwxi0
   6wOZfDfLcazg0fnOdt6Oe5kTzjUF+QUz0OCDwuwlb8MG7da7ZOYzNTMui
   zPGtxvEukmavqXR4x87qT6f7UVcBRF0iTxlWTVPuaHcYPiGLXvGSpgd18
   4RZoRWcfvk2cJubTpbPrlWkMs4+5iHg8ZeGQTm/PUC/GCNjGB6Ma/0gFv
   yh8TZHCQtRUTVOsE5nPTwiB408DaJJo6Z1y07bi0V11ku+dAsfhPcqqhF
   g==;
X-IronPort-AV: E=Sophos;i="5.98,249,1673910000"; 
   d="scan'208";a="29597122"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Mar 2023 08:55:44 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 98A77280072;
        Fri, 10 Mar 2023 08:55:43 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: clk: rs9: Add 9FGV0441
Date:   Fri, 10 Mar 2023 08:55:33 +0100
Message-Id: <20230310075535.3476580-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
References: <20230310075535.3476580-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is a 4-channel variant of 9FGV series.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
---
Changes in v3:
* Added Marek's R-b

 .../devicetree/bindings/clock/renesas,9series.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index 6b6cec3fba52..3afdebdb52ad 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -16,6 +16,11 @@ description: |
   - 9FGV0241:
     0 -- DIF0
     1 -- DIF1
+  - 9FGV0441:
+    0 -- DIF0
+    1 -- DIF1
+    2 -- DIF2
+    3 -- DIF3
 
 maintainers:
   - Marek Vasut <marex@denx.de>
@@ -24,6 +29,7 @@ properties:
   compatible:
     enum:
       - renesas,9fgv0241
+      - renesas,9fgv0441
 
   reg:
     description: I2C device address
-- 
2.34.1

