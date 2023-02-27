Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B636A49F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 19:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjB0SkE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 13:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjB0SkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 13:40:03 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C4A21A3F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id a1so4496410iln.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVRZ9O/xeg4wvwaNlAos7VzArnRbqSw6RvITnKjvv3o=;
        b=OCf1tJpoZBimcQbIcNpDBt/mvRM6YLDEVQ+vNB2XgrlMV1TUJyD6z4NFxQPO3wD11E
         TtD2Lazai5TYeiokozdyymD0ge+a+06FSh8ZYKB2LQDDjsiafWLi9Qnn8JoOGGkRMwvB
         F6QrRCzKjEm6JulYpxblbcLOcC4Qq4yNonJRISV/988jadh/PMOZTClBLNhGbMytLqel
         PYPIn3+NRWNgDzx8sIJFcQhPP8H0EGMPLkuHfjJqRehy/ooApr3rz0BASB3yg4uZ/Zxb
         TS4d2IFDKv7iNXRH/lQYExn9iud1qxC6MYwn7klEjp7NtENCf2lJMKtAWJG3D9jw5fPO
         Yz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVRZ9O/xeg4wvwaNlAos7VzArnRbqSw6RvITnKjvv3o=;
        b=HDNtUaKYgKRkjVP/7guDULi+JQRQktWXrpFtCk3nBuTf0RSmdR0mknxuzwCW/rV6B1
         g+gB0Idjr7oYfoxAFzJZFpCzQzsRFUgI6mqWwWWODjxn/UN8eq5upRoHoKYp+7t7ysX9
         3hZdIiHwoiSejQ6TVV8mLD/hbrQci95UBn/F4jh0ElL+AQjEbY2W7NOrP4f6M5Wgl/vz
         9EanFN1NiRHSmJzdGYfP31rAI4PI7nZtsPOWUyzlILRF+oyqyChO6AT3xr1QoHu/Be1w
         ahkgu5dXCvqLG8K9SvWLlASVJ+F7kDpDFBoSVii7kuHs5fCfXrfJxXiQMWujN93XOp5p
         5XDw==
X-Gm-Message-State: AO0yUKWPMS8LsBOeviLgycBVU727OBHVTRcbk2EUWWsOp5ba2p8o1gvc
        v//0UqZERDkvGRn9/JQ7oBwmt4jvOeGBihiX
X-Google-Smtp-Source: AK7set+xvC4SuSCk/6xKyfNThoKXIM58aHFlkB3JprMaUJb+RkHI9w3pcDJaAbTJpeRSDXmBPLJLMw==
X-Received: by 2002:a05:6e02:1a07:b0:315:554e:e73b with SMTP id s7-20020a056e021a0700b00315554ee73bmr362875ild.21.1677523201466;
        Mon, 27 Feb 2023 10:40:01 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:40:01 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 2/4] clk: renesas: r9a06g032: drop unused fields
Date:   Mon, 27 Feb 2023 13:39:34 -0500
Message-Id: <20230227183937.377612-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227183937.377612-1-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop three unused fields from the clock descriptor structure, and update
the macros for filling such structures accordingly.

The values for such fields are kept in the source code, now unused, in
case they are needed later.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

 drivers/clk/renesas/r9a06g032-clocks.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 75a095a15c03..8a1ab9da19ae 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -28,8 +28,9 @@
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
 struct r9a06g032_gate {
-	u16 gate, reset, ready, midle,
-		scon, mirack, mistat;
+	u16 gate, reset, ready, midle;
+	/* Unused fields omitted to save space */
+	/* u16 scon, mirack, mistat; */
 };
 
 enum gate_type {
@@ -67,14 +68,18 @@ struct r9a06g032_clkdesc {
 	};
 };
 
+/*
+ * The last three arguments are not currently used,
+ * but are kept in the r9a06g032_clocks table below.
+ */
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) { \
 	.gate = _clk, \
 	.reset = _rst, \
 	.ready = _rdy, \
 	.midle = _midle, \
-	.scon = _scon, \
-	.mirack = _mirack, \
-	.mistat = _mistat \
+	/* .scon = _scon, */ \
+	/* .mirack = _mirack, */ \
+	/* .mistat = _mistat */ \
 }
 #define D_GATE(_idx, _n, _src, ...) { \
 	.type = K_GATE, \
-- 
2.25.1

