Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F40543ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 19:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbiFHRps (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 13:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbiFHRpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:45:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBB4182B8B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 10:45:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gl15so29036219ejb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jun 2022 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRZfT94ACJ/ZflqdJTZPyeewUEefd9u2TxCqAzB+We4=;
        b=0qvEqaRFCp9bGX+rR3Aei4WUOjpKK7JLzGAMSp6lcRA1usnTCK1sq5Xr/8V55qwx83
         PHl2O7yVgwUMRHtENwLS1ZtG/LMfg/qHaIsz9UxPKntaWDKd5qjfcOj1jYwUV6GEwIeS
         DAPsJt1j0V6HB6Cd1l0P8L/RKd5EtKnvK4GlCdRHQV9dR2opbJ4/S7CKyrC5a4KUtiZP
         zP8LBw6SXQfysJ4USKSZY92fWl8x7Lw3yieMwXyc8OJhPCDanVZy3Zv/NmTTkgHwfbSx
         E3BNqt2u6umqqdWSjNKGubo+elVvEmfGHWvUdGYTDH/ueeNj833M9fkj6NND2FHZ23ZP
         7dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HRZfT94ACJ/ZflqdJTZPyeewUEefd9u2TxCqAzB+We4=;
        b=j5eBP1dvYA00EbOKGlb+YauzQ3VZFC5OAOM2MSGgGQ5zBGgiTLSmTpdlGclU5QscLA
         +Z0DiTa+i9v+OgwBUj5mB5yGzPv4RlQ+WeaEWvorK457LEwwzACTsmjsSpHOj3P3KvVy
         2fzFCp8yTTyv18lN2A6mDpO/bFAyk5OWyEdLHUfjCCWEEtHu0+b1kWZYSUAH7rp5+P2V
         Dm9hK6pUgfXykH0pFfxMlKL7Ko+ZWtNaQHc6LMuEddP6uA2MX3SszusmYG7ljC3a/ihc
         RGaUdyYSDVZ33CjopSmlWifa3xFO4y7fCHXBY7SiTsLiTq3BmplwEsunElu0bM5AsUxt
         /fBw==
X-Gm-Message-State: AOAM531nBMI2s+6I6yfArkQwHVKCau6bl5Uzm5c+3pan6FpfRvZ+b2ct
        YJXVyQIeZwwRT898Y8VtjYcPNA==
X-Google-Smtp-Source: ABdhPJxZrDv9P9wvMv3NiaJqpKlWSAGH1JqH1nAo2JYFdxRuhcrMtIt3QAj6+f9RG5fT5WXnai8tlA==
X-Received: by 2002:a17:906:72de:b0:711:f8c8:ba00 with SMTP id m30-20020a17090672de00b00711f8c8ba00mr3113312ejl.586.1654710343431;
        Wed, 08 Jun 2022 10:45:43 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id j6-20020a170906254600b0070c1c494f73sm8152905ejb.90.2022.06.08.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:45:43 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] media: rcar-vin: Fix channel routing for Ebisu
Date:   Wed,  8 Jun 2022 19:44:46 +0200
Message-Id: <20220608174446.994823-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When converting to full Virtual Channel routing an error crept into the
routing table for Ebisu (r8a77990). The routing information is used at
probe time preventing rcar-vin from probing correctly on this SoC, solve
by correcting the routing table.

Fixes: 3e52419ec04f9769 ("media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 49bdcfba010b2c8a..4b7a9743554af6c3 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1261,7 +1261,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
-	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
-- 
2.36.0

