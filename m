Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBB0366A9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Apr 2021 14:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238860AbhDUMTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Apr 2021 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbhDUMTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Apr 2021 08:19:21 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECD1C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 05:18:48 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e7so49008731edu.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Apr 2021 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8uhuAw715JZRQqO+E3WmMwPMMQ5nc0EpXioav40hkQ=;
        b=swXbBmMXEgEp9VGI+qOfr3Q2M++5buNiMKq0I/i9pXUuGeFBrR4HU/8JytrLsQ4j4R
         9wEB4qK5c4I1OkVuKmRD+rcVV/3Db4ARAnG0UfsVNu9McR4MYCnqjDBPXOjacERzxS/F
         9FLXqI6owzkqD48vV1REtejGZ8QQpBn30fpZgavQJ1J7d+ru0cggIY2c75xwZSx1uwR3
         2ZMKJGD0aN6KZSeRDRM5GomhQ6aV65u81HD78RFQZRTkr92HWCX75+WEKSY4zJ+mZi5I
         TXG12N68dISDzmNA+uoWE0ZJtXjFi/U87G0FiHjlvqk9Scm8J+JGF+qJ1nV3bJlGRHKU
         vF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8uhuAw715JZRQqO+E3WmMwPMMQ5nc0EpXioav40hkQ=;
        b=fR3o/2cIu1QNbu2YdSpPaweyzgU/cG/Q09hf9pnOm4lBMMPv5y2BVCHx5fir6ickN6
         J0IvR7rJrqRFeXjHBpfU1oFT/ATR5Z+NSkRKVj+tNwYeh0F3e7csx8DSXGrF9jfs+KEE
         4n3TA5IA1fWGBnHpF6alRB9A1vjySFmvskYc+kCSAXJrpkH0WAgh4Xk/etaHTsAz8wHd
         0WVf2XOChuFtQSIkACnXC2tIad82Dt8JJAyZC0vfnMJZkvic+Aj6/8j+Jsi1kaHo6Sse
         btO+Wc0Gl8DDF4tzu+L5gOYo2nxhSxZcciczPxJayVQ4GnVHZxexz3arYC/S7kOqVz7n
         hK1A==
X-Gm-Message-State: AOAM530ZCRXidYeUjVidIeV4wIs7U+LcZzqpJg2gQUyv4PcsawPvSXd0
        y39m6MWC4qr7SCEsKsHCvwRkRg==
X-Google-Smtp-Source: ABdhPJw4fSw0I7mEZhZOmXY0XxJV4b+alhgWohtqUVXf8AEOSZSV7Vg4bIucb0doN6gjhpcaMQOsNQ==
X-Received: by 2002:a05:6402:2054:: with SMTP id bc20mr37316562edb.334.1619007526837;
        Wed, 21 Apr 2021 05:18:46 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id hs26sm2232758ejc.23.2021.04.21.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 05:18:46 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] yavta: Fix usage documentation for --field option
Date:   Wed, 21 Apr 2021 14:18:38 +0200
Message-Id: <20210421121838.3060973-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The --field option takes an argument selecting the field order. Update
the usage text to reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- List all valid filed values.
---
 yavta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/yavta.c b/yavta.c
index 4e5b62a96eb66f8d..1129ab245966384b 100644
--- a/yavta.c
+++ b/yavta.c
@@ -2290,7 +2290,9 @@ static void usage(const char *argv0)
 	printf("    --enum-formats		Enumerate formats\n");
 	printf("    --enum-inputs		Enumerate inputs\n");
 	printf("    --fd                        Use a numeric file descriptor insted of a device\n");
-	printf("    --field			Interlaced format field order\n");
+	printf("    --field field		Set the format field order\n");
+	printf("\tValid values for field are none, top, bottom, interlaced, seq-tb, seq-bt\n");
+	printf("\talternate, interlaced-tb and interlaced-bt.\n");
 	printf("    --log-status		Log device status\n");
 	printf("    --no-query			Don't query capabilities on open\n");
 	printf("    --offset			User pointer buffer offset from page start\n");
-- 
2.31.1

