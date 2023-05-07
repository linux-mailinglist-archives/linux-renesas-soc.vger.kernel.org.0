Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A846F98B4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 May 2023 15:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjEGNjZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 09:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjEGNjY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 09:39:24 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DFE17FCE;
        Sun,  7 May 2023 06:39:20 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QDlrl1Slqz9sV0;
        Sun,  7 May 2023 15:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DqhpfqQ1jPAneqcud8kUo2XC74P29aEtLCZQKHDRNeY=;
        b=MHFPzrwCv4htjxDsbFkgCMPVklGfiXPykG/mhRt16+4Jp1iwqo2ThkTBB69y6Fe6uMTKpt
        apqMsWJzwQtjROs81Il8yWNAgF2DGls2lrEF1G1lnLo/b3oAUIOuIqDoe7y1DEd7ffYglN
        N4Xg5ogVl0PlCZxuKrPiZfN/oZ/ziqO4SVbXS4F9bk8lOdSQ19H61uWpiXZjfbBYYDE3S0
        VS70bEHNH6H8NP6qRpfqrjI+qUIYOQHCVBOzctL0wsmIPgVuvJfAMlWNBDSrYcN0YoJOep
        ZNynos/5EeE32b21epXrbIe3Yi79PcGjbE1ZtEdhcENt133jmEdU/VSYGajEaA==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DqhpfqQ1jPAneqcud8kUo2XC74P29aEtLCZQKHDRNeY=;
        b=no5YzfpncfpIEfBDMFY2lSCjZklRQuBz3loN7LANaxzg1WH8tWdiOru1n95QeQl503cW6j
        7N7IZ8HIaCnkTYVU0/n9YTGHtkg+cT/cFZJ/9hg3iFJOpz/ZLL4okRIwNsMcSvsyddJfKb
        6PnWrCYFCGUfJojslHGtHmCQDHPgFfIrZ/NZpS67sFLRpY7WovCR4WJ8Nkel1kBRDwCe+2
        9J7DY70TK25UJV9xQbAPKzhgwM6djFKx2hqevcF438TPm9xdSqEEwlxZ9MGnYngggg5/sP
        0z8yXKcCZefG/cNbuDFugw/4V38+HhhliENKhY3dlKSUXz8wr+YHTECZ9OBFPw==
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
Subject: [PATCH 3/3] clk: rs9: Fix .driver_data content in i2c_device_id
Date:   Sun,  7 May 2023 15:39:06 +0200
Message-Id: <20230507133906.15061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9fe0008d3a116348b51
X-MBO-RS-META: kk57igdeijcz6kqg5jgk996apu4ncy5o
X-Rspamd-Queue-Id: 4QDlrl1Slqz9sV0
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

Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator driver")
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
 drivers/clk/clk-renesas-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 10d31c222a1c..6060cafe1aa2 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -392,8 +392,8 @@ static const struct rs9_chip_info renesas_9fgv0441_info = {
 };
 
 static const struct i2c_device_id rs9_id[] = {
-	{ "9fgv0241", .driver_data = RENESAS_9FGV0241 },
-	{ "9fgv0441", .driver_data = RENESAS_9FGV0441 },
+	{ "9fgv0241", .driver_data = (kernel_ulong_t)&renesas_9fgv0241_info },
+	{ "9fgv0441", .driver_data = (kernel_ulong_t)&renesas_9fgv0441_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs9_id);
-- 
2.39.2

