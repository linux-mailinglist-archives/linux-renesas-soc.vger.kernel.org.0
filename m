Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BDD762C7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 09:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjGZHFC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 03:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjGZHEY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 03:04:24 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D983A87
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 00:02:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98377c5d53eso1005268866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 00:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690354966; x=1690959766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YecLEf8qZprCEU7ERZ9Wc6P5u7z1nwmeCE8OvgcZdt0=;
        b=x1if1as6W99o+6uXX8NnHX/RMLQ27OspYAaqhE7gnduJ8Sso/MCinYGaz2wiW1O6Xs
         u0MkL+1SOr5L1h03uxgGMksTZ3TkqAg0pSgFkRKAP8CPai9nRNf7yQ5/YTmM/SmDie/W
         X7GPSGAJZ6SZ6uR8kEvU7siFKJdYJfMR1ZQsF8EAhnLUl24I/mB8wtLPmuDO0Czkecom
         ylQlnDKYvKg7iRJwcDO0rRu/EoJ9OQOONPEM+bQflXXdJ/iHO009pKZ+L/sYyt4TB20w
         G0wix0WrIHcqBnsYvp1tmRD3KofOSV6iBwQP2FvY0A/jxXu9a2fOI52BPxyMUMmFPZ27
         hwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690354966; x=1690959766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YecLEf8qZprCEU7ERZ9Wc6P5u7z1nwmeCE8OvgcZdt0=;
        b=XITlM7RDE2pKdNhDobLs8ObQ34yl9Gn9qzoZhyRQjI2YW60mGRlUWYu/U1V+JOxCIM
         kBu+VYuqsRpnJchvXhqsTG9ys5b0Yy4J4LPruwl9TC3S21k9mym58QvaQb/Gntlgx/Ao
         PT1m+f1FKsKOhHABoAAp5s9hCV87o09Z3ap3gGG/ColCT9WM/TUA65vjbJe/RM7EqBoj
         FMuKR1XJ5MoSMW1zqFbI3ayZNHf4594EJtZY/UMCvw8qxPU7PFy4Pe7baGNxRIaynyAO
         vGv8k+U8M4upW/pnLYP48xO0bheEDMSetg4F4MqD6acc2n/oT2/EWVsrm8X+zTpTPogg
         cYKw==
X-Gm-Message-State: ABy/qLZ7iHh0VijEcWjBzIpyRo/WBQXWUdLVCI50wzrb09Jw0i3GIlQg
        OS5Pg6d+k4HS7ERr2ca3sxH59g==
X-Google-Smtp-Source: APBJJlHvdJs2n1j0lsHu5vxNDRHqv8G7d/t6TqS0C9zPnPwi9a+WpMhy76XTDv1NOzIDpeFfDB0pGg==
X-Received: by 2002:a17:906:539a:b0:994:5396:e32c with SMTP id g26-20020a170906539a00b009945396e32cmr880369ejo.3.1690354966393;
        Wed, 26 Jul 2023 00:02:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id si2-20020a170906cec200b0099304c10fd3sm9180093ejb.196.2023.07.26.00.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:02:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] AMR: dts: renesas: r8a7740-armadillo: switch to enable-gpios
Date:   Wed, 26 Jul 2023 09:02:41 +0200
Message-Id: <20230726070241.103545-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The recommended name for enable GPIOs property in regulator-gpio is
"enable-gpios".  This is also required by bindings:

  r8a7740-armadillo800eva.dtb: regulator-vccq-sdhi0: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index fa09295052c6..d21e00e1f401 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -58,7 +58,7 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_sdhi0>;
 
-		enable-gpio = <&pfc 74 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&pfc 74 GPIO_ACTIVE_HIGH>;
 		gpios = <&pfc 17 GPIO_ACTIVE_HIGH>;
 		states = <3300000 0>, <1800000 1>;
 
-- 
2.34.1

