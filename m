Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201D139C6E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jun 2021 10:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhFEIzM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 5 Jun 2021 04:55:12 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:43598 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhFEIzL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Jun 2021 04:55:11 -0400
Received: by mail-ed1-f54.google.com with SMTP id s6so13848291edu.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jun 2021 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTZMNkSkrxsY19WZ8OOJ+AdlEgOY7uEkgMHRF1lc4/0=;
        b=do+tIaxIuO4sLd4cTYpazgGGnIq/lovmcYVs3lJD3uzrGuaadkfpDihyxYLVbzLcca
         RYxsgdvSPxLW0oenuiE7HIlbr/qP6Bmvnps/e/8A5NQZhR5LzG/lvzIa6ql0DQGP6B6a
         LD+mlaQXSJIXvHcCDgRQBCe3W8kKMxmJWQI3Sj5ePnJv6s3CXiAsSuuaj59vBYcaWElF
         ZIcu6ojsgEUVJrevo5g5E9KdG2/jInP50KiReThmP40WXUI4wGcenZr1yPWsNfbGEBeN
         aCUoH7vHz4nzkwbnjYAnwcTRW3loVRdw5crgS0kST4zeUKm+QmVdMHq98dKKc4haMDqY
         e+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTZMNkSkrxsY19WZ8OOJ+AdlEgOY7uEkgMHRF1lc4/0=;
        b=ruViBi+SgwN6n5agXwq/NUc2zhF43AvZURTiZ50DBgLYEXirKFOSAFzZgaIBdexfS/
         eUbXY5Rl3D87OBFgt1lyKLT5+o4Xxjcacs6/aff5zj01nvcRG3tCZJRP7kyDNiuJYoxe
         kHr0PLplRgDzHJIczjQC6JHsRB8THC2yYiDyxYThUxTUpL++ymzbBHycJ2DYyYiIGZw5
         dWF5R+v5YV1l6TJMkO46cuTDfjeuW0Nw34t9C+uRZX9K093beVXue5dx4dY+ngcqxQ03
         uHF6YNwJPmV41KFlk4jzF+qdVb2TTebQGTUjLYG7lSDqJswqa3nPKDgiguT40CFiHrb1
         /4ag==
X-Gm-Message-State: AOAM533isMw8MH2LqpUKp0TDnGBHmwT7wkzmgWaT46O21+r7+ZtGS73j
        UZnGulvHwdLtCeDheTNtXjkiAUqlGGsTUuDt
X-Google-Smtp-Source: ABdhPJyHK9fA6NLR1lXAqdaGTc+gPWKpYXYPv2HuQsdl0myrddD5fxhFN1Y/ksf0pXMAB5NtWNdGtA==
X-Received: by 2002:a05:6402:35c4:: with SMTP id z4mr9128935edc.362.1622883143381;
        Sat, 05 Jun 2021 01:52:23 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id e25sm3823412eja.15.2021.06.05.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 01:52:22 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] thermal: rcar_gen3_thermal: Fix coefficient calculations
Date:   Sat,  5 Jun 2021 10:52:11 +0200
Message-Id: <20210605085211.564909-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The fixed value of 157 used in the calculations are only correct for
M3-W, on other Gen3 SoC it should be 167. The constant can be derived
correctly from the static TJ_3 constant and the SoC specific TJ_1 value.
Update the calculation be correct on all Gen3 SoCs.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index e1e412348076b2ff..1a60adb1d30a011d 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -143,7 +143,7 @@ static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_tsc *tsc,
 	 * Division is not scaled in BSP and if scaled it might overflow
 	 * the dividend (4095 * 4095 << 14 > INT_MAX) so keep it unscaled
 	 */
-	tsc->tj_t = (FIXPT_INT((ptat[1] - ptat[2]) * 157)
+	tsc->tj_t = (FIXPT_INT((ptat[1] - ptat[2]) * (ths_tj_1 - TJ_3))
 		     / (ptat[0] - ptat[2])) + FIXPT_INT(TJ_3);
 
 	tsc->coef.a1 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[2]),
-- 
2.31.1

