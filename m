Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F43B7B2BDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 07:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjI2Fmy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 01:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjI2FmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 01:42:03 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1986C1FE2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:40:11 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so1888109666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695966010; x=1696570810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiMN4iAomSYzsnYh4FbTjlQllZnWEOpw/8D+l1h2fjk=;
        b=IKHnYsRNb2uS9QIZlGeNzGeL2A5vlkisyd1BDqeeo+ousm5EUVOedPu1v0w47FOCDZ
         1yWUKeqfVPreAwTGQcNiH8+BcpDsk5Kj9YfRQTrRMldK+N9y1yVmHbjU1D6Y8i0gpzKr
         pPvEbwr5WyDlLnJkb9KzLKPKEbib2jrvW1y5eQ0jW4Z3ThezfSMxckuffbtpq+S1uNeb
         4KxpeA89UNfFqphSKCSHfoE0wPgohTLn4ohhnyFDcxqUqO//ZDwGQHt37avq8qWCkmFh
         xpmyeTyzloXFMpYpoVuX018nhggxQnSq3MS/vCCU8CvvlPv+LSmiIWtj7UIK+/gYJfJi
         6WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695966010; x=1696570810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiMN4iAomSYzsnYh4FbTjlQllZnWEOpw/8D+l1h2fjk=;
        b=tVkXQgfHC08b5vntuGzr/WnyP/prST+GMDM56qbT2prSfXFBtVr46yThdavqqWr47o
         5m1LpB1uQezkD7befGqJ9te3DZR1kWexAJtCUSLSiLuXwxewI5Erzk9BotKpuTeoTzni
         fgEMD4M02H9+CsGQZmNSNabQaQg7DZR2rzRzMOWRUHgZMgyYP3yMgz7Gul3N0oN4Et1D
         tdhLKJpZP1zsZ7L48S2ZI/nBztIWQWdy3fkuWHLuSsfm/vjsEBIQfS+SnENwubrM7mxS
         PMKowoEIpxYyDh8R3NZstPyHd7aIJatUCmYNP3PdiIIeOU37Jio8uUNfuv7Y6auvGJUu
         zT9A==
X-Gm-Message-State: AOJu0Yyk1CQVj0zeONRUTVcFA2/tliPzMD4Nf1b7GO0kL3qb5WUQz7iP
        0nZuYYQRIJ5/DLf4L7ObFTvNrw==
X-Google-Smtp-Source: AGHT+IFYJ0/ox1lCTBKrCVFvWl/loERm0gAT3y1iJHmEDHCLHh/UA5xT59zUFo3GjLMZmuC4oVX4QQ==
X-Received: by 2002:a17:906:3116:b0:9ae:546b:786b with SMTP id 22-20020a170906311600b009ae546b786bmr2541209ejx.33.1695966010310;
        Thu, 28 Sep 2023 22:40:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:40:09 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 25/28] arm64: dts: renesas: rzg3s-smarc: add initial device tree for RZ SMARC Carrier-II Board
Date:   Fri, 29 Sep 2023 08:39:12 +0300
Message-Id: <20230929053915.1530607-26-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add initial device tree for RZ SMARC Carrier-II. At the moment it
contains only serial interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- inversed the pin naming

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
new file mode 100644
index 000000000000..e7073a09ed2e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ SMARC Carrier-II Board.
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/ {
+	aliases {
+		serial0 = &scif0;
+	};
+};
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
+			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
+	};
+};
+
+&scif0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif0_pins>;
+	status = "okay";
+};
-- 
2.39.2

