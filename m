Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D497F0C69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 08:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjKTHCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 02:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbjKTHCV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 02:02:21 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618B010E0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:45 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-407da05f05aso11532565e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463703; x=1701068503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj4K1pfoFmhhsoRQVm6vixpVPFIpo1qe9oMsVe2v1kc=;
        b=lPhjqlFP2QiKu60ymedE1u3UuvkYV209Ysj1Lp2GqEUEcTm+8s0C+DufIvh/X8T8KA
         rCu/5ZVt0axOenEG93fsCsUiOVn8hxAu1wxSkNdoq8xbGOiTN8zf3BabR3L6gdjCdsRp
         sm8Q57mYhssWG4s0CU/J7NZs0om3mCRkWRru4DMJTaEZHO9pTiHsGKBXPAPMQ8tt/952
         4LZ9RPwF+zIxT4e4jc8dchqiGCi+cPRwui3RAIXACwdf76qipoyXtYtArQ6ZSbrJlU9p
         9PoMbJR7wKSbwLuKb85Qg0gFrtt6PZRqjepFkmM8eRrBtr25VUmpoa09GFIt2Ve77kxa
         cSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463703; x=1701068503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj4K1pfoFmhhsoRQVm6vixpVPFIpo1qe9oMsVe2v1kc=;
        b=bS9CLfrsUlmkB54knLAa4HEzCTY95IkbGvUsnrMwwb+9lrVYU+FVebOpo34c3xq1a4
         NGEyPnKUyxUn0pkyTsaTx3SMnsvxxLSmZ8KTkOee1MCPPP6S/wWcu9H3TZ9HIprJezIx
         of4MKk4slyelCgKW2fgMVkD4kPL20Oaj9Hl57ViqeOrf97HVLpsVVqIowAjvHWZaU3H4
         7ml+iWabEv2wjD0gvKPf19bv6E0vI7WMUfKE1zMeAZXSICtk630wzGsuDxx6Ql9qKGWC
         qU9wxPFyzFrph4DxVXdPXMZBvK7sJXv8HDZLd1Ste9JPmnGNAPaEbrmu0KNsTlkCcGeo
         kg/w==
X-Gm-Message-State: AOJu0YxxnjMyNpLaa7hdWqFr5vUzV/sZNTssRbDn67Dvxe7Vmig0OT2A
        czVY1cU0faZWVgjhb7WJ647eqw==
X-Google-Smtp-Source: AGHT+IFbHUCjfCJLgApfU02GbEBAEEDTn2cUfzkYAcqxgH3UIdeUTzC7eHrWRIOHe/xLOqhqenD/bA==
X-Received: by 2002:adf:fd4a:0:b0:32f:7cea:2ea2 with SMTP id h10-20020adffd4a000000b0032f7cea2ea2mr4049149wrs.17.1700463703709;
        Sun, 19 Nov 2023 23:01:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:43 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@armlinux.org.uk, geert+renesas@glider.be,
        magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de,
        m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com,
        broonie@kernel.org, alexander.stein@ew.tq-group.com,
        eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, claudiu.beznea@tuxon.dev,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/14] arm: multi_v7_defconfig: Enable CONFIG_RAVB
Date:   Mon, 20 Nov 2023 09:00:24 +0200
Message-Id: <20231120070024.4079344-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

ravb driver is used by RZ/G1H. Enable it in multi_v7_defconfig.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 10fd74bf85f9..9a04564566a7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -272,6 +272,7 @@ CONFIG_KS8851=y
 CONFIG_LAN966X_SWITCH=m
 CONFIG_R8169=y
 CONFIG_SH_ETH=y
+CONFIG_RAVB=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_STMMAC_ETH=y
-- 
2.39.2

