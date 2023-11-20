Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7677F0C45
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 08:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjKTHCI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 02:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjKTHBu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 02:01:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0075171F
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:30 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083f613272so15913865e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463689; x=1701068489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf6nqUoubfvF4vGSjIN2fyq3fdRNvhqZWqSw1FrX9lg=;
        b=M4uAiFT6YUuDV/y0uCUdOzfcYkM0BOPWxND9Zsvj5w+dWvtLStoWToeu/qnyvw9EyQ
         FYeodN/JdPpi2wvLND7BnmEGmCtLaOsFAfUW4J/bdbOvizCtsfjHsruheAnoA8F+xJcj
         51eE3pWRllev+b0ZrQWwq13reJt30rd3govBEQYqWJRziI0PlIEGD61H9b5q6UjDmIcw
         5AzqxPoZkyrV5QTT/c7LtpcT88v3c3sE55mVk3aGkZNSOeQ/eJRkMTReGzJp7us9nJZw
         6m76igSsVYXT/nFlFG7yWp1Z9Tuv4XOYcAhNKEf6HBd30dkxPjIP162P4SOZkS+CSeRb
         0hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463689; x=1701068489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf6nqUoubfvF4vGSjIN2fyq3fdRNvhqZWqSw1FrX9lg=;
        b=tWvyZwTJpfzQcsoxnUsrkiJMwR9JkSM57DAsz5ewXycnj7yJ8rbyzZ5nl+squKXqi1
         Xi+0qvqp0hRJRU/vyfkdNCUH4OLHvkJKscVyfFi0QkKWhz5+KCfRZTt4q/7IHNOhwMU4
         fBTie4z2gMi4VlM89d3Gx943+AW3EAuXIYtDPKPAnBtbx9kJbMb837+tRqRTGixkCqH4
         cfVdrVso3shUBSSUJYjUEk1HHScWGxJog+hwbqjqq22VK0DFA8WwKQUvnJKfFkaWAMt3
         SBo9nMAb/pPNS/pBgwVUwyQBt9VZTk33Ls1I7xNtdcZCVqSB8xGlS0XgV1CgJqTeLg9O
         yJMg==
X-Gm-Message-State: AOJu0YxYHBjgE3M9Ex050jyCZ5g33dJyMpJi7QBXAsA/rl0/mKKlQzZ2
        3Rvt1mV/D+tMgAKKpo+xVPaYPw==
X-Google-Smtp-Source: AGHT+IEYA480uU3PYmOPPZkYag60VVo3otAt6tbJovUushdq8KM2+SzL0I4iXX1GYwhzP5W6ORWA7w==
X-Received: by 2002:a5d:5f89:0:b0:32f:7bf6:db01 with SMTP id dr9-20020a5d5f89000000b0032f7bf6db01mr4597804wrb.67.1700463689323;
        Sun, 19 Nov 2023 23:01:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:29 -0800 (PST)
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
Subject: [PATCH 09/14] dt-bindings: net: renesas,etheravb: Document RZ/G3S support
Date:   Mon, 20 Nov 2023 09:00:19 +0200
Message-Id: <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>
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

Document Ethernet RZ/G3S support. Ethernet IP is similar to the one
available on RZ/G2L devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 5d074f27d462..38b71e687513 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -58,6 +58,7 @@ properties:
               - renesas,r9a07g043-gbeth # RZ/G2UL
               - renesas,r9a07g044-gbeth # RZ/G2{L,LC}
               - renesas,r9a07g054-gbeth # RZ/V2L
+              - renesas,r9a08g045-gbeth # RZ/G3S
           - const: renesas,rzg2l-gbeth  # RZ/{G2L,G2UL,V2L} family
 
   reg: true
-- 
2.39.2

