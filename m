Return-Path: <linux-renesas-soc+bounces-28309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAYhDJHYlWmmVQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 16:19:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5506E1575AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 16:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 951E2300860C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0AA340290;
	Wed, 18 Feb 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BCCxKajL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40335334C22
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427974; cv=none; b=kZ7GCf0Ais9A5wZeDE+QAwrA37sC07LT3w17h3MAnvZOseXYFqArgUg9hysaE2VAbCdEMmtYdAV7HE+MjHf/wi1eSskiPpZFr+nPoYaYtTAGZgAOYv5ZvRhES7MTQeVEwoH0YexvqlULuvsc0EXSMArKypyde8qxipX35YU+7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427974; c=relaxed/simple;
	bh=Z9t1qd7Zi142S/RDKbRfVBxzx0hO6FedD/Dj/TvtNNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qiAqvYCH2K0jGZZlAHFHnU6ZI7zqwwOGgzNPw43eqxjE0yc/o5eXzIEsfoY4hb1AjU3P1XLIPZmvpuU/PeTINaAYIIxI5xjuPa5T5+R6QzWogjLnM3MJqz2bWGbft1Vmc0is25/buL3HWX5nxKZuulUoeSI8ATtVb4VGG3WJwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BCCxKajL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-481188b7760so44843585e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771427969; x=1772032769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOeSqkvPcCTeeZO2w2pgvx/aOnZebeGyV7yskHw842k=;
        b=BCCxKajLsFXKUYaMEkJAes2CtLX5CBkMwX0W22KayTse1B376Bzdi92DcNu73OtDen
         hhlFOVEt5pz3Kfo6MWyBm0ROGlwP5UxtSuCuhfuKA1A4vrIIkY62uoxcUJwEEW/QfqEV
         pQIh2XaRSM20HX5W0fCd/PrJwcLAtV8bsHRkhnWLDrAYPXcd8ZQmvJzjvtR4w1b/FfVP
         sXc+HxT/nkAS/mAQq4v5W0nV8z3ooujGVBXoNzczGdi2n1iCBNi9oxEtwfFhcN/IJlJq
         RDJVb2LUV/KEdwAgBzdf6+FJLz90JzXQvrA8k8o3OdlYEbYl2DsnskkXohhyUfFkfAl7
         xRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427969; x=1772032769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOeSqkvPcCTeeZO2w2pgvx/aOnZebeGyV7yskHw842k=;
        b=ijvUQi05/3G9i/hXT5F1EXN1EPUMPYrr2RhY4YyLU//Klyy3TI63ii+FjWH1zXRVbR
         h2JmS4YZp6rG/I27u+t4TWDt7nQuuGtPjqwlIxtLLyVqjMJr0kGD8r2NA2sxYFTM+zym
         T8YrKn9wdfAavSV4rRV39aEdJhqZX9pBLHS9suTyzQ95zDY8HKzNRh21fOltmO13/ZJ4
         /r2QWDCjBSqA9NyJFWFYphS9zZzJlUr+AG61cEEu2JWGelKoixCI2O3PHy3VWQIJide0
         z0AJdYbm68sPfvwh1ZDih4IsdC1lRcb3NDnp37d8y/V05SP/q4WgZQBJv1A2yjlbDpb8
         +taA==
X-Forwarded-Encrypted: i=1; AJvYcCVOyQ7cJAZwkSWm/JUyNuJOeuMxlJXRkwCZqaTr7BoC3bKs5uIL0LQ8XqdTsBACEE5GZZYPBgVQlZD/5pmTcJiwoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydwbGGPh8IG1I/lGM/i9gIJjho2xyuECWnnDoT/IP+Z4UDXcMT
	zhI14Oz1RsTPdzz9/qPogGCUTS7DpAWa3Zzmx/A6SFlg1xGAVbPSnuSBA0jFwuqmFSE=
X-Gm-Gg: AZuq6aLpAVeuCqynDZ6s6ULh7oDeswfa2ghkF4MXJBVy316YZO3GqofjTnaiUc9/H8j
	o3TCRob+cNIkBfzgr5lh+4kjoLgfxBL4bcExGjYsDYK2yvmuNljYQAyX+9MysvKxn8xiLzliQMR
	r9Bv0uFO8fkSisyB3+P2ZlkejBCdb3/Msn355UlC1E78aXusZV/1yF17d0wWuEOIiCjToG8Q/XO
	nnVN+jPrGvtRykAW0MAE5TYPNfouhlokvWnK0CZUNStrOIlx3SKlsyBT18FxqMbH4Xz2cEUzMGe
	Y2B0U+OoSaysvNWrhIQGuj/muLjwoqkKXIZCrQjJibfRbo6qpSN0Gjy+FufPPnRsV7UO0gxGWry
	TwF+u2kkXhSpsI9Y+piW7NKAT+S5tjU0ORqNye610tCaZjQmEmXEzjRvB/ANc9rfykgaDYFgwpF
	BDqetjc/wQJjWgZOD2asTUV9V+hqtvp68z3WqRB1hg+YqbIXr177g=
X-Received: by 2002:a05:600c:8a0d:20b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-4839baa7e29mr15702945e9.12.1771427969071;
        Wed, 18 Feb 2026 07:19:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm45366347f8f.4.2026.02.18.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:19:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	brgl@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
Date: Wed, 18 Feb 2026 17:19:25 +0200
Message-ID: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28309-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 5506E1575AA
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add GPIO set_config to allow setting GPIO specific functionalities.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..641ae1adfd4a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	rzg2l_gpio_direction_input(chip, offset);
 }
 
+static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				 unsigned long config)
+{
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_SLEW_RATE:
+	case PIN_CONFIG_DRIVE_STRENGTH:
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+	case PIN_CONFIG_POWER_SOURCE:
+		return pinctrl_gpio_set_config(chip, offset, config);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const char * const rzg2l_gpio_names[] = {
 	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
 	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
@@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->direction_output = rzg2l_gpio_direction_output;
 	chip->get = rzg2l_gpio_get;
 	chip->set = rzg2l_gpio_set;
+	chip->set_config = rzg2l_gpio_set_config;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;
-- 
2.43.0


