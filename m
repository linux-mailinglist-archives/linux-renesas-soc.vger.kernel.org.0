Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19CA87B2B42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 07:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjI2Fj1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 01:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjI2FjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 01:39:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE006195
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:22 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-534848725e8so6794750a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965961; x=1696570761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK/3dVXqgg1IkWVSTABE0q0pHwVE+qQyK/K/05HOKqI=;
        b=MP94yn5lefcYCv1t7k58ixpP7BpsEZ+B6+z5fukqsaO9/gR367HwesPsK+3bD6ABLg
         yyDzTvdFZMTUT5fkUsYcOvYwXekCoNC+ihUZyZr8zS0tOfBGK/icABHEDFUCy+d3pVC/
         awXFA5OZWV6IrcmgploK2OKU03GFbi5vjxpv4xQCx+W3vi6K9zWYSmlpx3oB47OSzL/Q
         Lu/HMZ/UV8Zuq+2m1u3QSJIphz7VcQ9Y2SG46BP2U50sdCTHrv44fRvzCIFcPn6Ns5p3
         qdb0/64XTfXbqqc3cY+2ROiTTXRbcvVqL+JkjEzhxRtbyZku+xttoj9JECo+FZtqL6bP
         I9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965961; x=1696570761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK/3dVXqgg1IkWVSTABE0q0pHwVE+qQyK/K/05HOKqI=;
        b=EZlubtwj7P1uFC0dz4zW+UWWeMCW09hWdxxsF6048Ui66txafRyupIhJ+DZtGKvN9J
         Weqm8DjUjCI5PAqi+RPd9vWS3UUxVHm6PGRoVrmiOw5wP8TkqRFZzRtNraUc/eTIBGAQ
         jovz8DiNgDe0O8mtPuB9D0g53r6K+wyRsHshqTeVNkdAGWR3nJmGGXMfBVWNz0ASsRiM
         2/MY3AtfLH8+x9BKDMNtcAndY/4YfeYQ62GjacvJuJEHjX2VzTn/EzWAdPoRoot0IsS0
         VWVs/CxauSyooXZA1K8eYwzyFb4nRQQvaW081LnE7ARIe2zayYD6TiHn1h1Tc+LYQK2e
         kpmA==
X-Gm-Message-State: AOJu0Yy4MIvslN0Rny5X0I4xYtfwy9hTmi7NKbsaJDUTQkCYTmtvRE4x
        skogmXFOtP7AJ80dWhveVxNIIQ==
X-Google-Smtp-Source: AGHT+IGhPIW0cOY4Oj0jbr8Hz4FWOAplpVyKIsi0LBN3q0xMZGidv8zfi4b0ooumLJKfQ/scVcl5gg==
X-Received: by 2002:a17:906:3109:b0:9b2:9d6f:2949 with SMTP id 9-20020a170906310900b009b29d6f2949mr2864815ejx.57.1695965961447;
        Thu, 28 Sep 2023 22:39:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:20 -0700 (PDT)
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
Subject: [PATCH v2 01/28] dt-bindings: serial: renesas,scif: document r9a08g045 support
Date:   Fri, 29 Sep 2023 08:38:48 +0300
Message-Id: <20230929053915.1530607-2-claudiu.beznea@bp.renesas.com>
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

Document support for the Serial Communication Interface with FIFO (SCIF)
available in the Renesas RZ/G3S (R9A08G045) SoC. SCIF interface in
Renesas RZ/G3S is similar to the one available in RZ/G2L.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 99030fc18c45..4610a5bd580c 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
               - renesas,scif-r9a07g054      # RZ/V2L
+              - renesas,scif-r9a08g045      # RZ/G3S
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
   reg:
-- 
2.39.2

