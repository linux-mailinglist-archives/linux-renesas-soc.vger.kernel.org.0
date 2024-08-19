Return-Path: <linux-renesas-soc+bounces-7883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC17956856
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 12:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A651283126
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 10:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2421166310;
	Mon, 19 Aug 2024 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mncnCM8g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F216165EFD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063051; cv=none; b=ikQrm+yGZBVrh23M99psV+yBY4l4kIcoGdxosQstE32kvafLpgKnEVR+1lYM1tuxqABNU5XGEsoMuN+IEas+h3ACogLqXdgWnXca5yQi3yiHhQJHPSjliZfNRlmy24dygccSkRKiC2fUDDPs+ZGeb8QbW1nrSsm4RP1plTmjeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063051; c=relaxed/simple;
	bh=z6TCcjwue9TYz7JInDjcmzx1UOfgxbAEKNVt5syHDaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PszzlJVjt2TAqSs5j9TLf05ysyJpIO+LuAgxF0kM/wLLLJlbLw5dV/mQDtqg5EG+2PkLO/o2UV6gwJK/psL2sJvxzDPuxrekbxgCgooUa4ad8bu2vKRgBCvx26x4hYfyVaqxouG5NqjAjwTEDtulIcXhkOAYFx+uGWabG2dg5kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mncnCM8g; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428119da952so33110705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063047; x=1724667847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ7yNcG1m1i0h8P6wLWOssV8KAFemhynAlwW6SKhVVo=;
        b=mncnCM8gy2FrBzlE9bPELAxyLgIqiL3nHP0agbx+H2oxoGYsDxDljBEDP4A2AltJ3S
         ftHtY76/pROZ8TlalUeMCgKa8m352sqVS/nrZ7aWweZZhFBnPkEGUC+FnacWyVrQYRCz
         Ps0kHiuuQ34FjTlFvEZ0cIM//hbERkqK7pVCT63294RY/RGRj2G6PV7nlqJQjhsFPhXC
         7TYjAKiHTt9keJovtLx6HK2xi5YDJvNj2Ul+ZJKZyzFXoFEiJ0UkIaxzBNowfdZSrOBZ
         3WVKwFWfCCcA1XW7eLfBrKy2zEew5ApZDa54FwQSivqJd2eyqL/rRH3qum9M1wrkpeit
         0ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063047; x=1724667847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJ7yNcG1m1i0h8P6wLWOssV8KAFemhynAlwW6SKhVVo=;
        b=A9QHlWWSDBVoNsiASEsMnuWy6VpvAvc09GG0DGQz694cov5sMRyl12wsilOBhZzELk
         jXRnAhWvtjgVK8W+Jz3QyunPfhu4mx04OHE3bxXcZjjWQlOpD6aq7IaAvNd64YjKe3Qv
         3arJ+IrPd78vY+4HSmoxjZpTCiuhFZlYEZ+zRy+OMoaphnO9WDYm1lt+vF0FxY2oKHK4
         jX/e005CxMTIXeS7Le0ERFrYjOWKlnXWMyIT5hPRokwPhz7p9ZLK5zKYoTpjkQQrkzBf
         6k3/YGKR/O2gmE24gVxT/4SW8hLBs4FQAELsvJnHqhquY8YmIXIG5q7C4LROCQAtl1yV
         zCJg==
X-Gm-Message-State: AOJu0YwjqmJWNoWkW1lX2WeGSzMA4PsVKxWQoB9zE/8pxgQVwQAUg/GO
	9ztfUMzm2wwPgLoV9ob4gBK48t6vDj8KapxINL1OB1YyDnLsibXlodKSKjiKKAM=
X-Google-Smtp-Source: AGHT+IH35aeD9aoWxV9BWKKVbIqVat0Tr6oYJvQSkKpqYRsKX2JAzCz6Kq8sQaX2iqJjtiMtEYiPdA==
X-Received: by 2002:a5d:69cc:0:b0:367:905c:823e with SMTP id ffacd0b85a97d-3719464e8d4mr6538216f8f.24.1724063047209;
        Mon, 19 Aug 2024 03:24:07 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:06 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 03/11] i2c: riic: Use pm_runtime_resume_and_get()
Date: Mon, 19 Aug 2024 13:23:40 +0300
Message-Id: <20240819102348.1592171-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- dropped error message on pm_runtime_resume_and_get() failures
- restored initial place of i2c_del_adapter() in riic_i2c_remove()

Changes in v2:
- delete i2c adapter all the time in remove

 drivers/i2c/busses/i2c-riic.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 2e119024c2d7..6fc41bde2ec2 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -133,10 +133,12 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct riic_dev *riic = i2c_get_adapdata(adap);
 	struct device *dev = adap->dev.parent;
 	unsigned long time_left;
-	int i;
+	int i, ret;
 	u8 start_bit;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -301,6 +303,7 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
+	int ret;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
@@ -379,7 +382,9 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
@@ -498,10 +503,13 @@ static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	int ret;
 
-	pm_runtime_get_sync(dev);
-	riic_writeb(riic, 0, RIIC_ICIER);
-	pm_runtime_put(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (!ret) {
+		riic_writeb(riic, 0, RIIC_ICIER);
+		pm_runtime_put(dev);
+	}
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(dev);
 }
-- 
2.39.2


