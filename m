Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A82B56493B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Jul 2022 20:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbiGCSfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 14:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbiGCSfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 14:35:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BA829F
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 11:35:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e12so12267457lfr.6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8QUvOhBUv7NM1caBCMln63UZ/qhI+tm9OURX6FeT+c=;
        b=XjI7202iDOzMcgm9sNfpq5DpAEj//T6SC3rar0x+T0Bfal7AI9JkRg59OL+a/y3BO7
         Tczybyu7rP384NAF0ts3WGs9RXgiv4yVe2kvuoOWF9JXRo3h0IpeUeEFM3mVNyA7J/v/
         E8Om1OhmGuWld2U0QB15EABy5is5/2Fp8vP4EILi0yYKB1mcOqj2xi3MwN2417zW17n6
         Wus5a5RWLz9T5y73aCrp6tco5n371Vlb3NxB/xLP67mCslK3tIRaMNjY8WAfvw0jAGfZ
         cuXVbfxdY304Lu2UuDo4iYe5+FTj1/S3WfS4/kNYRBLANwBaAaswutudBdKJmPT5x0eM
         8ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8QUvOhBUv7NM1caBCMln63UZ/qhI+tm9OURX6FeT+c=;
        b=ih90wAsTSyLUbjfzBsFe0hsLca9qEhFMK6xPMT/4sJjhWRkcK0rArBQLQPh71Txc05
         ZChZTJ7kNTXBUlaSa4yAfNeRs3Hh0H3Zl4+3cC1uwLDSTJH6eOCzfVYKQhMwX6bVQ4eY
         lt8na8mUIfWlQLTwnyhu4DnW8W7wX0KalMc+6uXUlinY/K3+NwIXChd3ThDs0eLYbBfy
         ZqgRSer/4lzcaxU9x0h/b6a+gURkshDGPVpX1DlUDBXlwByUwG+Mc8aEQgNnQ2mOkLFK
         Xc+mGUCDNsOd6nE/KLkRa/OfUkoN/PsR0JQOnzMKnb8J4Bl76MXpgZ14i8Se3Hpc0mqZ
         ecGg==
X-Gm-Message-State: AJIora+kW2K1h1gxNTwiNyJr3JdgXeWGc5T78M+8bwKCRMs4dmrNmGxl
        riGq4ph7kz8Tk3619KdXjWmwqw==
X-Google-Smtp-Source: AGRyM1vu3qVKOM0EflH555LtgDiNznAPRu0Bw1EvtfScWtqn9Rom9y7O+809eJuWL4aE9rJK4GDUAg==
X-Received: by 2002:a05:6512:281a:b0:47f:aea3:357e with SMTP id cf26-20020a056512281a00b0047faea3357emr16799049lfb.450.1656873318236;
        Sun, 03 Jul 2022 11:35:18 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n3-20020a056512310300b0047960b68eb5sm2020412lfb.40.2022.07.03.11.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 11:35:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] dt-bindings: hwinfo: group devices and add s5pv210-chipid
Date:   Sun,  3 Jul 2022 20:34:47 +0200
Message-Id: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

As suggested by Rob [1], I organized a bit bindings for SoC devices having
similar purpose - chip identification.

These sometimes are put under nvmem directory, although in that case the
purpose is usually broader than just chipid.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: hwinfo: group Chip ID-like devices
  dt-bindings: hwinfo: samsung,s5pv210-chipid: add S5PV210 ChipID

 .../{soc/renesas => hwinfo}/renesas,prr.yaml  |  2 +-
 .../samsung,exynos-chipid.yaml}               |  2 +-
 .../hwinfo/samsung,s5pv210-chipid.yaml        | 30 +++++++++++++++++++
 .../ti,k3-socinfo.yaml}                       |  2 +-
 MAINTAINERS                                   |  3 ++
 5 files changed, 36 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/{soc/renesas => hwinfo}/renesas,prr.yaml (92%)
 rename Documentation/devicetree/bindings/{soc/samsung/exynos-chipid.yaml => hwinfo/samsung,exynos-chipid.yaml} (92%)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/samsung,s5pv210-chipid.yaml
 rename Documentation/devicetree/bindings/{soc/ti/k3-socinfo.yaml => hwinfo/ti,k3-socinfo.yaml} (92%)

-- 
2.34.1

