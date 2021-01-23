Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD4D3012C4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Jan 2021 04:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbhAWDqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 22:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbhAWDp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 22:45:56 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22428C0617AB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 19:44:34 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b8so4410487plx.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 19:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJGIvDbFer174uYIU3S/UHlxuD0C4SN9Ba2a5uW/TjI=;
        b=OifXzFWywulgTYIb9jiyHpcD9JRWqdvQpqyIxxU2D6tsvuICK7UAWAuNdhwL9zUrAR
         K+Nk1PB3vJuukAby67BHb75dLenU9dJldjAEfwR/2+8xvD7W58qyqrNjKfvj0OLfm/Vm
         zbEeseMkg52zIyx68ryB6lk3sZbv2Q8yvg+zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJGIvDbFer174uYIU3S/UHlxuD0C4SN9Ba2a5uW/TjI=;
        b=qpdV6c4CUGCy3mikq4hWZJwiroSI4tuUZhOtCqyNTisdQOgcX1e/nD81fpTW1OsKGW
         weCstoH5G+9lEDHZpkSpGnDZvbkEM+20CIjg29JTg8Pqc8wXhoaKAPG7oknUzRaXX23H
         5xU5o2+nYsruu9QtUxqXzmgzXo33FjSkcIPm2STTcyOcTVcoFAq8vN539454VsyGhD0Y
         Tq0NIsf6vu+YsSgssmUFhtMs8FQR/xPWYG0ho3/rFjxRzw+xOjhN3Tat3f9ZKt0MgUtA
         wi1BY1IrOW0hMqdHpmXSK0XAXFqqtM8naYEt5k2kUtpZGE8cdgt3ibbb7Ov0JCO056fb
         qkIg==
X-Gm-Message-State: AOAM531+0cT1Hcm35zPND/DnPiEYHkvXH9r+5XUB0MXXAuC6orIXGqYO
        yyVXvNCtYnc3oMZuBB49FufBlA==
X-Google-Smtp-Source: ABdhPJwOaNd8kn+wXdYuJVArrzuHdGMUINcUY27IXOlFKIQTp/Yvg53oR2Q8FrPD6gGeNitPo2TNQw==
X-Received: by 2002:a17:90b:3792:: with SMTP id mz18mr8968978pjb.23.1611373473763;
        Fri, 22 Jan 2021 19:44:33 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id gf23sm10480343pjb.42.2021.01.22.19.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 19:44:33 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/6] media: renesas-ceu: Use of_device_get_match_data()
Date:   Fri, 22 Jan 2021 19:44:23 -0800
Message-Id: <20210123034428.2841052-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210123034428.2841052-1-swboyd@chromium.org>
References: <20210123034428.2841052-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This driver can use the replacement API instead of calling
of_match_device() and then dereferencing the pointer that is returned.
This nicely avoids referencing the match table when it is undefined with
configurations where CONFIG_OF=n.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-renesas-soc@vger.kernel.org>
---

Please ack so Rob can apply.

 drivers/media/platform/renesas-ceu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 4a633ad0e8fa..352e7c84d5ba 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1679,7 +1679,7 @@ static int ceu_probe(struct platform_device *pdev)
 	v4l2_async_notifier_init(&ceudev->notifier);
 
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
-		ceu_data = of_match_device(ceu_of_match, dev)->data;
+		ceu_data = of_device_get_match_data(dev);
 		num_subdevs = ceu_parse_dt(ceudev);
 	} else if (dev->platform_data) {
 		/* Assume SH4 if booting with platform data. */
-- 
https://chromeos.dev

