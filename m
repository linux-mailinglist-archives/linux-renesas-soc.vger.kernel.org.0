Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7374D6F98B3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 May 2023 15:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjEGNjX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 09:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjEGNjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 09:39:22 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B2C1635F;
        Sun,  7 May 2023 06:39:18 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QDlrh43Zkz9shP;
        Sun,  7 May 2023 15:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4fgQ2AA/ZP9Q31JC0thF0rs1ha1creCyXIytqfAePqI=;
        b=I6CRR4WJAV4eLopU79RVgaciorlZZBFTitS7Gq96uHlp6WtKeX5e1uIHhkVH+f4IBL+r9Y
        L5xfxGPCEMy/XezGJ7xj1vFLSm0mvLrJrmfuCg4ZUIWjKxflfgjGbmiCbAeeP6QHGtAgw+
        STpYnEaTUkD0RyyXQvNsDuq43Q26gpry17oVSUP5rjgPLYIsFnNS35/oYitplaOeCZcOZr
        D86dR0g0HjAUzf0ouLRH4sVozyjZjVmUg4rdGEqDJd5MjjZNdqP7mYVRx1TDAt84FqiHAC
        /I84Gaig1maGZULrcGdDpzX51E6js4kjGM7LqI3HMI9goy9PFCxfPbIZa0Bepw==
From:   Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1683466754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4fgQ2AA/ZP9Q31JC0thF0rs1ha1creCyXIytqfAePqI=;
        b=OjKWptYTBwxm9l71hoPz77JGVVOFOOS2aLwGh0OR2mRPeIEenK0qmSxHi4DMB8OzlXgTfX
        FLU8C67jfS86eLLzGTaHNDrkyorJmYTROVU7ZZvIVRpnq+wdkQ9fAsdBaHbUrkA0xhMP/N
        ayS5ujffUUe58Vfq6il5O9rSS7bG1ue4Mv5El5pg3OPoTMInVVDYD3e4+kG6ai9uHvVvb8
        iKPTy3XNT6aiGKEwIX6r0lomm/xRI25mR0CAEam2SBSHv8CK1HmfQnIMzTCmCP+nGlhD7r
        tjSgAaDC4sorSTr0CGQeVjHxnjB2z+6K2lArm6NkqzD+cfVLSwnHS6v9LpDI4Q==
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
Subject: [PATCH 1/3] clk: vc5: Fix .driver_data content in i2c_device_id
Date:   Sun,  7 May 2023 15:39:04 +0200
Message-Id: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8ad0a7f78ccef191bd9
X-MBO-RS-META: emtkqf589wnhogos4d39cky6th4ssjrj
X-Rspamd-Queue-Id: 4QDlrh43Zkz9shP
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
's@.compatible = "idt,\([^"]\+"\), .data = \(.*\)@"\1, .driver_data = (kernel_ulong_t)\2@'

Fixes: 9adddb01ce5f ("clk: vc5: Add structure to describe particular chip features")
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
 drivers/clk/clk-versaclock5.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index fa71a57875ce..5452471b7ba5 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1271,14 +1271,14 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
 };
 
 static const struct i2c_device_id vc5_id[] = {
-	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
-	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
-	{ "5p49v5933", .driver_data = IDT_VC5_5P49V5933 },
-	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
-	{ "5p49v60", .driver_data = IDT_VC6_5P49V60 },
-	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
-	{ "5p49v6965", .driver_data = IDT_VC6_5P49V6965 },
-	{ "5p49v6975", .driver_data = IDT_VC6_5P49V6975 },
+	{ "5p49v5923", .driver_data = (kernel_ulong_t)&idt_5p49v5923_info },
+	{ "5p49v5925", .driver_data = (kernel_ulong_t)&idt_5p49v5925_info },
+	{ "5p49v5933", .driver_data = (kernel_ulong_t)&idt_5p49v5933_info },
+	{ "5p49v5935", .driver_data = (kernel_ulong_t)&idt_5p49v5935_info },
+	{ "5p49v60", .driver_data = (kernel_ulong_t)&idt_5p49v60_info },
+	{ "5p49v6901", .driver_data = (kernel_ulong_t)&idt_5p49v6901_info },
+	{ "5p49v6965", .driver_data = (kernel_ulong_t)&idt_5p49v6965_info },
+	{ "5p49v6975", .driver_data = (kernel_ulong_t)&idt_5p49v6975_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
-- 
2.39.2

