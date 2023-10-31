Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F141E7DCFCE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Oct 2023 15:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344388AbjJaO6A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Oct 2023 10:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344312AbjJaO57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2023 10:57:59 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FF7E8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 07:57:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso11841242a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1698764275; x=1699369075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jeb48vmA/o9ulzJEex2wEVbiRcT5CIjh82DiUH/+tbk=;
        b=V6but9JlADbdOylH1AUZeK1IdOd8pwdGd+aeYmCaLueCgAzhDRDFeGs81ycKjoxAM8
         X94kZ54vh+hqsXxVf8bthFbqyjEGUAa/o3/bou7cUYmBZVg1ZZj8OmsJlz2D//nUeRsP
         jpOWkq4QTz6Hm9IUdnoRPNeoXyPGVFT8HCAqlsok4FjzfzoK98bXg5PVHSICMlHCI0yb
         z9lFv7jPzxmngJc6cFJeabxBoW6notu1QEf492pU0nja24Ow2YGe71UhXD4Jy+TtSCQ5
         3zJ4/x8w6NVmeM939Zmp6SCMjthPQolaokPDxWJcV/6eAnzXmQvtNqwpE8LwsmvgShla
         BaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698764275; x=1699369075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jeb48vmA/o9ulzJEex2wEVbiRcT5CIjh82DiUH/+tbk=;
        b=hyErv+l51HVuOHFTREAjchtnReAJ0Yk0gI9qlVyliseJ6KXUaHw1ShxfnHqG1TXi/s
         WegA6G8XqGR5iBASZkFeWTWkduag/enUc60a+4bb6wscu/vXaIPJbG46LcGmtIEskYhc
         +rvoN3HbVqiyxWmgqWM0aa/Z2NrfBLoJNNkCXLQUKdXzH3ouupVW9uXlRnNOfYc4+sO1
         h7KLcntjz+7ZWOGnEoFHRB5haKglqDn44LbNuApYWpY1gRKQLAg4SbMSTCZreELz2K3O
         muk2hmxc9jE+VTSb/DbjZcO2Eu5dxxMgfVT+NAs3msRSDmNwWmUlGUL3pfWKN4ujTDE/
         tbiQ==
X-Gm-Message-State: AOJu0Yz+1MMpNlD2itOOjRceMtef16+PRm3XSZ+BZZ/c9wpjG4GlMsna
        QsnfaTIAJqOWTcwlHZATAKartRkL890HcJybc81vwjHt
X-Google-Smtp-Source: AGHT+IGCPN4YqBEYkzm6IJafXKg60f7ZjzBk039ZXG8wnqjy6Gu9/Ttc7VlChXT7nMTSMGlfXFbiOA==
X-Received: by 2002:a50:9f44:0:b0:53e:2aab:14f3 with SMTP id b62-20020a509f44000000b0053e2aab14f3mr2579551edf.17.1698764274636;
        Tue, 31 Oct 2023 07:57:54 -0700 (PDT)
Received: from sleipner.berto.se (p4fca21ea.dip0.t-ipconnect.de. [79.202.33.234])
        by smtp.googlemail.com with ESMTPSA id e25-20020a50a699000000b0053e89721d4esm1268236edc.68.2023.10.31.07.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:57:54 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: r8a779g0: Add EtherTSN clock
Date:   Tue, 31 Oct 2023 15:57:39 +0100
Message-ID: <20231031145739.657638-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the TSN module clock, which are used by the EtherTSN module on the
Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 7cc580d67362..affc5fc60332 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -235,6 +235,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CL16M),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
 };
-- 
2.42.0

