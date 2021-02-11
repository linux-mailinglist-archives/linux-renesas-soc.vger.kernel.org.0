Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C773187DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 11:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhBKKPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 05:15:17 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:34838 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhBKKNL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 05:13:11 -0500
Received: by mail-lf1-f46.google.com with SMTP id u25so7324286lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Feb 2021 02:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=znM62LdaK161ZnCyEZoLn126psE687kCEgju9qI/rkc=;
        b=rKoWpffIGzS6FUF5fMboc4QUddrLTEwRJSh8QfT+LTRmw1zq1776OQ5h1hYOF5Vdds
         0+GGAJVfsSPCYqO/9gu1QdXVFzXKdqn0cZ1c9MV1qiAcTuUJ6M52Y9TY5x2iHX5AnLJt
         0kthK8B07/IZMoSYSUQMoQ6lVbWC9x+7uc0NOfXdpaHOSMSs4MOuQuOdWDsC4Bwa+4cb
         R6tprZZ5dl5Nu5iizYbEYNlKJsR6jDbiEwRVDz6hTc5SlBRJr15KZgCTq/qZV+LP/mRh
         VuBQD+Jfm9oKyYzoRwajbecRJPhkvy0fX+rPdAgSHGcthVX/FkPwFVzzaAO8OWbW+ECC
         dWlg==
X-Gm-Message-State: AOAM532E1nQh43Zghsk4SBk/q679waVRr8pyiu1gQ8fTz7FaRYSuokxR
        qxluePFAGHiptMoRoK2cptQ=
X-Google-Smtp-Source: ABdhPJzBbY1eR4pmQ5GXG/Skm+F8iyQkJ4u6aahQzL1Y0DMS1wHC7gDjAvY0EQvcJ0HGp0vn81ddHA==
X-Received: by 2002:a19:3f08:: with SMTP id m8mr3929692lfa.569.1613038348400;
        Thu, 11 Feb 2021 02:12:28 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id c16sm598358lft.264.2021.02.11.02.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 02:12:28 -0800 (PST)
Date:   Thu, 11 Feb 2021 12:12:21 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 5/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <f40a1c110efb6f9daf1fc48f40daf2b691445ae3.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---

No changes. (Ack added)

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 667d03852191..0bc076cb1815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15339,16 +15339,20 @@ F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
+F:	drivers/mfd/rohm-bd9576.c
 F:	drivers/power/supply/bd70528-charger.c
 F:	drivers/regulator/bd70528-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
+F:	drivers/regulator/bd9576-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd70528_wdt.c
+F:	drivers/watchdog/bd9576_wdt.c
 F:	include/linux/mfd/rohm-bd70528.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
 
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
