Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A46D65BFE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237499AbjACMcG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237470AbjACMcF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:32:05 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA31FCEF;
        Tue,  3 Jan 2023 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749124; x=1704285124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdPaOVPnLgL5NwMn1GVjCRwEM7WNii8G6Mh4x2uDZnw=;
  b=IJ6huV+irbtJQ1BKOCtAURfhORM/x0spQ9Ec4lt5b7yG779X1AuKYW9v
   kQYEMgC+4jB2XLkzxhgMGLUbt968SBHPEEl8N5lSB5ZqxM2co7JUxFPEY
   keGwMR9rFIjkj4CwfJ/UGJVt5Rzjk7/ZKk7Jho01shmN5Wf/6qphOURL0
   MXyNFVOUZuE10/7VTJuL3126Lq0R8d1lfDqLZM3KR42YVev7uY5myf1cy
   LCLy9nLsvktF/+rE1RBT6D+Tg1RZh+zZx2NWhiG6r/rngIlB8v6jaUFFs
   gxHXWQ7UpeSrkC/dfom9zKxkUW5fw6W2dF9sFAhYZLMwd9ENXlcnR2QmO
   w==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221131"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 03 Jan 2023 13:31:59 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 03 Jan 2023 13:31:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1672749119; x=1704285119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdPaOVPnLgL5NwMn1GVjCRwEM7WNii8G6Mh4x2uDZnw=;
  b=YvmPLs04MElThT5uq72BdtpxqjJGw8GHDBoUi6IPwIRVuRN0t8IxtCyA
   V/En/BwFGahcUaeaYLksZKZzedzvd6W71yUBOhtaU+nmxsiGMlTpmpuqz
   7laWG7txHHWox2GMQHUAQCGzJ4bf4OLU8Obrvdw/HSpJKU/sVPVkMfSCU
   6oRVynqSI7fQSzAOdW+kC/5xlt8A+RgkfHXYCXC+EOgzrL5R/bzZ1LDdF
   /7bEA9wOaS0ec4ysrFdu5d2929onDkLrp0RGddrQhepwyN6AcBk3qn42M
   YA8xB5inbEtK7r3jo2t2K0VFy3CG+dGWHY+yyqcgyBY8yv0FLVKdOcscN
   g==;
X-IronPort-AV: E=Sophos;i="5.96,296,1665439200"; 
   d="scan'208";a="28221130"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Jan 2023 13:31:59 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 116BD280072;
        Tue,  3 Jan 2023 13:31:59 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marex@denx.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: clk: rs9: Add bindings for 9FGV0441
Date:   Tue,  3 Jan 2023 13:31:52 +0100
Message-Id: <20230103123154.3424817-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is a 4-channel variant of 9FGV series.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
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

