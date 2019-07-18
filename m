Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9AD6CD9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfGRLn5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 07:43:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45893 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRLn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 07:43:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so12770968pgp.12;
        Thu, 18 Jul 2019 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=IGzz/j95f1SCm6JxIZBHarR8Zr/45NveZScDEByX+FA=;
        b=Pn6e3M6cmUUJXwpH5V+kSi/GAKBH2dMqGFvxp/ZpDZ5KWU2fPgyJRIr/D+DSZCWhaB
         Pueg+7FgQgBukLcazFSKSXIMbyKAP+m8BfQjN3412JXYRiTKW7YJOkhvEMBHfZj+dQnb
         nTJvL5a5P/JGU/TvM79wsQ1Upkb0uZQG/n2sDe+e6Ux9zVp4TQKo4hWBUPLWytiSF40q
         ILchNY5souYmy4YCty/H0nXP/9ZM84JeEbE1o628EtOl8QuEnODqu9UhC/8cpzW12ALM
         QdM22XHdlsH+SJTnHS82pydXIz0257iGVn9hU5RvqRB7T4ZCPcGzdfPZKJrBYnsvgKM2
         o5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=IGzz/j95f1SCm6JxIZBHarR8Zr/45NveZScDEByX+FA=;
        b=LXmeMNh5gy57l0Ka8t9dja4KLXWpoqcQUjkFXCQT18lVZT9YvXizhiXyJZgMHjFE6h
         AIHyPf36/51/vbc6p2z7inuZkGoaMU6fAGlZrot061b2Bq/JKZvRzAMXwus9jVqkql/W
         24ZSyZ+O5O4ls3YBuMIEl1gCviju6WYJnbjaFs/gUHubthB5cBMH7tU6b0NVog2YP6P7
         M9ri0vWXAvAsAcNG+1mWU/w3G3C2P9KqqxEodVHkQKZryNt5YLfClNBAID82KffcVOlv
         rvMtbWP0ceRXWxImDnfhsihy0CCx93RrG5c4rL2Ls3K9Ujll9wgoyQuOjJ/DZXHgdY1b
         HuOA==
X-Gm-Message-State: APjAAAUko5Y5pR0pwCxM6ZZ970lR8mNmvGg4hEu28DZ0rsRUuPqBcjWO
        rdpx5PRoDgWxriBuKt7Xk55DFGkA
X-Google-Smtp-Source: APXvYqx0SuuW9UZDBzwqmepbneO4j6zQjBnRObwyEe0onLOEwDx6yk1Kk4TAS4UIpLd2GnXhuKQ3RQ==
X-Received: by 2002:a63:fe15:: with SMTP id p21mr47770944pgh.149.1563450236000;
        Thu, 18 Jul 2019 04:43:56 -0700 (PDT)
Received: from [127.0.0.1] (FL1-133-202-12-40.iwa.mesh.ad.jp. [133.202.12.40])
        by smtp.gmail.com with ESMTPSA id j15sm39116123pfn.150.2019.07.18.04.43.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 04:43:54 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, daniel.lezcano@linaro.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
Date:   Thu, 18 Jul 2019 20:45:24 +0900
Message-Id: <156345032407.5307.16702422867507502597.sendpatchset@octo>
In-Reply-To: <156345023791.5307.6113391102648394591.sendpatchset@octo>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
Subject: [PATCH 6/7] clocksource/drivers/sh_cmt: r8a7740 and sh73a0 SoC-specific match
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Add SoC-specific matching for CMT1 on r8a7740 and sh73a0.

This allows us to move away from the old DT bindings such as
 - "renesas,cmt-48-sh73a0"
 - "renesas,cmt-48-r8a7740"
 - "renesas,cmt-48"
in favour for the now commonly used format "renesas,<soc>-<device>"

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/clocksource/sh_cmt.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- 0001/drivers/clocksource/sh_cmt.c
+++ work/drivers/clocksource/sh_cmt.c	2019-07-18 19:29:06.005414716 +0900
@@ -928,6 +928,14 @@ static const struct of_device_id sh_cmt_
 		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
 	},
 	{
+		.compatible = "renesas,r8a7740-cmt1",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
+	{
+		.compatible = "renesas,sh73a0-cmt1",
+		.data = &sh_cmt_info[SH_CMT_48BIT]
+	},
+	{
 		.compatible = "renesas,rcar-gen2-cmt0",
 		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
 	},
