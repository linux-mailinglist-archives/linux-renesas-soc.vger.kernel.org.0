Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36615701F3B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 May 2023 21:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235503AbjENTU1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 14 May 2023 15:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbjENTUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2023 15:20:24 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959E119B6;
        Sun, 14 May 2023 12:20:22 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4QKC501ZFdz9svH;
        Sun, 14 May 2023 21:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1684092020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=E4zGR4AahOO9E1zP1RQPk2r8+bU/5CUm6gCk5iiNXrw=;
        b=QACasJFJDAKHODyWltrk6dWiVY3Y2caXmoZ9KmMR+IXr9UYe/GTcyKzh1wAsLpLBrrOWF1
        K5ehkli7lQAJZj9SVhsumtyxNXkYOfCOJIiUG2Q7dLO1YgboehCDw2Y9ljuYYBB+jnL1JB
        vM6WXZZ4jpIOBj+we5YXnIYFVqd60CEJgtieSawDf68Hznlwi28px82OqmYqsOy/Hizn8D
        J2uxVjmG15KACDoOYY2aUqJb+LLLy5bA9XFe2Lgk4enlq5I4YKyPoq5aDKfUVG14R2BcKR
        BiGE1hrXT8ieTXr3ku0QuiNkkY1zegS5fQnDYGsBdzEKm0qERAJA3LItlY/tTA==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1684092018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=E4zGR4AahOO9E1zP1RQPk2r8+bU/5CUm6gCk5iiNXrw=;
        b=qkjgVnTwAKZbg1vdTA4RbP+3jT+Jg+EhTJblEqZfPA1V02/r75ZXx61ibCLjTaruiI/cCq
        w94pf8lDcg/Bspnsro0M38nUCFbYf49y5m/R3aFUZx3NN/P6RaYCCcq7GJpH6tXjH6d49n
        ZjTmxMBRjliJIfKZo4BEdj/WrT0QSbdbJcR7DhJvNRzkzTpzleKYcuXeWsQpnEn5mNPpNf
        iBFms5m39vdkO7OsUVIWm+Ou2SPMXvXrSE1tTzA7xpT9FeQ4zG2AHOlOBgqev+FcBH5ckO
        ROzFgs7ssXqTGa7K8Li2WIja9oO6+CgxxlT8vWj6yVrRB52dieueafxq3iTWCw==
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] clk: vc5: Use device_get_match_data() instead of of_device_get_match_data()
Date:   Sun, 14 May 2023 21:19:58 +0200
Message-Id: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 84146f7bc2074b894b1
X-MBO-RS-META: 8tt39nbrwiue8qwj5wij847now4cem35
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use device_get_match_data() which, unlike of_device_get_match_data(),
is compatible with other firmware interfaces than just OF.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alex Helms <alexander.helms.jy@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tom Rix <trix@redhat.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Explicitly include linux/property.h
    - Add RB from Luca
---
 drivers/clk/clk-versaclock5.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 5452471b7ba5..28ef1e9a3c56 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -953,7 +954,7 @@ static int vc5_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc5);
 	vc5->client = client;
-	vc5->chip_info = of_device_get_match_data(&client->dev);
+	vc5->chip_info = device_get_match_data(&client->dev);
 
 	vc5->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
-- 
2.39.2

