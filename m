Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A486F98B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 May 2023 15:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjEGNjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 09:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEGNjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 09:39:22 -0400
X-Greylist: delayed 2261 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 07 May 2023 06:39:19 PDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A378F17FD1
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 May 2023 06:39:19 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4QDlrj6cVNz9sTR;
        Sun,  7 May 2023 15:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CzQ/DzKHizl9gwBYpFJbGlskLtPe1Io2toM+AVjcCDQ=;
        b=vZcJKUc3Fxgkb0/Gyt9tYE6ZDANjkYnZZiIerSfcKcCH5kGgtrsrExWUfWj/Dn5cKoD5z2
        XcjbnIkDVYG/2OzsQ1HHXDCJzT0c5jD4uGFLqsRDN+ZBz2bgnRzPc/oNQcQomyvxCwRQgw
        3TkB4jBvfuFOchKzvNa+SMAyQCOYgWxucI58ebwnrBs62Ui8ao+7c6yM5qMBuntSmGe0V1
        PnIvjUCwakvRXEzUGyzXimn52ECQKggj8jjHwgNuertMh1bWA49QaDRCOm3d5JpSy6WoRf
        l5m3T4E58g/jVUtA3DXQz7PlBOMm5G7iuPtCDngVdfvjKiJsSS/7QRYEJLb9yw==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CzQ/DzKHizl9gwBYpFJbGlskLtPe1Io2toM+AVjcCDQ=;
        b=sO0E4iVDqDT3QFTj3F39v3pNBs/Lnh89yL+T+QByR3KuZ6wcu2ZXfYc6fqrbRujuOxOS/s
        XWaoHBGBwRuh1UUpjQperP4F6yHQIqEap9ZN9Gz7ZzRBdEji2VTlIqov6wdH3fUAOqCho4
        n3Xn+vHEJf/J7rZxSaEMKS0F1h9SkoP9u5l0KXX+V4QxwwACU39L70nzMmTpAprCZXNlOk
        ABBYnVFDnEmEqstQiKSht4cYf89vZl2uegw+rCYVSaLSIG9rIq5zU67N9wHJ3/0ewhtnuV
        G0sQxvgcMZedgSuZ4GMdxzxLQwqZfaljFxf2Wwjlycqwxq3DzHO/PjnV+wyFwg==
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
Subject: [PATCH 2/3] clk: vc7: Fix .driver_data content in i2c_device_id
Date:   Sun,  7 May 2023 15:39:05 +0200
Message-Id: <20230507133906.15061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 91z3uhjdeddszjchgssnshj5srmjz7ca
X-MBO-RS-ID: 9f29d7bc7f8f0877124
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The .driver_data content in i2c_device_id table must match the
.data content in of_device_id table, else device_get_match_data()
would return bogus value on i2c_device_id match. Align the two
tables.

The i2c_device_id table is now converted from of_device_id using
's@.compatible = "renesas,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'

Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
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
index 8e4f86e852aa..0ae191f50b4b 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1282,7 +1282,7 @@ static const struct regmap_config vc7_regmap_config = {
 };
 
 static const struct i2c_device_id vc7_i2c_id[] = {
-	{ "rc21008a", VC7_RC21008A },
+	{ "rc21008a", .driver_data = (kernel_ulong_t)&vc7_rc21008a_info },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, vc7_i2c_id);
-- 
2.39.2

