Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA667F0DE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 09:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjKTIqY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 03:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjKTIqX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 03:46:23 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80909A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:18 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507bd644a96so5690722e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700469977; x=1701074777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOUwHQ3tIEPqVxD003y/axANZjYq9yXWHmQwKicRxv4=;
        b=P92POmTiejhtLFaKk/Zb3U4EsmqIV2OndDcFEc7nNsB0JqJMB/HCB7o9MspiH5oH+m
         O5YNOXGGjvXw0wEn++AanepKVZckI5GIlWm3FyFQkVkBxmYLY3Jw1y259T+7+PXK/RLk
         BiSRwOnOYFoVV/p6IQnGJc74iDvOuk6HqDxJ63OFu3kyZoumVPX2mGeWirDJOD8CXLMV
         ooMJXRlK0fO7nOHhfd+xpknj4enkjPTTQDzIPxEp8L7GvHrjsJQirnpw1Azem4hESCKi
         0qh3Upwwz7629XZCVt4cB37lJWpe1X9E+ICzR0sqVpTz10wRhjPCMob+2IznSwg6IHQ1
         5RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469977; x=1701074777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOUwHQ3tIEPqVxD003y/axANZjYq9yXWHmQwKicRxv4=;
        b=G6FTlVU4+ERjdLG5CAjV/vpOQxbYRvRC2iHQHj+XIwFusn90AAHW8qG/PCUShxT9Lf
         2pdqaKGdGl7nzQea39m8HUkPYFqGmDfW99Qs4FzXIP3jQiin9s1sEYgCw9/nW5QY0AkV
         tWZc126nKN3OIAbeg0tmwZ8vFmWphEOqXkAnVFTupZtOgUDy0X1p3MEOguYB4nFfFqbM
         6k//gjEk3yLF3fsIMkZoA6T3MC5Fm41Xk0l8IHcKmeKD4EnBtkk+RCMFqP1DxqfXXMzt
         EscfV0FBXDmY3qCpmT8rfWNHyrB7ybpIxo4zbKvdkUhqOJL+i5nleQPgriouePebWc+5
         Xb9Q==
X-Gm-Message-State: AOJu0Yz9QkGJHBtGesUv/alWhku3/AgJ1L5WzyibrZV1AGCbjsn0xENv
        +PzzdaUpqnQaeIlyCTpEdzMkJg==
X-Google-Smtp-Source: AGHT+IGA8m5mvMi46rvFWOb3dW/RQ2+4PUYMypdqU5+qjOpHXpylOvvBjm42GzDhIUkn/YKsVRHuSA==
X-Received: by 2002:ac2:549c:0:b0:507:b935:9f5f with SMTP id t28-20020ac2549c000000b00507b9359f5fmr5263073lfk.24.1700469976750;
        Mon, 20 Nov 2023 00:46:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d45c8000000b003142e438e8csm10435267wrs.26.2023.11.20.00.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:46:16 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, p.zabel@pengutronix.de,
        yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
        wsa+renesas@sang-engineering.com, biju.das.jz@bp.renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        sergei.shtylyov@cogentembedded.com,
        mitsuhiro.kimura.kc@renesas.com, masaru.nagai.vx@renesas.com
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/13] net: ravb: Add suspend to RAM and runtime PM support for RZ/G3S
Date:   Mon, 20 Nov 2023 10:45:53 +0200
Message-Id: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds suspend to RAM and runtime PM support for Ethernet
IP available on RZ/G3S (R9A08G045) SoC.

Along with it series contains preparatory fixes and cleanups.

Thank you,
Claudiu Beznea

Claudiu Beznea (13):
  net: ravb: Check return value of reset_control_deassert()
  net: ravb: Use pm_runtime_resume_and_get()
  net: ravb: Make write access to CXR35 first before accessing other
    EMAC registers
  net: ravb: Start TX queues after HW initialization succeeded
  net: ravb: Stop DMA in case of failures on ravb_open()
  net: ravb: Let IP specific receive function to interrogate descriptors
  net: ravb: Rely on PM domain to enable gptp_clk
  net: ravb: Rely on PM domain to enable refclk
  net: ravb: Make reset controller support mandatory
  net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and
    pm_ptr()
  net: ravb: Use tabs instead of spaces
  net: ravb: Assert/deassert reset on suspend/resume
  net: ravb: Add runtime PM support

 drivers/net/ethernet/renesas/ravb.h      |   2 +
 drivers/net/ethernet/renesas/ravb_main.c | 220 ++++++++++++++++-------
 2 files changed, 160 insertions(+), 62 deletions(-)

-- 
2.39.2

