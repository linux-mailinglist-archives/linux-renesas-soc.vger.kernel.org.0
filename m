Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0925C79C5FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 06:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjILE5S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Sep 2023 00:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjILE4c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2023 00:56:32 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A65530C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 21:53:34 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52f31fb26e2so3131856a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 21:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494413; x=1695099213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n7YThP1Pltmyq4edaZuVaHz4mWlqiOuma7OTx2zERo=;
        b=Y96+ykaxR8m3gCEC7kcxEqChkPv3yYAPmLvRy7jjV2dF0bWyq1KEGs/s2IgQeH4NA1
         RszZPisosN/9k/i428LBXFlVkQMYsbt5xEB76FNb3PW02aI2xNDiJocO0EwU2meH+Vtp
         BFV2zR6AY7UDWqW6jtIT4LpEBRrzUsyDWGT2J4EFMpPzEe5AMjH/nn7h/vRH218XVRVB
         qLrxtp21DY9KJuOxHC08iLmznq8ZehMtQ/P2A/1KO3D5yjGUZgTKMR/ZyYAjEX3eUzMe
         5lKrkd51rR9NghxCTnZdzr8DTBce1siprfYQmwUDgh8gDlnzQZP0hi0cfdoyw6b72X8l
         uogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494413; x=1695099213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n7YThP1Pltmyq4edaZuVaHz4mWlqiOuma7OTx2zERo=;
        b=xHm3YlrABbtIfMzXwVxxN7/Ybs0hSWWthmdgsSFF3zlV/jFY8+FX/EOaNofwFtJEUj
         n5ny94fvtgRKn9b1kOXJkigYECRxYaNw0GZNkJc0tLDDrRDc4/j2lNLKJjQK0gpXI72Z
         twp5eAjy6JZ7H54NeWNjbqgL7j3ZJ6ncPvINAEkM95PH+xmCWjXeSf4xMolTLEXGYJxQ
         eL6uKomfv1dSyv2uWiMB/HDLiZBWsRb9k5WWU1Xx6ygmHq7hjN0R3tHNhikdyCGqaQDD
         vjKeswWiAyAcgk2fSS1F4zrZSmka8GMjHjkD4KcZIkPr3SFQ7GFomRWzd329lwb4kL/C
         Ie5Q==
X-Gm-Message-State: AOJu0YzBvZsSA+zyJtC8ICmdEOg9UHWMxB805QINTWpq8m4rDKIbIPHK
        296ZOgbcoq7cQVf5d9Ha/kfIyg==
X-Google-Smtp-Source: AGHT+IE4+aHEa9EXViBj8JUa5dT/DvO7i/hmQPzgNykizZhWvsOZn8AdTIStjI7MBIzcpfdOo5ENgg==
X-Received: by 2002:a05:6402:759:b0:52e:24fd:50f4 with SMTP id p25-20020a056402075900b0052e24fd50f4mr9040084edy.18.1694494413001;
        Mon, 11 Sep 2023 21:53:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:53:32 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 37/37] arm64: defconfig: enable RZ/G3S (R9A08G045) SoC
Date:   Tue, 12 Sep 2023 07:51:57 +0300
Message-Id: <20230912045157.177966-38-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable config flag for Renesas RZ/G3S (R9A08G045) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..f597ae20959c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1335,6 +1335,7 @@ CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R9A07G043=y
 CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
+CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
-- 
2.39.2

