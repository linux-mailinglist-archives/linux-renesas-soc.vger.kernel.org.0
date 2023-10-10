Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C407BFD60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjJJN1P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjJJN1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:27:13 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C618FB4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:27:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-538e8eca9c1so9870170a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696944429; x=1697549229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRqYip+DIiJaVW5NA+IlRQb69v9BKma6ktZWSJUs31g=;
        b=e7fsV5cWZ4dNhc8TwNHNPHxniY3pbWtaQi/HfUB9VpE7h3kdHbm668FpdOpq3QW+7t
         LlRq0VFtSKo62i+xZAr3+eg+8qlBKLcx8ZRnSUghIBChT3/E89MifZDwsHszdmvkQ01c
         uv3O6Frd4+6AkRYvuNOozFs3MaE+dQg1xNBPrb4ugorS4kEtldWPuBqH3acRXw8WPVwL
         dVcyjEuuJBRGz3Mb0sJQZ86Gz24Mw8+tR60rGcP/dXhNd2vVWzyieeQ2L5RlrGOUwSP7
         g7MUFqLW7QbeINZsMNlJYK/Jewy4NFxysrlZ8Dyp45Hz/1iuLeSngbwSv/Iht2vz6CLs
         busQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944429; x=1697549229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRqYip+DIiJaVW5NA+IlRQb69v9BKma6ktZWSJUs31g=;
        b=ldO6JY+zs3xHpt6Wz0Qt/4sFz5dFV0IGKBbh6mXQtrvhAm5l3VA1Xgg/PCs2pDFi4W
         gElgNSrkExqBTge6iHWxrG5mbAqAu0NwP9xHsaFR1uBJ8W5ZgaV9F9BqIs6fkRytPPeS
         3jC510hN4DOZR+RFNHo21QBuMxdIZI2zD+O3sSDuZxvGdZ5HJDPNAtuxetDhqfl71LQD
         k3ByczPi70chqNkw7zLUYEtMTnboeGPwcEOvDtLLmf4Cf2Tg8BqWGgr6oh7Z99Nkxras
         usPWq5R44jhzZJIYU6jTSxQkbEgauBAFSCzku5j9dpPhEZUjGJsYm1miCGioidRgptaC
         clxA==
X-Gm-Message-State: AOJu0Yz3e5bNxWULTdOQrHv2sOsBaJdjllWEcEjdOLSnk95osn6BiYgd
        eI2fO0JEPqDdQI31o/bIaPl36g==
X-Google-Smtp-Source: AGHT+IF32yzeTQOTzp2gkm5QY+PEtK4uHJc1XkGUNanybiZ8Mmksq6ha1acBwygIYrRvQljZDiVYMw==
X-Received: by 2002:a17:906:18b1:b0:9ba:8ed:eab8 with SMTP id c17-20020a17090618b100b009ba08edeab8mr8202128ejf.45.1696944429242;
        Tue, 10 Oct 2023 06:27:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709064ed000b0099bd0b5a2bcsm8526578ejv.101.2023.10.10.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:27:08 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/6] arm64: dts: renesas: Add SDHI1 and SDHI2 for RZ/G3S
Date:   Tue, 10 Oct 2023 16:26:55 +0300
Message-Id: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series enables Renesas RZ/G3S (R9A08G045) SDHI1 and SDHI2 clocks and
resets and adds proper DT entries. SDHI1 is connected to a uSD interface
available on Smarc-II carrier board while SDHI2 is connected to a
uSD interface available on RZ/G3S Smarc Module (SoM).

Along with SDHI1 and SDHI2 support I've added 2 small cleanup patches
(patch 1/6 and 6/6).

Please not that series is based on patches at [1].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20231006103959.197485-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  clk: renesas: rzg2l: Use %x format specifier to print CLK_ON_R()
  clk: renesas: r9a08g045: Add clock and reset support for SDHI1 and
    SDHI2
  arm64: dts: renesas: r9a08g045: Add nodes for SDHI1 and SDHI2
  arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
  arm64: dts: renesas: rzg3s-smarc: Enable SDHI1
  arm64: dts: renesas: rzg3s: Fix dtbs_check

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 31 +++++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 62 ++++++++++++++++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 66 +++++++++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c           | 34 ++++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |  2 +-
 5 files changed, 193 insertions(+), 2 deletions(-)

-- 
2.39.2

