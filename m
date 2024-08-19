Return-Path: <linux-renesas-soc+bounces-7882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6A956850
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EBB1F2162F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 10:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB623165EF9;
	Mon, 19 Aug 2024 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jM/7nqaB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27316130C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063048; cv=none; b=te4jTQ5ZXv7CiSnMxrl2SJePWoOkCzfumEx4ZMIXxNIcgLnG4T5pgDS5Y29rpFe9mO9zhNfz3dXnrpm44J4R8IDS1Oi0u0OCKOfzRKskwQeCG25sJkBF/2T+RVt6h4z6+EnDJmcnsNVaeFkOaISfaIGhA1ZcNnVCE1jL9J4HHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063048; c=relaxed/simple;
	bh=lATT16tEASaWJrtIZ8R8OxHTCKd5ZoB5ix2CHDbDV6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SHGuzi1hCrTmYNMGRVZNg0eMllTyDNjRu1dGrD+++1+ST+GKds1vQKMSywyum/MqA5JlUVy8q5pQe09okFlvS9SEsqzVB8TYQ5ZU2kVDQcsNHIF1p61WRk415ScM+jMgm6Xpqkdi33LuGNhyYNJB5uU2BH5u/vUzwnaveBlKUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jM/7nqaB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso33040165e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2024 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063045; x=1724667845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ria4gejXgTrbHH7pUOF3bsKUCGfhOX9GK/RsFmy6f6k=;
        b=jM/7nqaBb5NIT5GNIxdjetb+Z0SPV2JTC7cG4Uwp12xFT301H7zMWR6mh0smiPkhzx
         Ea8xJUr9Bd/WjGCcApYvZE5pbnZCQUh8AfHBIhOojaIZaJY3avxr4geZLRQGZM2hkwOZ
         0Su36RjUoZQ2InPdqMezEqaZFXViAfXmBvLnv77naJafVvnJF3CwFeMXa4NDwU4IZamU
         burzyo4XlmJY0o2unleMusPVXBOYrA930hpFO5WmX5Z6fpOOcoisnhw5yk9MzK6AcBQp
         RuXt2Mbdk+cgeiyUiJJcqXAlL2sboyX/P7sVrDkrG5p3rZniXD/Tx/WeUS6TbPJb/VM0
         fcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063045; x=1724667845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ria4gejXgTrbHH7pUOF3bsKUCGfhOX9GK/RsFmy6f6k=;
        b=fJRnLpMgqRzzP1v5Id/+EjRjvWzn0J4DT7y1iwiMQFZdqhNG2T1ZemziXrOKLgHmOR
         mw5eFy7KF50z1Pp65PCirB8xIVOp87OUhLwfU/iUPaCKRmZFW/YBMT2j/drS3U0dlrdu
         7C1fRGOgH1dMZFeX211zwXRBRNQm5viv48m+g/nFApGJiCPRFDF0aSlbF9+u7wX7F0V/
         PF4kJ7s5ulke10DOvak7HTKaVoM8hwtpn3AY55m1KlX0EUWVbms8+j2J/PeC71C6udV5
         Uhjl2CEVcxiqdXat2br8n1hFumFP6EPUcT9foV9OsKddaINJm5oQrl9z5y12MOOf9OyF
         W80w==
X-Gm-Message-State: AOJu0YyeOarcYu5e9UoNLEtkHuUdy2fKLmaXzJmwoe7VftrReY4HVOFC
	L8e10KVeiErU3EKuD46vVk+UE/mOJRIRNa/6ac+K5GUSW8uUBWOI8PIqANnmF+g=
X-Google-Smtp-Source: AGHT+IFRms7CEp+mC2QUpyEJ6F7ca4xvMy27W1APCHnVbbzJpGgWcbRMxcsIbhj6IKc7uYK2FM2O0Q==
X-Received: by 2002:a05:600c:3550:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-429ed77db6amr68523215e9.3.1724063045333;
        Mon, 19 Aug 2024 03:24:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:04 -0700 (PDT)
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
Subject: [PATCH v4 02/11] i2c: riic: Call pm_runtime_get_sync() when need to access registers
Date: Mon, 19 Aug 2024 13:23:39 +0300
Message-Id: <20240819102348.1592171-3-claudiu.beznea.uj@bp.renesas.com>
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

There is no need to runtime resume the device as long as the IP registers
are not accessed. Calling pm_runtime_get_sync() at the register access
time leads to a simpler error path.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index bc33762a5d07..2e119024c2d7 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -301,19 +301,15 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(dev);
-
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(&riic->adapter.dev,
 			"unsupported bus speed (%dHz). %d max\n",
 			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -351,8 +347,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	brh = total_ticks - brl;
@@ -384,6 +379,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
+	pm_runtime_get_sync(dev);
+
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -397,9 +394,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-out:
 	pm_runtime_put(dev);
-	return ret;
+	return 0;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
-- 
2.39.2


