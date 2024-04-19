Return-Path: <linux-renesas-soc+bounces-4725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212C8AA87F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 08:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A427B21AD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 06:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D352E3F2;
	Fri, 19 Apr 2024 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bZy9nPsb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B926BA39
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713508735; cv=none; b=CQRhIjRPSyoTp44c5pPDpALwgKwwlPHYJqSmxyKVveziHKqnkJOB8ibuQr5h32IXkxZZtoJH/emglDksQmGdcVsWROi6cLQlGn8OUd7pspWZD+ijYpqleE1odHNXrAkC8LV5BKRNVmIOEmACQdjKY0M3+xmpuPEO55Ijj+aE2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713508735; c=relaxed/simple;
	bh=ELosVufvt3J8r8VoFCclmgHzRzoTIWsDwCk5v8O+W+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aD7EUTSMAmZmM1lafNIm9+BnTc4pxmCsQEYfWWD+91TLPEy89v4Szvktwm9Dzmww60Ep0sWHj8bIPdIS0VHVGQdktE97fDGRfnSt3zO7v7gjzinl13xejz2CUbcmgGgqwlTwiOPUI6M5zS9iCERD7NVVtiULVEOnbERMmVH5tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bZy9nPsb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a554afec54eso174426066b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Apr 2024 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713508733; x=1714113533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2Mx24L3N0RW14qQUkoJvbTo91HHgAXzvzpRIQqaSQY=;
        b=bZy9nPsbyAcHA1xhIestMc6gaPCxk/uV59TJmeJz0ZmEy++KsWeFRBEJZDEBpp7JLr
         zDaEtunr1q8JXQ9boF8R1hiDe28rGamk7uvJ6jvPH4YLfnNbcEBz9QJXe7j+xJXt1WoW
         ER5cMp7lNhImD4ojv6Y8lLiIA5nofaRJj1Ns0Joc26vwE90grz6btyONUs/IxsFykp+W
         8kqTSAqAfNuh553Acc93/cEHppnQiBout33qVrH8MmkOsXpv8ARiM1laI4eeyp2RjEn4
         cQpMGL5ZnScAaYOdN9PViKKvtNT72u6MBfwTksVE+o0WrcyV6bLTvlko0SZTwx6oL84T
         iZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713508733; x=1714113533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2Mx24L3N0RW14qQUkoJvbTo91HHgAXzvzpRIQqaSQY=;
        b=H2eavXeRVgWFWhcruPa3CNgOJryQ37VJTJ2zQ8l5q94CUv8jt/FUyg2dLnkBCOjotH
         QcDxRWfVS0ytq6qmKW3OE3uq0GGYuhgWoJlUidVa3gqc99xwUhvYHqMK7rgeDMKrmoQK
         yQHIzOgqBnXZq8bhvpPM+T4/LaYMo/DiT9HTaV73exhCvXmpZeQVFzwBs8m7pWACLz58
         LRH33CL7vknP+N0jBGCKyfUfji1nijP7Ay8a4zt1Oc028VHmx5grXjTPQjG2TLpQ829Q
         umohyamM3X3hGDHCuc2R4GPCSXEjbUWIONOwYfE51i2KP1AmBpivR20bKy+dXfDk5pfa
         EiUQ==
X-Gm-Message-State: AOJu0YxNBzkLE4LmbhxdsgRdqrKyTPnEHoe+itnknMLz+7y/w0Swarxr
	4ypkMzr/jh/ZdjM+1cgqwfwY7s3/8yYeDiWzXUOqw/OPVOG7Zh1rsNzl5ugEHEY=
X-Google-Smtp-Source: AGHT+IEL8RYkHCjgvfJZPy2uPbkbMy44leaygK204xVTUhAcLJRhbuT13glVUZZ/p3X2kh3LZLN+Fw==
X-Received: by 2002:a17:907:7288:b0:a54:e183:6248 with SMTP id dt8-20020a170907728800b00a54e1836248mr941953ejc.0.1713508732584;
        Thu, 18 Apr 2024 23:38:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id m16-20020a1709061ed000b00a51c0c0cb86sm1797440ejj.22.2024.04.18.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 23:38:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	biju.das.jz@bp.renesas.com,
	tglx@linutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4] pinctrl: renesas: rzg2l: Configure the interrupt type on resume
Date: Fri, 19 Apr 2024 09:38:22 +0300
Message-Id: <20240419063822.3467424-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT
source at the same time") removed the setup of TINT from
rzg2l_irqc_irq_enable(). To address the spourious interrupt issue the setup
of TINT has been moved in rzg2l_tint_set_edge() though
rzg2l_disable_tint_and_set_tint_source(). With this, the interrupts are
not properly re-configured after a suspend-to-RAM cycle. To address
this issue and avoid spurious interrupts while resumming set the
interrupt type before enabling it.

Fixes: dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same time")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- moved dev_crit() out of critical section

Changes in v3:
- none; this patch was part of series at [1] and added in v3 of that
  series

Changes in v2:
- none

[1] https://lore.kernel.org/all/20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 93916553bcc7..20425afc6b33 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2045,7 +2045,9 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 
 	for (unsigned int i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
 		struct irq_data *data;
+		unsigned long flags;
 		unsigned int virq;
+		int ret;
 
 		if (!pctrl->hwirq[i])
 			continue;
@@ -2063,17 +2065,18 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 			continue;
 		}
 
-		if (!irqd_irq_disabled(data)) {
-			unsigned long flags;
-
-			/*
-			 * This has to be atomically executed to protect against a concurrent
-			 * interrupt.
-			 */
-			raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
+		/*
+		 * This has to be atomically executed to protect against a concurrent
+		 * interrupt.
+		 */
+		raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
+		ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
+		if (!ret && !irqd_irq_disabled(data))
 			rzg2l_gpio_irq_enable(data);
-			raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
-		}
+		raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
+
+		if (ret)
+			dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
 	}
 }
 
-- 
2.39.2


