Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BCC2D5A2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 13:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgLJMQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 07:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgLJMQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 07:16:46 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3E4C0611CA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 04:15:29 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id t16so5245638wra.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Dec 2020 04:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RFh2OYp1AIw9+1gIuk13B075+zUU8XY1s7bawa7LB6o=;
        b=LqyOHEu5V+z03no0UW7ifZb3Jmi421rFx6DMwHbniRYbl42RKA29HPo8aLy1gNicy3
         dViH025BgwnFuh9C9GrZUJRQ5XF8vXxyBeOmqbYR9f1NgN2QKb9rhVHCIlGQY1YOsg9a
         1faZunKLsQpUaZIVZ6n0xnENErVN2t6vWbFnpIjHzZ/h0XREoD9QtgNqDE3dhb2zADEG
         Vh3F8O6JpQDSBqJqzSD/6P1w/UG5Mkg9SUxMsfQDi2CX5Ab2ir8Ilsf0PoyGOIhItVq7
         CeFWq+8hTEJN8/cYNjjbs42QjgVGhc4VcTeOEP1+ja58DHCnf2yaWaSLp5sWcUJEuxz9
         4WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RFh2OYp1AIw9+1gIuk13B075+zUU8XY1s7bawa7LB6o=;
        b=EHlN57QpPQenJ07gW0Oy1jXVR5yDwdbzJi2Bw2TWToyxh4lPPlOgoHkTevUe+swrsD
         iroN6p06qbruS1GcJ1XKaRJi6634L6ew2sSyuncnFo6qj1sTOpaJyUrJTT9E5O0/Hn97
         qbmnE3eu3w9S6sXiozjeDHiUiKKoO4o5PZqV6mtBZi6E/RIIBxYYT1XJqbij9UftIi1x
         ewhLruFfTQ0HIAZ9YRw3kzqlHm/YVahlwCKAuFzsuRmVI6kqeJiag2h5LZxyJ76chNUw
         7q1XOmPw63B5GbJWEB4yfNnqxKQzsDw5Yg3hLct87dkvhkSsrgyn5zAdMO7KFF0VL2NF
         b2ow==
X-Gm-Message-State: AOAM530UrTURtTu/5g4/hL22SwcszBStbcbQTjsCtyI2ZUS2Eb4TdRcR
        NsNmbLzklxIW7isOYRnEVAs19Q==
X-Google-Smtp-Source: ABdhPJzeWtMXg+INjetWH7xaYHfATi/5nbDyJA9TpfHgH8sLEwDqwQM8CZN6iCOnEdC0PInMfPMQxQ==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr8162873wrr.40.1607602527723;
        Thu, 10 Dec 2020 04:15:27 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-158-132.adsl.proxad.net. [82.252.158.132])
        by smtp.gmail.com with ESMTPSA id k6sm8412863wmf.25.2020.12.10.04.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 04:15:27 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rui.zhang@intel.com
Cc:     kai.heng.feng@canonical.com, lukasz.luba@arm.com,
        srinivas.pandruvada@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Amit Kucheria <amitk@kernel.org>,
        linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
        DRIVERS)
Subject: [PATCH 4/5] thermal/drivers/rcar: Remove notification usage
Date:   Thu, 10 Dec 2020 13:15:13 +0100
Message-Id: <20201210121514.25760-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210121514.25760-1-daniel.lezcano@linaro.org>
References: <20201210121514.25760-1-daniel.lezcano@linaro.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The ops is only showing a trace telling a critical trip point is
crossed. The same information is given by the thermal framework.

This is redundant, remove the code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/rcar_thermal.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 6ae757d66f46..b49f04daaf47 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -323,24 +323,6 @@ static int rcar_thermal_get_trip_temp(struct thermal_zone_device *zone,
 	return 0;
 }
 
-static int rcar_thermal_notify(struct thermal_zone_device *zone,
-			       int trip, enum thermal_trip_type type)
-{
-	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
-	struct device *dev = rcar_priv_to_dev(priv);
-
-	switch (type) {
-	case THERMAL_TRIP_CRITICAL:
-		/* FIXME */
-		dev_warn(dev, "Thermal reached to critical temperature\n");
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static const struct thermal_zone_of_device_ops rcar_thermal_zone_of_ops = {
 	.get_temp	= rcar_thermal_of_get_temp,
 };
@@ -349,7 +331,6 @@ static struct thermal_zone_device_ops rcar_thermal_zone_ops = {
 	.get_temp	= rcar_thermal_get_temp,
 	.get_trip_type	= rcar_thermal_get_trip_type,
 	.get_trip_temp	= rcar_thermal_get_trip_temp,
-	.notify		= rcar_thermal_notify,
 };
 
 /*
-- 
2.17.1

