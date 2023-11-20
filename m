Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FB37F1811
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 17:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbjKTQDd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 11:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjKTQDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 11:03:32 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ECF100
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:28 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-409299277bbso15374405e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700496207; x=1701101007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCuKJJPaD5V6lLtWPkXeck252UXqGAE7uAoQWOQcy7A=;
        b=n9+wGFoaq07UZl2jBer0LJnA6GzNJVhYdLs8c/ckH65Fbpu4Q8g9JClHRPv0dlovOu
         4RT7vl159hknqDpa+2yiK6a5GY1ijEWkkYXz0wdj/VpwN+IgtxtqpZ8tl9LD8ePuuGAR
         y6tum0Pq2HgJ2VocCiKuVBW1ZTUA6M2UF7o3BqXNx71O6y+BP5Tqi5QdH7CzWkdjmVHe
         s9sINtPnjh/SFoQ7Kynni91EFiLP79rOZxS/rUUubsiszcJU/ht1/McpCO8yFPEGHwyN
         hBNgdJDIYDCSRk8S6ZcPPcQhJMF9f6vkRGCs9RcNtTIQJr6MK1uv7RELMMPPwTv4uqGN
         nNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700496207; x=1701101007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCuKJJPaD5V6lLtWPkXeck252UXqGAE7uAoQWOQcy7A=;
        b=IVhPcB/++aOvGnzgfO0i994MEEJ6FW5rmnHO5NNrssJc088WfkpA0K9e5+73VqAKja
         vOVINaeKD0PDQ8nYUWZHWyLUJ4ZDQccwPsxx1OCnrybSRC75Cj4NPn8yBq3ppBLKLNkZ
         hafGFLebSkMdwJq+jRm5rTXPKNBn/62H2L0NgeUTz+DW8J0n5Rhq0gvyBCnzwycAr96m
         4Xia8CHT1SE4oWRjonw2f1VlJgddb5SBfZj18OTabJPe5r7mYv/yznhuFHs4QvBh+VUY
         wFoVRCCZJ98s8qZ44Cri0c+0pYCvwngp836GXafO2fpgWLlQB5I+yPHC1ElyXY2yFtoj
         SZ/w==
X-Gm-Message-State: AOJu0Yw8UIPAr8IzCiWNvzeSYRB/2xzZ0wHTkU0Adhw4YMBSmwOQt/HN
        N+BlIxxnFWwcY2QJbFgOA44MFg==
X-Google-Smtp-Source: AGHT+IGrIn6cydY9Wp9P9eVUO8ONV3ded3Cd20aFLroq7J4ObGAvD/0N6ml7GMMx+5YPZ3v/3kn5Dg==
X-Received: by 2002:a05:600c:4507:b0:401:daf2:2735 with SMTP id t7-20020a05600c450700b00401daf22735mr5802675wmo.31.1700496207198;
        Mon, 20 Nov 2023 08:03:27 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id m21-20020a7bce15000000b004080f0376a0sm13564631wmc.42.2023.11.20.08.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:03:26 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [net-next v2 1/5] net: ethernet: renesas: rcar_gen4_ptp: Remove incorrect comment
Date:   Mon, 20 Nov 2023 17:01:14 +0100
Message-ID: <20231120160118.3524309-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231120160118.3524309-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The comments intent was to indicates which function uses the enum. While
upstreaming rcar_gen4_ptp the function was renamed but this comment was
left with the old function name.

Instead of correcting the comment remove it, it adds little value.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v1
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index b1bbea8d3a52..9f148110df66 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -13,7 +13,6 @@
 #define RCAR_GEN4_PTP_CLOCK_S4		PTPTIVC_INIT
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
-/* for rcar_gen4_ptp_init */
 enum rcar_gen4_ptp_reg_layout {
 	RCAR_GEN4_PTP_REG_LAYOUT_S4
 };
-- 
2.42.1

