Return-Path: <linux-renesas-soc+bounces-33570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V6sYJulNIWqaCwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:05:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869C63ECB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VQe6f7bo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3D5430680A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF783FA5FC;
	Thu,  4 Jun 2026 09:56:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8033DFC6C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567017; cv=none; b=WXBxxa3GgVkfJphZBTUeBtrslxQALasE6QDyg4JHG8NQF4DmZCKxDkY6B6FeUVHJreLEkWX2a2ONc84+b5l2DfTIxK29tKPTJzA4M4SM3LqbT7bHSuwO8aCGiHyYyTrxJ2IK7aP6ehl/x6lGQzdXFhHyHZSmmp6haVvTrKw/Ilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567017; c=relaxed/simple;
	bh=ormcBKXgtMUbxhPH8flZunLMCWwtspwzC/31OfGnHNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wt+w3c6zk0W0oUUn7jnDpm9w9V7wXN1nST6eptW1HXjyOU3QYXxmItNga5Zc6muzXuM4mlC4FnHURDplzS0zE5huofgiTk9gU03N/bB7TWzCNrafVsWydgR8UGWIBafiU9LeXi5xiaF29BSkZG0MjkZdeDbvTukA35TaARDcqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQe6f7bo; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4045695e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567014; x=1781171814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRHuLwRJMvtvIKprdTuRI74u8tyjnb0ERZ60XzwxUP4=;
        b=VQe6f7bon18+7QGKbdzoaphzaYbDRWjE82U1lnsUKukrj6AhWfqavsECmqK5mwt6Jp
         zzilVHMarGcY60iHp66zx+z4BYmy/iUlq1t1S5od6LgdyDlwQY51Vy5sVvjFfSYBUXH1
         NaONf7TYElPn3goeaa/OEY2TwYdogf56wAM0R7qzoDpsTs/j87lIj4JJzM8yxnAXN/zz
         Xzx04jA1wnFSNHBt3pjLMzlquuF8PJWBhUwPwS2MogPxg8cKt+jy3QHJZcI2BwuVJ1NR
         i0KD9uyu3+kYNS7jNz/1nc2HfpiE6YexFdmWm0IWaBFbdWGWoSd2N4sxGyTqu6VSOGhn
         aEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567014; x=1781171814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WRHuLwRJMvtvIKprdTuRI74u8tyjnb0ERZ60XzwxUP4=;
        b=LjUZSK9dRBt8qK5VkEqelIE1hVTj7I5d5orOnxnj6MmlPxoAEfMd3V8DFUB69CAvuA
         yzYrs2ZQIBOWfxNk2rqKEjLtoU+g2fphNq46C23kOgFTqTl+JHnDmJQBQ1OZXgX9o9AQ
         Ouc2dTlft2lnGOGIzIVSUzN8eivMgadt9g2X5fYtqk62qVr8pdRYfz8IZUzglKR0LFk0
         QJzN7vZJasaKIELVVSiO749+C5aD4fIBbLc4updEOtYjYeioWrtJOb9JV0/j9ke+3azT
         fZUwsuepko/aK0e01t7riQSfwZmxj3T8jl27BOx/AG8b3dpCynsUOjTEAyViqvMgk/As
         pVCw==
X-Forwarded-Encrypted: i=1; AFNElJ+n2iNuoKoHbrL1hzxMA+DxWqJCX/ghsbKN8ncPGCnY+pC1NBVLarL2tOrzWxe8mAzz4zxKRxziKL78U4Ij/WZtFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aNW8is1UEDKlJDm4tTbd7a542OCynFverzen27jcJxtsXWXv
	J2QeDXMtqxxl33eh4t8qw9QSFXk6FJJ0hKQZVYkdDXnYVG7fSNTVXaxX
X-Gm-Gg: Acq92OGptnMHxWj46pNC8LiHhA9j4YwQ1NGzcRomMprAhw19EVLHLb3z4Hdqo9jWWLL
	6BWJYklXX4VSesd2Rk5zo4npKaZODKmKqZfIpCZujDLo6oI7alaTZp401YWiqsgToL8Pw619bpr
	2iJrL0torOdqTnNNlMHSi/wdy69uNWmQ0zotPbqzbrx0GPweXLBm86GeR1Yp3Yuli0nZjwIwI0Y
	zXiDQrsXREVs25Mm9U5yodMahH4s7WiJ7Ulmj3R0DqKVFnNos9xsNpadB2xpQe1TfCA2msjW3x3
	CtGxZVR+/r1i/Sl/tRF2Z5HfHHPY+8eBBsLjc/c13R8t4n4N0EvZO8fYlrlfk6Hc6ystCI781I+
	1gyoHmV7bYPz1QDOaeruhBBNqVxhvQwbUkUz0216kQYf4NxatZ0ZhvankzIk0wZcMPZXsJugtLB
	JyeHV+cFFSdjRkn+0u9xTwrV30g7G8F/NGK7tK22P1oux1oqy3fe4CCf5Eclw=
X-Received: by 2002:a05:600c:83c6:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490bc5001e0mr48514435e9.14.1780567014180;
        Thu, 04 Jun 2026 02:56:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 04/11] pwm: rzg2l-gpt: Add missing newlines to dev_err_probe() messages
Date: Thu,  4 Jun 2026 10:56:34 +0100
Message-ID: <20260604095647.108654-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33570-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0869C63ECB7

From: Biju Das <biju.das.jz@bp.renesas.com>

dev_err_probe() internally calls dev_err() which uses pr_fmt() and
printk(). Kernel log messages should end with a newline character
to ensure proper log formatting. Add missing '\n' at the end of
the error strings in rzg2l_gpt_probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 233e5ff2d04d..47c6c2eb3067 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -497,14 +497,14 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 	rate = clk_get_rate(clk);
 	if (!rate)
-		return dev_err_probe(dev, -EINVAL, "The gpt clk rate is 0");
+		return dev_err_probe(dev, -EINVAL, "The gpt clk rate is 0\n");
 
 	/*
 	 * Refuse clk rates > 1 GHz to prevent overflow later for computing
 	 * period and duty cycle.
 	 */
 	if (rate > NSEC_PER_SEC)
-		return dev_err_probe(dev, -EINVAL, "The gpt clk rate is > 1GHz");
+		return dev_err_probe(dev, -EINVAL, "The gpt clk rate is > 1GHz\n");
 
 	/*
 	 * Rate is in MHz and is always integer for peripheral clk
@@ -513,7 +513,7 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	 */
 	rzg2l_gpt->rate_khz = rate / KILO;
 	if (rzg2l_gpt->rate_khz * KILO != rate)
-		return dev_err_probe(dev, -EINVAL, "Rate is not multiple of 1000");
+		return dev_err_probe(dev, -EINVAL, "Rate is not multiple of 1000\n");
 
 	ret = rzg2l_gpt_poeg_init(pdev, rzg2l_gpt);
 	if (ret)
-- 
2.43.0


