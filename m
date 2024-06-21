Return-Path: <linux-renesas-soc+bounces-6610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E8E912354
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8AA9B23A71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E2A176253;
	Fri, 21 Jun 2024 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GeZynVUt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328A6176224
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969006; cv=none; b=g9WTqmNuUSgmROMJCm8XZnINIMzLF0aY4U9uvEqVBOclYshQN6RIh74HNk7PI8K6DE3shfXxvC2qOZ2olviBfezlv4ujRL9XFKzfA+JqwMDX9hzR6Pcya2RmCLmx7fFlc2FyULKcu7ms+bJXY+GYwnSEkoAKnoChpbOgt7XgpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969006; c=relaxed/simple;
	bh=S1hm/Q+NuAcT9nxD/pVjadLD+I32CWUrwiArUqlGHZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5/Or5rdEkkdrSs26Ni0liNpKvHNA4VicHh/NkHBOeftPG8dAJtDS6XGaCmeONZ0qTGKRvDemgAKPgDf3mu/W2UOyTNWsQE05vy17ybq35HX4ZF0H2GuijFZEXJyjWbRo8U+sgD2KAARRX9Ahf9u77gT9IUbqfbU/gCZiB4sLbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GeZynVUt; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6fb696d2e5so214019866b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969002; x=1719573802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q2S7HvfURtpVg3mGnjpDhomnr+bQTG6duN65cLSQuA=;
        b=GeZynVUtyNJ7ICUa+oeTYkvg05nCPYCHKrpxNRu4oAGR1PUDDW8QksNp7RoW9xMo47
         EVz3gZiymrJhwTrnfKlyVGH2MZpCmoJ0RI45l0Kotpu88fhvliOoKIRMCEOv91KxcF5+
         BI4pSgZ5Ajtn50Aw79Sg914/BstzazII0MW03GrTQBlX9tKzVDSK7v3MASrWpl8f4T2M
         rbCTY2T0gJ0zNPi+KBTWvL0stojZ+1T6SRt9yTX1rRuY8GnI/d+Wt/8d79enhuz25WM4
         FbljAahvZX26/5fSR1nDXCwi+KXZmZMANLYoPlz2PEqwV7+KIXshqcXjph6CVjXIZh8z
         ADMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969002; x=1719573802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q2S7HvfURtpVg3mGnjpDhomnr+bQTG6duN65cLSQuA=;
        b=ugjSoaFohRM8Wi4Wbmu64h0QT5+7vxGKUgImdUfUOx/oPBFB2GB1SmqIiws9YeQW2G
         CMbNn0idrg3Icz2BESFFIPyZkhWAH8JYew6Hem0fRtqcD8sC2veEFB/88graNm2zJTcV
         x32IHv3L2f0Umz3cqJU1PdBuUu5lwRY2z4rsgvCgUGOkaV+A+JmUQMzw5FrRf3HSlCUI
         DzhAGG0Wi3gzZOzsFDzM7YoyH0dFa7Cwi7ov0WZyC/v758aTNqPU7eOla1dahnPdgvvi
         6kUQQB2U2iBFqM42Ta672pTt+l4wg3eCz89RAaWw6Mp9XG20CRNHJw0eId071RfMEjf1
         cdQQ==
X-Gm-Message-State: AOJu0YzV1F3w54AlOxncgdE0yukPZOCjEzE6vyrI7t0vg0r79NMl4vz/
	nqG16rzSONoepDIsUjVZU96TqEJE/jvlnfazvIGiZdx+RusHnDcg8C0w6hZLW/E=
X-Google-Smtp-Source: AGHT+IFBywlMwo6ddeYYu3/kNuX5vO5gDzF03oKjx3N6oQ3I7NwLK+CukGLkpEtNcx6M4DcPC6fEDA==
X-Received: by 2002:a17:906:c385:b0:a6f:5fc2:fe8b with SMTP id a640c23a62f3a-a6fab62f61dmr408251266b.32.1718969002596;
        Fri, 21 Jun 2024 04:23:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:22 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Date: Fri, 21 Jun 2024 14:22:55 +0300
Message-Id: <20240621112303.1607621-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 83e4d5e14ab6..6b739483ef37 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -113,6 +113,8 @@ struct riic_irq_desc {
 	char *name;
 };
 
+static const char * const riic_rpm_err_msg = "Failed to runtime resume";
+
 static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)
 {
 	writeb(val, riic->base + riic->info->regs[offset]);
@@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct riic_dev *riic = i2c_get_adapdata(adap);
 	struct device *dev = adap->dev.parent;
 	unsigned long time_left;
-	int i;
+	int i, ret;
 	u8 start_bit;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+		return ret;
+	}
 
 	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
+	int ret;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
@@ -379,7 +386,11 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+		return ret;
+	}
 
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
@@ -498,8 +509,14 @@ static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, riic_rpm_err_msg);
+		return;
+	}
 
-	pm_runtime_get_sync(dev);
 	riic_writeb(riic, 0, RIIC_ICIER);
 	pm_runtime_put(dev);
 	i2c_del_adapter(&riic->adapter);
-- 
2.39.2


