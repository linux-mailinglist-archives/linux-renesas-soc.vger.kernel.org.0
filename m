Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 648DE69318A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjBKOhS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBKOhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:37:18 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B2F2884F
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:16 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m14so7901596wrg.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1YCXkn2Um8+ob9HnT6aPnPihF3Hi+osvkbCgUuiknY=;
        b=glyBPRLr6GEeMsFfZHkkzG+GqpUt0aCLgpeHrfUmXUQx+ozcI8YFCiIaY8Ef8GWx75
         2qKJBxMfqdP5kru99ZM/0zZbC26EHAqj42kDHjrORU32zsudqPIy1SOvqc9qgw1bh4us
         ZSEAvCfhVp2ZpjRqb4Tvuiu7ZBqaXAG6AGqnFk+mwbR/aJUU0Yrw99+LTvackFmD7shZ
         rBdv11vk1LPy69rB1TvhgRGtvEe4r8+wNXOoXZlIl58syneO7s1TjukMX4r/yJ+3qNmS
         b02Ca/xxey2ROtoZ4mEuEdxwHTYyauVE38lYQeWQ33uNKOx62glXnb55FACUUuTzpONi
         LwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1YCXkn2Um8+ob9HnT6aPnPihF3Hi+osvkbCgUuiknY=;
        b=WciTizw2LMqJ2ogRRCbe51ke25HrQp+U5rrbrfGxDc63fBLDU7vmcfRHgS8Mmxl2PJ
         aUsNgU2XAgHDflDUfP3vae6PiKMoFI97aFwWBDS3MmQj/6SFCzfR85oNigdNucN06RcS
         Kh83LMAbrbz2dX5vNRES/6DZTFc/RbF2aURNeHC+2pQ2IGiTE69VOwDFd6b8RrSa9E8l
         2+0Jpyob39bvIlMTgOZx62l4n+vahkwb78AbrW4yFV4DOwcAvOIpxgctT+5pxU4DK0jx
         gg6l+afhBHAFqsDUde/d29bZsHcQrgpeLnEnaHH2T9qD88paHrjjZiW0YgwlJOuY1giZ
         acdg==
X-Gm-Message-State: AO0yUKXHPrBfCWuKuhhIZeV+iyZbHYCoUeW3hHTggVE3S9Q1F9xjq0Y1
        oie53Pus5gv+IqCxH5Ck/z+YHA==
X-Google-Smtp-Source: AK7set/jMGpAmLTo4No+hMKFhV6tUmzh55sWJsENC5z4q0MDu+hN7RhqWB0lX0pNzikh0BngOjMi5g==
X-Received: by 2002:a5d:4b4c:0:b0:2c3:e0a0:950 with SMTP id w12-20020a5d4b4c000000b002c3e0a00950mr15821615wrs.0.1676126235322;
        Sat, 11 Feb 2023 06:37:15 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4194866wrq.25.2023.02.11.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:37:14 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] clk: renesas: r8a779g0: Add VIN clocks
Date:   Sat, 11 Feb 2023 15:36:55 +0100
Message-Id: <20230211143655.3809756-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the VIN module clocks, which are used by the VIN modules on the
Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 0ae3c7f43ce7..dedbe1a6767c 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -207,6 +207,22 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("tmu3",		716,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("tmu4",		717,	R8A779G0_CLK_SASYNCPERD2),
 	DEF_MOD("tpu0",		718,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("vin00",	730,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin01",	731,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin02",	800,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin03",	801,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin04",	802,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin05",	803,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin06",	804,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin07",	805,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin10",	806,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin11",	807,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin12",	808,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin13",	809,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin14",	810,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin15",	811,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin16",	812,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("vin17",	813,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("vspd0",	830,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("vspd1",	831,	R8A779G0_CLK_VIOBUSD2),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
-- 
2.39.1

