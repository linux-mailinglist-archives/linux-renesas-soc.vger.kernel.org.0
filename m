Return-Path: <linux-renesas-soc+bounces-3945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D26881030
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 11:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95D5E1F23E1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFF63BB30;
	Wed, 20 Mar 2024 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ln0jnrwZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D838DE9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710931416; cv=none; b=KDWJh8UHIxNyIAoCmW7KDPJC5XqZ+wOv7gOGbbJZG2Wpf5mR8GX8JkiP74ZlnLTlEYcsHvp5qNjdiSlGGaifpAUuLn8Oq7rCjnosp2hllVnixbu4Na/QawnMP4ETwF4jEaCXmVvBJUGUO/oUX2seksrPK9NfIQbfuxj6A/yGrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710931416; c=relaxed/simple;
	bh=QKzDcHkcQRIpFqamU9V3UGClYgEa7TjD2keY4AvFTp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YuGBgIa8/0BlOX/N1/cVIduQ80R/WtmN2P0vF1lgKs9yiNSlmywzEZ5DLXG8cj95nMEuvPC/igs3cryjEaMJYheETdxTI6UumyZVUqRW8FU9fuwD0KwIqkNQ1ALtMor3b6HjIUfdwKaPth9ZPKPNtEVDN4aZ5H6sy9v3Tw/6w2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ln0jnrwZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a46db55e64fso223900266b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710931411; x=1711536211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9vEMO0oObvX6A3lGCcBDddPOw0Lk5Ue/zalyjwjvDs=;
        b=ln0jnrwZC6xeWVMTQG4rQ+TpdeoUzMtCl5tcQioIo5ba8xanUTd08heSvIJ3l75wME
         WJFDZjvFUPRISE/JzC9DJCS0vM6rPJbtZUwwey/H0L35hXkZYhosmlgiBdzj48jlLgW1
         YGKfdqkkLytDBVUuxieGMt3bTGBWbO/xGyPHdQZuWMpg2RAW7Lsb87I0FLAQOJ6QnSPm
         hW+KVYB3k+TWVj7HHxq5WJNiQl/UfHVCSphTmNtIfelZTBlewn87w1jAKBOs9nlJncPp
         qNfEkSC5/f31I/11hgcryTh+j3tsZyADoVnJKwqj/HZ6BV9BH3EdlAUBuVijJPfRR3Tf
         phsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710931411; x=1711536211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9vEMO0oObvX6A3lGCcBDddPOw0Lk5Ue/zalyjwjvDs=;
        b=qfmMHZlMDPU0umgng7ZbMxkFtswpMDXeQyHGnrl7QcY1REOFNMjpBNkH7REDzyr8DQ
         6dK80AmZQ5dkww9zEotoIHyf7daldfUiC8vNcZLlN+og3qtwiZW5CV+tq5zrkp8M5yhu
         k9VaaGjgoLcTrVXsz3vEixtSibsvcnUu8o0rJRKxa0hT16utsQ81PUNkfNrXkcm0cM8j
         FKXzxVDXn8TBxV/VggnDN5uRBWqswFJOiQzFFhp8reyaaj4kAK8Klj2u/6CoTUker4LV
         6a5XNuUvrBIxAsn+W0JFKzjoeTWyyx2VCnyvuifgMNGPwfKyLMuIsUDN42rxPE1UZxSa
         mbpA==
X-Gm-Message-State: AOJu0YxD4um52SzodVea7lXiBSC2cVSpE0JwNFaHgUTu3dbEjEGm+rBq
	eTFxmsxrdItsuKIqWqf8MIs5EuQ+7VsRYRJFzKzj4+/rHFXVft7tvupCAcDJx52R4yVCVmOTihP
	q
X-Google-Smtp-Source: AGHT+IEGXW7GOajlc4OJ+pw4llUEbCf2kM5xIPQ7EBC2bj7pvQ2hEFUGwk1xgTBleHZc5deIrbnz9A==
X-Received: by 2002:a17:907:807:b0:a46:c09b:f1f3 with SMTP id wv7-20020a170907080700b00a46c09bf1f3mr7304405ejb.41.1710931411392;
        Wed, 20 Mar 2024 03:43:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906289400b00a45ffe583acsm7092081ejd.187.2024.03.20.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 03:43:31 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	tglx@linutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 2/2] pinctrl: renesas: rzg2l: Configure the interrupt type on resume
Date: Wed, 20 Mar 2024 12:42:30 +0200
Message-Id: <20240320104230.446400-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 93916553bcc7..4fee3b0e6c5e 100644
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
@@ -2063,17 +2065,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
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
+		if (ret)
+			dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
+		else if (!irqd_irq_disabled(data))
 			rzg2l_gpio_irq_enable(data);
-			raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
-		}
+		raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
 	}
 }
 
-- 
2.39.2


