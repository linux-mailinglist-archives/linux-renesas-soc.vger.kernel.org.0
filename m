Return-Path: <linux-renesas-soc+bounces-31401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NT7CZQD5mnqqQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:44:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09438429793
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7891F3019384
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5256D39C65C;
	Mon, 20 Apr 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR6d7U1v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F639C004
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681825; cv=none; b=dSTV8CswRFt7kV2wGMBusdhFVZJNkSZU0S8Gi7442q5FKg4QvW8ILl+nUZnqr4DPlFRNbOSCBWMfkhETdzEZ2FnWUNz5zpc9AzVPhE4XjaLPcTUpyFrvAE6F5hNxDTte8CcjVk/F1inE0ZpCLsBLE63kRz4i8s4R3EhdMBQiAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681825; c=relaxed/simple;
	bh=CzNdLIlMDStTIZ7BBa1Bsq0Y9eD8RZUhGL/aLMqsKLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+71ipQu6r0jtLRllHLurt8iQJCfDxEsbZCD8D9fuGJ5Mex3OyrhfHoeWxKk/HliqijETBxwVfmM6Hyw2zT5H88/c8byNj5DeRsGtdEkI6+LfnsQ2pbVOdZ3qSpgJ5iJ5bw4/VrJKryX/2fN0GLh/rrTsZuRBspAgP7arlQTBxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR6d7U1v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso33761185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681822; x=1777286622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd03d915YFFbDDS7Gpno90+cH614IrY41lAzLURzwnU=;
        b=TR6d7U1vsOaB8FPOnHu12YAz4JmZFyaa0vVhlSR16IzkLgtp/qE4ivCZ3w7lWdoy0b
         eVqmgfLL3hinsDpBE2NTmPdMcYxuSVRvjJo+mxzbieIxTCiIW3Bws9+mePkptoXHnMQ9
         5r2IFZvFpmOtp9GSph6ztttP9et1O2QGhjZKb4KgOws3BLHsqyWbdmvEwhAHFDMXsJIP
         KEFJNKMgaNUpO6NFKWdN43GcgupiTvxjvz7yUhzObTcM/R3xIa+Z6uYBsGgBRF9RoJQg
         iswSX9qUNw6EIMXsKGHy4WCaXsEkEwR+J8OgOy4uCBw4lviuEcwdxm+8nwxvA+QWlh2n
         0NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681822; x=1777286622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nd03d915YFFbDDS7Gpno90+cH614IrY41lAzLURzwnU=;
        b=nI47xG68ekKpZq7exQ4O4AVbDbT1t6aeVPRFa/e5cuiAwW61rK8Zo/zzRvO3XhZfhW
         MHIRq3OJIjgfWgIKGVNUXztROKiRNgfoszrsDw80c6TlhWOr99QooR+45EwEXagp+1LX
         vddnqGOb2AMkoCLCigB3EPveND0z76Vzz3KjJ0+JRINcI9ct3t6Zbs0F26UyTrgnapxr
         4RNHGcCxPmMVcnSDHLavQ7deG01n5lmJZolEC/luVMJ1vc7nYLwnBrVgCswO0jsE5pIr
         GlA590eeXArb6warS2byCLxl0ygKJ4FJ5xewecaV6owZjs6PpERfyoG7r3uB1mSW6yAs
         VbrA==
X-Forwarded-Encrypted: i=1; AFNElJ9yLwGr+n4go5TJ4VwKXuAokssb/vHAbq5XYW4cop598JU/O1xBlUhFHXZGuOZ1wDpP0nbRF9eFIigDfWuhHZfqkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCA/ozkV0Wt1R9TYOx4vEUi1VbPgUjtKSYjWYDxlo3k39pFQHF
	qew2ZCltaUbpIdBAM2HtGFo3+i3EoOgQ/J67k+6Ge4aZrO6P9fQ6+O7jekyfxg==
X-Gm-Gg: AeBDietjOEHBne5MEBRe/2i29eNgKK/0hKjk3Jnv3oee3zZ0HyOQICGNNqruDG5HaTz
	zFTL17TW8nMr74/u/qTdzkvX4ZZ0Sx6oThyvJRSO4RMnUDJA5sro/EuUxeiMQSfI+Ye6Fei4k8/
	KkbYUY9AV4sfWLdjxPVtdWcJF6FJ62fGjjikuO5U2OYvXqXNSNRxlFNh8gUZM/FsMnARTBX9E+4
	aZ87lDQA2WZ7QqJQ06W0OFt0lPP7x4PcAerphuwFTQ+GWorIfEpX6aD3PAHBFQHyFQk69h1W0XB
	zK7Mvr7ksGhX5p0pCQ18nUTWlJsrmEyNm8eUvyugk6aMlvm7FzMDOHw7NLPs3k5l2wPu5mBRNPn
	hie/KNieDOJKTIfIdU9rK9m9hGhcJY2I5IBPrcwKZiWMbIM72QE3v+uZmTk7mi6jcJ1boJcC9Qp
	p2Q4QNo4X2jphFaWpyKG8vv4fxVX3EIMxoS3H3ZwMUEzM/3MGxaulKfldnEn01mpxLs5lpIA==
X-Received: by 2002:a05:600c:8a1a:20b0:485:3038:72c2 with SMTP id 5b1f17b1804b1-488fb8bcdf6mr130455095e9.17.1776681821758;
        Mon, 20 Apr 2026 03:43:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 7/9] pwm: rzg2l-gpt: Add calculate_prescale() callback to struct rzg2l_gpt_info
Date: Mon, 20 Apr 2026 11:43:24 +0100
Message-ID: <20260420104332.153640-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31401-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 09438429793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L GPT prescaler steps are continuous powers of 4, while RZ/G3E
uses powers of 2 but with a discontinuous sequence. Add a
calculate_prescale function pointer to struct rzg2l_gpt_info to allow
per-SoC prescaler selection logic. Replace the direct call to
rzg2l_gpt_calculate_prescale() in rzg2l_gpt_round_waveform_tohw() with an
indirect call through info->calculate_prescale(). Wire the existing
rzg2l_gpt_calculate_prescale() into rzg2l_data to preserve current RZ/G2L
behaviour.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 4324ffc8629d..de68c02b2d50 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -91,6 +91,7 @@
 #define RZG2L_LAST_POEG_GROUP	3
 
 struct rzg2l_gpt_info {
+	u8 (*calculate_prescale)(u64 period);
 	u32 gtcr_tpcs;
 	u8 prescale_mult;
 };
@@ -305,7 +306,7 @@ static int rzg2l_gpt_round_waveform_tohw(struct pwm_chip *chip,
 		}
 	}
 
-	wfhw->prescale = rzg2l_gpt_calculate_prescale(rzg2l_gpt, period_ticks);
+	wfhw->prescale = info->calculate_prescale(period_ticks);
 	pv = rzg2l_gpt_calculate_pv_or_dc(info, period_ticks, wfhw->prescale);
 	wfhw->gtpr = pv;
 	wfhw->gtccr = 0;
@@ -587,6 +588,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 }
 
 static const struct rzg2l_gpt_info rzg2l_data = {
+	.calculate_prescale = rzg2l_gpt_calculate_prescale,
 	.gtcr_tpcs = RZG2L_GTCR_TPCS,
 	.prescale_mult = 2,
 };
-- 
2.43.0


