Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC866F98B8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 May 2023 15:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjEGNmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 09:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjEGNmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 09:42:06 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA3835B6;
        Sun,  7 May 2023 06:42:03 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QDlvt2lpVz9slp;
        Sun,  7 May 2023 15:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yg6rSvs/km57l/SFRzTV4ALBJYztbsp9TDDKC8eYx9s=;
        b=M3WvugFzAg7ZNYuAcISCLHuEnvzOoF6GRAJ+Ot6v5ZGvj0EUbYm/6xMUd18h5RXYuYn1d6
        Hcz5ZlGNyBRsqyMxIroZtfUiltEIsD61X3wcZwDr0R4MJ1HVKKe2nS7VsmElF8ouIpHQXh
        UER4eneZ7hdNaQAmqkRpra1EP+h0FdBfZhKDYj+fmhQBnV/FlcUd8LKHyLtiaS/IhofClH
        Bm0TqFOdUfDZJ9XI9Mk+qOO+lmFMX5RHdBSxHAbN9ACr0D5PttfrYQyQ9qXKaggRqW2S8+
        zTEv1pYfeOmOjOQPMGj48oa+mxbv7iji9FeoDmbfsyD4ZIhTJKwVCa+DXayXVw==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yg6rSvs/km57l/SFRzTV4ALBJYztbsp9TDDKC8eYx9s=;
        b=Kmf0q6SsLTku7iwlE0M8f5K734xNufWEBYavB3QSv5BiP5uBqd1jMUGh/C+3iBMacg9G73
        g/+BNepACyHZbJjrhqbhWqgOAwC0JqNvQsxFubXP8JoldYwKT4lrdbe4pbBPiovD0Aw2lO
        SHWOOZnvVKWLhWm/YnkiGUXjjbAd6OeRLgKlHlr80v5OiwPFlrjffazIlNbUQ33pBpRhFe
        UHVhL6TJNqVdycp0ZQ/gzjzW0B9JRFQkW9SO8qE3jhs4tywtk8SxwiwzVfeT5CqPyyw43B
        z6Rzj5HiwAgSXtqUK87hlrejCCEDOUPSlUhK/CWnsnEZozdwSYhnr+r/I3PlfA==
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
Subject: [PATCH 2/2] clk: vc7: Use device_get_match_data() instead of of_device_get_match_data()
Date:   Sun,  7 May 2023 15:41:48 +0200
Message-Id: <20230507134148.16530-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
References: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jmzb878jmwsfcuyncc1k6wgu3n44bsx9
X-MBO-RS-ID: ff5e630adb91bb7fe4f
X-Rspamd-Queue-Id: 4QDlvt2lpVz9slp
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/clk/clk-versaclock7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 0ae191f50b4b..d563afee79d4 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1108,7 +1108,7 @@ static int vc7_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc7);
 	vc7->client = client;
-	vc7->chip_info = of_device_get_match_data(&client->dev);
+	vc7->chip_info = device_get_match_data(&client->dev);
 
 	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
-- 
2.39.2

