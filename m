Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4323701F3A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 May 2023 21:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjENTU1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 14 May 2023 15:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbjENTUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2023 15:20:25 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5064419B7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2023 12:20:24 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QKC523Lnnz9sQp;
        Sun, 14 May 2023 21:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1684092022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gZM5ZzjtFg/rYXLHRzCfNvOVOMDqKgxi6keltv+A8jM=;
        b=SYeiz9Jst9mGRjgXg9VlfyTkuoXkRHjMehO9/hoR3aSWlADuBs23xY9sgTEqBYc8oDZphX
        1+AvbCbQk8zPDybvCtp3MKtUImc2nbrwGRhNarVoNwLhl0Xpyhf7Ri36ERDXtYnSSHm6Kd
        RgyyjXpMbZXncXu3QZ8tLQUmNGzuCVIs4Nu4b4l56POriKLZmNt5hVV3oh6BXh0a73KlN/
        sWS0XDvtsOmSUtjUfOYUE/Ye4k+7MQh8TB3HBcUAaZz8U4k9u7nitTZXgPSChqYK+XMvUi
        lnPl/gSQzIZlBBdaxpzBF9qm4MNGSodldNv7WZe0i0g2+f4g3jPMT1bZziV+Ag==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1684092020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gZM5ZzjtFg/rYXLHRzCfNvOVOMDqKgxi6keltv+A8jM=;
        b=HtTO8Mx16X1JWK2rHsQksSgy8hxBe2wjoPFgdPFBWdDSqTDsW/2NbOLcvgMCAKG/FTM/Pn
        QoeLg7iL8Q2FX3YcZ7PIOtvsWAUIk+fqf3s5ZtoTWYQp4teLfOOeLTwUpYAFkzu9eZZMo8
        y6X8luIMyBZb79ih64v4ltt17RO7rCgeZPHGmUelqkmbNyKdUhqFFKruKwRlh++EBGSSox
        guMXkgw7sFH8HkAH6F60BkZP+lppQakT3ic/aaTDaupAYvd5u8HKBo/oQL3YtHFZgQFKXg
        MPyKuKCSxlb36ohd3+i3LRXTRRjBY8AKuoT12LbIQrkCHlyIyFyWCfrbvlzgyQ==
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] clk: vc7: Use device_get_match_data() instead of of_device_get_match_data()
Date:   Sun, 14 May 2023 21:19:59 +0200
Message-Id: <20230514191959.706269-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
References: <20230514191959.706269-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bc96a341453e96c3f4f
X-MBO-RS-META: jfnwzbj7be4rmde9irnsngfbc7x91zaj
X-Rspamd-Queue-Id: 4QKC523Lnnz9sQp
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
V2: Explicitly include linux/property.h
---
 drivers/clk/clk-versaclock7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 0ae191f50b4b..42abd5da6675 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/swab.h>
 
@@ -1108,7 +1109,7 @@ static int vc7_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc7);
 	vc7->client = client;
-	vc7->chip_info = of_device_get_match_data(&client->dev);
+	vc7->chip_info = device_get_match_data(&client->dev);
 
 	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
-- 
2.39.2

