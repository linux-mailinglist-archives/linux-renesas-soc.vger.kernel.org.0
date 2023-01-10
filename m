Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAED8663D67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 11:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjAJKAQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 05:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjAJKAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 05:00:15 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031004C70A;
        Tue, 10 Jan 2023 02:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673344814; x=1704880814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V3H2ZJBnsxc22GvVDNWTXTTyOhw3rwj0VZSOt1woFjk=;
  b=IJvJBOgEBa0zHcdcoZg8AfohJIVyicxJegPnvrzFCunVVWqW8vbyjIS0
   w3wdti3D1sQN4woqUwGvmM02NjCZEQ2Vs1Y7zDPc7wj53uVHqM4w8k8AZ
   KR9276y4CxqIHxfHTGxkEUlYExuJ1ozQPt4B2IM/EhWxb9oPuDgTUwZUK
   XPjhbTc6ri2V4d9M41cy4ejl5+xDdFUoNkCONCFEhmUmVNvoBUMFXqGBQ
   0sSswyswMWoqasgqtAuS2tDTxatb5ui99EBZhX3OWz5YbSdPflJgR9EZB
   PQVnbbXRL+HMNyeEBseu5fIsDAf2HZRiBgp/tJMukk8UUDupKbHaLREKe
   g==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324368"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 Jan 2023 11:00:09 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 10 Jan 2023 11:00:09 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 10 Jan 2023 11:00:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673344809; x=1704880809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V3H2ZJBnsxc22GvVDNWTXTTyOhw3rwj0VZSOt1woFjk=;
  b=hpyoCkeF5GstlNW90i7fy+NzyjJHg0Q/5H/9GHVdeld7mtq9Rpy/gX9E
   5SPKOnjio0CKBUrmflPVVdcYVUsxRYAxCXv2FFDgvg2TW62WK+AINv0Oi
   sFATsuy+1EcUVbu4WPpbp3EWjlS0KYupfN1wgHW5C9a6Z+y9AJI3RwwP4
   lhQRikLtHXCm3cioGx6ldH0YZtIqPMcv786I3yIT4vtwDKH6S2xPfGVw3
   XBLfrduCaHIIYaBFtAyrK4gxFbU7LDhkfrmMXIG0zrfBAOefux/760b0Q
   ySNOup5x62q93Ak8g+XJr0TESphdOxCSqdJhO3it/xX6JB8YUSN67FDcy
   A==;
X-IronPort-AV: E=Sophos;i="5.96,314,1665439200"; 
   d="scan'208";a="28324366"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2023 11:00:09 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4920F280072;
        Tue, 10 Jan 2023 11:00:09 +0100 (CET)
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
Subject: [PATCH v2 2/4] dt-bindings: clk: rs9: Add 9FGV0441
Date:   Tue, 10 Jan 2023 11:00:01 +0100
Message-Id: <20230110100003.370917-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
* Add Krzysztof's A-b

 .../devicetree/bindings/clock/renesas,9series.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index 6b6cec3fba528..3afdebdb52ad4 100644
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

