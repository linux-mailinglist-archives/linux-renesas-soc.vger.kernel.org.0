Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACD01D8D0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 03:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgESBRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 21:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgESBRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 21:17:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43E8C05BD0B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 18:17:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id e125so8977527lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2020 18:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=xOPgjvAjIx8tLUowGcMfjYDQ/kMehnrvLIphz2d0rPY=;
        b=EkiEQDMfNl49SJQUh3VX4e4ZDXfYZkzM/bgAJ22dkDNT+EP8mBkjqYmyoOLAFAJQU0
         MSynuvhWa6CwBkkZLybzB/l17FH7MbM2L1h1ZNyQlmclrMKDmO851BzolEWeYwTrgTgL
         itAfqpHQ2dtpVS8HiZlIbzK3s5vT0Qmg28ESIM5EPpJgsr5GC/S/VSuDjL5bkP9L6d+J
         0M3xpnJkjiMTA/K0HXX3t8FkDBy7/vjN5IJ7+KnUoIZh6Xgbut8OYoPDkB9iKl+gfqVk
         Cz/Tu3eCHQF8Ui9x9TQNHW4/DumOaTkg6LwObSmeWEHcvGrHN/ii5+zu83WOiajNJxZO
         0cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=xOPgjvAjIx8tLUowGcMfjYDQ/kMehnrvLIphz2d0rPY=;
        b=HCsFZkiIyX13pxIM2Ix+o2MozmEkq8EsoTIcrNx/eLEksGPLAQ60kPJo0X8s2/NaV+
         U1pteuKD68pjygd+15XXRjWqMtHA1mylzXagehdTM+3IiYyTcGXoQmd9uoJAWbjnovfq
         2meNtLs9++0WDnBJJ/zT92YdEFwQdm/kUpqT8w64bh4nmhJd+K8C2ugbDxcJ3BhR2qYK
         uUCphGVrkxZYK35BkL/GyFIICubsiGMyuVmw3O9jguO2Pi0/Zty9z3bUyfUhGbWTCxb6
         JedRFBEvShach1ANKGeeEB0FBGRSgE4m+iOLM3pF5ITrvFcyr5OrvisInzPzDzmIlywP
         /Btw==
X-Gm-Message-State: AOAM531zXQl5cK6mFQ5VEEaNywHG9asGGtecbsz9jy9hR0Tk42ALzv6Y
        kW6XASNIFtpDdSO7M4xaNRb3FA==
X-Google-Smtp-Source: ABdhPJzVl+KELPsmRULh2Rc+eqv6+X6Lx0uX+EQYpcjDteuAXY8yjhlADFiglvYPcwsLTRa48Eey6Q==
X-Received: by 2002:a05:6512:3ea:: with SMTP id n10mr13576037lfq.127.1589851020077;
        Mon, 18 May 2020 18:17:00 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:59 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH v2 4/6] media: ov5647: Use gpiod_set_value_cansleep
Date:   Tue, 19 May 2020 04:16:19 +0300
Message-Id: <ff9d9fe93a50efdeced9efab7b38d72c7dabc08f.1589850165.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

All calls to the gpio library are in contexts that can sleep,
therefore there is no issue with having those GPIOs controlled
by controllers which require sleeping (eg I2C GPIO expanders).

Switch to using gpiod_set_value_cansleep instead of gpiod_set_value
to avoid triggering the warning in gpiolib should the GPIO
controller need to sleep.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 10f35c637f91..7600b4844f16 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -378,7 +378,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		dev_dbg(&client->dev, "OV5647 power on\n");
 
 		if (ov5647->pwdn) {
-			gpiod_set_value(ov5647->pwdn, 0);
+			gpiod_set_value_cansleep(ov5647->pwdn, 0);
 			msleep_range(PWDN_ACTIVE_DELAY_MS);
 		}
 
@@ -420,7 +420,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 
 		clk_disable_unprepare(ov5647->xclk);
 
-		gpiod_set_value(ov5647->pwdn, 1);
+		gpiod_set_value_cansleep(ov5647->pwdn, 1);
 	}
 
 	/* Update the power count. */
@@ -661,13 +661,13 @@ static int ov5647_probe(struct i2c_client *client)
 		goto mutex_remove;
 
 	if (sensor->pwdn) {
-		gpiod_set_value(sensor->pwdn, 0);
+		gpiod_set_value_cansleep(sensor->pwdn, 0);
 		msleep_range(PWDN_ACTIVE_DELAY_MS);
 	}
 
 	ret = ov5647_detect(sd);
 
-	gpiod_set_value(sensor->pwdn, 1);
+	gpiod_set_value_cansleep(sensor->pwdn, 1);
 
 	if (ret < 0)
 		goto error;
-- 
2.17.1

