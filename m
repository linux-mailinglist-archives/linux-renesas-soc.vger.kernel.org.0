Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A161A6495
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 11:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgDMJYo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 05:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728224AbgDMJYm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 05:24:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4AEC008749
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2020 02:18:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q19so8018108ljp.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2020 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lHubTvQBvGK3a1f0dL5uuc3R9QqieZy5ygx33SyVyOU=;
        b=T0yOasC4EK+K/uSP6q/VHtsWfhYkDjRADF7V9g4F5+Z4DUWC5frjadvL0F6P0vsPe/
         ktgqKhj3YQk6Z/Vu29R3XivuTQsAlMUbGlD9RbD/i5QgrMhdJJEmMf5MGsF+UjZiJ6gH
         63TaszCvMTswnknyawfP/PU/lt66yzBxp8dwd9WKCqUeOHQQ/Vi1le4ng01Kw6hCaJ/r
         BAJpA6jmFGMDM+ppj4MAPHGRZOR3qQ6xwqur4z1ZcXugdhBHcgHFp8zUGLPSy4S0FxlR
         NGHoeaL4W/NWuJqRAV1ddVOGub1Bc3b7HNdYnZyUMkVJG6ev9+STqZuby5um6fFpqqJy
         lm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lHubTvQBvGK3a1f0dL5uuc3R9QqieZy5ygx33SyVyOU=;
        b=tPXCvNN0/ewxVtDEjC2IIJsQMbJiAAYPMJk3/0pnmHpxcj7poI2I930Ima+Z1rba9e
         UVjP8T75tYq1plTIX+p30NABunW8GiIKhih+S+f8+UUUWd5YhOr6zr3qbIqLU67ADft7
         Md5MJyytTCwLdBXfs2aqQAPMcZ1+Uqcu5zMje9MMnVWh/Lvx4VPXUVatw2hKIVhlRv62
         kJbibx0G7CvC8kFqnXrHsRVtZ3EUGGySZ/I+cz+btGmfk7/xUnImIy1JW3Mfyi5/qu90
         1WMpSVMdb40w82cmo5Vz9SFTx+0ndmELLvk2Iw8laOe4mWgN2IBE3tvLoxNMHP57vJl0
         3Q7w==
X-Gm-Message-State: AGi0PuYS/tTVFNur8h967xu/IavaqgpUpYuf/DD4BcJ4YczYrUX2UpSa
        t7eYaIYPLbZuP0ycRP9/pl+wJw==
X-Google-Smtp-Source: APiQypImlQL77/NsGdTM2O6q1MEpHE6CFMfh4ANSEsdt5fRmb4aUSjEpYhVF5ciGCXbqj8qUKhLhhg==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr9982617ljo.59.1586769500639;
        Mon, 13 Apr 2020 02:18:20 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id e16sm8339049ljh.18.2020.04.13.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:18:20 -0700 (PDT)
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
Subject: [PATCH 0/4] ov5647 driver improvement
Date:   Mon, 13 Apr 2020 12:17:43 +0300
Message-Id: <cover.1586758372.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Driver for ov5647 camera sensor lacks some important functionality, such
as ability to query device format and resolution or operations with
power down mode. Patches from Raspberry kernel source tree[1] fixes
those issues and improves quality of mentioned driver.

[1] - https://github.com/raspberrypi/linux

Dave Stevenson (4):
  media: ov5647: Add set_fmt and get_fmt calls.
  media: ov5647: Add support for PWDN GPIO.
  media: ov5647: Add support for non-continuous clock mode
  media: ov5647: Use gpiod_set_value_cansleep

 drivers/media/i2c/ov5647.c | 67 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

-- 
2.17.1

