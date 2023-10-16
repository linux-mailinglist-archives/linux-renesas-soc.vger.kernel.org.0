Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C0E7CA60C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 12:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjJPKyB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 06:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjJPKyA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 06:54:00 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A564883
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 03:53:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so665879066b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697453637; x=1698058437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxNTh+uyDKLWsmxupnWSc6U2Hic2Ni63Y8zI4pPRJak=;
        b=WN9CMfWCAYW3W0yCYxM1fL9tXMmiHKT6I2wWi0B7bvuNnLZCZmxUK4aMdud5JBvMo2
         Ngl7oVQAGv/tKBHcMBqZhZgfyllsBiIaJ91FXWNvIJxFkyfCXyaOdIhMAv8cdYSTdLJo
         MsigUpBmgcgAsNym3+5Oplk6bBDeONvYHqdLAr1vruP3ibEDOfeect7TMARi5r93Yoh2
         ENwldK9++/gPhbB7EvvqQXvFI2KajhYx+FAC0ehIytmWvHe+IwBg+6Vohjc9Bho9EMzs
         C6ZSOK3R9YRmR1vzQFTg+HLl59hkIeRGtqhkxTe+JFlZQd8ZnRSgO9rz1dUxzGs3+G/W
         zjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453637; x=1698058437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxNTh+uyDKLWsmxupnWSc6U2Hic2Ni63Y8zI4pPRJak=;
        b=WsZU+yBIYgjOnqJZ0IGqE/LDQJhCyze1rihjIuaLic90gqpF7tpaYqVHj5iEomF4Sx
         Pg3k2mK+KBM0YrfmLe0G4+aHzsThYa4s7HZAviChZ2k8puS+U1bRlVh0/CxNmx8hoCT5
         FFW/SCrZkMzga2eh8hAD8zYB6HmQv/taQgfSdmE6LVLR5j6njkvRQ/K/Oad7O+7urW1V
         7IHDVCaDcNa18/GdIVBqtqSB77ocuH4NTf778Ljdymq5sDBcAZCaqBRgPOddhFccs7kD
         XCb8bb6nhmE6vNguMzdkMrLw7Z6lPgHfo7KPzzRmwxswUvTL3uF9lyM72xomlxTrtyOE
         NV8Q==
X-Gm-Message-State: AOJu0Yx6zlponZYT9LyEIu2ap7Rm7mP+8huYj1HCJCC6voqWw0CVfz0a
        5b/E0A2GCaAgvNb/0W0s1HNo3A==
X-Google-Smtp-Source: AGHT+IGbVnaMTAqevmmvuacn2EkANYMZ2bGIY2fOygD1PBvhtQX9uA7CkemAj8Augtl4aoePWVjCGQ==
X-Received: by 2002:a17:907:e86:b0:9bf:1142:4361 with SMTP id ho6-20020a1709070e8600b009bf11424361mr5137635ejc.10.1697453637002;
        Mon, 16 Oct 2023 03:53:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090651c200b009a5f7fb51dcsm3818126ejk.42.2023.10.16.03.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 03:53:55 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add SDHI1 and SDHI2 for RZ/G3S
Date:   Mon, 16 Oct 2023 13:53:42 +0300
Message-Id: <20231016105344.294096-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series enables Renesas RZ/G3S (R9A08G045) SDHI1 and SDHI2.
SDHI1 is connected to a uSD interface available on Smarc-II carrier
board while SDHI2 is connected to a uSD interface available on
RZ/G3S Smarc Module (SoM).

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20231006103959.197485-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v2:
- addressed review comments
- remove patches from series that were already integrated

Claudiu Beznea (2):
  arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
  arm64: dts: renesas: rzg3s-smarc: Enable SDHI1

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 49 ++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 65 +++++++++++++++++++
 2 files changed, 114 insertions(+)

-- 
2.39.2

