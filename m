Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6585D6F98B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 May 2023 15:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjEGNmG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 09:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEGNmF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 09:42:05 -0400
X-Greylist: delayed 2427 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 May 2023 06:42:03 PDT
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6287B30DB
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 May 2023 06:42:03 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QDlvs0ZMmz9scl;
        Sun,  7 May 2023 15:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=D3uLEmivijwYVzqw/8zlTNspBajMlCggcmC9qlJ+tl8=;
        b=gVkeuIw5Srgx/KuyF+nt1AWI3/iC2M0gSZ+lkOU9/hC+SRWhFhJZBprYtRFeL/RUGtGdUj
        fFWHs7PMwo4t3pmmOu5ctNx0RA84DVM4RwOHgLGzFHaeYAjwrfPFKHJu5StuPEt297jCo1
        cPbUcGVk05GqmABGyJJAtUMSsZGmZDDDrgfnAVTrCseK1aiz4Sv/7soegWaNOYOZV0006c
        F+S3kvN51CylfetPQcRGJJBvp1+sKH2eyGJoCXfBqVGJBIHlc2mI+J5ScUq56BDAJFdfw2
        aArG9wJ2qNi+pKuSZGYVoWFQ9jEenHmXawJyr5uzPQudHXYPNwenfzH9LhVJhw==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=D3uLEmivijwYVzqw/8zlTNspBajMlCggcmC9qlJ+tl8=;
        b=pn+q6Y45brWzGo2WbCpF602cqNGp8DjmRyy5tUvB4RERb7XRJo/QIA5r91YQo9rTsYyuBa
        OJQ0I3uKjOCS2iov3djB6BTImdohZBb16cR/6guu+ZQrmqrZY3q0r8mo6KX+nDfCbEgLc3
        pX5/pUOBW4HPQlCVXKzf0nIWPurHjqCgFxgmLjTyq9dHEW3PbsPoycwGqC9ImgXgfa7wPf
        0k5rzuA6+g7AbbvT2ecq5JfIrSC1YSKLSab7snRFS4cGusXZdg6q7Qn77HG0JlpHQBOTUk
        9ydsYm19MsrPPy+vCZVo5q6vdzSmIAcvWY+WfdzRJslMbAz2RRj3BQQwXJafyw==
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
Subject: [PATCH 1/2] clk: vc5: Use device_get_match_data() instead of of_device_get_match_data()
Date:   Sun,  7 May 2023 15:41:47 +0200
Message-Id: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6f01736487f43392e19
X-MBO-RS-META: pjxby95jjgg8o8q334dyi5ikd41akd68
X-Rspamd-Queue-Id: 4QDlvs0ZMmz9scl
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
 drivers/clk/clk-versaclock5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 5452471b7ba5..7d91d5e862a3 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -953,7 +953,7 @@ static int vc5_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, vc5);
 	vc5->client = client;
-	vc5->chip_info = of_device_get_match_data(&client->dev);
+	vc5->chip_info = device_get_match_data(&client->dev);
 
 	vc5->pin_xin = devm_clk_get(&client->dev, "xin");
 	if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
-- 
2.39.2

