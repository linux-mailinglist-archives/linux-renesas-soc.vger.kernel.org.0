Return-Path: <linux-renesas-soc+bounces-24991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 070CEC7AC0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8620A3672BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B949B350288;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRmzhu7g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A43491C2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741339; cv=none; b=aefBLN55RDByKPe4MFJLar196CRxFTMkMnUCTnhOsOl0KA9dazGIJjV0I0VmLha3Kt6IAXYCT1DZuv7QXOjxEhFvLKvwBLwVfwF+StGDm/1r06GLU9b8Xqp4EVN35nFgrlavzGAYnOoDaYey5gz5EL6XxtnxNBTGf2RqNDYJMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741339; c=relaxed/simple;
	bh=8ZF3K5fZHfu8OJ0FjVbioizmnSP8gLtvioziN5zK+5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr76PkWWx1jtJqPWwgafFJGq0YU3Mtr5oBjdCJUdWT9SxOhReOy8LQZBXZYq7yqLPPS1vquI93YPIFra42hfgPKBxnkhrUslgWLHi/VWaV/Nt1+R5nV1dsN0HJf0WRHAfaw7lLgdJYCPXsDWAkbFw5TdU5qKrvQZn8bSazZ4Ymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRmzhu7g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47790b080e4so12335435e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741332; x=1764346132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBMzVmStt4iXY2kK48dRs2GNNttV+QfJh9K9JLJwKno=;
        b=JRmzhu7g7YMGh50Gra/SPfwvR7IHDsTDFrjTe1y5eJo+53JVCM76NClWwEuU9DCEeg
         g37k5F05t1z9eQMlsYgDbPASkuJcv2pYYBmHJBSE1B+EgbIgbELrmOTXfIQjfN44WoqM
         cme5c2hEvd0JaDBWe5ukft2dM7v7+UWang9zis9hpNhItDshzA0PX1HuSMK/7Xcu/bKq
         5kT7mToBVN4xwIO8JshTxhMxqkPuRajnxcVXDivWm3WaeJ6qnkkoDr0WnKIh+Tic7YS2
         z/vP8tAnnWgtMJRXayiF1K3Cxz/nAg0aH05XCbHXslH6dnoAUK05r34pMt439Nd3j9Vu
         bahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741332; x=1764346132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBMzVmStt4iXY2kK48dRs2GNNttV+QfJh9K9JLJwKno=;
        b=MykxP1Gdty+qtkJe+Phjn9NCdmDxO4oI1/SsPainNWVxikLWNasv5Lef5YK2robeWQ
         VkpFWVx3bPEzd+aSiTSJiZKXk0iR93Sh8eaPCIfmwMuHwucG5ClqUt40j/iB6TC6JywZ
         X6TshLfq2nweXbQmVx+VSXREuiBPjIHJcFxIDeAEoD0F57vxQtYrqEl5b2a+u7WYRLKx
         EB3m9wLsvjWGmP0cJKI6hSJzcouicV4LPO/UpBSkyfmzzJSAQ6T18vK+YSvBmigKYoLH
         4F4a1wlAnU5lHOosEJf4ZLq2Q9CSsiI2EChvlqxSEEwpokXyQSPZTKk1h05ZERRs7tbZ
         EWDw==
X-Forwarded-Encrypted: i=1; AJvYcCX39Q3oVY28KBlU9zpfSTqlhCmKsBuIZjCfUWNcb9HNFeD9nabcH0VftpmgwLUnFqP3cOGbb4uJi7sWHSexKrXkhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6j8r022lNKGl2GcLKVGYwwDO2T4rrCJibMW9cw0lzOrdWt+wO
	dIh7Ysn93JEsFYohofJtVOf1JGzhNK96klM7O0650cwfIN/DB4aOmxXs
X-Gm-Gg: ASbGncsHLosjnTOMFiPlN6KbdrZqEvtnhoV3rxc4CYqKSUJB5KrvAKhwx53VOWivdLm
	8yu529G1Kfs+5TDgcvtAHJzopRGtd8IObYThxMNHGYUA/zAW5nhuTJmxqe7TAZ2CDQfk+XM8NDR
	dBMVPmVDc+ASSmTCeOx1jUmfPSiU1LZQghBMdZf+hjbCFB1cDz9/Bx4b9CPiIQ+V5uECl0c1rCI
	LusNNIhDG2lcQfvpENU69j6MjdbOPUG1fOgb4DwRymdOLe+OcqAe5O9YBX0Q6g7cN46IaXw0a3u
	GPQxsPioqHigD4C28rnGNB8usVu8vOXgYL2dbXpOYxjnNn5Ios6mOvPda1kTqS0Z4XGkq34bfuU
	0jlo68/KOBQaj8eNXpQULIwiPiNpHiiqDtCNTl5KcYRekti1HPgb/S48QrOOne9p/8XAOl6v/Px
	YQSEXC2Qy6urGoHXJHxmwjfq9ch2rufTYEDCGRHglknXI8C+ZXkKNXtxWRMaf6ybskV86o/9Ngv
	CsE73J5tQ==
X-Google-Smtp-Source: AGHT+IE+ZUdN+W37qG7IiBAeuKMl1Doki1B7HpdO5POm0Ccptffh0HTr4Xa5JOkE3W2dOvU9/wjFQQ==
X-Received: by 2002:a05:600c:4591:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-477c10e1cacmr26405905e9.14.1763741331535;
        Fri, 21 Nov 2025 08:08:51 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:51 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY v8 09/15] pwm: rzg2l-gpt: Add support for output disable request from gpt
Date: Fri, 21 Nov 2025 16:08:16 +0000
Message-ID: <20251121160842.371922-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

When dead time error occurs or the GTIOCA pin output value is
the same as the GTIOCB pin output value, output protection is
required. GPT detects this condition and generates output disable
requests to POEG based on the settings in the output disable request
permission bits, such as GTINTAD.GRPDTE, GTINTAD.GRPABH,
GTINTAD.GRPABL. After the POEG receives output disable requests from
each channel and calculates external input using an OR operation, the
POEG generates output disable requests to GPT.

Add support for output disable request from gpt, when output level is
high for both IOs at the same time.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pwm/pwm-rzg2l-gpt.c   | 99 +++++++++++++++++++++++++++++++++++
 include/linux/pwm/rzg2l-gpt.h | 33 ++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 include/linux/pwm/rzg2l-gpt.h

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index aabd2d576231..8006c62068b6 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
+#include <linux/pwm/rzg2l-gpt.h>
 #include <linux/reset.h>
 #include <linux/time.h>
 #include <linux/units.h>
@@ -40,6 +41,7 @@
 #define RZG2L_GTUDDTYC(ch)	(0x30 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTIOR(ch)		(0x34 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTINTAD(ch)	(0x38 + RZG2L_GET_CH_OFFS(ch))
+#define RZG2L_GTST(ch)		(0x3c + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTBER(ch)		(0x40 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTCNT(ch)		(0x48 + RZG2L_GET_CH_OFFS(ch))
 #define RZG2L_GTCCR(ch, sub_ch)	(0x4c + RZG2L_GET_CH_OFFS(ch) + 4 * (sub_ch))
@@ -82,6 +84,12 @@
 	 RZG2L_GTIOR_GTIOA_OUT_HI_END_TOGGLE_CMP_MATCH)
 
 #define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
+#define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH	BIT(29)
+
+#define RZG2L_GTST_OABHF			BIT(29)
+#define RZG2L_GTST_OABLF			BIT(30)
+
+#define RZG2L_GTST_POEG_IRQ_MASK		GENMASK(30, 28)
 
 #define RZG2L_MAX_HW_CHANNELS	8
 #define RZG2L_CHANNELS_PER_IO	2
@@ -395,6 +403,96 @@ static const struct pwm_ops rzg2l_gpt_ops = {
 	.apply = rzg2l_gpt_apply,
 };
 
+u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = dev_get_drvdata(dev);
+	u8 bitpos = grp * RZG2L_MAX_HW_CHANNELS;
+	unsigned int i;
+	u8 irq_bitpos;
+	u32 irq_bits;
+	u32 val = 0;
+	u32 reg;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!test_bit(bitpos + i, rzg2l_gpt->poeg_gpt_link))
+			continue;
+		else
+			irq_bitpos = (3 * i);
+
+		reg = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTST(i));
+		irq_bits = FIELD_GET(RZG2L_GTST_POEG_IRQ_MASK, reg);
+		val |= (irq_bits << irq_bitpos);
+	}
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_irq_status);
+
+int rzg2l_gpt_poeg_disable_req_clr(void *dev, u8 grp)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = dev_get_drvdata(dev);
+	u8 bitpos = grp * RZG2L_MAX_HW_CHANNELS;
+	unsigned int i;
+	u32 reg;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!test_bit(bitpos + i, rzg2l_gpt->poeg_gpt_link))
+			continue;
+
+		reg = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTST(i));
+		if (reg & (RZG2L_GTST_OABHF | RZG2L_GTST_OABLF))
+			rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTIOR(i),
+					 RZG2L_GTIOR_OBE, 0);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_clr);
+
+int rzg2l_gpt_pin_reenable(void *dev, u8 grp)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = dev_get_drvdata(dev);
+	u8 bitpos = grp * RZG2L_MAX_HW_CHANNELS;
+	unsigned int i;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!test_bit(bitpos + i, rzg2l_gpt->poeg_gpt_link))
+			continue;
+
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTIOR(i),
+				 RZG2L_GTIOR_OBE, RZG2L_GTIOR_OBE);
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_pin_reenable);
+
+static int rzg2l_gpt_poeg_disable_req_endisable(void *dev, u8 grp, int op, bool on)
+{
+	struct rzg2l_gpt_chip *rzg2l_gpt = dev_get_drvdata(dev);
+	u8 bitpos = grp * RZG2L_MAX_HW_CHANNELS;
+	unsigned int i;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!test_bit(bitpos + i, rzg2l_gpt->poeg_gpt_link))
+			continue;
+
+		if (on)
+			rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTINTAD(i), op, op);
+		else
+			rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTINTAD(i), op, 0);
+	}
+
+	return 0;
+}
+
+int rzg2l_gpt_poeg_disable_req_both_high(void *dev, u8 grp, bool on)
+{
+	int id = RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH;
+
+	return rzg2l_gpt_poeg_disable_req_endisable(dev, grp, id, on);
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_high);
+
 /*
  * This function links a poeg group{A,B,C,D} with a gpt channel{0..7} and
  * configure the pin for output disable.
@@ -526,6 +624,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to link gpt with poeg\n");
 
 	mutex_init(&rzg2l_gpt->lock);
+	platform_set_drvdata(pdev, rzg2l_gpt);
 
 	chip->ops = &rzg2l_gpt_ops;
 	ret = devm_pwmchip_add(dev, chip);
diff --git a/include/linux/pwm/rzg2l-gpt.h b/include/linux/pwm/rzg2l-gpt.h
new file mode 100644
index 000000000000..718aaeca39f2
--- /dev/null
+++ b/include/linux/pwm/rzg2l-gpt.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_PWM_RENESAS_RZG2L_GPT_H__
+#define __LINUX_PWM_RENESAS_RZG2L_GPT_H__
+
+#if IS_ENABLED(CONFIG_PWM_RENESAS_RZG2L_GPT)
+u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp);
+int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp);
+int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp);
+int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on);
+#else
+static inline u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
+{
+	return -ENODEV;
+}
+
+static inline int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp)
+{
+	return -ENODEV;
+}
+
+static inline int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp)
+{
+	return -ENODEV;
+}
+
+static inline int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on)
+{
+	return -ENODEV;
+}
+
+#endif
+
+#endif /* __LINUX_PWM_RENESAS_RZG2L_GPT_H__ */
-- 
2.43.0


