Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE74693186
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjBKOhR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBKOhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:37:17 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281BE2A6EB
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:15 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j23so7972264wra.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEow9IqGMe/40D1MkUaG08385FbzvVWYP13EUksK08I=;
        b=UJL4HtBfWfXjKzELdaU6u/ldZRdAc0Qvhcw80uyMdPyBTn1zjZQUEzNt5Ml9lzI2z0
         +AXQnune1Ik716zlQVu/vDHYhneFAWocrMMpOyLXAz/At25xaVHaGxbh47TcZXWini4U
         XgrLkWCTYZkgEFoCu2gfThS8IosEg/KG4GS4+bVb4vSi1ZeVqTAAuQnDEFzBjfR4O/FT
         RwdkY/Gt/50xpGxzztq1NgsdWbmcJC4KI5/3TyB9M3kVsKFB0pjbBL4hgTik8QIO0kvZ
         10Mn1o2giSERckG7QtDkIbEDEH6U+1R1UXM2NCyjmKiNohkJYBXskmZrN8gO/MOvdcmC
         skng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEow9IqGMe/40D1MkUaG08385FbzvVWYP13EUksK08I=;
        b=HxnYpaFyTu7cYAPF6iot1GEa7oG/dn/AQr9lG4fHs4hB0kxl/uFvYLrNsqo9e3B+cN
         ael93LBlbzhCR5q7jQplaptoSCKB6oiTTOXz6ilhjowU9cFX9P/ly4C19BtSeXWXrw5u
         XLh/e5rALPAXcPL5DZ65Bgvg9/vQU1GF5mEM0zAoXCxQSbK7C2bREhZ0QumRdp/MCB1z
         ZGwyobH+2TFtvP+P8e9HaebibqJ+aZlDCGQbeHaxFJqEmRgz00nrCyPZDUQcDueu26Ec
         PQL1dsMGUUsAQU/4gRe9MV3Cytpbz0lmdgQliC8Vtk7nA4d12vOuML3Yrt40F+Oa1I8O
         3TyA==
X-Gm-Message-State: AO0yUKXVPGcvML+Cyl2kevWbSYOdYYBZGEcLQrTh9HcGM9ZnwZy/0XQ6
        BURJH5IKosFdSGMNvPDPZ0a5/Q==
X-Google-Smtp-Source: AK7set/wGzLqlYB9mMeXb9btlSkvfY4HSdJMtUOBk7sf41mIEpIGs2AUeE255xNgy0Ml6w0ULY3XgA==
X-Received: by 2002:a5d:50cc:0:b0:2c3:f8d0:63da with SMTP id f12-20020a5d50cc000000b002c3f8d063damr14295692wrt.62.1676126233811;
        Sat, 11 Feb 2023 06:37:13 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4194866wrq.25.2023.02.11.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:37:13 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] clk: renesas: r8a779g0: Add CSI-2 clocks
Date:   Sat, 11 Feb 2023 15:36:53 +0100
Message-Id: <20230211143655.3809756-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the CSI core clock and the CSI40 and CSI41 module clocks, which are
used by the CSI-2 Interfaces on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 7fca11204f74..baed1b8601bf 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -146,6 +146,7 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 	DEF_FIXED("vcbus",	R8A779G0_CLK_VCBUS,	CLK_VC,		1, 1),
 	DEF_FIXED("vcbusd2",	R8A779G0_CLK_VCBUSD2,	CLK_VC,		2, 1),
 	DEF_DIV6P1("canfd",     R8A779G0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
+	DEF_DIV6P1("csi",	R8A779G0_CLK_CSI,	CLK_PLL5_DIV4,	0x880),
 	DEF_FIXED("dsiref",	R8A779G0_CLK_DSIREF,	CLK_PLL5_DIV4,	48, 1),
 	DEF_DIV6P1("dsiext",	R8A779G0_CLK_DSIEXT,	CLK_PLL5_DIV4,	0x884),
 
@@ -164,7 +165,9 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("csi40",	331,	R8A779G0_CLK_CSI),
 	DEF_MOD("canfd0",	328,	R8A779G0_CLK_SASYNCPERD2),
+	DEF_MOD("csi41",	400,	R8A779G0_CLK_CSI),
 	DEF_MOD("dis0",		411,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("dsitxlink0",	415,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("dsitxlink1",	416,	R8A779G0_CLK_VIOBUSD2),
-- 
2.39.1

