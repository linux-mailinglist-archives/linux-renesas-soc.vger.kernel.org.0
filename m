Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8B17E162E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Nov 2023 21:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjKEUHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Nov 2023 15:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjKEUHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Nov 2023 15:07:06 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D78E1;
        Sun,  5 Nov 2023 12:07:03 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4SNlr3449Dz9sVN;
        Sun,  5 Nov 2023 21:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aTQFv+jxFsY3X5csA/whB9c77q2hCbYcNxae1TskwzQ=;
        b=c8MsOHYNKCZq+G4vK28jvelMzuh9vV0bIReZeId4FVGLZrShV70vmH+dn4kmBaLXQweddR
        0gVPDF0GSXrQwszV3wzR9kSHVy00j53ao+hHWru/h7gzSUO82JnO4H0KtwhWVPH+IC6IR4
        xCri0Qb2a8dINoLliCPPYRDKwPL4idEBhx1bjGbjZxZPnspfCl7a8Vgxu6z3qyfNJKEew4
        7PIGcNBmk6tlNiDaSUGpVg01Z7GIYknxmqqcADaH7CuTDBqSUsNPeBFOSQgLdMqCIMRJ3N
        459olyXiJ7yIx6UXDOTdktTQT1OgDMlpz5hup6A19VHGFCFSJjaLwNbSdnRdKg==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1699214817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aTQFv+jxFsY3X5csA/whB9c77q2hCbYcNxae1TskwzQ=;
        b=X+55kuiQgnpvrwpqBcNYI9FDdAqRnmhbis7tN9Xo4uWEZOxRJEQaETMHuZTVdoc9DjbLLS
        MTf1LCx96Kna1fYyHVqzBTp9pFFJICpx5eH4/iIwEKa9TUbEo3snDUMvqTx9+pjZuB5ao0
        UVPGTN3Vopcu1Jdx9tHXMjJYuwbfjCDvUVy8ck8mIxU+4+QgitHjGLMSxerDP9K9PtSqSw
        6ll51WSmnlUEjI7AJmsF5yd7A0NPuP/9wtsshtLzEK6zwX9j45o66jroNlZ6pkNe9jzWPC
        s3DZaRr52qp2Qp5IGvQ8gmgcuH3VFuGtmjBSJ3O1DNLgTiuhxyvURtURxbdtJw==
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
Subject: [PATCH] clk: rs9: Fix DIF OEn bit placement on 9FGV0241
Date:   Sun,  5 Nov 2023 21:06:15 +0100
Message-ID: <20231105200642.62792-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7jnrc1r3hg64n4pus16cxxxnohkj5j8e
X-MBO-RS-ID: a2288b80ca60afe3830
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE1 is BIT(2), on the other
chips like 9FGV0441 and 9FGV0841 DIF OE0 is BIT(0) and so on. Increment
the index in BIT() macro instead of the result of BIT() macro to shift
the bit correctly on 9FGV0241.

Fixes: 603df193ec51 ("clk: rs9: Support device specific dif bit calculation")
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
 drivers/clk/clk-renesas-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 380245f635d6..6606aba253c5 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -163,7 +163,7 @@ static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)
 	enum rs9_model model = rs9->chip_info->model;
 
 	if (model == RENESAS_9FGV0241)
-		return BIT(idx) + 1;
+		return BIT(idx + 1);
 	else if (model == RENESAS_9FGV0441)
 		return BIT(idx);
 
-- 
2.42.0

