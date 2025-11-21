Return-Path: <linux-renesas-soc+bounces-24992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C76C7AC12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6028367910
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C91350D6E;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlkNNUK9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3A34F245
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741339; cv=none; b=LLgfoM4aiCdOqwSIcnGOy+rx5tEDAe5tyvZ4z8kdWd90gXn+llYnyoxCY+YhgO5u2uiH3KOXGrHPzILFxXJ/LTlAWjDSEgcJYSFuw1wNxDy61YrUyRMrKueiNiKoQUli9gUbgCla4/dt+Qo/IofrA0xxgRkyUqMt+7tY14Uaojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741339; c=relaxed/simple;
	bh=6d3UawdJbIGNpQ1r+t0ClfBpoFcfP4pXx/49sOBT1uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p++Ajfa0YCK42lhiYkyWOeWSzD+zhDBxCPnaQDFxDjTziWRpyaK6kwI5uXDAiidUHKBFe+8T4lwbrwDNkoTzREQM5prG5WE14rFW/b/h6HwAb8rAlARkN+zOwPRa1hUw47T7BQCT2I+fJbZTVoztoQLMUSLplCZCL6IVS9IrGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlkNNUK9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso14989945e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741333; x=1764346133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrSuBxCexGS87tmWsDBU0gBjhQ4SwSQ7srqw0RC4gYg=;
        b=LlkNNUK9VhuyQ8JHMYcDKCXpPybTzHs5PyofT7YOvnPGUH4WeT2UOawGElNjY+x9rW
         VWZdi6LIOixX10VFyJwkZAPDd+boNxavCi4aOEKQUAP1cZM0nVI56B+oKJr+xI75ft+y
         dGP5phaX2lF+43TzI9LE1V2U0/xPxXI11dOKpJA7YLPC4HIEhGjK5PAAdDXn6AEOVyoD
         B1JVg1h67obq9Icz0MU1KOQkzjHAkNj1817N6InA80pFnRNl28achBePtUD4kISnQmjv
         1gsbEOuvGOwozm+cy78pExm7ZF1PB7rB3gfQSQvGXIgZZCt9q2houzcIEvTXQ+Qyq0hq
         5H8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741333; x=1764346133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrSuBxCexGS87tmWsDBU0gBjhQ4SwSQ7srqw0RC4gYg=;
        b=gogK1YPvJcAvC6FL385stN/r8uMKwxPWHugfhWSkIkqo+xWsaV1lYAsxtmWvRef8iM
         XA0ub7hHhI2NqDs8wEC8c3YGbYQshLmLiQ1JSsufcQvKFj03qlOF+BkD/PPVrp60zW/r
         d1TcBhKHA1sWMGOr2TrHFA+nXAafkgKzW0XDOVIk112o+qfiGKQ5bT0mFRPCyFkUacGO
         IdgJ2TpnkwyJIKwU4gY/GqmqdNOm3tGpk0ChBc9RYV68uGrM2hUClSzaSshBHIa3UZHg
         39Zcd8LY+MgtLEEqVNUWQkS9l1+6KJFo+2BkOBD2dFSLNsUgjg61wAeequ3bIh0SBUZY
         2Pdg==
X-Forwarded-Encrypted: i=1; AJvYcCVj8FTURVzCz0ZBGfz4787d0DA73Og0/rhy6zOXJ7mn2VmSbFoiw76jQVR1mzYRfteaq/UyZKNFYFkydWNHoaMKwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrPFN2rK0Tx9Cyg+LU98uLXLIuFQM7MlcenoS7v5Y8ExBYWVX
	d4TtaBR6VJiTZK5WO9Cn4eeolbZxVcxJ+E1C3rWKingyi1k+znFooRYI
X-Gm-Gg: ASbGncux1zF7+6jEVyL8uUbkTNgBzQJnX3u8nt2JjVxDZRa80ooHg+UoqZ88JWoOm1V
	Bf4evNwUHfaJIvup/zOnF1V04W5QgPNA5IOQxm2zqidG9t4SkX9af48RD/8mnXHjJX002T1dRZz
	ujvMyhWyryuUwiN+4MvIBe7nslXxLPyaY5l0qT63mfMPb58mgpEGI+ec7YRVpyYI96rki2OKMU2
	2QRcANQEP6IvpBggqoGBkT9ToNu8DvdPrC+BNaoCI4ZUkNKFoEZN+Pncp/STQ5RU2tZ+IviChi3
	+1E066kVNsboDwUeo7zAe54q9VNfvX7htrRSD84wd5FoakuLnOcZBRseLQcDyjvt6EdO0rl/Po/
	E7AhqSZomBAmwI8BOYc6Ca7RKyB9itUoLmSHu1C6458Jj5I1hhHPvjv28HZH0yZf2m4ZjnYhIvk
	SVoaVa1MnMVOuRFsZT/6sboYrJeFvn3FaL1bU3+bd9dIWJ+BhCPXUhHXyiGoH6vu5wUKJcW6I=
X-Google-Smtp-Source: AGHT+IEsDBPrjJf1KURwoq8uXlilefcsQLW4264GczEDAFI2hLFsKc/qZ1a0TXfu+QIo/tHMJdFj3w==
X-Received: by 2002:a05:600c:4f88:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477c01c0c9cmr28504395e9.26.1763741332734;
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
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
Subject: [DO NOT APPLY PATCH v8 11/15] pwm: rzg2l-gpt: Add support for output disable on dead time error
Date: Fri, 21 Nov 2025 16:08:18 +0000
Message-ID: <20251121160842.371922-12-biju.das.jz@bp.renesas.com>
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

This patch adds support for output disable request from gpt,
when dead time error occurred.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pwm/pwm-rzg2l-gpt.c   | 9 +++++++++
 include/linux/pwm/rzg2l-gpt.h | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index a0100e1b948d..0e158f677f01 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -84,6 +84,7 @@
 	 RZG2L_GTIOR_GTIOA_OUT_HI_END_TOGGLE_CMP_MATCH)
 
 #define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
+#define RZG2L_GTINTAD_OUTPUT_DISABLE_DEADTIME_ERROR	BIT(28)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH	BIT(29)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW	BIT(30)
 
@@ -502,6 +503,14 @@ int rzg2l_gpt_poeg_disable_req_both_low(void *dev, u8 grp, bool on)
 }
 EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_low);
 
+int rzg2l_gpt_poeg_disable_req_deadtime_error(void *dev, u8 grp, bool on)
+{
+	int id = RZG2L_GTINTAD_OUTPUT_DISABLE_DEADTIME_ERROR;
+
+	return rzg2l_gpt_poeg_disable_req_endisable(dev, grp, id, on);
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_deadtime_error);
+
 /*
  * This function links a poeg group{A,B,C,D} with a gpt channel{0..7} and
  * configure the pin for output disable.
diff --git a/include/linux/pwm/rzg2l-gpt.h b/include/linux/pwm/rzg2l-gpt.h
index adb5b9cfc8b3..f9365bbca57c 100644
--- a/include/linux/pwm/rzg2l-gpt.h
+++ b/include/linux/pwm/rzg2l-gpt.h
@@ -8,6 +8,7 @@ int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp);
 int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp);
 int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on);
 int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on);
+int rzg2l_gpt_poeg_disable_req_deadtime_error(void *gpt_device, u8 grp, bool on);
 #else
 static inline u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
 {
@@ -34,6 +35,10 @@ static inline int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp,
 	return -ENODEV;
 }
 
+static inline int rzg2l_gpt_poeg_disable_req_deadtime_err(void *gpt_device, u8 grp, bool on)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_PWM_RENESAS_RZG2L_GPT_H__ */
-- 
2.43.0


