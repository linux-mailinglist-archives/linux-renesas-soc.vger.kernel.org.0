Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EC83BE897
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 15:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbhGGNQ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 09:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhGGNQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 09:16:24 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E086C061764
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jul 2021 06:13:43 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id u8so2992307wrq.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jul 2021 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+AugMQI9wEQJZOdDBg6Ny4letwAdD9I7PJCkMpNv4o=;
        b=pefpTcaYn4Nfe7B5MTQmCN1CJH5GS2ZQQJEJpWwaYrdA258XI8yOS0Jn7HPrSxMTdL
         FtOJbxGSRDTaMTdb1cJKx1ydl6cvODQsUFYW60n8FDL5iCFVw7eFJDOwQLxl0s/rP/+K
         viHa26MESqX9mbAu60CLuQ75R1xZ5xz7J4go85vd0UNfRnZNhb2HpmfCV/sVgA+U+YIt
         VOHd3ehtKj/t5OiAADE5nceovLRIk+5M2yDaFKNdpYCbTcmFg4kfSjMs+M4ac99qdgOT
         urDawe7yYz6y+7DzGwwNbp9rOKLhH2LtI9KOlvfX0yS47RlzEMrhKOiRM1R6NQWcQYt2
         zjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+AugMQI9wEQJZOdDBg6Ny4letwAdD9I7PJCkMpNv4o=;
        b=WLW5SujSK6vt28e0w1wuITv8bqT9bRknf5I09oj82mwamQ1OqYmuutRG0wAq9IGrRV
         NT7faK40sjhwbp3F44J7qj8VPkzdDyFuqX+aOqogbwOqlgCbk9KBTFZ7oFzAald8j//E
         YgYJQE7QoS4khRzJaPhRf5FYVXYZUhTS34o7EFGez1GGkOxCnR4UCkC3I8+oykEm8Z4B
         Z7lSVuzsqVWBxo+ODB1gRlx2lYeBzZ7En97ECyLjD0mzZX+PgSq9hh1pr+UOr8tGvH1S
         b/adCI9tZqQytlM8PWiDx0YajT7TUAR3VkvAkz0so4ebEa22BYK34wwTR4K3idJE6Nd9
         HR4Q==
X-Gm-Message-State: AOAM533Qwnp6MvneeF/oZhd1YVcoE3gWdm9TQpIFhNpiWY/lze6OJzzk
        oVo3MEqE1yo/ZU+PFio2QMYKVg==
X-Google-Smtp-Source: ABdhPJzMkC9Mt8OgsxeFtKkKFT+EZttdMm3T3q/B0gsgzmUtD609Ly+wXMVcIQfqj131ccQIgXwSPA==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr28402844wrr.302.1625663622019;
        Wed, 07 Jul 2021 06:13:42 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id l20sm19233670wmq.3.2021.07.07.06.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:13:41 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] thermal: rcar_gen3_thermal: Fix datatype for loop counter
Date:   Wed,  7 Jul 2021 15:13:06 +0200
Message-Id: <20210707131306.4098443-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707131306.4098443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210707131306.4098443-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The loop counter 'i' should be unsigned int to match struct
rcar_gen3_thermal_priv num_tscs where it's stored.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index a438e05e7ca7f20e..8ca4bfee7bca4122 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -423,7 +423,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct thermal_zone_device *zone;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	/* default values if FUSEs are missing */
 	/* TODO: Read values from hardware on supported platforms */
-- 
2.32.0

