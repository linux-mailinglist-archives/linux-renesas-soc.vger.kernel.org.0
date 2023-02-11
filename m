Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7052693188
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBKOhS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjBKOhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:37:17 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A8D2A6EC
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:15 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j25so7935964wrc.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=satx2wQlDzMRr4b8UZlhPan5dlbPj6FY4faSfCQtuIg=;
        b=tU0liAhTa76teRSVVs+DQa/6ZqARGEJh60RUZpqLfr+UqC9tRL+DWkhn3rTAwaHfC1
         vKTck4u6jKgYXGtopY5URSBUY5zZbV0btue1JQe1Qlnkw6ivW4TI7L6Hcc3TuW54DbVi
         xvbl62DesqMUk4++9Lwm0JIqZYmGesjuTB3AhjPoAD6EfevTepmtaC8N/eReQ4sLbqSr
         5vmhJEUfLPZNJnK3q3uNblWvEY+nalpUL6bA9uM+C+hHoz5OlVoKVegMrY2wJ4OD1YKz
         p/wPyKlz3cSTARE1gkITaG8ASiKqE9nsBiog/flqg9Ybq3pE5qrpKzPS4qiD1V7WAkOK
         efCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=satx2wQlDzMRr4b8UZlhPan5dlbPj6FY4faSfCQtuIg=;
        b=cGfvcVYHRqk/DQhhHEQaEM8s6dTuh6ToT51ifMVSc/ObX9RI9hu47SqSNCIqlO4/Zk
         Af/otDMfQjed4WR7q3fAX31qh5dNTEk18FIOyRk3MeyYdnzQlSK+7yOKG+VuOvZyOV9k
         gV9cGzpqB3aA2odIIgqMmb3zi7vatX1zM56Xhgejmv43rpOfhwkP52BJ6c5rra4ZWQLC
         GwX4ZMfB3T+YnuBi6rL74cOmWsdgfY6nTN7zejhyiTRVHjCLVhvug4JSgFpJTIvuGIRy
         L4xTGNGXJ4wJxeeZzYXu98QKWDsKvWB2zFRkLsFvBFTtt+3nRpHvziu4JLt4hum3OL6U
         e7wg==
X-Gm-Message-State: AO0yUKWMR3fY1g7BbLmnwov4mK5CqUSCcT9DBYlObtcUR3j0c78r+fPs
        57Cv/M+NUTOwgavehsjHEAlZHg==
X-Google-Smtp-Source: AK7set9A2ajix9VSqE7Kny3ifwRm+BZQpFoJasObkEPF4IT4mLihW/TCzk92+OsFzrYXzjTC9n8f7w==
X-Received: by 2002:a5d:440e:0:b0:2c1:2a15:9dda with SMTP id z14-20020a5d440e000000b002c12a159ddamr18160441wrq.43.1676126234528;
        Sat, 11 Feb 2023 06:37:14 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4194866wrq.25.2023.02.11.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:37:14 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] clk: renesas: r8a779g0: Add ISPCS clocks
Date:   Sat, 11 Feb 2023 15:36:54 +0100
Message-Id: <20230211143655.3809756-3-niklas.soderlund+renesas@ragnatech.se>
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

Add the ISPCS0 and ISPCS1  module clocks, which are used by the ISPCS
modules on the Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index baed1b8601bf..0ae3c7f43ce7 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -184,6 +184,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("i2c4",		522,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("i2c5",		523,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("irqc",		611,	R8A779G0_CLK_CL16M),
+	DEF_MOD("ispcs0",	612,	R8A779G0_CLK_S0D2_VIO),
+	DEF_MOD("ispcs1",	613,	R8A779G0_CLK_S0D2_VIO),
 	DEF_MOD("msi0",		618,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi1",		619,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi2",		620,	R8A779G0_CLK_MSO),
-- 
2.39.1

