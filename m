Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B098579C502
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 06:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjILEwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Sep 2023 00:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjILEw3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2023 00:52:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CA5E6C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 21:52:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-500913779f5so8912575e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 21:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494343; x=1695099143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbtDbdKWy7sknPLbBivPbrazuM+8hh1NSsaSqosYDOg=;
        b=qstQMKjfu3xj/Y1lVU6/GeD0Eu4SXyXOQl19lGGRHnDDdoTZO0hOeHsrdglroQ7lOG
         +4Hs6YYt0FpmnU52Xe/YBRi+Nqs0vfefdyrlHBEz+PJKTdhZGVUiFUfTgb5W/euQG1ou
         lz97TvRRhWTBYYv8ytIv/imO1PaNvP3QQZ6y7buFSKcxRIpv8gOXxe/nUUBR24aGkV3g
         CoUN6Zo0yQZqI4v9i+abPQXlxCGblGVOxUN8sOTPdmzH8uALmx24mnoVx4HPT3qRkHOF
         zT8M3/L+tE0Ut5W6qt7+9ezqQOCVaD4seHTxpojxGjDNma4BvINP23H+rjAE3JMG6cCk
         nM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494343; x=1695099143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbtDbdKWy7sknPLbBivPbrazuM+8hh1NSsaSqosYDOg=;
        b=iTr8LINby8fPp60NeDzi9ED7jxmBmmUBzJJPnJrrF4e43OSUrnxxSfWXWQkK0bc1Xm
         Dg8QXXUbMG52BV1vyurwZYMEfTcMi9G6cqvjHM0KTiXhPPGJ0gKuia8KavZ/TpVeiFMp
         u5r1hJLl8xUWZ1irXpGSlC6KAPRAry8A2DiUYpWuEpSpcogPB1OvHsRcOHk2hmZKbaiK
         OUqZXuSDyiTQj7afb7urXN3Ih2b+0gl6k2NWx0oCcPlKMZflYOf9hw5biAuqSa4cXVOQ
         IiK/5VlfmHE7VEeAh4UrHFGkeZg1Jj2xhWM3YkDQKYXY/gyBJo1nMwMNlbOd7J8YDSGl
         eGRg==
X-Gm-Message-State: AOJu0Yzpezb2aHGPG6+Cd2NZSRERo+XNZjca32At3Q8cBQIPZzwA8+cr
        vXzHmdApVzP0FeMSfMeKzac7HA==
X-Google-Smtp-Source: AGHT+IGXUW/JoTKle/AYEXdn1asCeC3YBoZs7TFHp20S2YoJe6qoMfnBsP4ELeziZ8//2c2LaNXEYg==
X-Received: by 2002:a05:6512:3d21:b0:4fb:8616:7a03 with SMTP id d33-20020a0565123d2100b004fb86167a03mr12938183lfv.4.1694494343160;
        Mon, 11 Sep 2023 21:52:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:22 -0700 (PDT)
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
Subject: [PATCH 03/37] dt-bindings: soc: renesas: renesas,rzg2l-sysc: document RZ/G3S SoC
Date:   Tue, 12 Sep 2023 07:51:23 +0300
Message-Id: <20230912045157.177966-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document RZ/G3S (R9A08G045) SYSC bindings. The SYSC block found on the
RZ/G3S SoC is similar to one found on the RZ/G2UL.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
index e52e176d8cb3..4386b2c3fa4d 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
@@ -23,6 +23,7 @@ properties:
       - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
       - renesas,r9a07g044-sysc # RZ/G2{L,LC}
       - renesas,r9a07g054-sysc # RZ/V2L
+      - renesas,r9a08g045-sysc # RZ/G3S
 
   reg:
     maxItems: 1
-- 
2.39.2

