Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04AC1F85E1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 Jun 2020 01:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgFMXYG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 19:24:06 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:56656 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgFMXYF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 19:24:05 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49ktvm367Sz9vZ22
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 23:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4Ze-NgZg_Oaf for <linux-renesas-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 18:24:04 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49ktvm1Ld9z9vZ21
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 18:24:04 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49ktvm1Ld9z9vZ21
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49ktvm1Ld9z9vZ21
Received: by mail-il1-f198.google.com with SMTP id o12so9290713ilf.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jun 2020 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i5/KgdrnjG3t15ZDOTj2WSH86OaHAOkZMrDvjRQElOk=;
        b=S0Ducmr01U4pjsVKx54X6hu/xzj+mukTSBvMLjy30tLcEvx2CPstvGqoTgLUSo/zs/
         UiS2bDEzixns6azcpvFUHDyKTsgV30bjzpDQfEfnnW8wxxgk78Is51IkWqet7eAtt9FA
         2vkpClFtD9aazychqlsolk35lUgh9U5i+YB762M3UqsC+uFCO3G1ai8JEyBXgohFaKVL
         44/JjwEVyUoJ1J69VATljk0j/9Vkr/9wdggBnBmN/RDmsYS4JxhSPZ1VcDh5Jqup+YQo
         e+/KBExO7NZCjsoJ1sI8p73A/N8L8V9JG8EHvK6qBg+8ivnHh2LBXjRnfmX4obExqp8K
         Iyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i5/KgdrnjG3t15ZDOTj2WSH86OaHAOkZMrDvjRQElOk=;
        b=n+mvf7f99XtChyowr74euBzEpU/YaBUQDI7jDG/SO8cpnXVWOI9m/48rmpMQkDwY37
         pBUO8A9IQXiyTWE50QxS18LQrdPp/6L3iNBqxH7WHM6gKKQty3zL+9kGdypkE+vRIoyU
         tn+Qs2q4C4W5dMTmtrVJtWYlTGXlx44SgkbSO9sRh4YKMfruzLEPN+BNFHeVhtv9qb3z
         1OSDlpr0C5fO1fo7fvNZ+W89heDuxLdddpYCC+JpcroIXCEIk9s0z0clJuecemOY84LJ
         A+uW0wLp6nM06sk66aNk0FrU8WkJW4KgbMf1ML+3h+St1Eni5TrOiLCVJNwOCW3vaRFF
         nMLQ==
X-Gm-Message-State: AOAM530gt9TpTUEOd3Ud84Ys38O4d+vAvz16eThnmn004eQo1XByIce1
        rZ1cINW3NOC9A+f/7lMT0VLwgqfJ44FhnbmgmyzOZKfQrmJcvvKgJoboFCo6cVPcMonIY9F8ihZ
        9ckPbCtvaR/8I4tzf6bgyB0O9uc26iougXwY=
X-Received: by 2002:a05:6e02:12b4:: with SMTP id f20mr19757646ilr.243.1592090643748;
        Sat, 13 Jun 2020 16:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFHZzsouHl0dV7YvSYM6/V0yenJjNsujtVpHuL7Bs24nylmCfdXnmTp6zh9++Ezrn3m4+iNg==
X-Received: by 2002:a05:6e02:12b4:: with SMTP id f20mr19757624ilr.243.1592090643451;
        Sat, 13 Jun 2020 16:24:03 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id x15sm5375267ilj.78.2020.06.13.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 16:24:02 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: vsp1: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 18:23:57 -0500
Message-Id: <20200613232357.18155-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index c650e45bb0ad..222c9e1261a0 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -846,8 +846,10 @@ static int vsp1_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
 		goto done;
+	}
 
 	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
 	pm_runtime_put_sync(&pdev->dev);
-- 
2.17.1

