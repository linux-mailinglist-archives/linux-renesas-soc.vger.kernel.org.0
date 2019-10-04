Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B01CC519
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 23:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbfJDVoQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 17:44:16 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39806 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730882AbfJDVnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 17:43:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id e1so4484316pgj.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Oct 2019 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ubsbJVfyaxxi8UEKJtUs1pHXgsPvFxblh2S9JiFfFEQ=;
        b=UFkwlLQnUNyI5WNntdW9sbZ+MOSMgf2+fOLF8RG0Idqq0BiDJ31IThtlWGL76sEsh8
         ZOXjRMMhS2+jDESxPJYaF23djnnmvObforQfo9Lci5kCDyLYBF8PRkwvnwVf8Yl/9q4/
         sLymgqNYk/o0RadXVPMTvlSeFll8zoJ8X+f5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ubsbJVfyaxxi8UEKJtUs1pHXgsPvFxblh2S9JiFfFEQ=;
        b=WtNwWzuwsOTS5tBYrZL2HC90eqox1CglWiwleHFz6uEkFNOjeFb4PGanzgGkBQOnCE
         g1uYHHpryE/HdOHm1dZd0neUf6L9ROxJ9NTmX0zZWSPtl+Wn93weN6oRTeTz5Vl8nqCL
         9t8v3aSm0KfKtloogzqi/6uoQ+97jtr3dLlZmaxjfrwZdX4iv4+hAdbW+DxSkjACDUsE
         +A+ycfHcNuwSrfBH3uGk3Ox/ZcJeShLl1KKcjOwccOGpFyE6D/7aJUpb0Pdc7dWSWwTr
         y0DFBIIsHArc5aMqHzvUPfK3G6WLqS5MAhI6lZsC6u7KGj67w9D2+0cprM/0xUjP9jaP
         3GpA==
X-Gm-Message-State: APjAAAXaaQNkPvPos6TTq/C4bUltzuoxTJQM8vzkAaxisol1urezP20r
        3FZwejesz64AxPYlDzjNASw+7g==
X-Google-Smtp-Source: APXvYqxWNvMZbZVIHoPzbXHXqx4rR45wvPydpGvMiAUC+AaI6mlLIv/J0XRSrindMPfHhhURSHgsxQ==
X-Received: by 2002:a17:90a:77c7:: with SMTP id e7mr19330232pjs.59.1570225418345;
        Fri, 04 Oct 2019 14:43:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a11sm10446799pfg.94.2019.10.04.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 14:43:37 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 02/10] media: renesas-ceu: Use of_device_get_match_data()
Date:   Fri,  4 Oct 2019 14:43:26 -0700
Message-Id: <20191004214334.149976-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191004214334.149976-1-swboyd@chromium.org>
References: <20191004214334.149976-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This driver can use the replacement API instead of calling
of_match_device() and then dereferencing the pointer that is returned.
This nicely avoids referencing the match table when it is undefined with
configurations where CONFIG_OF=n.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-renesas-soc@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please ack or pick for immediate merge so the last patch can be merged.

 drivers/media/platform/renesas-ceu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 197b3991330d..60518bbc2cd5 100644
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
Sent by a computer through tubes

