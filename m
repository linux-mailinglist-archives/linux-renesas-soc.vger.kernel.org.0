Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1697E1637
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Nov 2023 21:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjKEUIh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Nov 2023 15:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjKEUIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Nov 2023 15:08:36 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75172DD;
        Sun,  5 Nov 2023 12:08:33 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SNlsp009sz9smh;
        Sun,  5 Nov 2023 21:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EDD6lR1/aN0jSTjcpIJ2Ol25YYZAKhXKuuE0WkDZ1r8=;
        b=cGY3VnztQYTzxiZeHjuLoPlBThP5AfuVIOOd4s8W0NFmUBp1OrxqniMqrewsc5aZIoSEph
        25mF2eyBHq1RKgzJlP1wvcidEJZy6d/i7liDx2/eWxl3pU9banjTe2HYH4fVvUrrSgy2LZ
        EFoAnAytNqfc9t6D/csupKoCy9JWLuu9E2xFt3vXGKHekkYaLGe/dXYa8f25oFckLYZ7wU
        QYGYfEZC8/8udKFkTEo8g+g/FyDzIAQ7OKQWBAPW8T+ZXkWd6j42qu79incwUr+7bRWDMD
        CQ9CBDdJcm8Z+0koHvUKwrCB9Rwu/IxryoR6l5b7wsr6a70Y7cqvCY0Lka0zrA==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EDD6lR1/aN0jSTjcpIJ2Ol25YYZAKhXKuuE0WkDZ1r8=;
        b=RUL7SbcFgSdDtQh9/Y2cY91DgvFgCUuvh/bm35Hgy4ND5DXTkruncPV0E8fjgV5aPsMyJk
        dajTs3LE2xOswtDjZWeLykAEiXpL6D8DgQIwf+PCLDy2pLy2zmZ5BzktNX6Q2z2jTmzs6n
        3ZelpIqPPFjyWrm7LGLiplecsyityWuuOGCVPhOwguQrdkGfdAEn/JpS7w3yd4WNtCNy/f
        iu5bJwD1w7lq3VSs4h2L3PtlrzLyitjSPMvNDRmHKs94hSNRqEL9049XtOQ8N8l2tGRljL
        ZHzxzniIF6c9RoSlTLCHOxhIdMU1OD2VCUcCb51F4FhyANbQjdkZzZAgWHPl5w==
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: rs9: Add 9FGV0841
Date:   Sun,  5 Nov 2023 21:07:58 +0100
Message-ID: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fdwghoktcwgo3put9mpangp8hhcdeh9c
X-MBO-RS-ID: 3d0007d7550afafabac
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is an 8-channel variant of 9FGV series.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,9series.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index 3afdebdb52ad..af6319697b1c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -21,6 +21,15 @@ description: |
     1 -- DIF1
     2 -- DIF2
     3 -- DIF3
+  - 9FGV0841:
+    0 -- DIF0
+    1 -- DIF1
+    2 -- DIF2
+    3 -- DIF3
+    4 -- DIF4
+    5 -- DIF5
+    6 -- DIF6
+    7 -- DIF7
 
 maintainers:
   - Marek Vasut <marex@denx.de>
@@ -30,6 +39,7 @@ properties:
     enum:
       - renesas,9fgv0241
       - renesas,9fgv0441
+      - renesas,9fgv0841
 
   reg:
     description: I2C device address
-- 
2.42.0

