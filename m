Return-Path: <linux-renesas-soc+bounces-7264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4792E799
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD181F21B38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35685167DB8;
	Thu, 11 Jul 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="icwAqShJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E81662FA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698758; cv=none; b=VPAPEaG9RE1ZBT5c+DE5UPBCWuJpO1rFYuHJW9m2bvfcSgS4HYDEYQpEKKqviudIWFxDJON9GFUejOZH091sfsFR7k5R2gCRxqHMuWYhJpFk73YzLj6iSUEBOjvkZ4dXPB8w38LCOBrybbCaJIUQ2EWuog/SfohLJVRwmMIOVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698758; c=relaxed/simple;
	bh=+msHcSiSOUtVE0zqd9yzVyAfgZYTM4iy8stuOGcJTf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJglUand9eesfJI41yQI5LyZfvAbjPG8ni8CD9/ObpKslniFcgfFCh0ipc3W+H+fXGqWNK6m+WJfsENrEBmTz3e331lNu+o++DYQp2PElonuqG5Yhf4Z/myJyVwagD4nKLgiDaBLlEzev+YwcffG8Fpk07gGYVkf2Qa56zDjUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=icwAqShJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-367818349a0so498855f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698755; x=1721303555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF+Ca0UauuML1oOffpq5+uiBPHq10uLXGtE5BcB3OGE=;
        b=icwAqShJzNiDCuRGF9DhVCznNMezuUEt/nfPgFKq8f97ik7U0HT05VfTyY6U8xzC9m
         hLlWdjupeQ+7NYWm3T168qQ9SSRqIOPH3Z00+vSn5qfg3JdZLfukM7QuVkun0EY8X2jP
         PG9igBWNQbCoVTscRN4/g/pB3/9eSQxw0aua0papbt8IiA21aBQ4nh1OEQzGP6FpBgBE
         BgMATcY2OCdmmQLHXjTeO4WSOnQERI9lP3uw796yv0xY6ui+DPCvgonZK6jwKMLdASZf
         HO0ury9+4FDbV9Ak8M6Kz/tYSXeaPVZN77nymKAd+JPpidxVW0rfZKCnvMGRsxajhqUC
         TVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698755; x=1721303555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF+Ca0UauuML1oOffpq5+uiBPHq10uLXGtE5BcB3OGE=;
        b=dTRv+GUOsAdktjsDIvhqTnyJNVMG6GVs4O3LDyrJGAAaUYZ7TV4qBAhb1PPQuf9PeP
         sEc4fW2ODAO2n446wXbhQRf4zH1fJQRO97AOzEwJz0kFWDyyh0fiH3584aCZtasPs0DG
         gVa31+ZngRB4Eg4eqgjuNWEomJdwWrel9bU6S/RQU/5UB/m0kQTWUCtXR9Bq2S9MTO7h
         ZRawSh6oiETDYwPAsv+OiNPWBMDYK9FKordx5/p+bQ9iqp3sn8pVkzBDwt/DkWK+hvPO
         eRg0bXX9sbaBXa/l/4YSol+brzQOJ+1HKoYFsrnLqjMZHVdND1GlvOxGQFlx36Uhnv5k
         iB6w==
X-Gm-Message-State: AOJu0Yx0ij4rwuKqdor0exD9lEKjHM7ic0Ukl+uCQzWbjeOdKK9tfsdP
	KIjna/Kodg/xdt3oNpT1WhcVoG/ZpfrHFJL5YLTg2cZX6m/lpWfurkqcOLR0yZU=
X-Google-Smtp-Source: AGHT+IFG+7H1dN+ufITntnAYmlbH6+rebYNpNdUfbgj+80L7inS/ej14iKsqvvdoxzPDiZSv+GOvUA==
X-Received: by 2002:adf:e64b:0:b0:367:9795:92ba with SMTP id ffacd0b85a97d-367cea73740mr5015509f8f.23.1720698755033;
        Thu, 11 Jul 2024 04:52:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:34 -0700 (PDT)
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
Subject: [PATCH v3 08/11] i2c: riic: Add support for fast mode plus
Date: Thu, 11 Jul 2024 14:52:04 +0300
Message-Id: <20240711115207.2843133-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fast mode plus is available on most of the IP variants that RIIC driver
is working with. The exception is (according to HW manuals of the SoCs
where this IP is available) the Renesas RZ/A1H. For this, patch
introduces the struct riic_of_data::fast_mode_plus.

Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
fast mode plus capable devices (and the i2c clock frequency was checked on
RZ/G3S).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- enabled FM+ for all riic_rz_a_info based platforms except RZ/A1H
  as requested in review comments; with this, dropped the riic_rz_g2_info
  and RZ/G2 specific compatibles in riic_i2c_dt_ids[];

  Note that it has been tested only on platforms mentioned in commit
  description (as I don't have all the other RZ/A platforms).

Changes in v2:
- dropped code that handles the renesas,riic-no-fast-mode-plus
- updated commit description

 drivers/i2c/busses/i2c-riic.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 0019a8e56dbb..ba969ad5f015 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -63,6 +63,8 @@
 #define ICMR3_ACKWP	0x10
 #define ICMR3_ACKBT	0x08
 
+#define ICFER_FMPE	0x80
+
 #define ICIER_TIE	0x80
 #define ICIER_TEIE	0x40
 #define ICIER_RIE	0x20
@@ -80,6 +82,7 @@ enum riic_reg_list {
 	RIIC_ICCR2,
 	RIIC_ICMR1,
 	RIIC_ICMR3,
+	RIIC_ICFER,
 	RIIC_ICSER,
 	RIIC_ICIER,
 	RIIC_ICSR2,
@@ -92,6 +95,7 @@ enum riic_reg_list {
 
 struct riic_of_data {
 	const u8 *regs;
+	bool fast_mode_plus;
 };
 
 struct riic_dev {
@@ -311,11 +315,14 @@ static int riic_init_hw(struct riic_dev *riic)
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
+	const struct riic_of_data *info = riic->info;
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
+	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
+	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
 		dev_err(&riic->adapter.dev,
-			"unsupported bus speed (%dHz). %d max\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
+			"unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
+			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
+			I2C_MAX_FAST_MODE_FREQ);
 		return -EINVAL;
 	}
 
@@ -401,6 +408,9 @@ static int riic_init_hw(struct riic_dev *riic)
 	riic_writeb(riic, 0, RIIC_ICSER);
 	riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
 
+	if (info->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
+		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
+
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
 	pm_runtime_mark_last_busy(dev);
@@ -526,6 +536,7 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 	[RIIC_ICCR2] = 0x04,
 	[RIIC_ICMR1] = 0x08,
 	[RIIC_ICMR3] = 0x10,
+	[RIIC_ICFER] = 0x14,
 	[RIIC_ICSER] = 0x18,
 	[RIIC_ICIER] = 0x1c,
 	[RIIC_ICSR2] = 0x24,
@@ -537,6 +548,11 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_a_info = {
 	.regs = riic_rz_a_regs,
+	.fast_mode_plus = true,
+};
+
+static const struct riic_of_data riic_rz_a1h_info = {
+	.regs = riic_rz_a_regs,
 };
 
 static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
@@ -544,6 +560,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 	[RIIC_ICCR2] = 0x01,
 	[RIIC_ICMR1] = 0x02,
 	[RIIC_ICMR3] = 0x04,
+	[RIIC_ICFER] = 0x05,
 	[RIIC_ICSER] = 0x06,
 	[RIIC_ICIER] = 0x07,
 	[RIIC_ICSR2] = 0x09,
@@ -555,6 +572,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_v2h_info = {
 	.regs = riic_rz_v2h_regs,
+	.fast_mode_plus = true,
 };
 
 static int riic_i2c_suspend(struct device *dev)
@@ -603,6 +621,7 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
 	{ /* Sentinel */ },
 };
-- 
2.39.2


