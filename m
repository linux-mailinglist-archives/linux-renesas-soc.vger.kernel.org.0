Return-Path: <linux-renesas-soc+bounces-7947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB095840C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 12:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95D2AB24678
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8818E03E;
	Tue, 20 Aug 2024 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lr9EK1Hs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C7318DF90
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149177; cv=none; b=uHhaREukTc0IowBx7T5ejMFzapDzRSXKBJ1z0/Q6/Uq2gPOpWleWumU7+f+pByqM7CXW086z6wV80UUpjTW84dwTZMwHdgg8OsK6vl+c7Y6gHwIiom1k9eiZpQk8/eTHXNJkoxOpdoRHvSuCHJGCncAL/6pHPcHUZj2HZhMSL2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149177; c=relaxed/simple;
	bh=cNNjQttiLgf1necaxo77Jw1cc9uDH5GA16TvXwtf6wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cchjpYKqrmLKY8YPhILHObSXJsTwkUC3BlwOlrjI1kyThGq8lm/yF8w4eXktjmcK6JD8bLFs/AC0PBQ9tmRNKWhew129gLUw4uAAyhlUKrGlpAPk1Oy5tXTxRUiVblXwZ4GmCjYG3cx4gjRmGmWXj4tVaVywUwFQutNmgEdjhvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lr9EK1Hs; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3e2f5163dso15816471fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149174; x=1724753974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPXFJc6gcMMk+4vX3cXQqxjNWYT/VTeUT7RD3vBSt14=;
        b=lr9EK1Hs6ZMVTnM7apxUdDwm037Sb59KsILdYpDTeccmcRqjVwXjqYihN8x3bocwvC
         6CRKvrIPKbVKcdFtmYcbq7FEWngi5zd2dYOWEvmrGNk2nSmfpiLfCWUjlC5ZvjkSyMNV
         2ckofCeUc/w0aHKa/pFyqgpoYmoD4DzFsQQSeEfihGm4sqsxwpklyI1ErILfwrVwqS/V
         Hq3TkIaE0/222F5vwxP4T7ioxhrowYu6taZGGiBShGpn7355RUOfuNqmq7ZU81sOarNK
         /eXjCZ4uUlg4Oj5aaMjSWPF9kElQbNIfSIXWvdZk+isjewM9udaRTyovp3MlBnTYMkbf
         skwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149174; x=1724753974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPXFJc6gcMMk+4vX3cXQqxjNWYT/VTeUT7RD3vBSt14=;
        b=W/xJFxtvFSEtg2ecJOBU9CruAZvUtrtKrv3YnwFAuhxKl0N3ITNM5WrFMkEW7vekJx
         9xOFaNFIL0gF07RsVk14XvKgBB2VEtF5tUM7SxjhVd5btHKUpCST89PfH+2Szj4OCIm/
         kKKIyAKXAJonp7Sj6D38AsmkCngqG7hJHweOjEhKOsJ+VsllZ6jfcReb5sGK5ArR9Yt7
         B3BnJYhAGJP2Tcc5OP8yl9dTmqb8ZlIWLD8bwzRz2kN+sbt1drTrsSmN7tJXKMDL/KcE
         lFlW9aKd5I+ckQTmEaP2uPfajeyv0u5k6XEimzeEmNSSc6exn3cNghQ1lad+utIzPLcc
         szFQ==
X-Gm-Message-State: AOJu0YzHQbtD1nvw/ZtsXQ1ZAikPMK5tzCMd6yOkkYWzwn6eG23FmYvh
	DrbWq5GnkPwqNW7TNe/nnabeFwSoUWwFOncQc/1uzF43t46KkNL6pNr9KhkD9FA=
X-Google-Smtp-Source: AGHT+IEWKnix5ITqvENAXxypC3bZpawDtQsVVhD1tV5/rTPnlQTkYQAFRPzt6jP6cYqsKGikHAplJw==
X-Received: by 2002:a05:6512:4020:b0:52e:9fe0:bee4 with SMTP id 2adb3069b0e04-533407870f1mr1226654e87.9.1724149173472;
        Tue, 20 Aug 2024 03:19:33 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:33 -0700 (PDT)
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
Subject: [PATCH v5 03/11] i2c: riic: Use pm_runtime_resume_and_get()
Date: Tue, 20 Aug 2024 13:19:10 +0300
Message-Id: <20240820101918.2384635-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v5:
- none

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


