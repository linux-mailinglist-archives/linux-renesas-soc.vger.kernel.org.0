Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9177A69318E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 15:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjBKOmB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 09:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBKOmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 09:42:01 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A492C1F49D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:41:59 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id o15so4629298wrc.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKG0ypF6gbhvdP8zAGHpXP3/P0Hsw2jM9OG5E6fiHI8=;
        b=uOtf1SIs57hOS8fVy35dVhUlttLEJtm6ZbYpNe6VqxDcE0Y1lzJRz6NmQ7Z2sCK6bN
         0u7B7NQlPUSVLKeeruAAHCmeRKVLg4n1mlpFX/q3AyUEx26MWs2PuK9PumyR611axrXd
         9yxi90mqYAEh00ytG+Y+j3xc2+nQO8Z6M5h/15HlxqcP232mKPBd99aIx8Vx7W5l3zYW
         MCykrN6UowopNham4XDFiv8C3AsAHb191EbZuPO9QqhV9KenxuAZdXLXBzvO5m16jHUY
         x84BRkjd/tE2uietLtxJnXaKpXimhI/izAqRj3wqiT7tOCljdMllNecp4vmnkOfuKPqM
         B5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKG0ypF6gbhvdP8zAGHpXP3/P0Hsw2jM9OG5E6fiHI8=;
        b=c437PU1Y5MvxDRXOafelPOsYhmhjSTdUng9Ts8Y6ko9ekDbOmDi71PelGvC/B+qsrV
         h89XRpfy3n4ypasKRLsE8FjK+RGQ0gKYyeZCq9vx5OnZwjBWiREeViH6DpEkcnvWf35s
         Gmy6Osd/GGNFV9CL3COfgdD5HgSTPef+tIA204FkHfyMqWg/teZ0WC7zt9bgfI54yzIj
         LKHcyN3rkPo8T989nueKp4Yw9/5lQLQDePOfyl5TqpvOro5BZ2kwBA3sfW/nBiWwwN5s
         9a2dghZ9BeYN9UUFP4MrUU+cvDyBEjeVuIlkG9LoLcizuSX6H+p2FmzGXr7QJpBAXkVn
         XbZg==
X-Gm-Message-State: AO0yUKUwdyjGctRbyXkcYeGE3hsfIMAXYyqFvB1QLaxY2ERx6ZftV5nI
        EDUkRa79o24KXsdf765ILDmFRQ==
X-Google-Smtp-Source: AK7set/RVUhgXzkUZXt1nJmn85VE1ijjwQ8bkv75So/niA7PC4Y64VaoYkP4cNbZMV2O8HnnH1/i1A==
X-Received: by 2002:adf:fec7:0:b0:2c5:4cf1:a57b with SMTP id q7-20020adffec7000000b002c54cf1a57bmr3013581wrs.35.1676126518280;
        Sat, 11 Feb 2023 06:41:58 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm4202510wrq.25.2023.02.11.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:41:57 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: dt-bindings: media: renesas,isp: Add binding for V4H
Date:   Sat, 11 Feb 2023 15:41:45 +0100
Message-Id: <20230211144147.3812388-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211144147.3812388-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the ISP module in the Renesas V4H (r8a779g0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index 514857d36f6b..33650a1ea034 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -21,6 +21,7 @@ properties:
     items:
       - enum:
           - renesas,r8a779a0-isp # V3U
+          - renesas,r8a779g0-isp # V4H
   reg:
     maxItems: 1
 
-- 
2.39.1

